unit MergeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TMergeForm = class(TForm)
    ResultComboBox: TComboBox;
    ResultLabel: TLabel;
    OkBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MergeForm: TMergeForm;

implementation

{$R *.dfm}

end.
