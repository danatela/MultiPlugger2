unit UConsumptionPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TConsumptionPlugin = class(TPlugin)
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
  PassportsGridUnit, Forms;

class function TConsumptionPlugin.Name: string;
begin
  Result := 'Расход материалов';
end;

class function TConsumptionPlugin.Group: string;
begin
  Result := 'Документы'
end;

class function TConsumptionPlugin.Pos: integer;
begin
  Result := 4;
end;

class function TConsumptionPlugin.UserGroups: string;
begin
  Result := '1,2,3,5,6';
end;

class function TConsumptionPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TConsumptionPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TConsumptionPlugin.Exec;
begin
  if not Assigned(ConsumptionGridForm) then
    Application.CreateForm(TConsumptionGridForm, ConsumptionGridForm);
  ConsumptionGridForm.Show;
end;

initialization
  ClassManager.Add(TConsumptionPlugin);

finalization
  ClassManager.Remove(TConsumptionPlugin);

end.

