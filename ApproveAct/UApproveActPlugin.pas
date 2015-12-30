unit UApproveActPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TApproveActPlugin = class(TPlugin)
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
  Forms, ApproveActUnit;

class function TApproveActPlugin.Name: string;
begin
  Result := 'Акты сдачи ГП';
end;

class function TApproveActPlugin.Group: string;
begin
  Result := 'Планы'
end;

class function TApproveActPlugin.Pos: integer;
begin
  Result := 7;
end;

class function TApproveActPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TApproveActPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TApproveActPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TApproveActPlugin.Exec;
begin
  if not Assigned(ApproveActForm) then
    Application.CreateForm(TApproveActForm, ApproveActForm);
  ApproveActForm.Show;
end;

initialization
  ClassManager.Add(TApproveActPlugin);

finalization
  ClassManager.Remove(TApproveActPlugin);


end.
