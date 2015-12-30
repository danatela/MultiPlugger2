unit UTestLauncherPlugin;

interface

uses
  UClassManager, UPlugin, Vcl.Forms, Generics.Collections, RTTI;

type
  TTestLauncherPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    constructor Create; override;
    procedure Exec; override;
    destructor Destroy; override;
    function SetProp(Key: string; Value: TValue): Boolean; override;
    function GetProp(Key: string): TValue; override;
    function Form: TForm; override;
    private
      Plugin: TPlugin;
  end;

implementation

uses
  Vcl.Dialogs, GlobVars, SysUtils, Variants, CMKUserUnit;

class function TTestLauncherPlugin.Name: string;
begin
  Result := 'Тестовый лаунчер';
end;

class function TTestLauncherPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TTestLauncherPlugin.Pos: integer;
begin
  Result := 111;
end;

class function TTestLauncherPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TTestLauncherPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TTestLauncherPlugin.Hidden: Boolean;
begin
  Result := false;
end;

constructor TTestLauncherPlugin.Create;
begin
  ShowMessage(ClassName + ' Create');
  if not Assigned(Plugin) then
    Plugin := Host.RunPlugin('TSprPlugin');
end;

procedure TTestLauncherPlugin.Exec;
begin
  ShowMessage(ClassName + ' Exec');
  Plugin.SetProp('SprTableName', 'MATERIALS');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование материала","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Каталог материалов - Прочие материалы');
  Plugin.SetProp('EditRights', CurrentUser.CUSERGROUPS<>4);
  Plugin.SetProp('SprFilterString', 'CPARENT=3');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 3);
  Plugin.Exec;
  {}
end;

destructor TTestLauncherPlugin.Destroy;
begin
  ShowMessage(ClassName + ' Destroy');
  Plugin.Free;
  Plugin := nil;
end;

function TTestLauncherPlugin.SetProp(Key: string; Value: TValue): Boolean;
begin
  ShowMessage(ClassName + ' SetProp ' + Key + ' := ' + Value.AsString);
  Result := Plugin.SetProp(Key, Value);
end;

function TTestLauncherPlugin.GetProp(Key: string): TValue;
begin
  ShowMessage(ClassName + ' GetProp ' + Key);
  Result := Plugin.GetProp(Key);
end;

function TTestLauncherPlugin.Form;
begin
  ShowMessage(ClassName + ' Form');
  Result := nil;
  if Assigned(Plugin) then
    Result := Plugin.Form;
end;

initialization
  ClassManager.Add(TTestLauncherPlugin);

finalization
  ClassManager.Remove(TTestLauncherPlugin);

end.
