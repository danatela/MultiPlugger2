unit PassportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  ContractorUnit, frxClass, FastReportUnit, MemTableEh,  GrMaterialsUnit,
  CmkUserUnit, KD2Unit, KD3Unit, SelectListsUnit, DBGridEhGrouping, GridsEh,
  DBGridEh, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList, SpArrivalUnit,
  MagsoftMsgDlgUnit, SpPassportUnit, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Menus,
  PaspDetailUnit, PassportTreeUnit, SelectDetailsUnit, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, StrUtils;


type
  TPassportForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    currentADOQ: TADOQuery;
    ActionManager1: TActionManager;
    AppendDetailAction: TAction;
    EditDetailAction: TAction;
    DelDetailAction: TAction;
    ImageList1: TImageList;
    currentDS: TDataSource;
    BitBtn14: TBitBtn;
    PassportReportAction: TAction;
    Panel3: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Splitter2: TSplitter;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    f_PLAN: TComboBox;
    Label1: TLabel;
    detailsADOQ: TADOQuery;
    Panel2: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    f_NUM: TLabeledEdit;
    GroupBox3: TGroupBox;
    Splitter3: TSplitter;
    ostatokADOQ: TADOQuery;
    HistoryADOQ: TADOQuery;
    OstatokGrid: TDBGridEh;
    OstatokDS: TDataSource;
    HistoryDS: TDataSource;
    detailsDS: TDataSource;
    GroupBox4: TGroupBox;
    DetailsGrid: TDBGridEh;
    ostatokDBNavigator: TDBNavigator;
    GroupBox5: TGroupBox;
    CurrentGrid: TDBGridEh;
    HistoryGrid: TDBGridEh;
    HistoryEditAction: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    plansADOQ: TADOQuery;
    f_ORDERNUM: TComboBox;
    f_ORDERNUM2: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    f_lom: TLabel;
    PassportTreeAction: TAction;
    BitBtn5: TBitBtn;
    AppendDetailsAction: TAction;
    BitBtn6: TBitBtn;
    TrimTypesADOQ: TADOQuery;
    TrimTypesADOQNREC: TFloatField;
    TrimTypesADOQDESCR: TStringField;
    TrimTypesADOQPARAMS: TMemoField;
    currentADOQNREC: TFloatField;
    currentADOQKOLT: TFloatField;
    currentADOQPROP_PWIDTH1: TFloatField;
    currentADOQPROP_PWIDTH2: TFloatField;
    currentADOQPROP_SIZE1: TFloatField;
    currentADOQPROP_SIZE2: TFloatField;
    currentADOQPROP_WTHICK: TFloatField;
    currentADOQPROP_SLENGTH: TFloatField;
    currentADOQPROP_DIAM: TFloatField;
    currentADOQPROP_SIZE: TFloatField;
    currentADOQCPASSPORTS: TFloatField;
    currentADOQNAME: TStringField;
    currentADOQMARKIR: TStringField;
    currentADOQCSPPASSPORTS: TFloatField;
    currentADOQDATEF: TDateTimeField;
    currentADOQPROP_A: TFloatField;
    currentADOQPROP_B: TFloatField;
    currentADOQPROP_C: TFloatField;
    currentADOQPROP_D: TFloatField;
    currentADOQTRIMTYPE: TFloatField;
    currentADOQPROP_SQUARE: TFloatField;
    ostatokADOQNREC: TFloatField;
    ostatokADOQKOLT: TFloatField;
    ostatokADOQPROP_PWIDTH1: TFloatField;
    ostatokADOQPROP_PWIDTH2: TFloatField;
    ostatokADOQPROP_SIZE1: TFloatField;
    ostatokADOQPROP_SIZE2: TFloatField;
    ostatokADOQPROP_WTHICK: TFloatField;
    ostatokADOQPROP_SLENGTH: TFloatField;
    ostatokADOQPROP_DIAM: TFloatField;
    ostatokADOQPROP_SIZE: TFloatField;
    ostatokADOQPROP_THICK_C: TFloatField;
    ostatokADOQPROP_WIDTH_C: TFloatField;
    ostatokADOQPROP_LENGTH_C: TFloatField;
    ostatokADOQCPASSPORTS: TFloatField;
    ostatokADOQNAME: TStringField;
    ostatokADOQMARKIR: TStringField;
    ostatokADOQCSPPASSPORTS: TFloatField;
    ostatokADOQDATEF: TDateTimeField;
    ostatokADOQPROP_A: TFloatField;
    ostatokADOQPROP_B: TFloatField;
    ostatokADOQPROP_C: TFloatField;
    ostatokADOQPROP_D: TFloatField;
    ostatokADOQTRIMTYPE: TFloatField;
    ostatokADOQPROP_SQUARE: TFloatField;
    currentADOQTrimType_S: TStringField;
    ostatokADOQTrimType_S: TStringField;
    SpisButton: TSpeedButton;
    SpisAction: TAction;
    spisADOQ: TADOQuery;
    currentADOQISLOM: TFloatField;
    currentADOQLOMDATE: TDateTimeField;
    currentADOQLOMPERSON: TFloatField;
    currentADOQLOMCOMMENT: TStringField;
    ostatokADOQISLOM: TFloatField;
    ostatokADOQLOMDATE: TDateTimeField;
    ostatokADOQLOMPERSON: TFloatField;
    ostatokADOQLOMCOMMENT: TStringField;
    currentADOQPROP_THICK_C: TFloatField;
    currentADOQPROP_WIDTH_C: TFloatField;
    currentADOQPROP_LENGTH_C: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AppendDetailActionExecute(Sender: TObject);
    Procedure UpdateGridColumnsVis;
    procedure EditDetailActionExecute(Sender: TObject);
    procedure DelDetailActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PassportReportActionExecute(Sender: TObject);
    procedure ostatokADOQBeforePost(DataSet: TDataSet);
    procedure detailsADOQBeforePost(DataSet: TDataSet);
    procedure currentDSDataChange(Sender: TObject; Field: TField);
    procedure UpdateDetailsADOQ;
    procedure UpdateOstatokADOQ;
    procedure detailsADOQAfterInsert(DataSet: TDataSet);
    procedure ostatokADOQAfterInsert(DataSet: TDataSet);
    procedure HistoryEditActionExecute(Sender: TObject);
    procedure HistoryDSDataChange(Sender: TObject; Field: TField);
    procedure HistoryGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    Procedure UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset);
    procedure DetailsGridColumns4DropDownBoxCheckButton(Sender: TObject;
      ACol: Integer; Column: TColumnEh; var Enabled: Boolean);
    procedure DetailsGridColumns4EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure DetailsGridColumns4EditButtonDown(Sender: TObject;
      TopButton: Boolean; var AutoRepeat, Handled: Boolean);
    procedure f_PLANChange(Sender: TObject);
    procedure DetailsGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure detailsDSDataChange(Sender: TObject; Field: TField);
    procedure OstatokDSDataChange(Sender: TObject; Field: TField);
    procedure PassportTreeActionExecute(Sender: TObject);
    procedure OstatokGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AppendDetailsActionExecute(Sender: TObject);
    procedure f_ORDERNUM2Change(Sender: TObject);
    procedure f_ORDERNUMChange(Sender: TObject);
    procedure ostatokADOQTRIMTYPEChange(Sender: TField);
    procedure SpisActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ActionsEnabling;
    procedure LomUpdate;
    procedure UpdateKolT(DataSet: TDataSet);
  public
    { Public declarations }
    f_RootCSpPassports:int64;
    f_nrec:int64;
    f_CSPARRIVALS:int64;
    f_new:boolean;
  end;

TPassport = class
 NREC: int64;
 CSPARRIVALS: int64;
 NUM: string[16];
 SPENT: boolean;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Procedure FieldsToReport(Var rep:TfrxReport;Prefix:string='');
 Procedure Report(OForm:TComponent;fr3:string);
 Procedure Report2(OForm:TComponent;Var f:boolean;Var conly:boolean; PrintEmptyPassp:boolean; Var gr:TGrMaterials; Var spar:TSpArrival);
 Function Save(Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TPassportForm;New:boolean):boolean;
 Function FromForm(Var Form:TPassportForm):boolean;
 Function Edit(OForm:TComponent;New:boolean;RootCSpPassports:int64=0):boolean;
 Procedure BuildPassportSpecMTE(OForm:TComponent;Var MTE:TMemTableEh;CSPPASSPORTS,CPARENT:int64);
 constructor Create;
 destructor Destroy; override;
