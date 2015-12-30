unit UReport1Plugin;

interface

uses
  Classes, UPlugin;

type
  TReport1Plugin = class(TPlugin)
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
  Forms, Dialogs, UClassManager, Unit1;

class function TReport1Plugin.Name: string;
begin
  Result := 'Отчет о сдаче готовой продукции';
end;

class function TReport1Plugin.Group: string;
begin
  Result := 'Отчёты'
end;

class function TReport1Plugin.Pos: integer;
begin
  Result := 100;
end;

class function TReport1Plugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TReport1Plugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReport1Plugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReport1Plugin.Exec;
begin
  if not Assigned(Form1) then
    Application.CreateForm(TForm1, Form1);
  Form1.Show;
end;

initialization
  ClassManager.Add(TReport1Plugin);

finalization
  ClassManager.Remove(TReport1Plugin);

end.
