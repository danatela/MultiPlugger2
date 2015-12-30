unit CorrSpPlanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, StrUtils;

type
  TCorrSpPlanForm = class(TForm)
    CMK_GroupBox: TGroupBox;
    EditDrawingDBEdit: TDBEdit;
    EditDrawingLabel: TLabel;
    EditGraphDBEdit: TDBEdit;
    EditGraphLabel: TLabel;
    OrderNum2DBEdit: TDBEdit;
    OrderNum2Label: TLabel;
    KolShtDBEdit: TDBEdit;
    KolShtLabel: TLabel;
    PrimDBMemo: TDBMemo;
    PrimLabel: TLabel;
    OrderNumDBEdit: TDBEdit;
    OrderNumLabel: TLabel;
    OrdNDBEdit: TDBEdit;
    OrdNLabel: TLabel;
    EditWeight1DBEdit: TDBEdit;
    EditWeight1Label: TLabel;
    DrawingDBEdit: TDBEdit;
    DrawingLabel: TLabel;
    GraphDBEdit: TDBEdit;
    GraphLabel: TLabel;
    INumDBEdit: TDBEdit;
    INumLabel: TLabel;
    KolDBEdit: TDBEdit;
    KolLabel: TLabel;
    NoteDBMemo: TDBMemo;
    NoteLabel: TLabel;
    NumDBEdit: TDBEdit;
    NumLabel: TLabel;
    ONumDBEdit: TDBEdit;
    ONumLabel: TLabel;
    Weight1DBEdit: TDBEdit;
    Weight1Label: TLabel;
    PPU_GroupBox: TGroupBox;
    OkBitBtn: TBitBtn;
    procedure CheckCommaCount(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CorrSpPlanForm: TCorrSpPlanForm;

implementation

uses ComparisonSpPlanUnit;
{$R *.dfm}

procedure TCorrSpPlanForm.CheckCommaCount(Sender: TObject; var Key: Char);
begin
  if Key = ',' then with Sender as TDBEdit do
    if ContainsStr(Text, ',') then
      Abort;
end;

end.
