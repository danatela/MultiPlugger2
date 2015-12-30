unit UMKGroupsSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMKGroupsSprPlugin = class(TPlugin)
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

class function TMKGroupsSprPlugin.Name: string;
begin
  Result := 'Группы М/К';
end;

class function TMKGroupsSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TMKGroupsSprPlugin.Pos: integer;
begin
  Result := 15;
end;

class function TMKGroupsSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMKGroupsSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMKGroupsSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMKGroupsSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'MKGROUPS');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Справочник групп М/К');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMKGroupsSprPlugin);

finalization
  ClassManager.Remove(TMKGroupsSprPlugin);

end.

