unit USprPlugin;

interface

uses
  UClassManager, UPlugin, RTTI, TypInfo, Forms, UniversalSprUnit, Generics.Collections, Classes;

type
  TSprPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    class function GetPropNames: TStrings; override;
    constructor Create;
    procedure Exec; override;
    destructor Destroy; override;
    function SetProp(Key: string; Value: TValue): Boolean; override;
    function GetProp(Key: string): TValue; override;
    function Form: TForm; override;
    private
      class var vCtx: TRTTIContext;
      Spr: TSpr;
      PropDict: TDictionary<string, TValue>;
  end;

implementation

uses
  Dialogs, StrUtils, SysUtils;

class function TSprPlugin.Name: string;
begin
  Result := 'Универсальный справочник';
end;

class function TSprPlugin.Group: string;
begin
  Result := 'Служебные'
end;

class function TSprPlugin.Pos: integer;
begin
  Result := 106;
end;

class function TSprPlugin.UserGroups: string;
begin
  Result := '*';
end;

class function TSprPlugin.AutoLoad: Boolean;
begin
  Result := False;
end;

class function TSprPlugin.Hidden: Boolean;
begin
  Result := True;
end;

class function TSprPlugin.GetPropNames: TStrings;
var
  vType: TRTTIType;
  vField: TRTTIField;
begin
  vType := vCtx.GetType(TSpr);
  Result := TStringList.Create;
  for vField in vType.GetFields do
    Result.Add(vField.Name);
end;

constructor TSprPlugin.Create;
var
  Prop: string;
  PropNames: TStrings;
begin
  inherited;
  Spr := TSpr.Create;
  PropDict := TDictionary<string, TValue>.Create;
  PropNames := GetPropNames;
  for Prop in PropNames do
    PropDict.Add(Prop, nil);
  PropNames.Free;
end;

procedure TSprPlugin.Exec;
var
  vField: TRTTIField;
  vType: TRTTIType;
  Value: TValue;
begin
  vType := vCtx.GetType(TSpr);
  Spr.Clear;
  for vField in vType.GetFields do if PropDict.TryGetValue(vField.Name, Value) then
    if not Value.IsEmpty then
      if Value.ToString <> '' then begin
        case vField.FieldType.TypeKind of
        tkInteger, tkInt64: Value := StrToInt(Value.AsString);
        end;
        Value.ExtractRawData(PByte(Spr) + vField.Offset);
      end;
  Spr.Edit(Application.MainForm);
end;

destructor TSprPlugin.Destroy;
begin
  Spr.Free;
  Spr := nil;
  PropDict.Free;
  PropDict := nil;
  inherited;
end;

function TSprPlugin.SetProp(Key: string; Value: TValue): Boolean;
begin
  if not Assigned(PropDict) then
    PropDict := TDictionary<string, TValue>.Create;
  Result := PropDict.ContainsKey(Key);
  if Result then
    PropDict[Key] := Value;
end;

function TSprPlugin.GetProp(Key: string): TValue;
begin
  PropDict.TryGetValue(Key, Result);
end;

function TSprPlugin.Form;
begin
  Result := UniversalSprForm;
end;

initialization
  ClassManager.Add(TSprPlugin);

finalization
  ClassManager.Remove(TSprPlugin);

end.
