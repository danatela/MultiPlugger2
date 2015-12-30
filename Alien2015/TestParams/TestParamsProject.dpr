program TestParamsProject;

uses
  Vcl.Forms,
  TestParamsUnit in 'TestParamsUnit.pas' {MainForm},
  SprUniSimpleUnit in '..\SprUniSimpleUnit.pas',
  GlobVarsUnit in '..\GlobVarsUnit.pas',
  SharedUnit in '..\SharedUnit.pas',
  SelectorUnit in '..\SelectorUnit.pas',
  MagsoftMsgDlgUnit in '..\MagsoftMsgDlgUnit.pas',
  SprUniSimpleItemUnit in '..\SprUniSimpleItemUnit.pas',
  MagsoftUniSelectorUnit in '..\MagsoftUniSelectorUnit.pas',
  PersonSelectorUnit in '..\PersonSelectorUnit.pas',
  LoginUnit in '..\LoginUnit.pas',
  SprSelectorUnit in '..\SprSelectorUnit.pas',
  EncryptorUnit in '..\EncryptorUnit.pas',
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
