unit USchedulePlugin;

interface

uses
  Classes, UPlugin, JvComponentBase, JvThreadTimer, GlobVars;

type
  TSchedulePlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    procedure Exec; override;
  private
    ScheduleTimer: TJvThreadTimer;
    FirstScheduleFlag, SecondScheduleFlag: Boolean;
    procedure ScheduleTimerTimer(Sender: TObject);
  end;

implementation

uses
  UClassManager, Vcl.Forms, Vcl.ExtCtrls, SysUtils, Vcl.Dialogs;

class function TSchedulePlugin.Name: string;
begin
  Result := '';
end;

class function TSchedulePlugin.Group: string;
begin
  Result := ''
end;

class function TSchedulePlugin.Pos: integer;
begin
  Result := -1;
end;

class function TSchedulePlugin.UserGroups: string;
begin
  Result := '';
end;

class function TSchedulePlugin.AutoLoad: Boolean;
begin
  Result := True;
end;

class function TSchedulePlugin.Hidden: Boolean;
begin
  Result := True;
end;

procedure TSchedulePlugin.ScheduleTimerTimer(Sender: TObject);
begin
  if (Time > EncodeTime(0, 0, 0, 0)) and (Time < EncodeTime(0, 1, 30, 0)) then begin
    FirstScheduleFlag := False;
    SecondScheduleFlag := False;
  end;
  if (Time > EncodeTime(9, 0, 0, 0)) and (Time < EncodeTime(9, 1, 30, 0)) then if not FirstScheduleFlag then begin
    FirstScheduleFlag := True;
    Host.RunPlugin('TImportPlanPlugin');
  end;
  if (Time > EncodeTime(13, 0, 0, 0)) and (Time < EncodeTime(13, 1, 30, 0)) then if not SecondScheduleFlag then begin
    SecondScheduleFlag := True;
    Host.RunPlugin('TImportPlanPlugin');
  end;
end;

procedure TSchedulePlugin.Exec;
begin
  ScheduleTimer := TJvThreadTimer.Create(Application.MainForm);
  ScheduleTimer.OnTimer := ScheduleTimerTimer;
  ScheduleTimer.Interval := 60000;
  ScheduleTimer.Enabled := True;
end;

initialization
  ClassManager.Add(TSchedulePlugin);

finalization
  ClassManager.Remove(TSchedulePlugin);

end.
