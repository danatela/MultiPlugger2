unit UKDPlugin;

interface

uses
  UClassManager, UPlugin;

type
    TKDPlugin = class(TPlugin)
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
  Vcl.Forms,
  Generics.Collections,
  Windows,
  frxClass,
  KDGridUnit;

class function TKDPlugin.Name: string;
begin
  Result := 'Конструкторская документация';
end;

class function TKDPlugin.Group: string;
begin
  Result := 'Документы'
end;

class function TKDPlugin.Pos: integer;
begin
  Result := 1;
end;

class function TKDPlugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TKDPlugin.AutoLoad: Boolean;
begin
  Result := False;
end;

class function TKDPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TKDPlugin.Exec;
begin
  if not Assigned(KDGridForm) then
    Application.CreateForm(TKDGridForm, KDGridForm);
end;

initialization
  ClassManager.Add(TKDPlugin);

finalization
  ClassManager.Remove(TKDPlugin);

end.

