unit SplashUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TSplashForm = class(TForm)
    LoadingLabel: TLabel;
    ProgressBar: TProgressBar;
    PaintBox: TPaintBox;
    procedure FormCreate(Sender: TObject);
  private
    {Private}
  public
    procedure ShowBitmapFromStream(Stream: TStream);
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.dfm}

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  Width := Screen.Width div 3;
  Height := Round(Width * 0.618);
  Top := (Screen.Height - Height) div 2;
  Left := Width;
end;

procedure TSplashForm.ShowBitmapFromStream(Stream: TStream);
var
  Bitmap: TBitmap;
begin
  Bitmap := TBitmap.Create;
  Bitmap.LoadFromStream(Stream);
  PaintBox.Canvas.Draw(100, 50, Bitmap);
end;

end.
