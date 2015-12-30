unit UImportPlanPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TImportPlanPlugin = class(TPlugin)
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
  ImportPlanUnit, Forms;

class function TImportPlanPlugin.Name: string;
begin
  Result := 'Импорт планов';
end;

class function TImportPlanPlugin.Group: string;
begin
  Result := 'Планы'
end;

class function TImportPlanPlugin.Pos: integer;
begin
  Result := 1;
end;

class function TImportPlanPlugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TImportPlanPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TImportPlanPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TImportPlanPlugin.Exec;
begin
  if not Assigned(ImportPlanForm) then
    Application.CreateForm(TImportPlanForm, ImportPlanForm);

  ImportPlanForm.Show;
end;

initialization
  ClassManager.Add(TImportPlanPlugin);

finalization
  ClassManager.Remove(TImportPlanPlugin);


end.
