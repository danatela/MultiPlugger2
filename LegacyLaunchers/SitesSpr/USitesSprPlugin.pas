unit USitesSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TSitesSprPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    procedure Exec; override;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  ADODB,
  Vcl.Dialogs,
  //Vcl.OleAuto,
  Vcl.Forms,
  Generics.Collections,
  CmkUserUnit,
  GlobVars;

class function TSitesSprPlugin.Name: string;
begin
  Result := 'Отделения (участки)';
end;

class function TSitesSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TSitesSprPlugin.Pos: integer;
begin
  Result := 14;
end;

class function TSitesSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TSitesSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TSitesSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TSitesSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'SITES');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Справочник отделений (участков)');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TSitesSprPlugin);

finalization
  ClassManager.Remove(TSitesSprPlugin);

end.

