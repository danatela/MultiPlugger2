unit KD2Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits, InclFileUnit,
  Spr1LabeledEditUnit, EquipmentUnit, ContractorUnit, MemTableEh, CmkUserUnit, KDWeldingUnit, UPlugin;


type
  TKD2Form = class(TForm)
    Panel1: TPanel;
    CancelBtn: TBitBtn;
    OKBtn: TBitBtn;
    f_CMKGROUP: TComboBox;
    Label1: TLabel;
    MKGROUPADOQ: TADOQuery;
    Label2: TLabel;
    Label4: TLabel;
    f_INPUTDATE: TLabel;
    f_LUPDDATE: TLabel;
    RECIPIENTADOQ: TADOQuery;
    T_SVARKA_EQADOQ: TADOQuery;
    T_ZACHIST_EQADOQ: TADOQuery;
    T_DOVODKA_EQADOQ: TADOQuery;
    f_ORDN: TLabeledEdit;
    f_QUEUE: TLabeledEdit;
    f_MARK: TLabeledEdit;
    f_NAME: TLabeledEdit;
    f_WEIGHT1: TJvCalcEdit;
    Label3: TLabel;
    f_WEIGHTZ: TJvCalcEdit;
    Label5: TLabel;
    f_DRAWING: TLabeledEdit;
    Label6: TLabel;
    f_CRECIPIENT: TComboBox;
    GroupBox1: TGroupBox;
    f_T_SBORKA_NV: TJvCalcEdit;
    f_T_SBORKA_NVLabel: TLabel;
    f_T_SBORKA_PR: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    f_T_SVARKA_WE: TJvCalcEdit;
    GroupBox3: TGroupBox;
    f_T_ZACHIST_NVLabel: TLabel;
    f_T_ZACHIST_NV: TJvCalcEdit;
    GroupBox4: TGroupBox;
    f_T_GRPOKR_NVLabel: TLabel;
    f_T_GRPOKR_NV: TJvCalcEdit;
    f_T_GRPOKR_GR: TLabeledEdit;
    GroupBox5: TGroupBox;
    f_T_DOVODKA_NVLabel: TLabel;
    f_T_DOVODKA_NV: TJvCalcEdit;
    f_T_DOVODKA_PR: TLabeledEdit;
    f_PRIM: TLabeledEdit;
    f_T_SVARKA_M: TJvCalcEdit;
    Label12: TLabel;
    f_T_SVARKA_NV: TJvCalcEdit;
    f_T_SVARKA_NVLabel: TLabel;
    f_T_SVARKA_CEQ: TComboBox;
    Label14: TLabel;
    T_SVARKA_CEQComboUpdateBtn: TBitBtn;
    CMKGROUPComboUpdateBtn: TBitBtn;
    CRECIPIENTComboUpdateBtn: TBitBtn;
    T_ZACHIST_CEQComboUpdateBtn: TBitBtn;
    Label15: TLabel;
    f_T_ZACHIST_CEQ: TComboBox;
    f_T_GRPOKR_POKR: TLabeledEdit;
    T_DOVODKA_CEQComboUpdateBtn: TBitBtn;
    f_T_DOVODKA_CEQ: TComboBox;
    Label16: TLabel;
    f_RKOEF: TJvCalcEdit;
    Label17: TLabel;
    InclFileBtn: TBitBtn;
    T_SVARKA_CEQAppendBtn: TBitBtn;
    T_ZACHIST_CEQAppendBtn: TBitBtn;
    T_DOVODKA_CEQAppendBtn: TBitBtn;
    CMKGROUPAppendBtn: TBitBtn;
    CRECIPIENTAppendBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MkGroupsSprBtnClick(Sender: TObject);
    procedure CRECIPIENTComboUpdateBtnClick(Sender: TObject);
    procedure InclFileBtnClick(Sender: TObject);
    procedure T_SVARKA_CEQAppendBtnClick(Sender: TObject);
    procedure T_ZACHIST_CEQAppendBtnClick(Sender: TObject);
    procedure T_DOVODKA_CEQAppendBtnClick(Sender: TObject);
    procedure T_SVARKA_CEQComboUpdateBtnClick(Sender: TObject);
    procedure T_ZACHIST_CEQComboUpdateBtnClick(Sender: TObject);
    procedure T_DOVODKA_CEQComboUpdateBtnClick(Sender: TObject);
    procedure CMKGROUPAppendBtnClick(Sender: TObject);
    procedure CRECIPIENTAppendBtnClick(Sender: TObject);
    Procedure SetVisiblityRights;
    procedure GroupBox2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
    f_ckd:int64;
  end;

