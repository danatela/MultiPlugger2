unit KDFilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  ContractorUnit;


type
  TKDFilterForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_ORDERNUM: TLabeledEdit;
    f_CCONTRACTOR: TComboBox;
    Label1: TLabel;
    contractorsADOQ: TADOQuery;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    f_ACTDATE1: TJvDateEdit;
    f_ACTDATE2: TJvDateEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    f_INPUTDATE1: TJvDateEdit;
    f_INPUTDATE2: TJvDateEdit;
    f_ORDERNUM2: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TKDFilter = class
 MinDate,MaxDate: TDateTime;
 ORDERNUM: string[10];
 ORDERNUM2: string[7];
 INPUTDATE1: TDateTime;
 INPUTDATE2: TDateTime;
 CCONTRACTOR: int64;
 ACTDATE1: TDateTime;
 ACTDATE2: TDateTime;
 Procedure Clear;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TKDFilterForm;New:boolean):boolean;
 Function FromForm(Var Form:TKDFilterForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetFilterString:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  KDFilterForm: TKDFilterForm;

implementation

{$R *.dfm}

procedure TKDFilterForm.FormCreate(Sender: TObject);
Var
 orderby:string;
begin
 orderby:=' order by freq desc,name';
 contractorsADOQ.Connection:=Host.ADOC;
 contractorsADOQ.SQL.Text:='select * from '+SchemaName+'CONTRACTORS'+' where active=1'+orderby;
 contractorsADOQ.Open;
end;

procedure TKDFilterForm.FormDestroy(Sender: TObject);
begin
 contractorsADOQ.Close;
end;

Constructor TKDFilter.Create;
begin
 inherited Create;
 MinDate:=0;
// MinDate:=EncodeDate(2000,1,1);
 MaxDate:=EncodeDate(9999,12,31);
 Clear;
end;

Procedure TKDFilter.Clear;
Var
 Year,Month,Day:word;
begin
 ORDERNUM:=EmptyStr;
 ORDERNUM2:=EmptyStr;
 DecodeDate(Now,Year,Month,Day);
 INPUTDATE1:=EncodeDate(Year,1,1);
 INPUTDATE2:=Trunc(Now);
 CCONTRACTOR:=0;
 ACTDATE1:=MinDate;
 ACTDATE2:=MaxDate;
end;

Function TKDFilter.GetFilterString:string;
Var
 FList:TStringList;
 i:integer;
Begin
 FList:=TStringList.Create;
 if Not Empty(ORDERNUM) then FList.Append('ORDERNUM='''+Trim(AddSlashes(ORDERNUM))+'''');
 if Not Empty(ORDERNUM2) then FList.Append('ORDERNUM2='''+Trim(AddSlashes(ORDERNUM2))+'''');
 if CCONTRACTOR<>0 then FList.Append('CCONTRACTOR='+IntToStr(CCONTRACTOR));
 FList.Append('inputdate>=:id1 and inputdate<=:id2');
 {If (ACTDATE1<>MinDate) or (ACTDATE2<>MaxDate) then} FList.Append('actdate>=:ad1 and actdate<=:ad2');
 If (ACTDATE1=MinDate) and (ACTDATE2=MaxDate) then FList[FList.Count-1]:='('+FList[FList.Count-1]+') or actdate is NULL';

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

Function TKDFilter.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
End;

Function TKDFilter.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
End;

Function TKDFilter.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TKDFilterForm;
begin
 Result := False;
 Form:=TKDFilterForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TKDFilter.ToForm(Var Form:TKDFilterForm;New:boolean):boolean;
Begin
 Form.f_ORDERNUM.Text:=ORDERNUM;
 Form.f_ORDERNUM2.Text:=ORDERNUM2;
 LookupItemToForm(Form.f_CCONTRACTOR,Form.contractorsADOQ,CCONTRACTOR,'abbr',EmptyStr,EmptyStr,False);
 Form.f_ACTDATE1.Date:=ACTDATE1;
 Form.f_ACTDATE2.Date:=ACTDATE2;
 Form.f_INPUTDATE1.Date:=INPUTDATE1;
 Form.f_INPUTDATE2.Date:=INPUTDATE2;
 result:=True;
End;

Function TKDFilter.FromForm(Var Form:TKDFilterForm):boolean;
Begin
 ORDERNUM:=Trim(Form.f_ORDERNUM.Text);
 ORDERNUM2:=Trim(Form.f_ORDERNUM2.Text);
 CCONTRACTOR:=LookupItemFromForm2(Form.f_CCONTRACTOR.ItemIndex,Form.contractorsADOQ,SchemaName+'CONTRACTORS');
 ACTDATE1:=Form.f_ACTDATE1.Date;
 ACTDATE2:=Form.f_ACTDATE2.Date;
 INPUTDATE1:=Form.f_INPUTDATE1.Date;
 INPUTDATE2:=Form.f_INPUTDATE2.Date;
 result:=True;
End;

Destructor TKDFilter.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.
