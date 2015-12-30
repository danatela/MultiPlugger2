unit UEditJobPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TEditJobPlugin = class(TPlugin)
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
  EditJobUnit, Forms;

class function TEditJobPlugin.Name: string;
begin
  Result := 'Заполнение плана';
end;

class function TEditJobPlugin.Group: string;
begin
  Result := 'Планы'
end;

class function TEditJobPlugin.Pos: integer;
begin
  Result := 4;
end;

class function TEditJobPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TEditJobPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TEditJobPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TEditJobPlugin.Exec;
begin
  if not Assigned(EditJobForm) then
    Application.CreateForm(TEditJobForm, EditJobForm);
  EditJobForm.Show;
end;

initialization
  ClassManager.Add(TEditJobPlugin);

finalization
  ClassManager.Remove(TEditJobPlugin);

end.

