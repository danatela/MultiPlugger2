unit UThicksSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TThicksSprPlugin = class(TPlugin)
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

class function TThicksSprPlugin.Name: string;
begin
  Result := 'Толщина листа';
end;

class function TThicksSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TThicksSprPlugin.Pos: integer;
begin
  Result := 1;
end;

class function TThicksSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TThicksSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TThicksSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TThicksSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'THICKS');
  Plugin.SetProp('SprVisibleFieldNames', 'VALUE,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Толщина (мм)","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'VALUE');
  Plugin.SetProp('UnicalField', 'VALUE');
  Plugin.SetProp('SprDescription', 'Справочник толщин листов');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TThicksSprPlugin);

finalization
  ClassManager.Remove(TThicksSprPlugin);

end.

