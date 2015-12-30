unit PeriodFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, JvExMask, JvToolEdit, ExtCtrls;

type
  TPeriodForm = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    date1: TJvDateEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    date2: TJvDateEdit;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PeriodForm: TPeriodForm;
  Function GetPeriodFromForm(AOwner:TComponent;Var date1,date2:TDateTime;caption:string=''):boolean;
implementation

{$R *.dfm}

Function GetPeriodFromForm(AOwner:TComponent;Var date1,date2:TDateTime;caption:string=''):boolean;
Begin
 PeriodForm:=TPeriodForm.Create(AOwner);
 PeriodForm.date1.Date:=date1;
 PeriodForm.date2.Date:=date2;
 if caption<>'' then PeriodForm.GroupBox1.Caption:=' '+caption+': ';
 result:=(PeriodForm.ShowModal=mrOK);
 If result then
  Begin
   date1:=PeriodForm.date1.Date;
   date2:=PeriodForm.date2.Date;
  End;
End;

end.