TKD2 = class
 ORDERNUM: string[10];
 NREC: int64;
 CKD: int64;
 ORDERNUM2: string[7];
 ORDN: string[5];
 QUEUE: string[100];
 MARK: string[100];
 NAME: string[255];
 RKOEF: double;
 CMKGROUP: int64;
 MKGROUP_S: string[255];
 WEIGHT1: double;
 WEIGHTZ: double;
 DRAWING: string[100];
 INPUTDATE: TDateTime;
 LUPDDATE: TDateTime;
 CRECIPIENT: int64;
 RECIPIENT_S: string[255];
 T_SBORKA_NV:double;
 T_SBORKA_PR: string[255];
 T_SVARKA_WE :double;
 T_SVARKA_M :double;
 T_SVARKA_CEQ: int64;
 T_SVARKA_EQ_S: string[255];
 T_SVARKA_NV :double;
 T_ZACHIST_CEQ: int64;
 T_ZACHIST_EQ_S: string[255];
 T_ZACHIST_NV :double;
 T_GRPOKR_GR: string[255];
 T_GRPOKR_POKR: string[255];
 T_GRPOKR_NV :double;
 T_DOVODKA_CEQ: int64;
 T_DOVODKA_EQ_S: string[255];
 T_DOVODKA_NV :double;
 T_DOVODKA_PR: string[255];
 PRIM: string[255];
 Procedure Clear;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Function GetTechnologyDescription(ttip:string;totalcount:integer):string;
 Function Save(Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TKD2Form;New:boolean):boolean;
 Function FromForm(Var Form:TKD2Form):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Procedure UpdateMKGROUP_S;
 Procedure UpdateRECIPIENT_S;
 Procedure UpdateT_SVARKA_EQ_S;
 Procedure UpdateT_ZACHIST_EQ_S;
 Procedure UpdateT_DOVODKA_EQ_S;
 constructor Create;
 destructor Destroy; override;
end;

var
  KD2Form: TKD2Form;

implementation

{$R *.dfm}