end;

var
  PassportForm: TPassportForm;

implementation

{$R *.dfm}

Function TPassport.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'PASSPORTS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function GetCGRMATERIALSOfPassport(CSPARRIVALS:int64):int64;
Begin
 result:=StrToIntM(GetTextValueOfPointer(IntToStr(CSPARRIVALS),SchemaName+'SPARRIVALS','NREC','CGRMATERIALS',False));
End;

Procedure TPassportForm.UpdateGridColumnsVis;
Var
 PropList, DopPropList: TStringList;
 CGRMATERIALS:int64;
 I: Integer;
Begin
 PropList := TStringList.Create;
 CGRMATERIALS:=GetCGRMATERIALSOfPassport(f_CSPARRIVALS);
 GetPropListOfMATERIAL2(CGRMATERIALS,PropList);

 if GetTextValueOfPointer(IntToStr(CGRMATERIALS),SchemaName+'GRMATERIALS','NREC','CPARENT',False) = '4' then begin
   DopPropList := TStringList.Create;
   DopPropList.CommaText := UpperCase(GetTextValueOfPointer(VarToStr(currentADOQ['TRIMTYPE']), SchemaName + 'TRIMTYPES', 'nrec', 'PARAMS'));
   for I := 0 to DopPropList.Count - 1 do
     if PropList.IndexOf(DopPropList[I]) = -1 then PropList.Add(DopPropList[I]);
   for I := PropList.Count - 1 downto 0 do
     if MatchStr(PropList[I], ['PROP_WIDTH', 'PROP_LENGTH', 'PROP_DIAM']) then
       if DopPropList.IndexOf(PropList[I]) = -1 then
         PropList.Delete(I);
   DopPropList.Free;
 end else begin
   currentADOQTrimType_S.Visible := False;
   ostatokADOQTrimType_S.Visible := False;
 end;

 for I := 0 to PropList.Count - 1 do
   if MatchStr(PropList[I], ['PROP_THICK', 'PROP_WIDTH', 'PROP_LENGTH']) then
     PropList[I] := PropList[I] + '_C';

 for I := 0 to CurrentGrid.Columns.Count - 1 do
   if StartsStr('PROP_', CurrentGrid.Columns[I].FieldName) then
     CurrentGrid.Columns[I].Visible := PropList.IndexOf(CurrentGrid.Columns[I].FieldName) > -1
   else if CurrentGrid.Columns[I].FieldName = 'TRIMTYPE_S' then
     CurrentGrid.Columns[I].Visible := CurrentGrid.Columns[I].Field.Visible;

 for I := 0 to OstatokGrid.Columns.Count - 1 do
   if StartsStr('PROP_', OstatokGrid.Columns[I].FieldName) then
     OstatokGrid.Columns[I].Visible := PropList.IndexOf(OstatokGrid.Columns[I].FieldName) > -1
   else if OstatokGrid.Columns[I].FieldName = 'TRIMTYPE_S' then
     OstatokGrid.Columns[I].Visible := OstatokGrid.Columns[I].Field.Visible;

 PropList.Free;
End;


Procedure TPassport.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CSPARRIVALS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'NUM', ftString, 16);
 MTE.FieldDefs.Add(Prefix+'SPENT', ftBoolean);
End;


Procedure TPassport.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
 CmkUser:TCmkUser;

Begin
 if Empty(Prefix) then Pr:='PASSPORTS'
                  else Pr:=Prefix;

 rep.Variables[Pr+dot+'NREC']:=NREC;
 rep.Variables[Pr+dot+'CSPARRIVALS']:=CSPARRIVALS;
 rep.Variables[Pr+dot+'NUM']:=kav+AddSlashes(NUM)+kav;
 rep.Variables[Pr+dot+'SPENT']:=SPENT;
 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;
End;


Procedure TPassport.BuildPassportSpecMTE(OForm:TComponent;Var MTE:TMemTableEh;CSPPASSPORTS,CPARENT:int64);
Var
 ADOQ:TAdoQuery;
 spar:TSpArrival;
Begin
 spar:=TSpArrival.Create;;
 MTE:=TMemTableEh.Create(nil);
 MTE.FieldDefs.Add('DATEIZG', ftDate);
 MTE.FieldDefs.Add('ordernum', ftString, 10);
 MTE.FieldDefs.Add('ordernum2', ftString, 7);
 MTE.FieldDefs.Add('ordn', ftString, 5);
 MTE.FieldDefs.Add('kolshtf', ftFloat);
 MTE.FieldDefs.Add('do_name', ftString, 16);
 MTE.FieldDefs.Add('do_razmern', ftString, 255);
// MTE.FieldDefs.Add('RAZMERN', ftString, 255);

// AppendStructToMTE(MTE,'ARRIVALS_');
// spar.AppendStructToMTE(MTE,'SPARRIVALS_');

 MTE.CreateDataSet;
 MTE.Open;

 ADOQ:=TAdoQuery.Create(nil);
 ADOQ.Connection:=Host.ADOC;
 ADOQ.EnableBCD:=False;
 adoq.SQL.Text:='select '+
 'Max(nrec) as nrec,Max(CSPPASSPORTS) as CSPPASSPORTS,Sum(kolshtf) as kolshtf,Sum(weight) as weight,DATEIZG,ORDERNUM,ORDERNUM2,ORDN'+
 ' from '+SchemaName+'SPPASSPORTSD'+
' where '+'csppassports='+IntToStr(CSPPASSPORTS)+
' group by DATEIZG,ORDERNUM,ORDERNUM2,ORDN'+
' order by DATEIZG,ORDERNUM,ORDERNUM2,ORDN';
 ADOQ.Open;
 while Not ADOQ.Eof do
  Begin
   MTE.Append;
   MTE['dateizg']:=adoq['dateizg'];
   MTE['ordernum']:=adoq['ordernum'];
   MTE['ordernum2']:=adoq['ordernum2'];
   MTE['ordn']:=adoq['ordn'];
   MTE['kolshtf']:=adoq['kolshtf'];
   MTE.Post;
   ADOQ.Next;
  End;
 ADOQ.Close;

 adoq.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS'+' where CSPPASSPORTS='+IntToStr(CSPPASSPORTS)+' order by NAME';
 ADOQ.Open;
 while Not ADOQ.Eof do
  Begin
   if mte.RecordCount>=adoq.RecNo then
    Begin
     mte.RecNo:=adoq.RecNo;
     mte.Edit;
    End else mte.Append;
//   if MTE['dateizg').IsNull or (MTE['dateizg').AsDateTime=0) then MTE['dateizg']:=adoq['datef'];
   MTE['do_name']:=adoq['markir'];

   spar.PROP_PWIDTH1:=adoq['PROP_PWIDTH1'];
   spar.PROP_PWIDTH2:=adoq['PROP_PWIDTH2'];
   spar.PROP_SIZE1:=adoq['PROP_SIZE1'];
   spar.PROP_SIZE2:=adoq['PROP_SIZE2'];
   spar.PROP_WTHICK:=adoq['PROP_WTHICK'];
   spar.PROP_SLENGTH:=adoq['PROP_SLENGTH'];
   spar.PROP_DIAM:=adoq['PROP_DIAM'];
   spar.PROP_SIZE:=adoq['PROP_SIZE'];
   spar.PROP_THICK_C:=adoq['PROP_THICK_C'];
   spar.PROP_WIDTH_C:=adoq['PROP_WIDTH_C'];
   spar.PROP_LENGTH_C:=adoq['PROP_LENGTH_C'];

   MTE['do_razmern']:=spar.GetRazmernostStr(CPARENT);
   MTE.Post;
   ADOQ.Next;
  End;
 ADOQ.Close;




 ADOQ.Free;
 spar.Free;
