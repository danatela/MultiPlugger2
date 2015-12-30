unit UReport4Plugin;

interface

uses
  Classes, UPlugin;

type
  TReport4Plugin = class(TPlugin)
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
 Forms, Dialogs, UClassManager, Unit4;

class function TReport4Plugin.Name: string;
begin
  Result := 'Деловая обрезь листового металлопроката';
end;

class function TReport4Plugin.Group: string;
begin
  Result := 'Отчёты'
end;

class function TReport4Plugin.Pos: integer;
begin
  Result := 103;
end;

class function TReport4Plugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TReport4Plugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReport4Plugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReport4Plugin.Exec;
begin
  if not Assigned(Form4) then
    Application.CreateForm(TForm4, Form4);
  Form4.Show;
end;

initialization
  ClassManager.Add(TReport4Plugin);

finalization
  ClassManager.Remove(TReport4Plugin);

end.
