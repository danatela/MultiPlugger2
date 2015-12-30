unit UArrivalsPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TArrivalsPlugin = class(TPlugin)
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
  ArrivalsGridUnit, Forms;

class function TArrivalsPlugin.Name: string;
begin
  Result := 'Задания на погрузку (подготовку) металлопроката';
end;

class function TArrivalsPlugin.Group: string;
begin
  Result := 'Документы'
end;

class function TArrivalsPlugin.Pos: integer;
begin
  Result := 3;
end;

class function TArrivalsPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TArrivalsPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TArrivalsPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TArrivalsPlugin.Exec;
begin
  if not Assigned(ArrivalsGridForm) then
    Application.CreateForm(TArrivalsGridForm, ArrivalsGridForm);
  ArrivalsGridForm.Show;
end;

initialization
  ClassManager.Add(TArrivalsPlugin);

finalization
  ClassManager.Remove(TArrivalsPlugin);

end.