// MTE.SortOrder:='SPARRIVALS_NUM';
End;




Procedure TPassport.Report2(OForm:TComponent;Var f:boolean;Var conly:boolean; PrintEmptyPassp:boolean; Var gr:TGrMaterials; Var spar:TSpArrival);
Var
 list:TStringList;
 MTE:TMemTableEh;
 cfilter,spfilter,ff:string;
 adoq:TAdoQuery;
 i:integer;
Begin
 spfilter:=Truu;
 if conly then
  Begin
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   ADOQ.SQL.Text:='select csppassports from '+SchemaName+'SPPASSPORTS'+
   ' where Not (nrec in (select CSPPASSPORTS from '+SchemaName+
   'SPPASSPORTS where cpassports='+IntToStr(nrec)+'))'+andd+'cpassports='+IntToStr(nrec)+' order by NAME';
   adoq.Open;
   if adoq.RecordCount>0 then
    Begin
    list:=TStringList.Create;
    while Not adoq.Eof do
     Begin
      if list.IndexOf(VarToStr(adoq['csppassports']))=-1 then list.Append(VarToStr(adoq['csppassports']));
      adoq.Next;
     End;
    cfilter:='csppassports in ('+list.CommaText+')';
 //   ShowMessage(list.CommaText);
    list.Free;
    End
                         else cfilter:='csppassports=0';
   adoq.Close;
   adoq.Free;
  End
          else cfilter:=Truu;

 ff:='nrec in (select csppassports from '+SchemaName+'SPPASSPORTSD where csppassports=spp.nrec)';
 If PrintEmptyPassp then ff:='spp.CSPPASSPORTS=0';
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 ADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS spp'+' where '+spfilter+andd+'cpassports='+IntToStr(nrec)+andd+
 ff+andd+
 cfilter+
 ' order by DATEF,NREC';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   FieldsToReport(FRForm.Report);
   if gr.GetByNrec(GetCGRMATERIALSOfPassport(CSPARRIVALS)) then gr.FieldsToReport(FRForm.Report);
   FRForm.Report.Variables['SPPASSPORTS'+dot+'MARKIR']:=kav+AddSlashes(VarToStr(adoq['markir']))+kav;
   if spar.GetByNrec(CSPARRIVALS) then
    Begin
     spar.PROP_PWIDTH1:=adoq['PROP_PWIDTH1'];
     spar.PROP_PWIDTH2:=adoq['PROP_PWIDTH2'];
     spar.PROP_SIZE1:=adoq['PROP_SIZE1'];
     spar.PROP_SIZE2:=adoq['PROP_SIZE2'];
     spar.PROP_WTHICK:=adoq['PROP_WTHICK'];
     spar.PROP_SLENGTH:=adoq['PROP_SLENGTH'];
     spar.PROP_DIAM:=adoq['PROP_DIAM'];
     spar.PROP_SIZE:=adoq['PROP_SIZE'];
     spar.PROP_THICK_C:=adoq['PROP_THICK_C'];
     spar.PROP_WIDTH_C:=adoq['PROP_WIDTH_C'];
     spar.PROP_LENGTH_C:=adoq['PROP_LENGTH_C'];
     FRForm.Report.Variables['SPPASSPORTS'+dot+'GABARITS']:=kav+AddSlashes(spar.GetRazmernostStr(gr.CPARENT))+kav;
    End;
   BuildPassportSpecMTE(OForm,MTE,ADOQ['nrec'],gr.CPARENT);
   If PrintEmptyPassp then
   for i := (MTE.RecordCount+1) to 40 do
     Begin
      MTE.Append; MTE.Post;
     End;

   FRForm.DBDataset.DataSet:=MTE;
   FRForm.Report.PrepareReport(f);
   MTE.Close;
   MTE.Free;

   f:=False;
   adoq.Next;
  End;




 adoq.Close;
 adoq.Free;

End;

Procedure TPassport.Report(OForm:TComponent;fr3:string);
Var
 cfilter,spfilter:string;
 f:boolean;
 adoq:TAdoQuery;
 gr:TGrMaterials;
 spar:TSpArrival;
 conly:boolean;
