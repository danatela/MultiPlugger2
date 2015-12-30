unit UPluginLauncher;

interface

uses
  UPlugin, UClassManager, RTTI, TypInfo, Classes, Forms, Contnrs, IniFiles;

type
  TPluginLauncher = class
  private
    FPluginClass: TPluginClass;
    FPlugin: TPlugin;
    Ini: TIniFile;
    function ReadFromIni(ItemName:  string): TValue;
    function GetItem(ItemName: string): TValue;
    procedure SetItem(Name: string; Value: TValue);
  public
    function Name: string;
    function Group: string;
    function Pos: Integer;
    function UserGroups: string;
    function AutoLoad: Boolean;
    function Hidden: Boolean;
    function Granted: Boolean;
    function EditRights: Boolean;
    function GetClassName: string;
    constructor Create(PluginFile: string);
    class procedure CreateLauncher(PluginClass: TPluginClass);
    procedure Exec;
    destructor Destroy; override;
    function SetProp(Key: string; Value: TValue): Boolean;
    function GetProp(Key: string): TValue;
    function GetPropNames: TStrings;
    function Form: TForm;
    function GetPlugin: TPlugin;
    function GetPluginClass: TPluginClass;
    function GetPluginDescription(Fields: string): TValue;
    procedure UpdatePluginDescription(Fields: string; Values: TValue);
    property Items[ItemName: string]: TValue read GetItem write SetItem; default;
    property PluginClass: TPluginClass read GetPluginClass write FPluginClass;
    property Plugin: TPlugin read GetPlugin;
  end;

  TIniHelper = class helper for TIniFile
    function Touch(Sect, Key: string; Def: TValue): TValue;
  end;

  TClassManagerHelper = class helper for TClassManager
    function ClassByName(ClassName: string): TClass;
  end;

  TRTTITypeHelper = class helper for TRTTIType
    function MethodIsImplemented(MethodName: string): Boolean;
  end;

  TValueHelper = record helper for TValue
    function ToVariant: Variant;
  end;

  

implementation

uses GlobVars, Variants, CMKUserUnit, SysUtils, ULaunchManager,
  StrUtils, MainUnit, DataSnap.DBClient, Generics.Collections, DB, Dialogs;

{ Class Helpers }

function TIniHelper.Touch(Sect, Key: string; Def: TValue): TValue;
begin
  if not Self.ValueExists(Sect, Key) then
    Self.WriteString(Sect, Key, Def.ToString);
  Result := Self.ReadString(Sect, Key, Def.ToString);
end;

function TClassManagerHelper.ClassByName(ClassName: string): TClass;
var
  I: Integer;
begin
  Result := nil;
  if ClassName = '' then
    Exit;
  for I := 0 to Self.Count - 1 do
    if Self.Items[I].ClassNameIs(ClassName) then
    begin
      Result := Self[I];
      Break;
    end;
end;

function TRTTITypeHelper.MethodIsImplemented(MethodName: string): Boolean;
var
  m: TRTTIMethod;
begin
  Result := False;
  for m in Self.GetDeclaredMethods do
  begin
    Result := UpperCase(m.Name) = UpperCase(MethodName);
    if Result then
      Break;
  end;
end;

{ Plugin Launcher }

function TPluginLauncher.ReadFromIni(ItemName: string): TValue;
var
  vType: TRTTIType;
  vCtx: TRTTIContext;
  vMethod: TRTTIMethod;
begin
  vType := vCtx.GetType(PluginClass);
  vMethod := vType.GetMethod(ItemName);
  if vMethod <> nil  then
    Result := vMethod.Invoke(PluginClass, []);
  Result := Ini.Touch('Main', ItemName, Result);
  if vMethod <> nil then
    case vMethod.ReturnType.TypeKind of
      tkInteger: Result := StrToInt(Result.AsString);
      tkEnumeration: Result := StrToBool(Result.AsString);
    end;
end;

function TPluginLauncher.GetItem(ItemName: string): TValue;
var
  Value: TValue;
begin
  Result := ReadFromIni(ItemName);
  Value := GetPluginDescription(ItemName);
  if Result.ToString <> Value.ToString then begin
    UpdatePluginDescription(ItemName, Result);
    Value := GetPluginDescription(ItemName);
    if not Value.IsEmpty then
      Result := Value;
  end;
end;

function TPluginLauncher.Name: string;
begin
  Result := Items['Name'].AsString;
end;

function TPluginLauncher.Group: string;
begin
  Result := Items['Group'].AsString;
