unit ContractorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits,
  Spr1LabeledEditUnit;


type
  TContractorForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_NAME: TLabeledEdit;
    f_ACTIVE: TCheckBox;
    f_ABBR: TLabeledEdit;
    f_CODE: TLabeledEdit;
    f_ContrType: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TContractor = class
 NREC: int64;
 CONTRTYPE: integer;
 NAME: string[255];
 ABBR: string[20];
 CODE: string[20];
 ACTIVE: boolean;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Function GetByName(vname:string):boolean;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TContractorForm;New:boolean):boolean;
 Function FromForm(Var Form:TContractorForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetUnicalFieldValue:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  ContractorForm: TContractorForm;

implementation

{$R *.dfm}

Function TContractor.GetUnicalFieldValue:string;
Begin
 result:=Name;
End;

Function TContractor.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'CONTRACTORS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TContractor.GetByName(vname:string):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.Parameters.CreateParameter('name',ftString,pdInput,0,UpperCase(vname));
 adoq.SQL.Text:='select * from '+SchemaName+'CONTRACTORS'+' where NAME=:name';
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Constructor TContractor.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TContractor.Clear;
begin
 NREC:=0;
 NAME:=EmptyStr;
 CONTRTYPE:=0;
 ABBR:=EmptyStr;
 CODE:=EmptyStr;
 ACTIVE:=True;
end;

Function TContractor.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Dataset['NAME']:=NAME;
 Dataset['CONTRTYPE']:=CONTRTYPE;
 Dataset['ABBR']:=ABBR;
 Dataset['CODE']:=CODE;
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о контрагенте! ('+e.Message+')');
      End;
 End;
End;

Function TContractor.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 NAME:=Dataset['NAME'];
 CONTRTYPE:=Dataset['CONTRTYPE'];
 ABBR:=Dataset['ABBR'];
 CODE:=Dataset['CODE'];
 ACTIVE:=(Dataset['ACTIVE']=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о контрагенте! ('+e.Message+')');
   End;
 End;
End;

Function TContractor.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TContractorForm;
begin
 Result := False;
 Form:=TContractorForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TContractor.ToForm(Var Form:TContractorForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 if New then Form.Caption:='Новый контрагент'
        else Form.Caption:=NAME;
 if (CONTRTYPE>=0) and (CONTRTYPE<=1) then Form.f_CONTRTYPE.ItemIndex:=CONTRTYPE;
 Form.f_NAME.Text:=NAME;
 Form.f_ABBR.Text:=ABBR;
 Form.f_CODE.Text:=CODE;
 Form.f_ACTIVE.Checked:=ACTIVE;
 result:=True;
End;

Function TContractor.FromForm(Var Form:TContractorForm):boolean;
Begin
 nrec:=Form.f_nrec;
 CONTRTYPE:=Form.f_CONTRTYPE.ItemIndex;
 if CONTRTYPE<0 then CONTRTYPE:=0;

 NAME:=Form.f_NAME.Text;
 if NAME=EmptyStr then NAME:=space;

 ABBR:=Form.f_ABBR.Text;
 if ABBR=EmptyStr then ABBR:=space;

 CODE:=Form.f_CODE.Text;
 if CODE=EmptyStr then CODE:=space;

 ACTIVE:=Form.f_ACTIVE.Checked;
 result:=True;
End;

Destructor TContractor.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

