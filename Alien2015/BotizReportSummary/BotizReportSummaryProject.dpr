program BotizReportSummaryProject;

uses
  Vcl.Forms,
  BotizReportSummaryUnit in 'BotizReportSummaryUnit.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
 Application.Initialize;
 Application.MainFormOnTaskbar := True;
 TStyleManager.TrySetStyle('Slate Classico');
 Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
