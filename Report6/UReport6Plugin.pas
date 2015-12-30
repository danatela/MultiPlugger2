unit UReport6Plugin;

interface

uses UPlugin, UClassManager;

type
  TReport6Plugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    procedure Exec; override;
  end;

implementation

uses Unit6, Forms;

class function TReport6Plugin.Name: string;
begin
  Result := 'Анализ израсходованного м/п по способам раскроя';
end;

class function TReport6Plugin.Group: string;
begin
  Result := 'Отчёты'
end;

class function TReport6Plugin.Pos: integer;
begin
  Result := 105;
end;

class function TReport6Plugin.UserGroups: string;
begin
  Result := '1,2,3,4,5,6,7';
end;

class function TReport6Plugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReport6Plugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReport6Plugin.Exec;
begin
  if not Assigned(SetPeriodForm) then
    Application.CreateForm(TSetPeriodForm, SetPeriodForm);
  SetPeriodForm.ShowModal;
end;

initialization
  ClassManager.Add(TReport6Plugin);

finalization
  ClassManager.Remove(TReport6Plugin);

end.
