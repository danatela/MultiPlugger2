program FlagCloser;

uses
  Vcl.Forms,
  FlagUnit in 'FlagUnit.pas' {FlagForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFlagForm, FlagForm);
  Application.Run;
end.
