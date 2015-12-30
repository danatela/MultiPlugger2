unit EquipmentUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits,
  Spr1LabeledEditUnit, Vcl.CheckLst;


type
  TEquipmentForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    SITESADOQ: TADOQuery;
    GroupBox1: TGroupBox;
    f_OperationsCLB: TCheckListBox;
    Panel2: TPanel;
    f_NAME: TLabeledEdit;
    f_INVNUM: TLabeledEdit;
    f_CSITE: TComboBox;
    f_CSITELabel: TLabel;
    CSITEAppendBtn: TBitBtn;
    f_CSITEComboUpdateBtn: TBitBtn;
    f_ACTIVE: TCheckBox;
    f_CEHNUM: TLabeledEdit;
    f_PYEAR: TLabeledEdit;
    f_MODEL: TLabeledEdit;
    f_OPERATIONS: TLabeledEdit;
    OADOQ: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure f_CSITEComboUpdateBtnClick(Sender: TObject);
    procedure CSITEAppendBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TEquipment = class
 NREC: int64;
 NAME: string[255];
 INVNUM: integer;
 CEHNUM: string[12];
 PYEAR:	integer;
 MODEL: string[255];
 CSITE: int64;
 OPERATIONS: string[255];
 ACTIVE: boolean;
 OPERLIST: TStringList;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Function GetByName(vname:string):boolean;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TEquipmentForm;New:boolean):boolean;
 Function FromForm(Var Form:TEquipmentForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetUnicalFieldValue:string;
 Function GetUnicalFieldValue1:string;
 Function GetUnicalFieldValue2:string;
 Function GetUnicalFieldValue3:integer;
 Function GetUnicalFieldValues:variant;
 constructor Create;
 destructor Destroy; override;
end;

var
  EquipmentForm: TEquipmentForm;

procedure NewEQUIPMENT(OForm:TComponent;Var ADOQ:TAdoQuery;InitOper:string;Var f_CEQ:TComboBox);
procedure EQUIPMENTComboUpdate(Var ADOQ:TAdoQuery;Var f_CEQ:TComboBox);

implementation

{$R *.dfm}

procedure NewEQUIPMENT(OForm:TComponent;Var ADOQ:TAdoQuery;InitOper:string;Var f_CEQ:TComboBox);
Var
 eq:TEquipment;
begin
 eq:=TEquipment.Create;
 eq.OPERLIST.Append(InitOper);
 if eq.Edit(OForm,True) then
  Begin
  if Not ADOQ.Locate('NAME;INVNUM;CEHNUM',VarArrayOf([eq.NAME,eq.INVNUM,eq.CEHNUM]),[loCaseInsensitive]) then
   Begin
    ADOQ.Append;
    ADOQ['active']:=1;
    if Not eq.Save(ADOQ) then ADOQ.Cancel;
    ADOQ.Requery;
    if ADOQ.Locate('NAME;INVNUM;CEHNUM',VarArrayOf([eq.NAME,eq.INVNUM,eq.CEHNUM]),[loCaseInsensitive]) then
     LookupItemToForm(f_CEQ,ADOQ,ADOQ['nrec'],'name','cehnum',tire,False,EmptyStr,'invnum');
   End else ShowMessage('Оборудование с именем "'+eq.Name+'", инв.номером "'+IntToStr(eq.INVNUM)+'" и цех.номером "'+eq.CEHNUM+'" уже присутствует в справочнике!');
  End;
 eq.Free;
end;

procedure EQUIPMENTComboUpdate(Var ADOQ:TAdoQuery;Var f_CEQ:TComboBox);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CEQ.ItemIndex,ADOQ,SchemaName+'EQUIPMENT');
 ADOQ.Requery;
 LookupItemToForm(f_CEQ,ADOQ,tempValue,'model',EmptyStr,EmptyStr,False);
end;

Function TEquipment.GetUnicalFieldValue:string;
Begin
 result:=Name+tire+cehnum+' ('+IntToStr(invnum)+')';
End;

Function TEquipment.GetUnicalFieldValue1:string;
Begin
 result:=Name;
End;

Function TEquipment.GetUnicalFieldValue2:string;
Begin
 result:=cehnum;