Begin
 conly:=(MagsoftMessageDlg('Печатать только текущее состояние материала? ("Да" - только последние операции, "Нет" - все операции)?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes);

 gr:=TGrMaterials.Create;
 spar:=TSpArrival.Create;

 FRForm.Report.Clear;
 FRForm.Report.LoadFromFile(fr3);

 f:=True;

 Report2(OForm,f,conly,False,gr,spar);

 if f then Report2(OForm,f,conly,True,gr,spar);

 if Not f then FRForm.Report.ShowPreparedReport
          else ShowMessage('По данному материалу не найдены операции изготовления деталей! В этом случае печать паспорта материала недоступна!');

 spar.Free;
 gr.Free;
End;

procedure TPassportForm.AppendDetailActionExecute(Sender: TObject);
Var
 Detail:TPaspDetail;
 cplan:int64;
begin
 if AppendDetailAction.Enabled then
  Begin
   Detail:=TPaspDetail.Create;
   DetailsADOQ.DisableControls;
   Detail.NREC:=OraInsertRecordAnGetID(Host.ADOC,SchemaName+'SPPASSPORTSD','nrec',SchemaName+'SPPASSPORTSD_SEQ','CSPPASSPORTS',VarToStr(CurrentADOQ['nrec']));
   Detail.CSPPASSPORTS:=CurrentADOQ['nrec'];
   Detail.ORDERNUM:=f_ORDERNUM.Text;
   Detail.ORDERNUM2:=f_ORDERNUM2.Text;
   if Detail.NREC<>0 then
   Begin
    if Not Empty(f_ORDERNUM.Text) then Host.ADOC.Execute('update '+SchemaName+'SPPASSPORTSD set ordernum='''+AddSlashes(f_ORDERNUM.Text)+''' where nrec='+IntToStr(Detail.NREC));
    if Not Empty(f_ORDERNUM2.Text) then Host.ADOC.Execute('update '+SchemaName+'SPPASSPORTSD set ordernum2='''+AddSlashes(f_ORDERNUM2.Text)+''' where nrec='+IntToStr(Detail.NREC));
    DetailsADOQ.Requery;
    If DetailsADOQ.Locate('nrec',Detail.NREC,[]) then
     Begin
      cplan:=LookupItemFromForm2(f_plan.ItemIndex,PlansADOQ,SchemaName+'PLANS');
      If Detail.Edit(Self,True,cplan) then
       Begin
        DetailsADOQ.Edit;
        if Not Detail.Save(DetailsADOQ) then DetailsADOQ.Cancel;
        DetailsADOQ.Requery;
        if Not DetailsADOQ.Locate('nrec',Detail.NREC,[]) then ShowMessage('Добавленная деталь не найдена!');
       End
        else
       Begin
        DetailsADOQ.Delete;
       End;
     End
      else
     Begin
      Host.ADOC.Execute('delete from '+SchemaName+'SPPASSPORTSD where nrec='+IntToStr(Detail.NREC));
      ShowMessage('Новая деталь не может быть добавлена в паспорт!');
     End;
   End else ShowMessage('Ошибка при попытке добавления в паспорт новой детали!');
   DetailsADOQ.EnableControls;
   DetailsGrid.SetFocus;
   Detail.Free;
   ActionsEnabling;
  End;
end;

procedure TPassportForm.AppendDetailsActionExecute(Sender: TObject);
Var
// Detail:TPaspDetail;
 SelectDetails:TSelectDetails;
 Detail:TPaspDetail;
 cplan:int64;
 PlansFilter:string;
begin
 if AppendDetailsAction.Enabled then
  Begin
   SelectDetails:=TSelectDetails.Create;
   Detail:=TPaspDetail.Create;
   PlansFilter:=EmptyStr;
   cplan:=LookupItemFromForm2(f_plan.ItemIndex,PlansADOQ,SchemaName+'PLANS');
   if cplan<>0 then PlansFilter:='pl.nrec='+IntToStr(cplan);
   if Not Empty(f_ORDERNUM.Text) then
    Begin
     if Not Empty(PlansFilter) then PlansFilter:=PlansFilter+andd;
     PlansFilter:=PlansFilter+'sppl.ORDERNUM='''+Trim(AddSlashes(f_ORDERNUM.Text))+'''';
    End;
   if Not Empty(f_ORDERNUM2.Text) then
    Begin
     if Not Empty(PlansFilter) then PlansFilter:=PlansFilter+andd;
     PlansFilter:=PlansFilter+'sppl.ORDERNUM2='''+Trim(AddSlashes(f_ORDERNUM2.Text))+'''';
    End;
   if Empty(PlansFilter) then PlansFilter:=Truu;

   if SelectDetails.Edit(Self,PlansFilter,CurrentADOQ['nrec']) then
   Begin
   DetailsADOQ.DisableControls;
   SelectDetails.MTE.First;
   while Not SelectDetails.MTE.Eof do
    Begin
     Detail.Clear;
     Detail.CSPPASSPORTS:=CurrentADOQ['nrec'];
     Detail.ORDERNUM:=VarToStr(SelectDetails.MTE['ORDERNUM']);
     Detail.ORDERNUM2:=VarToStr(SelectDetails.MTE['ORDERNUM2']);
     Detail.ORDN:=VarToStr(SelectDetails.MTE['ORDN']);
     Detail.CDETAILS:=SelectDetails.MTE['CDETAILS'];
     Detail.DATEIZG:=VarToDateTime(SelectDetails.MTE['DATEIZG']);
     Detail.KOLSHTP:=SelectDetails.MTE['KOLSHTP'];
     Detail.KOLSHTF:=SelectDetails.MTE['KOLSHTF'];
     Detail.WEIGHT1:=SelectDetails.MTE['WEIGHT1'];
     Detail.WEIGHT1F:=SelectDetails.MTE['WEIGHT1F'];
     Detail.WEIGHT:=SelectDetails.MTE['WEIGHT'];
     DetailsADOQ.Append;
     if Not Detail.Save(DetailsADOQ) then DetailsADOQ.Cancel;
     SelectDetails.MTE.Next;
    End;
   DetailsADOQ.Requery;
   DetailsADOQ.EnableControls;
   End;
   Detail.Free;
   SelectDetails.Free;
   DetailsGrid.SetFocus;
   ActionsEnabling;
  End;
end;

procedure TPassportForm.PassportReportActionExecute(Sender: TObject);
Var
 ReportsList:TMemTableEh;
 Passport:TPassport;
begin
 if PassportReportAction.Enabled then
  Begin
   Passport:=TPassport.Create;
   ReportsList:=TMemTableEh.Create(nil);
   if GetReportsList(Self,ReportsList,'passport') and (ReportsList.RecordCount>0) then
    Begin
     ReportsList.First;
     while Not ReportsList.Eof do
      Begin
       if Passport.FromForm(Self) then
        if Passport.ToForm(Self,f_New) then
         Passport.Report(Self,VarToStr(ReportsList['fr3']));
       ReportsList.Next;
      End;
    End;
   ReportsList.Close;
   ReportsList.Free;
   Passport.Free;
   CurrentGrid.SetFocus;
  End;
end;

procedure TPassportForm.PassportTreeActionExecute(Sender: TObject);
Var
 tree:TPassportTree;
begin
 if PassportTreeAction.Enabled then
  Begin
   tree:=TPassportTree.Create;
   tree.cpassports:=f_nrec;
   tree.Edit(Self);
   tree.Free;
  End;
end;

procedure TPassportForm.SpisActionExecute(Sender: TObject);
var
  sComment: string;
begin
  if SpisAction.Enabled then begin
    sComment := InputBox('Списание материала', 'Введите комментарий/причину списания', '');
    if sComment = EmptyStr then
      Exit;
    spisADOQ.Parameters.ParamValues['pCOMMENT'] := sComment;
    if ostatokADOQ.RecNo > 0 then
      spisADOQ.Parameters.ParamValues['pNREC'] := ostatokADOQ['NREC']
    else
      spisADOQ.Parameters.ParamValues['pNREC'] := currentADOQ['NREC'];
    spisADOQ.ExecSQL;
  end;
end;

Procedure TPassportForm.UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset);
var
  i: Integer;
begin
 ColumnName:=UpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if UpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].KeyList.Clear;
      Grid.Columns[i].PickList.Clear;
      Grid.Columns[i].KeyList.Append(zero);
      Grid.Columns[i].PickList.Append('');
      ADOQ.First;
      while Not ADOQ.Eof do
       Begin
        Grid.Columns[i].KeyList.Append(VarToStr(ADOQ['NREC']));
        Grid.Columns[i].PickList.Append(VarToStr(ADOQ['NAME']));
        ADOQ.Next;
       End;
      break;
    end;
  end;
end;



procedure TPassportForm.UpdateDetailsADOQ;
Var
 wh,whORDERNUM,whORDERNUM2:string;
 adoq:TAdoQuery;
 kd3:TKD3;
 s:string;
 MTE:TMemTableEh;
Begin
 DetailsADOQ.DisableControls;
 DetailsADOQ.Close;
 DetailsADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTSD'+' where CSPPASSPORTS='+VarToStr(CurrentADOQ['nrec'])+' order by DATEIZG,DETAILS_S';
 DetailsADOQ.Open;
 {
 wh:=EmptyStr;
 whORDERNUM:=Truu;
 if Not Empty(f_ORDERNUM.Text) then
  Begin
   if Not Empty(wh) then wh:=wh+andd;
   wh:=wh+'ORDERNUM='''+AddSlashes(Trim(f_ORDERNUM.Text))+'''';
   whORDERNUM:='CKD in (select NREC from '+SchemaName+'KD where ORDERNUM='''+AddSlashes(Trim(f_ORDERNUM.Text))+''''+')'
  End;


 whORDERNUM2:=Truu;
 if Not Empty(f_ORDERNUM2.Text) then
  Begin
   if Not Empty(wh) then wh:=wh+andd;
   wh:=wh+'ORDERNUM2='''+AddSlashes(Trim(f_ORDERNUM2.Text))+'''';
//   whORDERNUM2:='CKD in (select CKD from '+SchemaName+'MARKS where ORDERNUM2='''+AddSlashes(Trim(f_ORDERNUM2.Text))+''''+')'
   whORDERNUM2:='CKD in (select NREC from '+SchemaName+'KD where ORDERNUM2='''+AddSlashes(Trim(f_ORDERNUM2.Text))+''''+')'
  End;

 if f_PLAN.ItemIndex>=0 then
  Begin
//   if Not Empty(wh) then wh:=wh+andd;
//   wh:=wh+'ORDERNUM2='''+AddSlashes(Trim(f_ORDERNUM2.Text))+'''';
  End;
 if Not Empty(wh) then wh:=andd+'('+wh+')';
 DetailsADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTSD'+' where CSPPASSPORTS='+IntToStr(CurrentADOQ['nrec').AsLargeInt)+wh+' order by DATEIZG,DETAILS_S';
 DetailsADOQ.Open;



 MTE:=TMemTableEh.Create(nil);
 MTE.FieldDefs.Add('NREC', ftLargeInt);
 MTE.FieldDefs.Add('NAME', ftString, 255);
 MTE.CreateDataSet;
 MTE.Open;

 if Not Empty(whORDERNUM) or Not Empty(whORDERNUM2) then
 Begin
 kd3:=TKD3.Create;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select '+
 '*'+
 ' from '+SchemaName+'DETAILS'+
 ' where '+
 whORDERNUM+andd+whORDERNUM2+
 ' order by nump';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   If kd3.Read(adoq) then
    Begin
     MTE.Append;
     MTE['NREC').AsLargeInt:=kd3.NREC;
     MTE['NAME').AsString:=kd3.GetDetailDescription;
     MTE.Post;
    End;
   adoq.Next;
  End;

 adoq.Close;
 adoq.Free;
 kd3.Free;
 End;

 UpdateColumnPicks(DetailsGrid,'CDETAILS',MTE);
 MTE.Close;
 MTE.Free;
 }
 DetailsADOQ.EnableControls;
End;

procedure TPassportForm.UpdateOstatokADOQ;
Begin
 OstatokADOQ.DisableControls;
 OstatokADOQ.Close;
 OstatokADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS'+' where CSPPASSPORTS='+VarToStr(CurrentADOQ['nrec'])+' order by NAME';
 OstatokADOQ.Open;
 OstatokADOQ.EnableControls;
End;

procedure TPassportForm.currentDSDataChange(Sender: TObject; Field: TField);
begin
 UpdateDetailsADOQ;
 UpdateOstatokADOQ;
end;

procedure TPassportForm.DelDetailActionExecute(Sender: TObject);
Var
 OldRecNo:int64;
 s:string;
begin
 if DelDetailAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что хотите удалить из паспорта деталь "'+VarToStr(DetailsADOQ['DETAILS_S'])+'" ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     OldRecNo:=DetailsADOQ.RecNo;
     DetailsADOQ.Delete;
     Try DetailsADOQ.RecNo:=OldRecNo; Except DetailsADOQ.First; End;
     ActionsEnabling;
    End;
  End;
 DetailsGrid.SetFocus;
end;

procedure TPassportForm.detailsADOQAfterInsert(DataSet: TDataSet);
begin
 Dataset['CSPPASSPORTS']:=CurrentADOQ['nrec'];
 Dataset['DATEIZG']:=Trunc(Now);
 Dataset['ORDERNUM']:=Trim(f_ORDERNUM.Text);
 Dataset['ORDERNUM2']:=Trim(f_ORDERNUM2.Text);
 Try DetailsGrid.SetFocus; Finally End;
end;

procedure TPassportForm.detailsADOQBeforePost(DataSet: TDataSet);
Var
 dadoq,madoq,kdadoq:TAdoQuery;
begin
// Dataset['CSPPASSPORTS').AsLargeInt:=CurrentADOQ['nrec').AsLargeInt;
 {
 if DataSet['CDETAILS').AsLargeInt<>0 then
  Begin
   dadoq:=TAdoQuery.Create(nil);
   dadoq.Connection:=Host.ADOC;
   dadoq.SQL.Text:='select * from '+SchemaName+'DETAILS'+' where nrec='+IntToStr(DataSet['CDETAILS').AsLargeInt);
   dadoq.Open;
   if dadoq.RecordCount=1 then
    Begin
     kdadoq:=TAdoQuery.Create(nil);
     kdadoq.Connection:=Host.ADOC;
     kdadoq.SQL.Text:='select * from '+SchemaName+'KD'+' where nrec='+IntToStr(dadoq['CKD').AsLargeInt);
     kdadoq.Open;
     if kdadoq.RecordCount=1 then
      Begin
       DataSet['ORDERNUM').AsString:=kdadoq['ORDERNUM').AsString;
       madoq:=TAdoQuery.Create(nil);
       madoq.Connection:=Host.ADOC;
       madoq.SQL.Text:='select * from '+SchemaName+'MARKS MARKS,'+SchemaName+'DMARKS DMARKS where DMARKS.CMARK=MARKS.NREC'+andd+'MARKS.CKD='+IntToStr(dadoq['CKD').AsLargeInt)+andd+
       'DMARKS.NUMP='''+AddSlashes(dadoq['NUMP').AsString)+'''';
       madoq.Open;
       if madoq.RecordCount=1 then
        Begin
         DataSet['ORDERNUM2').AsString:=madoq['ORDERNUM2').AsString;
         DataSet['ORDN').AsString:=madoq['ORDN').AsString;
        End;
       madoq.Close;
       madoq.Free;
      End;
     kdadoq.Close;
     kdadoq.Free;

    End;
   dadoq.Close;
   dadoq.Free;
  End;
 }
 ReplEmptyToSpace(DataSet,'ORDERNUM');
 ReplEmptyToSpace(DataSet,'ORDERNUM2');
 ReplEmptyToSpace(DataSet,'ORDN');
 ReplEmptyToSpace(DataSet,'DETAILS_S');
 DataSet['WEIGHT']:=Integer(DataSet['KOLSHTF'])*DataSet['WEIGHT1F'];
end;

procedure TPassportForm.detailsDSDataChange(Sender: TObject; Field: TField);
begin
 LomUpdate;
 if (detailsADOQ.RecordCount > 0) and ostatokADOQ.Active and (ostatokADOQ.RecordCount = 0) then begin
   ostatokADOQ.Insert;
   ostatokADOQ.Post;
 end;
 ActionsEnabling;
end;

procedure TPassportForm.DetailsGridColumns4DropDownBoxCheckButton(
  Sender: TObject; ACol: Integer; Column: TColumnEh; var Enabled: Boolean);
begin
 ShowMessage('DropDownBoxCheckButton');
end;

procedure TPassportForm.DetailsGridColumns4EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
 ShowMessage('EditButtonClick');
end;

procedure TPassportForm.DetailsGridColumns4EditButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
 ShowMessage('EditButtonDown');
end;

procedure TPassportForm.DetailsGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
 edit:boolean;
begin
 edit:=True;
 if Key=vk_return then
  Begin
   If DetailsADOQ.Active and ((DetailsDS.State=dsEdit) or (DetailsDS.State=dsInsert)) then
    Try DetailsADOQ.Post; edit:=False; Except DetailsADOQ.Cancel; End;
   If edit then EditDetailActionExecute(Sender);
   Key:=0;
  End;
end;

procedure TPassportForm.EditDetailActionExecute(Sender: TObject);
Var
 Detail:TPaspDetail;
begin
 if EditDetailAction.Enabled then
  Begin
   Detail:=TPaspDetail.Create;
   DetailsADOQ.DisableControls;
   if Detail.Read(DetailsADOQ) then
   Begin
    If Detail.Edit(Self,False,0) then
     Begin
      DetailsADOQ.Requery;
      if DetailsADOQ.Locate('nrec',Detail.NREC,[]) then
       Begin
        DetailsADOQ.Edit;
        if Not Detail.Save(DetailsADOQ) then DetailsADOQ.Cancel;
        DetailsADOQ.Requery;
        DetailsADOQ.Locate('nrec',Detail.NREC,[]);
       End;
     End
   End;
   DetailsADOQ.EnableControls;
   Detail.Free;
   DetailsGrid.SetFocus;
   ActionsEnabling;
  End;
end;

procedure TPassportForm.FormCreate(Sender: TObject);
Var
 orderby:string;
 y,m,d:word;
begin
 currentADOQ.Connection:=Host.ADOC;
 detailsADOQ.Connection:=Host.ADOC;
 ostatokADOQ.Connection:=Host.ADOC;
 historyADOQ.Connection:=Host.ADOC;
 TrimTypesADOQ.Connection := Host.ADOC;

 DecodeDate(Now,y,m,d);
 plansADOQ.Connection:=Host.ADOC;
 orderby:='pyear desc,pmonth desc';
 plansADOQ.SQL.Text:='select * from '+SchemaName+'plans'+' where '+
 'PYEAR='+IntToStr(y)+orr+'PYEAR='+IntToStr(y-1)+orr+'PYEAR='+IntToStr(y+1)+
 ' order by '+orderby;
 plansADOQ.Open;
end;

procedure TPassportForm.FormDestroy(Sender: TObject);
begin
 plansADOQ.Close;
// contractorsADOQ.Close;
end;

procedure TPassportForm.FormShow(Sender: TObject);
begin
 if f_New then Try f_NUM.SetFocus Except End
          else CurrentGrid.SetFocus;
end;

procedure TPassportForm.f_ORDERNUM2Change(Sender: TObject);
Var
  cplan: int64;
  adoq: TAdoQuery;
  ComboBox: TComboBox absolute Sender;
begin
  if f_PLAN.ItemIndex>=0 then
  Begin
    cplan:=LookupItemFromForm2(f_plan.ItemIndex,PlansADOQ,SchemaName+'PLANS');
    adoq:=TAdoQuery.Create(nil);
    adoq.Connection:=Host.ADOC;
    if ComboBox.Text <> '' then begin
      adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS=:pCPLAN' +
      ' AND ORDERNUM2=:pORDERNUM2';
      adoq.Parameters.ParamValues['PCPLAN;PORDERNUM2'] := VarArrayOf([cplan, ComboBox.Text]);
    end else begin
      adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS=:pCPLAN';
      adoq.Parameters.ParamValues['PCPLAN'] := cplan;
    end;
    adoq.Open;
    f_ORDERNUM.Items.BeginUpdate;
    f_ORDERNUM.Items.Clear;
    while Not adoq.Eof do
    Begin
      if f_ORDERNUM.Items.IndexOf(VarToStr(adoq['ordernum']))=-1 then f_ORDERNUM.Items.Append(VarToStr(adoq['ordernum']));
      adoq.Next;
    End;
    f_ORDERNUM.Items.EndUpdate;
    adoq.Close;
    adoq.Free;
  End;
end;

procedure TPassportForm.f_ORDERNUMChange(Sender: TObject);
Var
  cplan: int64;
  adoq: TAdoQuery;
  ComboBox: TComboBox absolute Sender;
begin
  if f_PLAN.ItemIndex>=0 then
  Begin
    cplan:=LookupItemFromForm2(f_plan.ItemIndex,PlansADOQ,SchemaName+'PLANS');
    adoq:=TAdoQuery.Create(nil);
    adoq.Connection:=Host.ADOC;
    if ComboBox.Text <> '' then begin
      adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS=:pCPLAN' +
      ' AND ORDERNUM=:pORDERNUM';
      adoq.Parameters.ParamValues['PCPLAN;PORDERNUM'] := VarArrayOf([cplan, ComboBox.Text]);
    end else begin
      adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS=:pCPLAN';
      adoq.Parameters.ParamValues['PCPLAN'] := cplan;
    end;
    adoq.Open;
    f_ORDERNUM2.Items.BeginUpdate;
    f_ORDERNUM2.Items.Clear;
    while Not adoq.Eof do
    Begin
      if f_ORDERNUM2.Items.IndexOf(VarToStr(adoq['ordernum2']))=-1 then f_ORDERNUM2.Items.Append(VarToStr(adoq['ordernum2']));
      adoq.Next;
    End;
    f_ORDERNUM2.Items.EndUpdate;
    adoq.Close;
    adoq.Free;
  End;
end;

procedure TPassportForm.f_PLANChange(Sender: TObject);
Var
 cplan:int64;
 adoq:TAdoQuery;
begin
 if f_PLAN.ItemIndex>=0 then
  Begin
   cplan:=LookupItemFromForm2(f_plan.ItemIndex,PlansADOQ,SchemaName+'PLANS');
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS='+IntToStr(cplan);
   adoq.Open;
   f_ORDERNUM.Items.BeginUpdate; f_ORDERNUM2.Items.BeginUpdate;
   f_ORDERNUM.Items.Clear; f_ORDERNUM2.Items.Clear;
   while Not adoq.Eof do
    Begin
     if f_ORDERNUM.Items.IndexOf(VarToStr(adoq['ordernum']))=-1 then f_ORDERNUM.Items.Append(VarToStr(adoq['ordernum']));
     if f_ORDERNUM2.Items.IndexOf(VarToStr(adoq['ordernum2']))=-1 then f_ORDERNUM2.Items.Append(VarToStr(adoq['ordernum2']));
     adoq.Next;
    End;
   f_ORDERNUM.Items.EndUpdate; f_ORDERNUM2.Items.EndUpdate;
   adoq.Close;
   adoq.Free;
  End;
end;

procedure TPassportForm.HistoryDSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TPassportForm.HistoryEditActionExecute(Sender: TObject);
Var
 pas:TPassport;
 root,OldNREC:int64;
begin
 If HistoryEditAction.Enabled then
  Begin
   pas:=TPassport.Create;
   root:=historyADOQ['CSPPASSPORTS'];
   if pas.GetByNrec(f_nrec) then
   Begin
    If pas.Edit(Self,False,root) then
     Begin
      if currentADOQ.RecNo>0 then OldNREC:=currentADOQ['nrec'] else OldNREC:=0;
      currentADOQ.Requery;
      if OldNREC<>0 then currentADOQ.Locate('nrec',OldNREC,[]);


//      if ostatokADOQ.RecNo>0 then OldNREC:=ostatokADOQ['nrec').AsLargeInt else OldNREC:=0;
      ostatokADOQ.Requery;

      if historyADOQ.RecNo>0 then OldNREC:=historyADOQ['nrec'] else OldNREC:=0;
      historyADOQ.Requery;
      if OldNREC<>0 then historyADOQ.Locate('nrec',OldNREC,[]);
     End;
    historyGrid.SetFocus;
   End;
   pas.Free;
  End;
end;

procedure TPassportForm.HistoryGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=vk_return then
  Begin
   Key:=0;
   HistoryEditActionExecute(Sender);
  End;
end;

procedure TPassportForm.ostatokADOQAfterInsert(DataSet: TDataSet);
begin
 ostatokDS.OnDataChange := nil;
 Dataset['CPASSPORTS']:=f_nrec;
 Dataset['DATEF']:=Trunc(Now);
 Dataset['CSPPASSPORTS']:=CurrentADOQ['nrec'];
 Dataset['NAME']:=Trim(VarToStr(CurrentADOQ['NAME']))+'/'+IntToStr(Dataset.RecordCount+1);
 Dataset['MARKIR']:=Trim(VarToStr(CurrentADOQ['MARKIR']))+'/'+IntToStr(Dataset.RecordCount+1);
 Dataset['PROP_PWIDTH1']:=CurrentADOQ['PROP_PWIDTH1'];
 Dataset['PROP_PWIDTH2']:=CurrentADOQ['PROP_PWIDTH2'];
 Dataset['PROP_SIZE1']:=CurrentADOQ['PROP_SIZE1'];
 Dataset['PROP_SIZE2']:=CurrentADOQ['PROP_SIZE2'];
 Dataset['PROP_WTHICK']:=CurrentADOQ['PROP_WTHICK'];
 Dataset['PROP_SLENGTH']:=CurrentADOQ['PROP_SLENGTH'];
 Dataset['PROP_DIAM']:=CurrentADOQ['PROP_DIAM'];
 Dataset['PROP_SIZE']:=CurrentADOQ['PROP_SIZE'];
 Dataset['PROP_THICK_C']:=CurrentADOQ['PROP_THICK_C'];
 Dataset['PROP_WIDTH_C']:=CurrentADOQ['PROP_WIDTH_C'];
 Dataset['PROP_LENGTH_C']:=CurrentADOQ['PROP_LENGTH_C'];
 DataSet['TRIMTYPE;PROP_A;PROP_B;PROP_C;PROP_D;PROP_SQUARE'] := CurrentADOQ['TRIMTYPE;PROP_A;PROP_B;PROP_C;PROP_D;PROP_SQUARE'];
 OstatokDS.OnDataChange := OstatokDSDataChange;
 Dataset['KOLT']:=StrToFloatM(f_lom.Caption);


 Try OstatokGrid.SetFocus; Finally End;
end;

procedure TPassportForm.ostatokADOQBeforePost(DataSet: TDataSet);
begin
 ReplEmptyToSpace(DataSet,'MARKIR');
 ReplEmptyToSpace(DataSet,'NAME');

// Dataset['CPASSPORTS').AsLargeInt:=f_nrec;
// Dataset['CSPPASSPORTS').AsLargeInt:=CurrentADOQ['nrec').AsLargeInt;
end;

procedure TPassportForm.ostatokADOQTRIMTYPEChange(Sender: TField);
var
  PropList: TStringList;
  I: Integer;
begin
 PropList := TStringList.Create;
 PropList.CommaText := UpperCase(GetTextValueOfPointer(VarToStr(ostatokADOQ['TRIMTYPE']), SchemaName + 'TRIMTYPES', 'nrec', 'PARAMS'));
 for I := 0 to PropList.Count - 1 do
   if MatchStr(PropList[I], ['PROP_THICK', 'PROP_WIDTH', 'PROP_LENGTH']) then
     PropList[I] := PropList[I] + '_C';
 for I := 0 to OstatokGrid.Columns.Count - 1 do
   if MatchStr(OstatokGrid.Columns[I].FieldName, ['PROP_WIDTH_C', 'PROP_LENGTH_C', 'PROP_DIAM', 'PROP_A', 'PROP_B', 'PROP_C', 'PROP_D', 'PROP_SQUARE']) then
     OstatokGrid.Columns[I].Visible := PropList.IndexOf(OstatokGrid.Columns[I].FieldName) > -1;
 PropList.Free;
end;

procedure TPassportForm.OstatokDSDataChange(Sender: TObject; Field: TField);
var
  DataSource: TDataSource absolute Sender;
begin
  DataSource.OnDataChange := nil;
  if Assigned(Field) then
    if MatchStr(Field.FieldName, ['PROP_WIDTH_C', 'PROP_LENGTH_C', 'PROP_THICK_C', 'PROP_DIAM', 'PROP_A', 'PROP_B', 'PROP_C', 'PROP_D', 'PROP_SQUARE']) then
      UpdateKolT(Field.DataSet);
  DataSource.OnDataChange := OstatokDSDataChange;
  LomUpdate;
end;

procedure TPassportForm.OstatokGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_return then
  Begin
   If OstatokADOQ.Active and ((OstatokDS.State=dsEdit) or (OstatokDS.State=dsInsert)) then Try OstatokADOQ.Post; Except OstatokADOQ.Cancel; End;
   Key:=0;
  End;
end;

Constructor TPassport.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TPassport.Clear;
begin
 NREC:=0;
 NUM:=EmptyStr;
 CSPARRIVALS:=0;
 SPENT:=False;
end;

Function TPassport.Save(Dataset:TDataset;Prefix:string=''):boolean;
Begin
 result:=True;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 if NUM=EmptyStr then NUM:=space;
 Dataset[Prefix+'NUM']:=NUM;
 Dataset[Prefix+'CSPARRIVALS']:=CSPARRIVALS;
 if SPENT then Dataset[Prefix+'SPENT']:=1
          else Dataset[Prefix+'SPENT']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении паспорта! ('+e.Message+')');
      End;
 End;

End;

Function TPassport.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 NUM:=Dataset['NUM'];
 CSPARRIVALS:=Dataset['CSPARRIVALS'];
 SPENT:=(Dataset['SPENT']=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке паспорта! ('+e.Message+')');
   End;
 End;
End;

Function TPassport.Edit(OForm:TComponent;New:boolean;RootCSpPassports:int64=0):boolean;
Var
 Form: TPassportForm;
begin
 Form:=TPassportForm.Create(OForm);
 Form.f_RootCSpPassports:=RootCSpPassports;

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Procedure GetQueueFilter(CSPPASSPORTS:int64;Var filter:string);
Var
 adoq:TAdoQuery;
 v:int64;
Begin
// filter:=EmptyStr;
// if CSPPASSPORTS<>0 then filter:=IntToStr(CSPPASSPORTS);

 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select CSPPASSPORTS from '+SchemaName+'SPPASSPORTS'+' where nrec='+IntToStr(CSPPASSPORTS);
 adoq.Open;
 if adoq.RecordCount=1 then v:=adoq['CSPPASSPORTS']
                       else v:=0;
 adoq.Close;
 adoq.Free;
 if v<>0 then
  Begin
   if Not Empty(filter) then filter:=filter+comma;
   filter:=filter+IntToStr(v);
   GetQueueFilter(v,filter);
  End
   else
  Begin
   if Empty(filter) then filter:=Falsee
                    else filter:='CSPPASSPORTS in ('+filter+')';
  End;


End;

Function TPassport.ToForm(Var Form:TPassportForm;New:boolean):boolean;
Var
 i:integer;
 spplans,QueueFilter:string;
 ordernum:string[10];
 ordernum2:string[7];
 cplan:int64;
 root:int64;
 plansList:TStringList;
 adoq:TAdoQuery;
Begin
 Form.f_nrec:=nrec;
 Form.f_CSPARRIVALS:=CSPARRIVALS;
 Form.f_new:=New;

 if New then Form.Caption:='Добавление нового паспорта'
        else
         Begin
          Form.Caption:='Паспорт № '+NUM;
          If Form.f_RootCSpPassports<>0 then Form.Caption:=Form.Caption+' {РЕДАКТИРОВАНИЕ ИСТОРИИ РАСХОДА МАТЕРИАЛА!}'
                                        else Form.Caption:=Form.Caption+' {текущие остатки}';
         End;


 Form.f_NUM.Text:=NUM;

 Form.f_NUM.Enabled:=(Form.f_RootCSpPassports=0);

 if Form.f_RootCSpPassports=0 then
 Begin
 Form.currentADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS'+
 ' where Not (nrec in (select CSPPASSPORTS from '+SchemaName+
 'SPPASSPORTS where cpassports='+IntToStr(nrec)+'))'+andd+'cpassports='+IntToStr(nrec)+' order by NAME';
 End
  else
 Begin
 root:=StrToIntM(GetTextValueOfPointer(IntToStr(Form.f_RootCSpPassports),SchemaName+'SPPASSPORTS','NREC','CSPPASSPORTS',False));
 Form.currentADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS'+
 ' where CSPPASSPORTS='+IntToStr(root)+
 andd+'cpassports='+IntToStr(nrec)+
 ' order by NAME';
 End;
 Form.detailsDS.OnDataChange := nil;
 Form.currentADOQ.Open;
 if Form.f_RootCSpPassports<>0 then Form.currentADOQ.Locate('nrec',Form.f_RootCSpPassports,[])
                               else Form.currentADOQ.First;
 Form.detailsDS.OnDataChange := Form.detailsDSDataChange;

 {if Form.CurrentADOQ['CSPPASSPORTS').AsLargeInt<>0 then QueueFilter:=IntToStr(Form.CurrentADOQ['CSPPASSPORTS').AsLargeInt)
                                                               else QueueFilter:=EmptyStr;
 }
 QueueFilter := VarToStr(Form.currentADOQ['NREC']);

 GetQueueFilter(Form.CurrentADOQ['NREC'],QueueFilter);
// ShowMessage(QueueFilter);

{ Form.historyADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTSD'+
' where '+QueueFilter+
 andd+'CSPPASSPORTS in (select nrec from '+SchemaName+'SPPASSPORTS where CPASSPORTS='+IntToStr(nrec)+')'+
' order by DATEIZG,DETAILS_S';}

 Form.historyADOQ.SQL.Text:='select '+
 'Max(nrec) as nrec,Max(CSPPASSPORTS) as CSPPASSPORTS,Sum(kolshtf) as kolshtf,Sum(weight) as weight,DATEIZG,ORDERNUM,ORDERNUM2,ORDN'+
 ' from '+SchemaName+'SPPASSPORTSD'+
' where '+QueueFilter+
 andd+'CSPPASSPORTS in (select nrec from '+SchemaName+'SPPASSPORTS where CPASSPORTS='+IntToStr(nrec)+')'+
' group by DATEIZG,ORDERNUM,ORDERNUM2,ORDN'+
' order by DATEIZG,ORDERNUM,ORDERNUM2,ORDN';


 Form.historyADOQ.Open;

// LookupItemToForm(Form.f_plan,Form.plansADOQ,GetCurrentPlan(Now),'PMONTH','PYEAR',dot,False,EmptyStr,'PRIM');
 cplan:=0; ordernum:=EmptyStr; ordernum2:=EmptyStr;
 spplans:=GetTextValueOfPointer(IntToStr(CSPARRIVALS),SchemaName+'SPARRIVALS','NREC','SPPLANS',False);
// ShowMessage('spplans='+spplans);
 if Not Empty(spplans) then
  Begin
   plansList:=TStringList.Create;
   plansList.CommaText:=spplans;
   if plansList.Count>0 then
    Begin
     adoq:=TAdoQuery.Create(nil);
     adoq.Connection:=Host.ADOC;
     adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where nrec='+plansList[0];
//     ShowMessage('adoq.SQL.Text='+adoq.SQL.Text);
     adoq.Open;
     if adoq.RecordCount=1 then
      Begin
//       ShowMessage('ок');
       cplan:=adoq['cplans'];
       ordernum:=VarToStr(adoq['ordernum']);
       ordernum2:=VarToStr(adoq['ordernum2']);
      End;
     adoq.Close;
     adoq.Free;
    End;
   plansList.Free;
  End;
 if cplan=0 then cplan:=GetCurrentPlan(Now);

 LookupItemToFormNew(Form.f_plan,Form.plansADOQ,cplan,'PMONTH,PYEAR,PRIM','.," (",)');
 Form.f_PLANChange(Form);
 if Not Empty(ordernum) then Form.f_ORDERNUM.Text:=ordernum;
 if Not Empty(ordernum2) then Form.f_ORDERNUM2.Text:=ordernum2;


 Form.UpdateGridColumnsVis;

 Form.spisADOQ.Connection := Host.ADOC;

 if Form.HistoryADOQ.RecordCount > 0 then
   Form.SpisButton.Down := Form.currentADOQ['ISLOM'] > 0;

 Form.ActionsEnabling;
 ReadOnlyColorsUpdateForGrid(Form.DetailsGrid,clWindow,clBtnFace);

 result:=True;
End;

Function TPassport.FromForm(Var Form:TPassportForm):boolean;
Begin
 nrec:=Form.f_nrec;
 CSPARRIVALS:=Form.f_CSPARRIVALS;

 If (Form.CurrentDS.State=dsEdit) or (Form.CurrentDS.State=dsInsert) then Try Form.CurrentADOQ.Post; Except Form.CurrentADOQ.Cancel; End;
 If (Form.DetailsDS.State=dsEdit) or (Form.DetailsDS.State=dsInsert) then Try Form.DetailsADOQ.Post; Except Form.DetailsADOQ.Cancel; End;
 If (Form.HistoryDS.State=dsEdit) or (Form.HistoryDS.State=dsInsert) then Try Form.HistoryADOQ.Post; Except Form.HistoryADOQ.Cancel; End;
 If (Form.OstatokDS.State=dsEdit) or (Form.OstatokDS.State=dsInsert) then Try Form.OstatokADOQ.Post; Except Form.OstatokADOQ.Cancel; End;


 NUM:=Trim(Form.f_NUM.Text);

 spent:=(Form.detailsADOQ.RecordCount>0) and (Form.ostatokADOQ.RecordCount=0);

 Form.currentADOQ.Close;
 Form.ostatokADOQ.Close;
 Form.historyADOQ.Close;
 Form.detailsADOQ.Close;
 result:=True;
End;

Destructor TPassport.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TPassportForm.LomUpdate;
Var
 s1,s2,s3:double;
 adoq:TAdoQuery;
Begin
 s1:=0; s2:=0; s3:=0;
 If CurrentADOQ.Active and (CurrentADOQ.RecNo>0) then
  Begin
   s1:=CurrentADOQ['KOLT'];

   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.CursorLocation:=clUseServer;
   adoq.EnableBCD:=False;

   adoq.SQL.Text:='select sum(weight) as sss from '+SchemaName+'SPPASSPORTSD'+' where CSPPASSPORTS='+VarToStr(CurrentADOQ['nrec']);
   adoq.Open;
   s2:=StrToFloatM(VarToStr(adoq['sss']));
   adoq.Close;

   adoq.SQL.Text:='select sum(kolt) as sss from '+SchemaName+'SPPASSPORTS'+' where CSPPASSPORTS='+VarToStr(CurrentADOQ['nrec']);
   adoq.Open;
   s3:=StrToFloatM(VarToStr(adoq['sss']));
   adoq.Close;

   adoq.Free;
  End;

 if (s2>0) or (s3>0) then s1:=s1-s2-s3
                     else s1:=0;

 if s1<0.0000001 then s1:=0;

 f_lom.Caption:=FloatToStr(s1);
End;

procedure TPassportForm.UpdateKolT(DataSet: TDataSet);
var
  ADOQ: TADOQuery;
  A, B, C, P: Double;
begin
  ADOQ := TADOQuery.Create(Self);
  ADOQ.Connection := Host.ADOC;
  ADOQ.SQL.Text := 'SELECT STEELMARKS.UW FROM CMKNEW.PASSPORTS LEFT OUTER JOIN CMKNEW.SPARRIVALS ON PASSPORTS.CSPARRIVALS=SPARRIVALS.NREC LEFT OUTER JOIN CMKNEW.GRMATERIALS ON SPARRIVALS.CGRMATERIALS=GRMATERIALS.NREC ' +
  'LEFT OUTER JOIN CMKNEW.STEELMARKS ON GRMATERIALS.PROP_STEELMARK=STEELMARKS.NREC WHERE PASSPORTS.NREC=:pNREC';
  ADOQ.Parameters.ParamValues['pNREC'] := DataSet['CPASSPORTS'];
  ADOQ.Open;
  case DataSet['TRIMTYPE'] of
  1: DataSet['PROP_SQUARE'] := DataSet['PROP_DIAM'] * DataSet['PROP_DIAM'] * Pi / 4;
  2: DataSet['PROP_SQUARE'] := DataSet['PROP_DIAM'] * DataSet['PROP_DIAM'] * Pi / 8;
  3: DataSet['PROP_SQUARE'] := DataSet['PROP_A'] * DataSet['PROP_C'] + (DataSet['PROP_B'] - DataSet['PROP_C']) * DataSet['PROP_D'];
  4: begin
    A := DataSet['PROP_A'];
    B := DataSet['PROP_B'];
    C := DataSet['PROP_C'];
    P := (A + B + C) / 2;
    DataSet['PROP_SQUARE'] := Sqrt(P * (P - A) * (P - B) * (P - C));
  end;
  //5: DataSet['PROP_SQUARE'] := ...
  6: DataSet['PROP_SQUARE'] := DataSet['PROP_WIDTH_C'] * DataSet['PROP_LENGTH_C'];
  end;
  {if VarIsNull(ADOQ['UW']) then
    MessageDlg('Удельный вес для марки стали данной детали не указан!', mtWarning, [mbOK], -1)
  else}
    DataSet['KOLT'] := DataSet['PROP_SQUARE'] * DataSet['PROP_THICK_C'] * ADOQ['UW'] / 1000000000;
  ADOQ.Close;
  ADOQ.Free;
end;

procedure TPassportForm.ActionsEnabling;
Begin
 HistoryEditAction.Enabled:=HistoryADOQ.Active and (HistoryADOQ.RecNo>0) and (CurrentUser.CUSERGROUPS<>2) and (CurrentADOQ['NREC'] <> HistoryADOQ['CSPPASSPORTS']);
 DetailsGrid.ReadOnly:=(CurrentUser.CUSERGROUPS=2) or (currentADOQ['ISLOM'] > 0);
 OstatokGrid.ReadOnly:=(CurrentUser.CUSERGROUPS=2) or (DetailsADOQ.RecordCount=0);
 ostatokDBNavigator.Enabled:=Not OstatokGrid.ReadOnly;


 AppendDetailAction.Enabled:=DetailsADOQ.Active and CurrentADOQ.Active and (CurrentADOQ.RecNo>0) and (CurrentADOQ['NREC']<>0) and not DetailsGrid.ReadOnly;
 AppendDetailsAction.Enabled:=AppendDetailAction.Enabled;
 EditDetailAction.Enabled:=DetailsADOQ.Active and (DetailsADOQ.RecNo>0) and (DetailsADOQ['NREC']<>0);
 DelDetailAction.Enabled:=DetailsADOQ.Active and (DetailsADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3)) and (DetailsADOQ['NREC']<>0);

 SpisAction.Enabled := ostatokADOQ.Active and (ostatokADOQ.RecNo > 0) and (CurrentUser.CUSERGROUPS <> 2);
 SpisButton.Visible := SpisAction.Enabled;
End;


end.