Function TKD2.GetTechnologyDescription(ttip:string;totalcount:integer):string;
Begin
 result:=EmptyStr;

 if ttip='SBORKA' then
  Begin
   if Not Empty(T_SBORKA_PR) or (T_SBORKA_NV<>0) then
    Begin
     if T_SBORKA_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_SBORKA_NV)+'/'+FloatToStr(T_SBORKA_NV*totalcount);
      End;
     if Not Empty(T_SBORKA_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_SBORKA_PR;
      End;
    End;
  End;
 if ttip='SVARKA' then
  Begin
   if (T_SVARKA_CEQ<>0) or (T_SVARKA_WE>0) or (T_SVARKA_M>0) or (T_SVARKA_NV<>0) then
    Begin
     if T_SVARKA_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_SVARKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_SVARKA_WE>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'в.эл.'+FloatToStr(T_SVARKA_WE)+'/'+FloatToStr(T_SVARKA_WE*totalcount);
      End;
     if T_SVARKA_M>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'метраж '+FloatToStr(T_SVARKA_M)+'/'+FloatToStr(T_SVARKA_M*totalcount);
      End;
     if T_SVARKA_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_SVARKA_NV)+'/'+FloatToStr(T_SVARKA_NV*totalcount);
      End;
    End;
  End;
 if ttip='ZACHIST' then
  Begin
   if (T_ZACHIST_CEQ<>0) or (T_ZACHIST_NV<>0) then
    Begin
     if T_ZACHIST_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_ZACHIST_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_ZACHIST_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_ZACHIST_NV)+'/'+FloatToStr(T_ZACHIST_NV*totalcount);
      End;
    End;
  End;
 if ttip='GRPOKR' then
  Begin
   if Not Empty(T_GRPOKR_GR) or Not Empty(T_GRPOKR_POKR) or (T_GRPOKR_NV<>0) then
    Begin
     if T_GRPOKR_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_GRPOKR_NV)+'/'+FloatToStr(T_GRPOKR_NV*totalcount);
      End;
     if Not Empty(T_GRPOKR_GR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_GRPOKR_GR;
      End;
     if Not Empty(T_GRPOKR_POKR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_GRPOKR_POKR;
      End;
    End;
  End;
 if ttip='DOVODKA' then
  Begin
   if (T_DOVODKA_CEQ<>0) or Not Empty(T_DOVODKA_PR) or (T_DOVODKA_NV<>0) then
    Begin
     if T_DOVODKA_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_DOVODKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_DOVODKA_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_DOVODKA_NV)+'/'+FloatToStr(T_DOVODKA_NV*totalcount);
      End;
     if Not Empty(T_DOVODKA_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_DOVODKA_PR;
      End;
    End;
  End;

End;


Procedure TKD2.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CKD', ftLargeInt);
// MTE.FieldDefs.Add(Prefix+'ORDERNUM2', ftString, 7);
 MTE.FieldDefs.Add(Prefix+'ORDN', ftString, 5);
 MTE.FieldDefs.Add(Prefix+'QUEUE', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'MARK', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'NAME', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'RKOEF', ftFloat);
 MTE.FieldDefs.Add(Prefix+'CMKGROUP', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'MKGROUP_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'WEIGHT1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'WEIGHTZ', ftFloat);
 MTE.FieldDefs.Add(Prefix+'DRAWING', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'INPUTDATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'LUPDDATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'PRIM', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'CRECIPIENT', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'RECIPIENT_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_SBORKA_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_SBORKA_PR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_SVARKA_WE', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_SVARKA_M', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_SVARKA_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_SVARKA_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_SVARKA_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_ZACHIST_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_ZACHIST_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_ZACHIST_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_GRPOKR_GR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_GRPOKR_POKR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_GRPOKR_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_DOVODKA_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_DOVODKA_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_DOVODKA_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_DOVODKA_PR', ftString, 255);
End;


Procedure TKD2.UpdateMKGROUP_S;
Begin
 MKGROUP_S:=GetTextValueOfPointer(IntToStr(CMKGROUP),SchemaName+'MKGROUPS','nrec','name',False);
 if MKGROUP_S=EmptyStr then MKGROUP_S:=space;
End;

Procedure TKD2.UpdateRECIPIENT_S;
Begin
 RECIPIENT_S:=GetTextValueOfPointer(IntToStr(CRECIPIENT),SchemaName+'CONTRACTORS','nrec','abbr',False);
 if RECIPIENT_S=EmptyStr then RECIPIENT_S:=space;
End;

Procedure TKD2.UpdateT_SVARKA_EQ_S;
Begin
 T_SVARKA_EQ_S:=GetTextValueOfPointer(IntToStr(T_SVARKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_SVARKA_EQ_S=EmptyStr then T_SVARKA_EQ_S:=space;
End;

Procedure TKD2.UpdateT_ZACHIST_EQ_S;
Begin
 T_ZACHIST_EQ_S:=GetTextValueOfPointer(IntToStr(T_ZACHIST_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_ZACHIST_EQ_S=EmptyStr then T_ZACHIST_EQ_S:=space;
End;

Procedure TKD2.UpdateT_DOVODKA_EQ_S;
Begin
 T_DOVODKA_EQ_S:=GetTextValueOfPointer(IntToStr(T_DOVODKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_DOVODKA_EQ_S=EmptyStr then T_DOVODKA_EQ_S:=space;
End;

procedure TKD2Form.CMKGROUPAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Группа М/К','Наименование') then
  Begin
  if Not MKGROUPADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    MKGROUPADOQ.Append;
    MKGROUPADOQ['freq']:=0;
    MKGROUPADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(MKGROUPADOQ,'NAME') then MKGROUPADOQ.Cancel;
    MKGROUPADOQ.Requery;
    if MKGROUPADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_CMKGROUP,MKGROUPADOQ,MKGROUPADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Spr1LabeledEdit.NAME+'" уже присутствует в справочнике!');
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD2Form.CRECIPIENTAppendBtnClick(Sender: TObject);
Var
 Contractor:TContractor;
begin
 Contractor:=TContractor.Create;
 if Contractor.Edit(Self,True) then
  Begin
  if Not RECIPIENTADOQ.Locate('NAME',Contractor.NAME,[loCaseInsensitive]) then
   Begin
    RECIPIENTADOQ.Append;
    if Not Contractor.Save(RECIPIENTADOQ) then RECIPIENTADOQ.Cancel;
    RECIPIENTADOQ.Requery;
    if RECIPIENTADOQ.Locate('NAME',Contractor.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_CRECIPIENT,RECIPIENTADOQ,RECIPIENTADOQ['nrec'],'abbr',EmptyStr,EmptyStr,False);
   End else ShowMessage('Контрагент с именем "'+Contractor.NAME+'" уже присутствует в справочнике!');
  End;
 Contractor.Free;
end;

procedure TKD2Form.CRECIPIENTComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CRECIPIENT.ItemIndex,RECIPIENTADOQ,SchemaName+'CONTRACTORS');
 RECIPIENTADOQ.Requery;
 LookupItemToForm(f_CRECIPIENT,RECIPIENTADOQ,tempValue,'abbr',EmptyStr,EmptyStr,False);
end;

Procedure TKD2Form.SetVisiblityRights;
Var
 ExclControlNameList:TStringList;
Begin
 f_T_SBORKA_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_SBORKA_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_SVARKA_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_SVARKA_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_ZACHIST_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_ZACHIST_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_GRPOKR_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_GRPOKR_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_DOVODKA_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_DOVODKA_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 ExclControlNameList:=TStringList.Create;
 ExclControlNameList.Append('F_T_SBORKA_NV');
 ExclControlNameList.Append('F_T_SVARKA_NV');
 ExclControlNameList.Append('F_T_ZACHIST_NV');
 ExclControlNameList.Append('F_T_GRPOKR_NV');
 ExclControlNameList.Append('F_T_DOVODKA_NV');
 ExclControlNameList.Append('F_T_SBORKA_NVLABEL');
 ExclControlNameList.Append('F_T_SVARKA_NVLABEL');
 ExclControlNameList.Append('F_T_ZACHIST_NVLABEL');
 ExclControlNameList.Append('F_T_GRPOKR_NVLABEL');
 ExclControlNameList.Append('F_T_DOVODKA_NVLABEL');
 ExclControlNameList.Append('INCLFILEBTN');
 ExclControlNameList.Append('CANCELBTN');
 ExclControlNameList.Append('OKBTN');
 if CurrentUser.CUSERGROUPS=4 then ControlDisabledIfNotInList(Self,ExclControlNameList);
 ExclControlNameList.Free;

 T_SVARKA_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_ZACHIST_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_DOVODKA_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 CMKGROUPAppendBtn.Enabled:=CurrentUser.SprEditRights;
 CRECIPIENTAppendBtn.Enabled:=CurrentUser.SprEditRights;
End;

procedure TKD2Form.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
 SetVisiblityRights;

 orderby:=' order by freq desc,name';

 MKGROUPADOQ.Connection:=Host.ADOC;
 wh:='active=1';
 MKGROUPADOQ.SQL.Text:='select * from '+SchemaName+'MKGROUPS'+' where '+wh+orderby;
 MKGROUPADOQ.Open;

 RECIPIENTADOQ.Connection:=Host.ADOC;
 wh:='active=1';
 RECIPIENTADOQ.SQL.Text:='select * from '+SchemaName+'CONTRACTORS'+' where '+wh+orderby;
 RECIPIENTADOQ.Open;

 T_SVARKA_EQADOQ.Connection:=Host.ADOC;
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=2)'+' and '+'(active=1)'; // 2 - Сварка
 T_SVARKA_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_SVARKA_EQADOQ.Open;

 T_ZACHIST_EQADOQ.Connection:=Host.ADOC;
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=3)'+' and '+'(active=1)'; // 3 - Зачистка
 T_ZACHIST_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_ZACHIST_EQADOQ.Open;

 T_DOVODKA_EQADOQ.Connection:=Host.ADOC;
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=5)'+' and '+'(active=1)'; // 5 - Доводка
 T_DOVODKA_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_DOVODKA_EQADOQ.Open;
end;

procedure TKD2Form.FormDestroy(Sender: TObject);
begin
 MKGROUPADOQ.Close;
 RECIPIENTADOQ.Close;
 T_SVARKA_EQADOQ.Close;
 T_ZACHIST_EQADOQ.Close;
 T_DOVODKA_EQADOQ.Close;
end;

procedure TKD2Form.GroupBox2DblClick(Sender: TObject);
begin
  if not Assigned(KDWeldingForm) then begin
    KDWeldingForm := TKDWeldingForm.Create(Self);
    KDWeldingForm.SpWeldingADOQuery.Connection := Host.ADOC;
  end;
  KDWeldingForm.SpWeldingClientDataSet.Close;
  KDWeldingForm.SpWeldingADOQuery.Close;
  KDWeldingForm.SpWeldingADOQuery.Parameters.ParamValues['pcMark'] := f_nrec;
  KDWeldingForm.SpWeldingADOQuery.Open;
  KDWeldingForm.SpWeldingClientDataSet.Open;
  LookupItemToForm(KDWeldingForm.f_T_SVARKA_CEQ, T_SVARKA_EQADOQ, LookupItemFromForm2(f_T_SVARKA_CEQ.ItemIndex, T_SVARKA_EQADOQ, SchemaName+'EQUIPMENT'), 'model', EmptyStr, EmptyStr, False);
  KDWeldingForm.ShowModal;
  KDWeldingForm.Free;
  KDWeldingForm := nil;
end;

procedure TKD2Form.InclFileBtnClick(Sender: TObject);
Var
 InclFile:TInclFile;
begin
 InclFile:=TInclFile.Create;
 InclFile.dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+'marks';
 InclFile.nrec:=f_nrec;
 InclFile.Descr:='порядковый '+f_ORDN.Text;
 InclFile.Edit(Self);
 InclFile.Free;
end;

procedure TKD2Form.MkGroupsSprBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
// LoadPlug(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'Plugins\'+'MaterialsEdit.plg');
// LoadPlug(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'Plugins\'+'kd.plg');
 tempValue:=LookupItemFromForm2(f_CMKGROUP.ItemIndex,MKGROUPADOQ,SchemaName+'MKGROUPS');
 MKGROUPADOQ.Requery;
 LookupItemToForm(f_CMKGROUP,MKGROUPADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD2Form.T_DOVODKA_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_DOVODKA_EQADOQ,'5',f_T_DOVODKA_CEQ);
end;

procedure TKD2Form.T_DOVODKA_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_DOVODKA_EQADOQ,f_T_DOVODKA_CEQ);
end;

procedure TKD2Form.T_SVARKA_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_SVARKA_EQADOQ,'2',f_T_SVARKA_CEQ);
end;

procedure TKD2Form.T_SVARKA_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_SVARKA_EQADOQ,f_T_SVARKA_CEQ);
end;