End;

Function TEquipment.GetUnicalFieldValue3:integer;
Begin
 result:=invnum;
End;

Function TEquipment.GetUnicalFieldValues:variant;
Begin
 result:=VarArrayOf([Name,cehnum,invnum]);
End;

Function TEquipment.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TEquipment.GetByName(vname:string):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.Parameters.CreateParameter('name',ftString,pdInput,0,UpperCase(vname));
 adoq.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where NAME=:name';
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

procedure TEquipmentForm.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
 orderby:=' order by name';
 SITESADOQ.Connection:=Host.ADOC;
 wh:='active=1';
 SITESADOQ.SQL.Text:='select * from '+SchemaName+'SITES'+' where '+wh+orderby;
 SITESADOQ.Open;

 OADOQ.Connection:=Host.ADOC;
 OADOQ.SQL.Text:='select * from '+SchemaName+'OPERATIONS'+' where '+wh+orderby;
 OADOQ.Open;
end;

procedure TEquipmentForm.FormDestroy(Sender: TObject);
begin
 SITESADOQ.Close;
 OADOQ.Close;
end;

procedure TEquipmentForm.FormShow(Sender: TObject);
begin
 f_NAME.SetFocus;
end;

procedure TEquipmentForm.CSITEAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Отделение (участок)','Наименование') then
  Begin
  if Not SITESADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    SITESADOQ.Append;
    SITESADOQ['freq']:=0;
    SITESADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(SITESADOQ,'NAME') then SITESADOQ.Cancel;
    SITESADOQ.Requery;
    if SITESADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_CSITE,SITESADOQ,SITESADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TEquipmentForm.f_CSITEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CSITE.ItemIndex,SITESADOQ,SchemaName+'SITES');
 SITESADOQ.Requery;
 LookupItemToForm(f_CSITE,SITESADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

Constructor TEquipment.Create;
begin
 inherited Create;
 OPERLIST:=TStringList.Create;
 Clear;
end;

Procedure TEquipment.Clear;
begin
 NREC:=0;
 NAME:=EmptyStr;
 INVNUM:=0;
 CEHNUM:=EmptyStr;
 PYEAR:=CurrentYear;
 MODEL:=EmptyStr;
 CSITE:=0;
 OPERATIONS:=EmptyStr;
 ACTIVE:=True;
 OPERLIST.Clear;
end;

Function TEquipment.Save(Var Dataset:TAdoQuery):boolean;
Var
 ok:boolean;
 i:integer;
Begin
 result:=True;
 Dataset['NAME']:=NAME;
 Dataset['INVNUM']:=INVNUM;
 Dataset['CEHNUM']:=CEHNUM;
 Dataset['PYEAR']:=PYEAR;
 Dataset['MODEL']:=MODEL;
 Dataset['CSITE']:=CSITE;
 Dataset['OPERATIONS']:=OPERATIONS;
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Repeat
  if NREC=0 then Dataset['NREC']:=Random(1000000000)+1000000000
            else Dataset['NREC']:=NREC;
  Try
   Dataset.Post;
   FreqInc(SchemaName+'SITES',CSITE);
   ok:=True;
  Except
   ok:=False;
  End;
 Until ok;

 NREC:=Dataset['NREC'];

 Host.ADOC.Execute('delete from '+SchemaName+'OPEREQUIP'+' where CEQUIPMENT='+IntToStr(NREC));
 for i := 0 to OPERLIST.Count-1 do
  Host.ADOC.Execute('insert into '+SchemaName+'OPEREQUIP'+' (CEQUIPMENT,COPERATION) values ('+IntToStr(NREC)+comma+OPERLIST[i]+')');


End;

Function TEquipment.Read(Var Dataset:TAdoQuery):boolean;
Var
 ADOQ:TAdoQuery;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];

 NAME:=Dataset['NAME'];
 INVNUM:=Dataset['INVNUM'];
 CEHNUM:=Dataset['CEHNUM'];
 PYEAR:=Dataset['PYEAR'];
 MODEL:=Dataset['MODEL'];
 CSITE:=Dataset['CSITE'];
 OPERATIONS:=Dataset['OPERATIONS'];
 ACTIVE:=(Dataset['ACTIVE']=1);

 ADOQ:=TAdoQuery.Create(nil);
 ADOQ.Connection:=Host.ADOC;
 ADOQ.SQL.Text:='select COPERATION from '+SchemaName+'OPEREQUIP'+' where CEQUIPMENT='+IntToStr(NREC)+' order by COPERATION';
 ADOQ.Open;
 while Not ADOQ.Eof do
  Begin
   OPERLIST.Append(VarToStr(ADOQ['COPERATION']));
   ADOQ.Next;
  End;
 ADOQ.Close;
 ADOQ.Free;

 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации об оборудовании! ('+e.Message+')');
   End;
 End;
