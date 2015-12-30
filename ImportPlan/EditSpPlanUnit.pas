unit EditSpPlanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Vcl.ImgList, Vcl.ExtCtrls, StrUtils,
  DBCtrlsEh;

type
  TEditSpPlanForm = class(TForm)
    ContractorLabel: TLabel;
    RecipientLabel: TLabel;
    MarkLabel: TLabel;
    OrderNumEdit: TDBEdit;
    OrderNumLabel: TLabel;
    OrderNum2Edit: TDBEdit;
    OrderNum2Label: TLabel;
    OrdNEdit: TDBEdit;
    OrdNLabel: TLabel;
    WeightGroupBox: TGroupBox;
    KolShtEdit: TDBEdit;
    KolShtLabel: TLabel;
    Weight1Edit: TDBEdit;
    Weight1Label: TLabel;
    WeightLabel: TLabel;
    GraphEdit: TDBEdit;
    GraphLabel: TLabel;
    DrawingLabel: TLabel;
    DrawingEdit: TDBEdit;
    PrimMemo: TDBMemo;
    UpdatedLabel: TLabel;
    RelDateLabel: TLabel;
    OkBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    PrimLabel: TLabel;
    ContractorComboBox: TDBLookupComboBox;
    RecipientComboBox: TDBLookupComboBox;
    MarkComboBox: TDBLookupComboBox;
    RelDateEditEh: TDBDateTimeEditEh;
    UpdatedEditEh: TDBDateTimeEditEh;
    WeightEdit: TButtonedEdit;
    ImageList: TImageList;
    procedure CalcWeightSpeedButtonClick(Sender: TObject);
    procedure CheckCommaCount(Sender: TObject; var Key: Char);
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditSpPlanForm: TEditSpPlanForm;

implementation

uses ImportPlanUnit;

{$R *.dfm}

procedure TEditSpPlanForm.CalcWeightSpeedButtonClick(Sender: TObject);
begin
  try
    WeightEdit.Text := FloatToStr(StrToFloat(Weight1Edit.Text) * StrToFloat(KolShtEdit.Text));
  finally

  end;
end;

procedure TEditSpPlanForm.CheckCommaCount(Sender: TObject; var Key: Char);
begin
  if Key = ',' then with Sender as TDBEdit do
    if ContainsStr(Text, ',') then
      Abort;
end;

procedure TEditSpPlanForm.ComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DELETE, VK_BACK: with Sender as TDBLookupComboBox do Field.Value := '';
  end;
end;

procedure TEditSpPlanForm.FormShow(Sender: TObject);
begin
  WeightEdit.Text := FloatToStr(ImportPlanForm.EditSpPlansQueryWEIGHT.Value);
end;

end.