procedure TKD2Form.T_ZACHIST_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_ZACHIST_EQADOQ,'3',f_T_ZACHIST_CEQ);
end;

procedure TKD2Form.T_ZACHIST_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_ZACHIST_EQADOQ,f_T_ZACHIST_CEQ);
end;

Constructor TKD2.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TKD2.Clear;
begin
 NREC:=0;
 CKD:=0;
 ORDERNUM:=EmptyStr;
 ORDERNUM2:=EmptyStr;
 ORDN:=EmptyStr;
 QUEUE:=EmptyStr;
 MARK:=EmptyStr;
 NAME:=EmptyStr;
 RKOEF:=0;
 CMKGROUP:=0;
 MKGROUP_S:=EmptyStr;
 WEIGHT1:=0;
 WEIGHTZ:=0;
 DRAWING:=EmptyStr;
 INPUTDATE:=Now;
 LUPDDATE:=Now;
 CRECIPIENT:=0;
 RECIPIENT_S:=EmptyStr;
 T_SBORKA_NV:=0;
 T_SBORKA_PR:=EmptyStr;
 T_SVARKA_WE:=0;
 T_SVARKA_M:=0;
 T_SVARKA_CEQ:=0;
 T_SVARKA_EQ_S:=EmptyStr;
 T_SVARKA_NV:=0;
 T_ZACHIST_CEQ:=0;
 T_ZACHIST_EQ_S:=EmptyStr;
 T_ZACHIST_NV:=0;
 T_GRPOKR_GR:=EmptyStr;
 T_GRPOKR_POKR:=EmptyStr;
 T_GRPOKR_NV:=0;
 T_DOVODKA_CEQ:=0;
 T_DOVODKA_EQ_S:=EmptyStr;
 T_DOVODKA_NV:=0;
 T_DOVODKA_PR:=EmptyStr;
 PRIM:=EmptyStr;
