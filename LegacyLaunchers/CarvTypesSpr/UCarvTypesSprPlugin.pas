unit UCarvTypesSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TCarvTypesSprPlugin = class(TPlugin)
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

class function TCarvTypesSprPlugin.Name: string;
begin
  Result := 'Виды резьбы';
end;

class function TCarvTypesSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TCarvTypesSprPlugin.Pos: integer;
begin
  Result := 23;
end;

class function TCarvTypesSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TCarvTypesSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TCarvTypesSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TCarvTypesSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'CARVTYPES');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Справочник видов резьбы');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TCarvTypesSprPlugin);

finalization
  ClassManager.Remove(TCarvTypesSprPlugin);

end.

