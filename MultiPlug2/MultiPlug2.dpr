program MultiPlug2;

uses
  Vcl.Forms,
  SplashUnit in 'SplashUnit.pas' {SplashForm},
  LoginUnit in 'LoginUnit.pas' {LoginForm},
  MainUnit in 'MainUnit.pas' {MainForm},
  ULaunchManager in 'ULaunchManager.pas',
  UPluginLauncher in 'UPluginLauncher.pas',
  EncryptorUnit in '..\Alien2015\EncryptorUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'АРМ. Технологический учёт ЦМК';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
