unit UPersonsSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TPersonsSprPlugin = class(TPlugin)
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
  Vcl.Forms,
  Generics.Collections,
  CmkUserUnit,
  GlobVars;

class function TPersonsSprPlugin.Name: string;
begin
  Result := 'Пользователи';
end;

class function TPersonsSprPlugin.Group: string;
begin
  Result := 'Администрирование'
end;

class function TPersonsSprPlugin.Pos: integer;
begin
  Result := 1;
end;

class function TPersonsSprPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TPersonsSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TPersonsSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TPersonsSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'PERSONS');
  Plugin.SetProp('SprVisibleFieldNames', 'ORAUSER,LNAME,FNAME,MNAME,USERGROUPS_S,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Логин","Фамилия","Имя","Отчество","Группа","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '90,100,70,100,0,80');
  Plugin.SetProp('SprOrderByString', 'LNAME,FNAME,MNAME');
  Plugin.SetProp('UnicalField', 'ORAUSER');
  Plugin.SetProp('SprDescription', 'Справочник пользователей системы');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS=1) and (CurrentUser.NREC<>63));

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TPersonsSprPlugin);

finalization
  ClassManager.Remove(TPersonsSprPlugin);

end.

