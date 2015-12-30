unit UTestPlugin;

interface

uses
  Classes, UPlugin;

type
  TTestPlugin = class(TPlugin)
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
  Forms, Dialogs, UClassManager;

class function TTestPlugin.Name: string;
begin
  Result := 'Тестовый плагин';
end;

class function TTestPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TTestPlugin.Pos: integer;
begin
  Result := 100;
end;

class function TTestPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TTestPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TTestPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TTestPlugin.Exec;
begin
  ShowMessage('Плагин 1 работает');
end;

initialization
  ClassManager.Add(TTestPlugin);

finalization
  ClassManager.Remove(TTestPlugin);

end.