End;

Function TEquipment.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TEquipmentForm;
begin
 Result := False;
 Form:=TEquipmentForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TEquipment.ToForm(Var Form:TEquipmentForm;New:boolean):boolean;
Var
 i:integer;
 s:string;
Begin
 Form.f_nrec:=nrec;
 if New then Form.Caption:='Новое оборудование'
        else Form.Caption:=NAME;

 Form.f_NAME.Text:=NAME;
 Form.f_INVNUM.Text:=IntToStr(INVNUM);
 Form.f_CEHNUM.Text:=CEHNUM;
 Form.f_PYEAR.Text:=IntToStr(PYEAR);
 Form.f_MODEL.Text:=MODEL;
 LookupItemToForm(Form.f_CSITE,Form.SITESADOQ,CSITE,'name',EmptyStr,EmptyStr,False);
 Form.f_OPERATIONS.Text:=OPERATIONS;
 Form.f_ACTIVE.Checked:=ACTIVE;

 s:=EmptyStr;
 Form.f_OperationsCLB.Clear;
 Form.OADOQ.First;
 while Not Form.OADOQ.Eof do
  Begin
   Form.f_OperationsCLB.Items.Append(VarToStr(Form.OADOQ['NAME']));
   Form.f_OperationsCLB.Checked[Form.f_OperationsCLB.Items.Count-1]:=(OPERLIST.IndexOf(Form.OADOQ['NREC'])<>-1);
   if Form.f_OperationsCLB.Checked[Form.f_OperationsCLB.Items.Count-1] then
    Begin
     if Not Empty(s) then s:=s+comma+space;
     s:=s+VarToStr(Form.OADOQ['NAME']);
    End;
   Form.OADOQ.Next;
  End;
 if Form.f_OperationsCLB.Items.Count>0 then Form.f_OperationsCLB.ItemIndex:=0;
 if Not Empty(s) and Empty(Form.f_OPERATIONS.Text) then Form.f_OPERATIONS.Text:=s;
 result:=True;
End;

Function TEquipment.FromForm(Var Form:TEquipmentForm):boolean;
Var
 i:integer;
Begin
 nrec:=Form.f_nrec;

 NAME:=Form.f_NAME.Text;
 if NAME=EmptyStr then NAME:=space;

 INVNUM:=StrToIntM(Form.f_INVNUM.Text);

 CEHNUM:=Form.f_CEHNUM.Text;
 if CEHNUM=EmptyStr then CEHNUM:=space;

 PYEAR:=StrToIntM(Form.f_PYEAR.Text);

 MODEL:=Form.f_MODEL.Text;
 if MODEL=EmptyStr then MODEL:=space;

 CSITE:=LookupItemFromForm2(Form.f_CSITE.ItemIndex,Form.SITESADOQ,SchemaName+'SITES');

 OPERATIONS:=Form.f_OPERATIONS.Text;
 if OPERATIONS=EmptyStr then OPERATIONS:=space;

 ACTIVE:=Form.f_ACTIVE.Checked;

 OPERLIST.Clear;
 for i := 0 to Form.f_OperationsCLB.Items.Count-1 do
  if Form.f_OperationsCLB.Checked[i] then
   Begin
    Form.OADOQ.RecNo:=i+1;
    OPERLIST.Append(VarToStr(Form.OADOQ['NREC']));
   End;

 result:=True;
End;

Destructor TEquipment.Destroy;
begin
 Clear;
 OPERLIST.Free;
 inherited Destroy;
end;

end.

