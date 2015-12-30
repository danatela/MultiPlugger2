unit UReport3Plugin;

interface

uses
  Classes, UPlugin;

type
  TReport3Plugin = class(TPlugin)
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
 Forms, Dialogs, UClassManager, Unit3;

class function TReport3Plugin.Name: string;
begin
  Result := 'Металлопрокат, поступивший в производство, но не израсходованный';
end;

class function TReport3Plugin.Group: string;
begin
  Result := 'Отчёты'
end;

class function TReport3Plugin.Pos: integer;
begin
  Result := 102;
end;

class function TReport3Plugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TReport3Plugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReport3Plugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReport3Plugin.Exec;
begin
  if not Assigned(Form3) then
    Application.CreateForm(TForm3, Form3);
  Form3.Show;
end;

initialization
  ClassManager.Add(TReport3Plugin);

finalization
  ClassManager.Remove(TReport3Plugin);

end.
