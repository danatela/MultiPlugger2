unit UReport5Plugin;

interface

uses
  Classes, UPlugin;

type
  TReport5Plugin = class(TPlugin)
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
 Forms, Dialogs, UClassManager, Unit5;

class function TReport5Plugin.Name: string;
begin
  Result := 'Деловая обрезь сортового металлопроката';
end;

class function TReport5Plugin.Group: string;
begin
  Result := 'Отчёты'
end;

class function TReport5Plugin.Pos: integer;
begin
  Result := 104;
end;

class function TReport5Plugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TReport5Plugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReport5Plugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReport5Plugin.Exec;
begin
  if not Assigned(Form5) then
    Application.CreateForm(TForm5, Form5);
  Form5.Show;
end;

initialization
  ClassManager.Add(TReport5Plugin);

finalization
  ClassManager.Remove(TReport5Plugin);

end.
