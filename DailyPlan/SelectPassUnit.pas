unit SelectPassUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TSelectPassForm = class(TForm)
    OkBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    PassesDataSource: TDataSource;
    PassesDBGrid: TDBGrid;
    procedure PassesDBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectPassForm: TSelectPassForm;

implementation

{$R *.dfm}

uses DailyPlanUnit;

procedure TSelectPassForm.PassesDBGridDblClick(Sender: TObject);
begin
  OkBitBtn.Click;
end;

end.
