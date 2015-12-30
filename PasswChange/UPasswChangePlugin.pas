unit UPasswChangePlugin;

interface

uses
  UClassManager, UPlugin;

type
  TPasswChangePlugin = class(TPlugin)
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
  GlobVars,
  MagsoftSharedUnit,
  PasswordChangeUnit;

class function TPasswChangePlugin.Name: string;
begin
  Result := 'Смена пароля текущего пользователя';
end;

class function TPasswChangePlugin.Group: string;
begin
  Result := 'Администрирование'
end;

class function TPasswChangePlugin.Pos: integer;
begin
  Result := 6;
end;

class function TPasswChangePlugin.UserGroups: string;
begin
  Result := '*';
end;

class function TPasswChangePlugin.AutoLoad: Boolean;
begin
  Result := true;
end;

class function TPasswChangePlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TPasswChangePlugin.Exec;
var
 PasswordChange:TPasswordChange;
 ok,good:boolean;
begin
 // ...
 // ShowMessage('Тест');
 if CurrentUser.PCHANGE then
  Begin
   PasswordChange:=TPasswordChange.Create;
   Repeat
    ok:=PasswordChange.Edit(Application.MainForm);
    if ok then
    Begin
     good:=False;
     if PasswordChange.PASSWORD1=PasswordChange.PASSWORD2 then
      Begin
       if Not Empty(PasswordChange.PASSWORD1) then
        Begin
         Try
          Host.ADOC.Execute('ALTER USER '+CurrentUser.ORAUSER+' IDENTIFIED BY '+Trim(PasswordChange.PASSWORD1));
          Host.ADOC.Execute('update '+SchemaName+'PERSONS set PCHANGE=0 where NREC='+IntToStr(CurrentUser.NREC));
          good:=True;
         Except on E:Exception do
          ShowMessage('Ошибка при попытке смены пароля! ('+E.Message+')');
         End;
        End else ShowMessage('Пароль не должен быть пустым!');
      End else ShowMessage('Пароли не совпадают! Будьте внимательнее при вводе!');
    End;
   Until Not ok or good;
   PasswordChange.Free;
  End;
end;

initialization
  ClassManager.Add(TPasswChangePlugin);

finalization
  ClassManager.Remove(TPasswChangePlugin);

end.