end;

Function TKD2.Save(Dataset:TDataset;Prefix:string=''):boolean;
Begin
 result:=True;
 UpdateMKGROUP_S;
 UpdateRECIPIENT_S;
 UpdateT_SVARKA_EQ_S;
 UpdateT_ZACHIST_EQ_S;
 UpdateT_DOVODKA_EQ_S;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 Dataset[Prefix+'CKD']:=CKD;
// Dataset[Prefix+'ORDERNUM2']:=ORDERNUM2;
 Dataset[Prefix+'ORDN']:=ORDN;
 Dataset[Prefix+'QUEUE']:=QUEUE;
 Dataset[Prefix+'MARK']:=MARK;
 Dataset[Prefix+'NAME']:=NAME;
 Dataset[Prefix+'RKOEF']:=RKOEF;
 Dataset[Prefix+'CMKGROUP']:=CMKGROUP;
 Dataset[Prefix+'MKGROUP_S']:=MKGROUP_S;
 Dataset[Prefix+'WEIGHT1']:=WEIGHT1;
 Dataset[Prefix+'WEIGHTZ']:=WEIGHTZ;
 Dataset[Prefix+'DRAWING']:=DRAWING;
 Dataset[Prefix+'INPUTDATE']:=INPUTDATE;
 Dataset[Prefix+'LUPDDATE']:=LUPDDATE;
 Dataset[Prefix+'CRECIPIENT']:=CRECIPIENT;
 Dataset[Prefix+'RECIPIENT_S']:=RECIPIENT_S;
 Dataset[Prefix+'T_SBORKA_NV']:=T_SBORKA_NV;
 Dataset[Prefix+'T_SBORKA_PR']:=T_SBORKA_PR;
 Dataset[Prefix+'T_SVARKA_WE']:=T_SVARKA_WE;
 Dataset[Prefix+'T_SVARKA_M']:=T_SVARKA_M;
 Dataset[Prefix+'T_SVARKA_CEQ']:=T_SVARKA_CEQ;
 Dataset[Prefix+'T_SVARKA_EQ_S']:=T_SVARKA_EQ_S;
 Dataset[Prefix+'T_SVARKA_NV']:=T_SVARKA_NV;
 Dataset[Prefix+'T_ZACHIST_CEQ']:=T_ZACHIST_CEQ;
 Dataset[Prefix+'T_ZACHIST_EQ_S']:=T_ZACHIST_EQ_S;
 Dataset[Prefix+'T_ZACHIST_NV']:=T_ZACHIST_NV;
 Dataset[Prefix+'T_GRPOKR_GR']:=T_GRPOKR_GR;
 Dataset[Prefix+'T_GRPOKR_POKR']:=T_GRPOKR_POKR;
 Dataset[Prefix+'T_GRPOKR_NV']:=T_GRPOKR_NV;
 Dataset[Prefix+'T_DOVODKA_CEQ']:=T_DOVODKA_CEQ;
 Dataset[Prefix+'T_DOVODKA_EQ_S']:=T_DOVODKA_EQ_S;
 Dataset[Prefix+'T_DOVODKA_NV']:=T_DOVODKA_NV;
 Dataset[Prefix+'T_DOVODKA_PR']:=T_DOVODKA_PR;
 Dataset[Prefix+'PRIM']:=PRIM;
 Try
     Dataset.Post;
     if Empty(Prefix) then
     Begin
     FreqInc(SchemaName+'MKGROUPS',CMKGROUP);
     FreqInc(SchemaName+'CONTRACTORS',CRECIPIENT);
     FreqInc(SchemaName+'EQUIPMENT',T_SVARKA_CEQ);
     FreqInc(SchemaName+'EQUIPMENT',T_ZACHIST_CEQ);
     FreqInc(SchemaName+'EQUIPMENT',T_DOVODKA_CEQ);
     End;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о марке! ('+e.Message+')');
      End;
 End;

