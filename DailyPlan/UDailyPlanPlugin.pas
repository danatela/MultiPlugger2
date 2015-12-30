unit UDailyPlanPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TDailyPlanPlugin = class(TPlugin)
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
  DailyPlanUnit, Forms;

class function TDailyPlanPlugin.Name: string;
begin
  Result := 'Суточное задание';
end;

class function TDailyPlanPlugin.Group: string;
begin
  Result := 'Планы'
end;

class function TDailyPlanPlugin.Pos: integer;
begin
  Result := 5;
end;

class function TDailyPlanPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TDailyPlanPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TDailyPlanPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TDailyPlanPlugin.Exec;
begin
  if not Assigned(DailyPlanForm) then
    Application.CreateForm(TDailyPlanForm, DailyPlanForm);
  DailyPlanForm.Show;
end;

initialization
  ClassManager.Add(TDailyPlanPlugin);

finalization
  ClassManager.Remove(TDailyPlanPlugin);


end.
