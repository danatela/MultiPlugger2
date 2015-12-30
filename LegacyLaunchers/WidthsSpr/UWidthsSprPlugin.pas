unit UWidthsSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TWidthsSprPlugin = class(TPlugin)
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

class function TWidthsSprPlugin.Name: string;
begin
  Result := 'Ширина листа';
end;

class function TWidthsSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TWidthsSprPlugin.Pos: integer;
begin
  Result := 2;
end;

class function TWidthsSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TWidthsSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TWidthsSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TWidthsSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'WIDTHS');
  Plugin.SetProp('SprVisibleFieldNames', 'VALUE,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Ширина (мм)","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'VALUE');
  Plugin.SetProp('UnicalField', 'VALUE');
  Plugin.SetProp('SprDescription', 'Справочник ширин листов');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TWidthsSprPlugin);

finalization
  ClassManager.Remove(TWidthsSprPlugin);

end.

