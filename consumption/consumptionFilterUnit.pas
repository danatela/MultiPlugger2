unit consumptionFilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, Vcl.CheckLst;


type
  TconsumptionFilterForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_NUM: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    f_ADATE1: TJvDateEdit;
    f_ADATE2: TJvDateEdit;
    GroupBox1: TGroupBox;
    f_state: TCheckListBox;
    f_PNUM: TLabeledEdit;
    f_FilterBy: TRadioGroup;
    procedure f_FilterByClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TconsumptionFilter = class
 NUM: integer;
 PNUM: string[16];
 ADATE1: TDateTime;
 ADATE2: TDateTime;
 spent: boolean;
 notspent: boolean;
 FilterBy: Integer;
 Procedure Clear;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TconsumptionFilterForm;New:boolean):boolean;
 Function FromForm(Var Form:TconsumptionFilterForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetFilterString:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  consumptionFilterForm: TconsumptionFilterForm;

implementation

{$R *.dfm}

Constructor TconsumptionFilter.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TconsumptionFilter.Clear;
Var
 Year,Month,Day:word;
begin
 NUM:=0;
 PNUM:=EmptyStr;
 DecodeDate(Now,Year,Month,Day);
 ADATE1:=EncodeDate(Year,1,1);
 ADATE2:=Trunc(Now);
 spent:=True;
 notspent:=True;
 FilterBy := 0;
end;

Function TconsumptionFilter.GetFilterString:string;
Var
 FList:TStringList;
 i:integer;
Begin
 FList:=TStringList.Create;
 if NUM<>0 then FList.Append('csparrivals in (select nrec from '+SchemaName+'sparrivals where carrivals in (select nrec from '+SchemaName+'arrivals where NUM='+IntToStr(NUM)+'))');

 case FilterBy of
 0: FList.Append('csparrivals in (select nrec from '+SchemaName+'sparrivals where carrivals in (select nrec from '+SchemaName+'arrivals where adate between :ad1 and :ad2'+'))');
 1: FList.Append('nrec in (select cpassports from '+SchemaName+'sppassports where datef between :ad1 and :ad2)');
 end;

 if Not Empty(PNUM) then FList.Append('NUM like ''%'+AddSlashes(PNUM)+'%''');

 if Not spent or Not notspent then
  Begin
   if spent then FList.Append('spent=1');
   if notspent then FList.Append('spent<>1');
  End;
 result:=EmptyStr;
 for i:=0 to flist.Count-1 do
  Begin
   if Not Empty(flist[i]) then
    Begin
     if Not Empty(result) then result:=result+andd;
     result:=result+'('+flist[i]+')';
    End;
  End;
 if Empty(result) then result:=Truu;

 FList.Free;
End;

Function TconsumptionFilter.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
End;

Function TconsumptionFilter.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
End;

Function TconsumptionFilter.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TconsumptionFilterForm;
begin
 Form:=TconsumptionFilterForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TconsumptionFilter.ToForm(Var Form:TconsumptionFilterForm;New:boolean):boolean;
Begin
 Form.f_NUM.Text:=IntToStr(NUM);
 Form.f_PNUM.Text:=PNUM;
 Form.f_ADATE1.Date:=ADATE1;
 Form.f_ADATE2.Date:=ADATE2;
 Form.f_state.Checked[0]:=spent;
 Form.f_state.Checked[1]:=notspent;
 Form.f_FilterBy.ItemIndex := FilterBy;
 result:=True;
End;

Function TconsumptionFilter.FromForm(Var Form:TconsumptionFilterForm):boolean;
Begin
 NUM:=StrToIntM(Form.f_NUM.Text);
 PNUM:=Trim(Form.f_PNUM.Text);
 ADATE1:=Form.f_ADATE1.Date;
 ADATE2:=Form.f_ADATE2.Date;
 spent:=Form.f_state.Checked[0];
 notspent:=Form.f_state.Checked[1];
 FilterBy := Form.f_FilterBy.ItemIndex;
 result:=True;
End;

Destructor TconsumptionFilter.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TconsumptionFilterForm.f_FilterByClick(Sender: TObject);
var
  RadioGroup: TRadioGroup absolute Sender;
begin
  case RadioGroup.ItemIndex of
  0: GroupBox2.Caption := 'Дата задания:';
  1: GroupBox2.Caption := 'Дата паспорта:';
  end;
end;

end.
