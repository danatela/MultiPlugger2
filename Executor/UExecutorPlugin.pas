unit UExecutorPlugin;

interface

uses
  Classes, UPlugin, RTTI;

type
  TExecutorPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    class function GetPropNames: TStrings; override;
    procedure Exec; override;
    function SetProp(Key: string; Value: TValue): Boolean; override;
    function GetProp(Key: string): TValue; override;
  private
    Exe: string;
    Params: string;
  end;

implementation

uses
  UClassManager, StrUtils, SysUtils, Vcl.Forms, GlobVars, ShellApi;

class function TExecutorPlugin.Name: string;
begin
  Result := 'Запуск Exe-файла';
end;

class function TExecutorPlugin.Group: string;
begin
  Result := 'Служебные'
end;

class function TExecutorPlugin.Pos: integer;
begin
  Result := 1;
end;

class function TExecutorPlugin.UserGroups: string;
begin
  Result := '*';
end;

class function TExecutorPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TExecutorPlugin.Hidden: Boolean;
begin
  Result := True;
end;

class function TExecutorPlugin.GetPropNames: TStrings;
begin
  Result := TStringList.Create;
  Result.Add('Exe');
  Result.Add('Params');
end;

procedure TExecutorPlugin.Exec;
begin
  if ExtractFilePath(Exe) = '' then
    Exe := ExtractFilePath(Application.ExeName) + 'Exe\' + Exe;
  Params := Host.GetPrivacyParams('slKjh3w923O34l1=\sdfpo483##*%DF$').AsString + ' ' + Params;
  UniqueString(Exe);
  UniqueString(Params);
  ShellExecute(Application.Handle, nil, PChar(Exe), PChar(Params), nil, 0);
end;

function TExecutorPlugin.SetProp(Key: string; Value: TValue): Boolean;
begin
  Result := MatchStr(Key, ['Exe', 'Params']);
  if Result then begin
    if Key = 'Exe' then Exe := Value.AsString;
    if Key = 'Params' then Params := Value.AsString;
  end;
end;

function TExecutorPlugin.GetProp(Key: string): TValue;
begin
  if MatchStr(Key, ['Exe', 'Params']) then begin
    if Key = 'Exe' then Result := Exe;
    if Key = 'Params' then Result := Params;
  end
  else
    Result := nil;
end;

initialization
  ClassManager.Add(TExecutorPlugin);

finalization
  ClassManager.Remove(TExecutorPlugin);

end.
