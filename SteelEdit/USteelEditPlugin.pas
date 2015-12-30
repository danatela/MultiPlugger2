unit USteelEditPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TSteelEditPlugin = class(TPlugin)
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
  System.SysUtils,
  System.Classes,
  ADODB,
  Vcl.Dialogs,
  //Vcl.OleAuto,
  Vcl.Forms,
  Generics.Collections,
  FMX.Types,
  Windows,
  SteelEditUnit,
  AddSteelMark;

class function TSteelEditPlugin.Name: string;
begin
  Result := 'Марки стали';
end;

class function TSteelEditPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TSteelEditPlugin.Pos: integer;
begin
  Result := 2;
end;

class function TSteelEditPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TSteelEditPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TSteelEditPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TSteelEditPlugin.Exec;
begin
  SteelMarksForm := TSteelMarksForm.CreateSteelMarksForm(Application);
  Application.CreateForm(TNewSteelMark, NewSteelMark);

end;

initialization
  ClassManager.Add(TSteelEditPlugin);

finalization
  ClassManager.Remove(TSteelEditPlugin);

end.

