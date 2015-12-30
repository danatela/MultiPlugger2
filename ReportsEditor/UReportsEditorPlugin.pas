unit UReportsEditorPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TReportsEditorPlugin = class(TPlugin)
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
  CmkUserUnit,
  GlobVars,
  MagsoftSharedUnit,
  FastReportUnit;

class function TReportsEditorPlugin.Name: string;
begin
  Result := 'Редактор печатных форм отчетов';
end;

class function TReportsEditorPlugin.Group: string;
begin
  Result := 'Администрирование'
end;

class function TReportsEditorPlugin.Pos: integer;
begin
  Result := 4;
end;

class function TReportsEditorPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TReportsEditorPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TReportsEditorPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TReportsEditorPlugin.Exec;
var
 OpenFR3:TOpenDialog;
begin
 if not Assigned(FRForm) then FRForm:=TFRForm.Create(Application.MainForm);
 OpenFR3:=TOpenDialog.Create(Application.MainForm);
 OpenFR3.InitialDir:=IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'Reports';
   if OpenFR3.Execute then
    Begin
     FRForm.Report.Clear;
     FRForm.Report.LoadFromFile(DeQuoted(OpenFR3.FileName));
     FRForm.Report.DesignReport;
    End;
 OpenFR3.Free;
end;

initialization
  ClassManager.Add(TReportsEditorPlugin);

finalization
  ClassManager.Remove(TReportsEditorPlugin);

end.

