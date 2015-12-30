unit UZachTypesSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TZachTypesSprPlugin = class(TPlugin)
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

class function TZachTypesSprPlugin.Name: string;
begin
  Result := 'Способы зачистки';
end;

class function TZachTypesSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TZachTypesSprPlugin.Pos: integer;
begin
  Result := 16;
end;

class function TZachTypesSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TZachTypesSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TZachTypesSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TZachTypesSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'ZACHTYPES');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Справочник способов зачистки');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TZachTypesSprPlugin);

finalization
  ClassManager.Remove(TZachTypesSprPlugin);

end.

