unit EditPlanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Buttons;

type
  TEditPlanForm = class(TForm)
    YearEdit: TDBEdit;
    YearLabel: TLabel;
    MonthLabel: TLabel;
    MonthComboBox: TComboBox;
    OkBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditPlanForm: TEditPlanForm;

implementation

uses ImportPlanUnit;

{$R *.dfm}

procedure TEditPlanForm.FormShow(Sender: TObject);
begin
  MonthComboBox.Text := ImportPlanForm.EditPlansQuery['month'];
end;

end.