end;

function TPluginLauncher.Pos: Integer;
begin
  Result := Items['Pos'].AsInteger;
end;

procedure TPluginLauncher.UpdatePluginDescription(Fields: string;
  Values: TValue);
var
  UsrGrps: TList<Int64>;
  GRNREC: Integer;
  LUserGroups: string;
  UpdatePlugins: Boolean;
begin
  LUserGroups := Ini.Touch('Main', 'UserGroups', PluginClass.UserGroups).AsString;
  with MainForm do
  begin
    if not PluginsCDS.Locate('CLASSNAME', Self.GetClassName,
      [loCaseInsensitive]) then
    begin
      PluginsCDS.Append;
      PluginsCDS['CLASSNAME'] := Self.GetClassName;
      PluginsCDS['GRANTED'] := MatchStr(LUserGroups, ['', '*']);
      PluginsCDS[Fields] := Values.ToVariant;
      PluginsCDS.Post;
    end;
    if not PluginsCDS['GRANTED'] then
    begin
      UsrGrps := GetGroups(LUserGroups);
      UsrGrps.Sort;
      UpdatePlugins := False;
      for GRNREC in UsrGrps do
      begin
        if UserGroupsADOQuery.Locate('NREC', GRNREC, []) then
        begin
          if not GroupsPluginsCDS.Locate('PLUGIN_ID;CUSERGROUPS',
            VarArrayOf([PluginsCDS['ID'], UserGroupsADOQuery['NREC']]), []) then
          begin
            GroupsPluginsCDS.Append;
            // все поля устанавливаются в AfterInsert,
            // GRANTED и EditRights установим здесь
            GroupsPluginsCDS['GRANTED'] := True;
          end
          else begin
            UpdatePlugins := GroupsPluginsCDS.FieldsEquals(Fields, PluginsCDS);
            GroupsPluginsCDS.Edit;
          end;
          if VarIsNull(GroupsPluginsCDS[Fields]) or UpdatePlugins then
            GroupsPluginsCDS[Fields] := Values.ToVariant;
          GroupsPluginsCDS.Post;
        end;
      end;
      UsrGrps.Free;

      if UpdatePlugins or VarIsNull(PluginsCDS[Fields]) then begin
        PluginsCDS.Edit;
        PluginsCDS[Fields] := Values.ToVariant;
        PluginsCDS.Post;
      end;


      GroupsPluginsCDS.Filter := GetProp('EditRights').AsString;
      GroupsPluginsCDS.Filtered := GroupsPluginsCDS.Filter <> '';
      try
        if GroupsPluginsCDS.Filtered then
        begin
          GroupsPluginsCDS.First;
          while not GroupsPluginsCDS.Eof do
          begin
            GroupsPluginsCDS.Edit;
            GroupsPluginsCDS['EditRights'] := True;
            GroupsPluginsCDS.Post;
            GroupsPluginsCDS.Next;
          end;
        end;
      finally
        GroupsPluginsCDS.Filter := '';
        GroupsPluginsCDS.Filtered := False;
      end;
    end;
  end;
end;

function TPluginLauncher.UserGroups: string;
begin
  Result := ReadFromIni('UserGroups').AsString;
end;

function TPluginLauncher.AutoLoad: Boolean;
begin
  Result := Items['AutoLoad'].AsBoolean;
end;

function TPluginLauncher.Hidden: Boolean;
begin
  Result := Items['Hidden'].AsBoolean;
end;

function TPluginLauncher.Granted: Boolean;
begin
  Result := Items['Granted'].AsBoolean;
end;

function TPluginLauncher.EditRights: Boolean;
begin
  Result := Items['EditRights'].AsBoolean;
end;

function TPluginLauncher.GetClassName: string;
begin
  Result := 'T' + ChangeFileExt(ExtractFileName(Ini.FileName), 'Plugin');
end;

constructor TPluginLauncher.Create(PluginFile: string);
begin
  inherited Create;
  Ini := TIniFile.Create(PluginFile);
  LaunchManager.Add(Self);
end;

class procedure TPluginLauncher.CreateLauncher(PluginClass: TPluginClass);
var
  LauncherName: string;
  Launcher: TPluginLauncher;
begin
  LauncherName := MidStr(PluginClass.ClassName, 2,
    Length(PluginClass.ClassName) - 7);
  Launcher := TPluginLauncher.Create(ExtractFilePath(Application.ExeName) + 'Launchers\' +
    LauncherName + '.launcher');
  // проинициализируем все свойства "плагина"...
  Launcher.PluginClass := PluginClass;
  with Launcher do
  try
    Items['ClassName'] := PluginClass.ClassName;
    Name;
    Group;
    Pos;
    UserGroups;
    AutoLoad;
    Hidden;
  except

  end;
  Launcher.Free;
