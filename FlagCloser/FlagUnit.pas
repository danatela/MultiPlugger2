unit FlagUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles;

type
  TFlagForm = class(TForm)
    AttentionLabel: TLabel;
    ReasonMemo: TMemo;
    FlagTimer: TTimer;
    procedure FormClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FlagTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FFlagClose: string;
    function GetFlagClose: string;
    property FlagClose: string read GetFlagClose write FFlagClose;
    procedure ReadIniFile;
  public
    { Public declarations }
  end;

var
  FlagForm: TFlagForm;

implementation

{$R *.dfm}

function TFlagForm.GetFlagClose: string;
begin
  if FFlagClose = '' then
    FFlagClose := ExtractFilePath(Application.ExeName) + 'flagClose.txt';
  Result := FFlagClose;
end;

procedure TFlagForm.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    FlagClose := IniFile.ReadString('Main', 'FlagClose', 'flagClose.txt');
  finally
    IniFile.Free;
  end;
end;

procedure TFlagForm.FlagTimerTimer(Sender: TObject);
var
  F: file of byte;
begin
  if FileExists(FlagClose) then begin
    AssignFile(F, FlagClose);
    Reset(F);
    if FileSize(F) > 0 then begin
      CloseFile(F);
      ReasonMemo.Lines.LoadFromFile(FlagClose);
    end else
      CloseFile(F);
  end else
    Close;
end;

procedure TFlagForm.FormClick(Sender: TObject);
begin
  Close;
end;

procedure TFlagForm.FormShow(Sender: TObject);
begin
  Width := Screen.Width div 3;
  Left := Screen.Width div 3;
  Height := Round(0.618 * Width);
  Top := (Screen.Height - Height) div 2;
  ReadIniFile;
end;

end.