End;

Function TKD2.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 CKD:=Dataset['CKD'];
 ORDERNUM:=GetTextValueOfPointer(IntToStr(CKD),SchemaName+'kd','nrec','ORDERNUM',False);
 ORDERNUM2:=GetTextValueOfPointer(IntToStr(CKD),SchemaName+'kd','nrec','ORDERNUM2',False);
// ORDERNUM2:=Dataset['ORDERNUM2'];
 ORDN:=Dataset['ORDN'];
 QUEUE:=Dataset['QUEUE'];
 MARK:=Dataset['MARK'];
 NAME:=Dataset['NAME'];
 RKOEF:=Dataset['RKOEF'];
 CMKGROUP:=Dataset['CMKGROUP'];
 MKGROUP_S:=Dataset['MKGROUP_S'];
 WEIGHT1:=Dataset['WEIGHT1'];
 WEIGHTZ:=Dataset['WEIGHTZ'];
 DRAWING:=Dataset['DRAWING'];
 INPUTDATE:=Dataset.FieldByName('INPUTDATE').AsDateTime;
 LUPDDATE:=Dataset.FieldByName('LUPDDATE').AsDateTime;
 CRECIPIENT:=Dataset['CRECIPIENT'];
 RECIPIENT_S:=Dataset['RECIPIENT_S'];
 T_SBORKA_NV:=Dataset['T_SBORKA_NV'];
 T_SBORKA_PR:=Dataset['T_SBORKA_PR'];
 T_SVARKA_WE:=Dataset['T_SVARKA_WE'];
 T_SVARKA_M:=Dataset['T_SVARKA_M'];
 T_SVARKA_CEQ:=Dataset['T_SVARKA_CEQ'];
 T_SVARKA_EQ_S:=Dataset['T_SVARKA_EQ_S'];
 T_SVARKA_NV:=Dataset['T_SVARKA_NV'];
 T_ZACHIST_CEQ:=Dataset['T_ZACHIST_CEQ'];
 T_ZACHIST_EQ_S:=Dataset['T_ZACHIST_EQ_S'];
 T_ZACHIST_NV:=Dataset['T_ZACHIST_NV'];
 T_GRPOKR_GR:=Dataset['T_GRPOKR_GR'];
 T_GRPOKR_POKR:=Dataset['T_GRPOKR_POKR'];
 T_GRPOKR_NV:=Dataset['T_GRPOKR_NV'];
 T_DOVODKA_CEQ:=Dataset['T_DOVODKA_CEQ'];
 T_DOVODKA_EQ_S:=Dataset['T_DOVODKA_EQ_S'];
 T_DOVODKA_NV:=Dataset['T_DOVODKA_NV'];
 T_DOVODKA_PR:=Dataset['T_DOVODKA_PR'];
 PRIM:=Dataset['PRIM'];
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о марке! ('+e.Message+')');
   End;
 End;
