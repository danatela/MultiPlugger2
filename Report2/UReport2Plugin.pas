unit UReport2Plugin;

interface

uses
  Classes, UPlugin;

type
  TReport2Plugin = class(TPlugin)
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
  Forms, Dialogs, UClassManager, Unit2;

class function TReport2Plugin.Name: string;
begin
  Result := 'ќтчЄт по разнице масс';
end;

class function TReport2Plugin.Group: string;
begin
  Result := 'ќтчЄты'
end;

class function TReport2Plugin.Pos: integer;
begin
  Result := 101;
end;

class function TReport2Plugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TReport2Plugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReport2Plugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReport2Plugin.Exec;
begin
  if not Assigned(Form2) then
    Application.CreateForm(TForm2, Form2);
  Form2.Show;
end;

initialization
  ClassManager.Add(TReport2Plugin);

finalization
  ClassManager.Remove(TReport2Plugin);

end.
