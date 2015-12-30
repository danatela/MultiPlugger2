unit UUserAddPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TUserAddPlugin = class(TPlugin)
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
  FMX.Types,
  UserUnit,
  Windows;

class function TUserAddPlugin.Name: string;
begin
  Result := 'Добавление пользователя';
end;

class function TUserAddPlugin.Group: string;
begin
  Result := 'Администрирование'
end;

class function TUserAddPlugin.Pos: integer;
begin
  Result := 3;
end;

class function TUserAddPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TUserAddPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TUserAddPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TUserAddPlugin.Exec;
begin
  if not Assigned(UserForm) then begin
    Application.CreateForm(TUserForm, UserForm);
    UserForm.ADOConnection.ConnectionString := 'Provider=MSDAORA.1;Data Source=galatest';
    UserForm.ADOConnection.Open('sys_DelphiUser', 'qazaq');
    UserForm.GalUsers.TableName:='GAL.X$USERS';
    UserForm.CMKGroups.TableName:='CMKNEW.USERGROUPS';
    UserForm.CMKPersons.TableName := 'CMKNEW.PERSONS';
  end;
end;

initialization
  ClassManager.Add(TUserAddPlugin);

finalization
  ClassManager.Remove(TUserAddPlugin);

end.