End;

Function TKD2.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TKD2Form;
begin
 Form:=TKD2Form.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TKD2.ToForm(Var Form:TKD2Form;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 Form.f_ckd:=CKD;

 Form.OKBtn.Enabled:=(CurrentUser.CUSERGROUPS<>2);

 if New then Form.Caption:='Добавление новой марки для заказа МРК № '+ORDERNUM+', заказа ЦМК № '+ORDERNUM2
        else Form.Caption:='Заказ МРК № '+ORDERNUM+', заказ ЦМК № '+ORDERNUM2;

 Form.InclFileBtn.Enabled:=Not New and Not Empty(Host.PicturesDir);

// Form.f_ORDERNUM2.Text:=ORDERNUM2;
 Form.f_ORDN.Text:=ORDN;
 Form.f_QUEUE.Text:=QUEUE;
 Form.f_MARK.Text:=MARK;
 Form.f_NAME.Text:=NAME;
 Form.f_RKOEF.Value:=RKOEF;
 LookupItemToForm(Form.f_CMKGROUP,Form.MKGROUPADOQ,CMKGROUP,'name',EmptyStr,EmptyStr,False);
 Form.f_WEIGHT1.Value:=WEIGHT1;
 Form.f_WEIGHTZ.Value:=WEIGHTZ;
 Form.f_DRAWING.Text:=DRAWING;
 Form.f_INPUTDATE.Caption:=DateToStr(INPUTDATE);
 Form.f_LUPDDATE.Caption:=DateToStr(LUPDDATE);
 LookupItemToForm(Form.f_CRECIPIENT,Form.RECIPIENTADOQ,CRECIPIENT,'abbr',EmptyStr,EmptyStr,False);
 Form.f_T_SBORKA_NV.Value:=T_SBORKA_NV;
 Form.f_T_SBORKA_PR.Text:=T_SBORKA_PR;
 Form.f_T_SVARKA_WE.Value:=T_SVARKA_WE;
 Form.f_T_SVARKA_M.Value:=T_SVARKA_M;
 LookupItemToForm(Form.f_T_SVARKA_CEQ,Form.T_SVARKA_EQADOQ,T_SVARKA_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_SVARKA_NV.Value:=T_SVARKA_NV;
 LookupItemToForm(Form.f_T_ZACHIST_CEQ,Form.T_ZACHIST_EQADOQ,T_ZACHIST_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_ZACHIST_NV.Value:=T_ZACHIST_NV;
 Form.f_T_GRPOKR_GR.Text:=T_GRPOKR_GR;
 Form.f_T_GRPOKR_POKR.Text:=T_GRPOKR_POKR;
 Form.f_T_GRPOKR_NV.Value:=T_GRPOKR_NV;
 LookupItemToForm(Form.f_T_DOVODKA_CEQ,Form.T_DOVODKA_EQADOQ,T_DOVODKA_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_DOVODKA_NV.Value:=T_DOVODKA_NV;
 Form.f_T_DOVODKA_PR.Text:=T_DOVODKA_PR;
 Form.f_PRIM.Text:=PRIM;
 result:=True;
End;

Function TKD2.FromForm(Var Form:TKD2Form):boolean;
Begin
 nrec:=Form.f_nrec;
 ckd:=Form.f_ckd;

// ORDERNUM2:=Trim(Form.f_ORDERNUM2.Text);
// if ORDERNUM2=EmptyStr then ORDERNUM2:=space;
 ORDN:=Trim(Form.f_ORDN.Text);
 if ORDN=EmptyStr then ORDN:=space;
 QUEUE:=Trim(Form.f_QUEUE.Text);
 if QUEUE=EmptyStr then QUEUE:=space;
 MARK:=Trim(Form.f_MARK.Text);
 if MARK=EmptyStr then MARK:=space;
 NAME:=Trim(Form.f_NAME.Text);
 if NAME=EmptyStr then NAME:=space;
 RKOEF:=Form.f_RKOEF.Value;
 CMKGROUP:=LookupItemFromForm2(Form.f_CMKGROUP.ItemIndex,Form.MKGROUPADOQ,SchemaName+'MKGROUPS');
 WEIGHT1:=Form.f_WEIGHT1.Value;
 WEIGHTZ:=Form.f_WEIGHTZ.Value;
 DRAWING:=Trim(Form.f_DRAWING.Text);
 if DRAWING=EmptyStr then DRAWING:=space;
 CRECIPIENT:=LookupItemFromForm2(Form.f_CRECIPIENT.ItemIndex,Form.RECIPIENTADOQ,SchemaName+'CONTRACTORS');
 T_SBORKA_NV:=Form.f_T_SBORKA_NV.Value;
 T_SBORKA_PR:=Trim(Form.f_T_SBORKA_PR.Text);
 if T_SBORKA_PR=EmptyStr then T_SBORKA_PR:=space;
 T_SVARKA_WE:=Form.f_T_SVARKA_WE.Value;
 T_SVARKA_M:=Form.f_T_SVARKA_M.Value;
 T_SVARKA_CEQ:=LookupItemFromForm2(Form.f_T_SVARKA_CEQ.ItemIndex,Form.T_SVARKA_EQADOQ,SchemaName+'EQUIPMENT');
 T_SVARKA_NV:=Form.f_T_SVARKA_NV.Value;
 T_ZACHIST_CEQ:=LookupItemFromForm2(Form.f_T_ZACHIST_CEQ.ItemIndex,Form.T_ZACHIST_EQADOQ,SchemaName+'EQUIPMENT');
 T_ZACHIST_NV:=Form.f_T_ZACHIST_NV.Value;
 T_GRPOKR_GR:=Trim(Form.f_T_GRPOKR_GR.Text);
 if T_GRPOKR_GR=EmptyStr then T_GRPOKR_GR:=space;
 T_GRPOKR_POKR:=Trim(Form.f_T_GRPOKR_POKR.Text);
 if T_GRPOKR_POKR=EmptyStr then T_GRPOKR_POKR:=space;
 T_GRPOKR_NV:=Form.f_T_GRPOKR_NV.Value;
 T_DOVODKA_CEQ:=LookupItemFromForm2(Form.f_T_DOVODKA_CEQ.ItemIndex,Form.T_DOVODKA_EQADOQ,SchemaName+'EQUIPMENT');
 T_DOVODKA_NV:=Form.f_T_DOVODKA_NV.Value;
 T_DOVODKA_PR:=Trim(Form.f_T_DOVODKA_PR.Text);
 if T_DOVODKA_PR=EmptyStr then T_DOVODKA_PR:=space;
 PRIM:=Trim(Form.f_PRIM.Text);
 if PRIM=EmptyStr then PRIM:=space;

 result:=True;
End;

Destructor TKD2.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

