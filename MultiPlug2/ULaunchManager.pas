unit ULaunchManager;

interface

uses
  Classes, Contnrs, UPluginLauncher, Generics.Collections;

type
  TLaunchManager = class (TList<TPluginLauncher>)
    function GetLauncherByName(LauncherName: string): TPluginLauncher;
  end;

function LaunchManager: TLaunchManager;

implementation

var
  Manager: TLaunchManager;

function LaunchManager: TLaunchManager;
begin
  Result := Manager;
end;

{ TLaunchManager }

function TLaunchManager.GetLauncherByName(LauncherName: string): TPluginLauncher;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if Items[I].ClassNameIs(LauncherName) then begin
      Result := Items[I];
      Break;
    end;

end;

initialization
Manager := TLaunchManager.Create;

finalization
Manager.Free;

end.
