unit ULengthsSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TLengthsSprPlugin = class(TPlugin)
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

class function TLengthsSprPlugin.Name: string;
begin
  Result := 'Длина листа';
end;

class function TLengthsSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TLengthsSprPlugin.Pos: integer;
begin
  Result := 3;
end;

class function TLengthsSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TLengthsSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TLengthsSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TLengthsSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'LENGTHS');
  Plugin.SetProp('SprVisibleFieldNames', 'VALUE,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Длина (мм)","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'VALUE');
  Plugin.SetProp('UnicalField', 'VALUE');
  Plugin.SetProp('SprDescription', 'Справочник длин листов');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TLengthsSprPlugin);

finalization
  ClassManager.Remove(TLengthsSprPlugin);

end.

