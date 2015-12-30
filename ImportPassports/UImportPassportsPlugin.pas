unit UImportPassportsPlugin;

interface

uses UPlugin, UClassManager;

type
  TImportPassportsPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    procedure Exec; override;
  end;

implementation

uses ImportPassportsUnit, Forms;

class function TImportPassportsPlugin.Name: string;
begin
  Result := 'Импорт паспортов';
end;

class function TImportPassportsPlugin.Group: string;
begin
  Result := 'Администрирование'
end;

class function TImportPassportsPlugin.Pos: integer;
begin
  Result := 105;
end;

{look @ /UserGroups.tsv for explanation}
class function TImportPassportsPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TImportPassportsPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TImportPassportsPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TImportPassportsPlugin.Exec;
begin
  if not Assigned(ImportPassportsForm) then
    Application.CreateForm(TImportPassportsForm, ImportPassportsForm);
  ImportPassportsForm.ShowModal;
end;

initialization
  ClassManager.Add(TImportPassportsPlugin);

finalization
  ClassManager.Remove(TImportPassportsPlugin);

end.
