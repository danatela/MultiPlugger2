unit UMaterialsEditPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterialsEditPlugin = class(TPlugin)
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
  Vcl.Forms,
  MaterialsEditUnit;

class function TMaterialsEditPlugin.Name: string;
begin
  Result := 'Материалы';
end;

class function TMaterialsEditPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TMaterialsEditPlugin.Pos: integer;
begin
  Result := 20;
end;

class function TMaterialsEditPlugin.UserGroups: string;
begin
  Result := '1'; // Администраторы
end;

class function TMaterialsEditPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterialsEditPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterialsEditPlugin.Exec;
begin
  if not Assigned(MaterialsEditForm) then
    Application.CreateForm(TMaterialsEditForm, MaterialsEditForm);
  MaterialsEditForm.Show;
end;

initialization
  ClassManager.Add(TMaterialsEditPlugin);

finalization
  ClassManager.Remove(TMaterialsEditPlugin);

end.