end;

procedure TPluginLauncher.Exec;
var
  I: Integer;
  vCtx: TRTTIContext;
  vType: TRTTIType;
  Params: TStrings;
begin
  vType := vCtx.GetType(PluginClass);
  if vType.MethodIsImplemented('GetPropNames') then
    Params := PluginClass.GetPropNames
  else
  begin
    Params := TStringList.Create;
    Ini.ReadSection('Params', Params);
  end;
  if vType.MethodIsImplemented('SetProp') then
  begin
    for I := 0 to Params.Count - 1 do
      try
        if UpperCase(Params[I]) = 'EDITRIGHTS' then
          Plugin.SetProp(Params[I], Items['EditRights'])
        else
          Plugin.SetProp(Params[I], Ini.ReadString('Params', Params[I], ''));
      except

      end;
  end;
  Params.Free;
  Plugin.Exec;
end;

destructor TPluginLauncher.Destroy;
begin
  if Assigned(FPlugin) then
    FPlugin.Free;
  Ini.Free;
  LaunchManager.Remove(Self);
  inherited;
end;

procedure TPluginLauncher.SetItem(Name: string; Value: TValue);
begin
  Ini.WriteString('Main', Name, Value.ToString);
end;

// свойства мы попросту пробрасываем внутрь плагина
// или можно ещё сохранять их в инишник
function TPluginLauncher.SetProp(Key: string; Value: TValue): Boolean;
begin
  Ini.WriteString('Params', Key, Value.ToString);
  Result := Ini.ValueExists('Params', Key);
  // Result := Plugin.SetProp(Key, Value);
end;

function TPluginLauncher.GetPluginDescription(Fields: string): TValue;
var
  DS1, DS2: TClientDataSet;
begin
  Result := nil;
  DS1 := TClientDataSet.Create(nil);
  DS2 := TClientDataSet.Create(nil);
  try
    DS1.CloneCursor(MainForm.PluginsCDS, True);
    DS2.CloneCursor(MainForm.GroupsPluginsCDS, True);
    if DS1.Locate('ClassName', GetClassName, [loCaseInsensitive]) then
      if DS2.Locate('PLUGIN_ID;CUSERGROUPS',
        VarArrayOf([DS1['ID'], CurrentUser.CUSERGROUPS]), []) then
        Result := TValue.FromVariant(DS2[Fields])
      else
        Result := TValue.FromVariant(DS1[Fields]);
  finally
    DS1.Free;
    DS2.Free;
  end;
end;

function TPluginLauncher.GetProp(Key: string): TValue;
begin
  Result := Ini.ReadString('Params', Key, '');
  // Result := Plugin.GetProp(Key);
end;

function TPluginLauncher.GetPropNames: TStrings;
begin
  Result := PluginClass.GetPropNames;
end;

function TPluginLauncher.Form: TForm;
begin
  Result := Plugin.Form;
end;

function TPluginLauncher.GetPlugin: TPlugin;
var
  c: TRTTIContext;
  m: TRTTIMethod;
  t: TRTTIType;
begin
  if not Assigned(FPlugin) then
  begin
    t := c.GetType(PluginClass);
    m := t.GetMethod('Create');
    FPlugin := m.Invoke(PluginClass, []).AsObject as TPlugin;
  end;
  Result := FPlugin;
end;

function TPluginLauncher.GetPluginClass: TPluginClass;
var
  ClassName: string;
begin
  if FPluginClass = nil then begin
    ClassName := Ini.ReadString('Main', 'ClassName', '');
    if ClassName = '' then
      raise Exception.Create('Wrong Launcher!');
    FPluginClass := TPluginClass(ClassManager.ClassByName(ClassName));
    if FPluginClass = nil then
      raise Exception.Create('Wrong Launcher!');
  end;
  Result := FPluginClass;
end;

{ TValueHelper }

function TValueHelper.ToVariant: Variant;
begin
  case Self.Kind of
    tkEnumeration:
    begin
      {
      if Self.TypeInfo = GetTypeInfo(Boolean) then
      }
        Result := Self.AsBoolean
      {
      else
        Result := Self.AsOrdinal;
      }
    end
    else
    begin
      Result := Self.AsVariant;
    end;
  end;
end;

end.
