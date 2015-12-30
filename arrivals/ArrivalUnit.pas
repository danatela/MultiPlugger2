unit ArrivalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  ContractorUnit, frxClass, FastReportUnit, MemTableEh,  GrMaterialsUnit,
  CmkUserUnit, KD2Unit, KD3Unit, SelectListsUnit, DBGridEhGrouping, GridsEh,
  DBGridEh, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList, SpArrivalUnit,
  MagsoftMsgDlgUnit, SpPassportUnit, PassportsGridUnit, Vcl.Menus, PassportsChildGridUnit,
  PassportUnit, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, StrUtils;


type
  TArrivalForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    sparrivalsADOQ: TADOQuery;
    Panel2: TPanel;
    f_NUM: TLabeledEdit;
    f_ADATE: TJvDateEdit;
    Label3: TLabel;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Panel4: TPanel;
    SpArrivalsGrid: TDBGridEh;
    Splitter2: TSplitter;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    f_ANUM: TLabeledEdit;
    f_active: TCheckBox;
    ActionManager1: TActionManager;
    AppendSpArrivalsAction: TAction;
    EditSpArrivalsAction: TAction;
    DelSpArrivalsAction: TAction;
    ImageList1: TImageList;
    sparrivalsDS: TDataSource;
    BitBtn5: TBitBtn;
    SetAllReceivedAction: TAction;
    BitBtn14: TBitBtn;
    ArrivalsReportAction: TAction;
    PassportsListAction: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    PrintAllPassportsAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AppendSpArrivalsActionExecute(Sender: TObject);
    procedure sparrivalsADOQBeforePost(DataSet: TDataSet);
    Procedure UpdateGridColumnsVis;
    procedure EditSpArrivalsActionExecute(Sender: TObject);
    procedure DelSpArrivalsActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetAllReceivedActionExecute(Sender: TObject);
    procedure SpArrivalsGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SpArrivalsGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ArrivalsReportActionExecute(Sender: TObject);
    procedure PassportsListActionExecute(Sender: TObject);
    procedure sparrivalsDSDataChange(Sender: TObject; Field: TField);
    procedure f_activeClick(Sender: TObject);
    procedure sparrivalsADOQAfterPost(DataSet: TDataSet);
    procedure PrintAllPassportsActionExecute(Sender: TObject);
  private
    { Private declarations }
    Procedure ActionsEnabling;
  public
    { Public declarations }
    f_nrec:int64;
    f_ncounter:integer;
    f_new:boolean;
  end;

TArrival = class
 NREC: int64;
 NUM: integer;
 ADATE: TDateTime;
 ANUM: string;
 ACTIVE: boolean;
 ncounter: integer;
 Procedure Clear;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Procedure FieldsToReport(Var rep:TfrxReport;Prefix:string='');
 Procedure Report(OForm:TComponent;fr3:string);
 Function Save(Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TArrivalForm;New:boolean):boolean;
 Function FromForm(Var Form:TArrivalForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Procedure BuildArrivalSpecMTE(OForm:TComponent;Var MTE:TMemTableEh);
 constructor Create;
 destructor Destroy; override;
end;

var
  ArrivalForm: TArrivalForm;

  Function GetPaspnumsWithArrivalLinks(anrec:int64):string;
  Function GetPaspnumsWithSpArrivalLinks(sanrec:int64):string;
//  Procedure KillPassportSpec(spNREC:int64);

implementation

{$R *.dfm}

Function GeneratePaspNUMBER(n1,n2,n3:integer):string;
Var
 s:string;
Begin
 s:='АБВГДЕЖИКЛМНПРСТУФХЦЧШЭЮЯ';
 result:=IntToStr(n1)+'-'+IntToStr(n2)+CharEncoder(n3,s);
End;

Function CreatePassportsForSpArrival(sparNREC:int64;KOLSHT:integer):boolean;
Var
 adoq:TAdoQuery;
 PNUM:string[16];
 s:string;
 spar:TSpArrival;
 arNUM:integer;
 ks,rc,i:integer;
 pNREC,snrec:int64;
 SpPassport:TSpPassport;
Begin
 result:=True;


 spar:=TSpArrival.Create;
 SpPassport:=TSpPassport.Create;
 if spar.GetByNrec(sparNREC) then
  Begin
 arNUM:=StrToIntM(GetTextValueOfPointer(IntToStr(spar.CARRIVALS),SchemaName+'ARRIVALS','nrec','NUM',False));
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'PASSPORTS'+' where CSPARRIVALS='+IntToStr(sparNREC)+' order by NREC';
 adoq.Open;
 rc:=adoq.RecordCount;
 ks:=KOLSHT;
 If Not spar.STATE then ks:=0;
 if rc<>ks then
  Begin
   if (rc<ks) and spar.STATE then
    Begin
     for i:=1 to ks-rc do
      Begin
       PNUM:=GeneratePaspNUMBER(arNUM,spar.NUM,rc+i);
       pNREC:=OraInsertRecordAnGetID(Host.ADOC,SchemaName+'PASSPORTS','nrec',SchemaName+'PASSPORTS_SEQ','CSPARRIVALS',IntToStr(sparNREC));
       //Host.ADOC.Execute('update '+SchemaName+'PASSPORTS set NUM='''+AddSlashes(PNUM)+''' where NREC='+IntToStr(pNREC));
       SpPassport.Clear;
       SpPassport.CPASSPORTS:=pNREC;
       SpPassport.InitMainInfoFromParent;
       s:=
       'insert into '+SchemaName+'SPPASSPORTS '+
       '(CPASSPORTS,NAME,MARKIR,KOLT,PROP_PWIDTH1,PROP_PWIDTH2,PROP_SIZE1,PROP_SIZE2,PROP_WTHICK,PROP_SLENGTH,PROP_DIAM,PROP_SIZE,PROP_THICK_C,PROP_WIDTH_C,PROP_LENGTH_C,CSPPASSPORTS)'+
       ' values ('+
       IntToStr(pNREC)+comma+
       ''''+AddSlashes(spar.GRMATERIALS_S)+''''+comma+
       ''''+AddSlashes(PNUM)+''''+comma+
       FloatToStr(spar.KOLT/spar.KOLSHT)+comma+
       FloatToStr(SpPassport.PROP_PWIDTH1)+comma+
       FloatToStr(SpPassport.PROP_PWIDTH2)+comma+
       FloatToStr(SpPassport.PROP_SIZE1)+comma+
       FloatToStr(SpPassport.PROP_SIZE2)+comma+
       FloatToStr(SpPassport.PROP_WTHICK)+comma+
       FloatToStr(SpPassport.PROP_SLENGTH)+comma+
       FloatToStr(SpPassport.PROP_DIAM)+comma+
       FloatToStr(SpPassport.PROP_SIZE)+comma+
       FloatToStr(SpPassport.PROP_THICK_C)+comma+
       FloatToStr(SpPassport.PROP_WIDTH_C)+comma+
       FloatToStr(SpPassport.PROP_LENGTH_C)+comma+
       zero+
       ')';
//       ShowMessage(s);
       Try
       Host.ADOC.Execute(s);
       Except on E:Exception do
        ShowMessage(E.Message);
       End;
//       ShowMessage('test1');
      End
     {
     while Not adoq.Eof do
      Begin
       if Not Empty(result) then result:=result+', ';
       result:=result+adoq.FieldByName('NUM').AsString;
       adoq.Next;
      End;
     }
    End;
   if rc>ks then
    Begin // Удаление лишних паспортов
     If (MagsoftMessageDlg('К позиции задания "'+spar.GRMATERIALS_S+'" уже привязано '+IntToStr(rc)+' паспортов! Удалить лишние паспорта, чтобы их осталось только '+IntToStr(ks)+' ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
     Begin
     while (adoq.RecordCount>0) and (adoq.RecordCount>ks) do
      Begin
       adoq.Last;
       snrec:=StrToIntM(GetTextValueOfPointer(adoq.FieldByName('nrec').AsString,SchemaName+'SPPASSPORTS','CPASSPORTS','nrec',False));
//       ShowMessage(IntToStr(snrec));
       KillPassportSpec(snrec);
       adoq.Delete;
      End;
     End else result:=false;
    End;

  End;
 adoq.Close;
 adoq.Free;
  End else result:=False;

 SpPassport.Free;
 spar.Free;
End;

Procedure GetPropListOfGRMATERIAL3(CGRMATERIAL:int64;Var PropList:TStringList);
Var
 i:integer;
 cparent:int64;
 PList:TStringList;
 Gr:TGrMaterials;
Begin
// ShowMessage('CMATERIAL='+IntToStr(CMATERIAL));
 if CGRMATERIAL<>0 then
  Begin
   PList:=TStringList.Create;
   cparent:=StrToIntM(GetTextValueOfPointer(IntToStr(CGRMATERIAL),SchemaName+'GRMATERIALS','nrec','cparent',False));
//   ShowMessage('cparent='+IntToStr(cparent));
   PList.CommaText:=UpperCase(GetTextValueOfPointer(IntToStr(cparent),SchemaName+'MATERIALS','nrec','CHILDPROP',False));

   Gr:=TGrMaterials.Create;
   If Gr.GetByNrec(CGRMATERIAL) then Gr.DelFilledProps(PList);
   Gr.Free;

   //   ShowMessage('PList.CommaText='+PList.CommaText);
   for i:=0 to PList.Count-1 do if PropList.IndexOf(PList[i])=-1 then PropList.Append(PList[i]);
   PList.Free;
  End;
// for i:=0 to PropList.Count-1 do PropList.Strings[i]:=UpperCase(
End;

Procedure TArrivalForm.UpdateGridColumnsVis;
Var
 OldRecNo:integer;
 PropList:TStringList;
 I: Integer;
Begin
 PropList:=TStringList.Create;
 sparrivalsADOQ.DisableControls;
 OldRecNo:=sparrivalsADOQ.RecNo;
 sparrivalsADOQ.First;
 while Not sparrivalsADOQ.Eof do
  Begin
   GetPropListOfGRMATERIAL3(sparrivalsADOQ['CGRMATERIALS'],PropList);
   sparrivalsADOQ.Next;
  End;
// Gr:=TGrMaterials.Create;
// If Gr.GetByNrec(tempValue) then Gr.DelFilledProps(PropList);

  for I := 0 to PropList.Count - 1 do
    if MatchStr(PropList[I], ['PROP_THICK', 'PROP_WIDTH', 'PROP_LENGTH']) then
      PropList[I] := PropList[I] + '_C';

  for I := 0 to SpArrivalsGrid.Columns.Count - 1 do
    if StartsStr('PROP_', SpArrivalsGrid.Columns[I].FieldName) then
      SpArrivalsGrid.Columns[I].Visible := PropList.IndexOf(SpArrivalsGrid.Columns[I].FieldName) > -1;

 if sparrivalsADOQ.RecordCount>0 then sparrivalsADOQ.RecNo:=OldRecNo;
 sparrivalsADOQ.EnableControls;
 PropList.Free;
End;


Function GetPaspnumsWithArrivalLinks(anrec:int64):string;
Var
 adoq:TAdoQuery;
Begin
 result:=EmptyStr;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select NUM from '+SchemaName+'PASSPORTS'+' where CSPARRIVALS in '+
 '(select NREC from '+SchemaName+'SPARRIVALS where CARRIVALS='+IntToStr(anrec)+')'+
 ' order by NUM';
 adoq.Open;
 if adoq.RecordCount>0 then
  Begin
   while Not adoq.Eof do
    Begin
     if Not Empty(result) then result:=result+', ';
     result:=result+adoq.FieldByName('NUM').AsString;
     adoq.Next;
    End;
  End;
 adoq.Close;
 adoq.Free;
End;

Function GetPaspnumsWithSpArrivalLinks(sanrec:int64):string;
Var
 adoq:TAdoQuery;
Begin
 result:=EmptyStr;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select NUM from '+SchemaName+'PASSPORTS'+' where CSPARRIVALS='+IntToStr(sanrec)+' order by NUM';
 adoq.Open;
 if adoq.RecordCount>0 then
  Begin
   while Not adoq.Eof do
    Begin
     if Not Empty(result) then result:=result+', ';
     result:=result+adoq.FieldByName('NUM').AsString;
     adoq.Next;
    End;
  End;
 adoq.Close;
 adoq.Free;
End;

Procedure TArrival.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'NUM', ftInteger);
 MTE.FieldDefs.Add(Prefix+'NCOUNTER', ftInteger);
 MTE.FieldDefs.Add(Prefix+'ADATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'ANUM', ftString, 1000);
 MTE.FieldDefs.Add(Prefix+'ACTIVE', ftBoolean);
End;


Procedure TArrival.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
 CmkUser:TCmkUser;
Begin
 if Empty(Prefix) then Pr:='ARRIVALS'
                  else Pr:=Prefix;

 rep.Variables[Pr+dot+'NREC']:=NREC;
 rep.Variables[Pr+dot+'NUM']:=NUM;
 rep.Variables[Pr+dot+'NCOUNTER']:=NCOUNTER;
 rep.Variables[Pr+dot+'ADATE']:=ADATE;
 rep.Variables[Pr+dot+'ANUM']:=kav+AddSlashes(ANUM)+kav;
 rep.Variables[Pr+dot+'ACTIVE']:=ACTIVE;

 CmkUser:=TCmkUser.Create;
 s:=GetTextValueOfPointer(IntToStr(NREC),SchemaName+'ARRIVALS','NREC','ORAUSER',True);
 If CmkUser.GetByLogin(s) then s:=CmkUser.GetUserFIO(True)
                          else s:=EmptyStr;
 rep.Variables[Pr+dot+'AUTHORFIO']:=kav+AddSlashes(s)+kav;
 CmkUser.Free;

 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;
End;

Procedure TArrival.BuildArrivalSpecMTE(OForm:TComponent;Var MTE:TMemTableEh);
Var
 sparADOQ:TAdoQuery;
 GrMaterials:TGrMaterials;
 spar:TSpArrival;
Begin
 GrMaterials:=TGrMaterials.Create;
 spar:=TSpArrival.Create;
 MTE:=TMemTableEh.Create(nil);
 MTE.FieldDefs.Add('CPARENT', ftLargeInt);
 MTE.FieldDefs.Add('PROFIL', ftString, 255);
 MTE.FieldDefs.Add('RAZMERN', ftString, 255);

 AppendStructToMTE(MTE,'ARRIVALS_');
 spar.AppendStructToMTE(MTE,'SPARRIVALS_');

 MTE.CreateDataSet;
 MTE.Open;

 sparADOQ:=TAdoQuery.Create(nil);
 sparADOQ.Connection:=Host.ADOC;
 sparADOQ.SQL.Text:='select * from '+SchemaName+'SPARRIVALS'+' where CARRIVALS='+IntToStr(NREC);
 sparADOQ.Open;
 while Not sparADOQ.Eof do
  Begin
   if spar.Read(sparADOQ) then
    If GrMaterials.GetByNrec(spar.CGRMATERIALS) then
   Begin
   MTE.Append;

   Save(MTE,'ARRIVALS_');
   MTE.Edit;

   spar.Save(OForm,MTE,'SPARRIVALS_');
   MTE.Edit;



   MTE['CPARENT']:=StrToIntM(GetTextValueOfPointer(IntToStr(spar.CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','cparent',False));

   MTE['PROFIL']:=GrMaterials.GetProfileName(True);

   if spar.PROP_PWIDTH1=0 then spar.PROP_PWIDTH1:=GrMaterials.PROP_PWIDTH1;
   if spar.PROP_PWIDTH2=0 then spar.PROP_PWIDTH2:=GrMaterials.PROP_PWIDTH2;
   if spar.PROP_SIZE1=0 then spar.PROP_SIZE1:=GrMaterials.PROP_SIZE1;
   if spar.PROP_SIZE2=0 then spar.PROP_SIZE2:=GrMaterials.PROP_SIZE2;
   if spar.PROP_WTHICK=0 then spar.PROP_WTHICK:=GrMaterials.PROP_WTHICK;
   if spar.PROP_SLENGTH=0 then spar.PROP_SLENGTH:=GrMaterials.PROP_SLENGTH;
   if spar.PROP_DIAM=0 then spar.PROP_DIAM:=GrMaterials.PROP_DIAM;
   if spar.PROP_SIZE=0 then spar.PROP_SIZE:=GrMaterials.PROP_SIZE;
   if spar.PROP_THICK_C=0 then spar.PROP_THICK_C:=GrMaterials.PROP_THICK_C;
   if spar.PROP_WIDTH_C=0 then spar.PROP_WIDTH_C:=GrMaterials.PROP_WIDTH_C;
   if spar.PROP_LENGTH_C=0 then spar.PROP_LENGTH_C:=GrMaterials.PROP_LENGTH_C;

   MTE['RAZMERN']:=spar.GetRazmernostStr(MTE.FieldByName('CPARENT').Value);
   MTE.Post;
   if MTE['SPARRIVALS_KOLSHT']=0 then MTE.Delete;
   End;
   sparADOQ.Next;
  End;
 sparADOQ.Close;
 sparADOQ.Free;
 spar.Free;

 GrMaterials.Free;
 MTE.SortOrder:='SPARRIVALS_NUM';
End;


Procedure TArrival.Report(OForm:TComponent;fr3:string);
Var
 MTE:TMemTableEh;
Begin
 FRForm.Report.Clear;
 FRForm.Report.LoadFromFile(fr3);
 FieldsToReport(FRForm.Report);

 BuildArrivalSpecMTE(OForm,MTE);

 FRForm.DBDataset.DataSet:=MTE;
 FRForm.Report.PrepareReport();
 FRForm.Report.ShowPreparedReport;
 MTE.Close;
 MTE.Free;
End;

procedure TArrivalForm.AppendSpArrivalsActionExecute(Sender: TObject);
Var
 spar:TSpArrival;
begin
 if AppendSpArrivalsAction.Enabled then
  Begin
   spar:=TSpArrival.Create;
   SpArrivalsADOQ.DisableControls;
//   ar.NUM:=OraGetNextIntValueForField(Host.ADOC,SchemaName+'arrivals','num','adate',EncodeDate(CurrentYear,1,1),EncodeDate(CurrentYear,12,31));
   spar.NREC:=OraInsertRecordAnGetID(Host.ADOC,SchemaName+'sparrivals','nrec',SchemaName+'SPARRIVALS_SEQ','CARRIVALS',IntToStr(f_nrec));
   Inc(f_ncounter); spar.NUM:=f_ncounter;
   if spar.NREC<>0 then
   Begin
    SpArrivalsADOQ.Requery;
    If SpArrivalsADOQ.Locate('nrec',spar.NREC,[]) then
     Begin
//       ShowMessage('123');
      If spar.Edit(Self,True) then
       Begin
        SpArrivalsADOQ.Edit;
        if spar.Save(Self,SpArrivalsADOQ) then CreatePassportsForSpArrival(spar.NREC,spar.KOLSHT)
                                          else SpArrivalsADOQ.Cancel;
        SpArrivalsADOQ.Requery;
        if Not SpArrivalsADOQ.Locate('nrec',spar.NREC,[]) then ShowMessage('Добавленная позиция задания не найдена!');
       End
        else
       Begin
        SpArrivalsADOQ.Delete;
//        Host.ADOC.Execute('delete from '+SchemaName+'sparrivals where nrec='+IntToStr(spar.NREC));
       End;
     End
      else
     Begin
      Host.ADOC.Execute('delete from '+SchemaName+'sparrivals where nrec='+IntToStr(spar.NREC));
      ShowMessage('Новая позиция не может быть добавлена в задание!');
     End;
   End else ShowMessage('Ошибка при попытке добавления в задание новой позиции!');
   SpArrivalsADOQ.EnableControls;
   SpArrivalsGrid.SetFocus;
   spar.Free;
   UpdateGridColumnsVis;
  End;
end;

procedure TArrivalForm.ArrivalsReportActionExecute(Sender: TObject);
Var
 ReportsList:TMemTableEh;
 Arrival:TArrival;
begin
 if ArrivalsReportAction.Enabled then
  Begin
   Arrival:=TArrival.Create;
   ReportsList:=TMemTableEh.Create(nil);
   if GetReportsList(Self,ReportsList,'arrival') and (ReportsList.RecordCount>0) then
    Begin
     ReportsList.First;
     while Not ReportsList.Eof do
      Begin
       if Arrival.FromForm(Self) then
        if Arrival.ToForm(Self,f_New) then
         Arrival.Report(Self,ReportsList.FieldByName('fr3').AsString);
       ReportsList.Next;
      End;
    End;
   ReportsList.Close;
   ReportsList.Free;
   Arrival.Free;
   SpArrivalsGrid.SetFocus;
  End;
end;

procedure TArrivalForm.DelSpArrivalsActionExecute(Sender: TObject);
Var
 OldRecNo:int64;
 s:string;
begin
 if DelSpArrivalsAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что хотите удалить из задания позицию "'+SpArrivalsADOQ.FieldByName('GRMATERIALS_S').AsString+'" ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     s:=GetPaspnumsWithSpArrivalLinks(SpArrivalsADOQ['NREC']);
     if Empty(s) then
      Begin
       OldRecNo:=SpArrivalsADOQ.RecNo;
       SpArrivalsADOQ.Delete;
       Try SpArrivalsADOQ.RecNo:=OldRecNo; Except SpArrivalsADOQ.First; End;
       UpdateGridColumnsVis;
      End
       else ShowMessage('В паспорте '+s+' присутствует ссылка на данную позицию. Удаление невозможно!');
    End;
  End;
 SpArrivalsGrid.SetFocus;
end;

procedure TArrivalForm.EditSpArrivalsActionExecute(Sender: TObject);
Var
 spar:TSpArrival;
begin
 if EditSpArrivalsAction.Enabled then
  Begin
   spar:=TSpArrival.Create;
   SpArrivalsADOQ.DisableControls;
   if spar.Read(spArrivalsADOQ) then
   Begin
    If spar.Edit(Self,False,Not f_active.Checked) then
     Begin
      spArrivalsADOQ.Requery;
      if spArrivalsADOQ.Locate('nrec',spar.NREC,[]) then
       Begin
        spArrivalsADOQ.Edit;
        if spar.Save(Self,spArrivalsADOQ) then CreatePassportsForSpArrival(spar.NREC,spar.KOLSHT)
                                          else spArrivalsADOQ.Cancel;
        spArrivalsADOQ.Requery;
        spArrivalsADOQ.Locate('nrec',spar.NREC,[]);
       End;
     End
   End;
   spArrivalsADOQ.EnableControls;
   spar.Free;
   spArrivalsGrid.SetFocus;
   UpdateGridColumnsVis;
  End;
end;

procedure TArrivalForm.FormCreate(Sender: TObject);
Var
 orderby:string;
begin
 orderby:=' order by freq desc,name';
 sparrivalsADOQ.Connection:=Host.ADOC;
end;

procedure TArrivalForm.FormDestroy(Sender: TObject);
begin
// contractorsADOQ.Close;
end;

procedure TArrivalForm.FormShow(Sender: TObject);
begin
 if f_New then f_ANUM.SetFocus
          else SpArrivalsGrid.SetFocus;
end;

procedure TArrivalForm.f_activeClick(Sender: TObject);
begin
 f_active.OnClick:=nil;
 if Not f_active.Checked then
  Begin
  if (CurrentUser.CUSERGROUPS<>1) then
   Begin
    f_active.Checked:=True;
    ShowMessage('Смена статуса из "исполняемое" на "оформляемое" доступна только для пользователей группы "Администраторы"!');
   End;
  End
   else
  Begin
   If (CurrentUser.CUSERGROUPS<>1) and ((MagsoftMessageDlg('Обратная замена статуса из "исполняемое" на "оформляемое" будет доступна только для пользователей группы "Администраторы"! Вы уверены, что хотите установить статус "Исполняемое"?',mtConfirmation,[mbNo,mbYes],0,mbNo)<>mrYes)) then
    Begin
     f_active.Checked:=False;
    End;
  End;
 ActionsEnabling;
 f_active.OnClick:=f_activeClick;
end;

procedure TArrivalForm.PassportsListActionExecute(Sender: TObject);
Var
 Passports:TPassports;
begin
 if PassportsListAction.Enabled then
  Begin
   Passports:=TPassports.Create;
   Passports.CSPARRIVAL:=sparrivalsADOQ.FieldByName('nrec').AsLargeInt;
   Passports.Edit(Self);
   Passports.Free;
  End;
end;

procedure TArrivalForm.PrintAllPassportsActionExecute(Sender: TObject);
Var
 recno:integer;
 adoq:TAdoQuery;
 Passport:TPassport;
 ReportsList:TMemTableEh;
 f,conly:boolean;
 gr:TGrMaterials;
 spar:TSpArrival;
begin
 if PrintAllPassportsAction.Enabled then
  Begin
   conly:=True;
   f:=True;
   gr:=TGrMaterials.Create;
   spar:=TSpArrival.Create;

   Passport:=TPassport.Create;
   ReportsList:=TMemTableEh.Create(nil);
   if GetReportsList(Self,ReportsList,'passport') and (ReportsList.RecordCount>0) then
    Begin
     FRForm.Report.Clear;
     FRForm.Report.LoadFromFile(ReportsList.FieldByName('fr3').AsString);

   sparrivalsADOQ.DisableControls;
   recno:=sparrivalsADOQ.RecNo;
   sparrivalsADOQ.First;
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   while Not sparrivalsADOQ.Eof do
    Begin
     if sparrivalsADOQ.FieldByName('state').AsInteger=1 then
      Begin
       adoq.SQL.Text:='select * from '+SchemaName+'PASSPORTS'+' where CSPARRIVALS='+IntToStr(sparrivalsADOQ.FieldByName('nrec').AsLargeInt)+' order by NREC';
       adoq.Open;
       while Not adoq.Eof do
        Begin
         if Passport.Read(adoq) then Passport.Report2(Self,f,conly,True,gr,spar);
         adoq.Next;
        End;
       adoq.Close;
      End;
     sparrivalsADOQ.Next;
    End;
   adoq.Free;

   if Not f then FRForm.Report.ShowPreparedReport
         else ShowMessage('Не обнаружен ни один паспорт, связанный с данным заданием!');

   try sparrivalsADOQ.RecNo:=recno; except end;
   sparrivalsADOQ.EnableControls;
    End;
   ReportsList.Close;
   ReportsList.Free;
   Passport.Free;
   gr.Free;
   spar.Free;
  End;
end;

procedure TArrivalForm.SetAllReceivedActionExecute(Sender: TObject);
begin
 if SetAllReceivedAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что все позиции этого задания имеются в наличии?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     sparrivalsADOQ.DisableControls;
     sparrivalsADOQ.First;
     while Not sparrivalsADOQ.Eof do
      Begin
//       result:=result+adoq.FieldByName('NUM').AsString;
       if sparrivalsADOQ.FieldByName('STATE').AsInteger<>1 then
        Begin
         If CreatePassportsForSpArrival(sparrivalsADOQ.FieldByName('NREC').AsLargeInt,sparrivalsADOQ.FieldByName('KOLSHT').AsInteger) then
          Begin
           sparrivalsADOQ.Edit;
           sparrivalsADOQ.FieldByName('STATE').AsInteger:=1;
           sparrivalsADOQ.Post;
          End;
        End;
       sparrivalsADOQ.Next;
      End;



//     Host.ADOC.Execute('update '+SchemaName+'sparrivals set STATE=1 where carrivals='+IntToStr(f_nrec));
     sparrivalsADOQ.Requery;
     sparrivalsADOQ.First;
     sparrivalsADOQ.EnableControls;
     SpArrivalsGrid.SetFocus;
    End;
  End;
end;

procedure TArrivalForm.sparrivalsADOQAfterPost(DataSet: TDataSet);
begin
 CreatePassportsForSpArrival(sparrivalsADOQ.FieldByName('nrec').AsLargeInt,sparrivalsADOQ.FieldByName('kolsht').AsInteger);
end;

procedure TArrivalForm.sparrivalsADOQBeforePost(DataSet: TDataSet);
begin
 Dataset.FieldByName('CARRIVALS').AsLargeInt:=f_nrec;
 ReplEmptyToSpace(DataSet,'SPPLANS_S');
 ReplEmptyToSpace(DataSet,'PRIM');
 ReplEmptyToSpace(DataSet,'GRMATERIALS_S');
 if (Dataset.FieldByName('STATE').AsInteger<0) or (Dataset.FieldByName('STATE').AsInteger>1) then Dataset.FieldByName('STATE').AsInteger:=0;
end;

procedure TArrivalForm.sparrivalsDSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TArrivalForm.SpArrivalsGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
 active:boolean;
begin
 Try active:=SpArrivalsADOQ.FieldByName('state').AsInteger=1; Except active:=False; End;

 If gdSelected in State then
  Begin
   SpArrivalsGrid.Canvas.Brush.Color:=clSilver;
  End;

 if active then SpArrivalsGrid.Canvas.Font.Color := clBlack
           else SpArrivalsGrid.Canvas.Font.Color := clNavy;
 SpArrivalsGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TArrivalForm.SpArrivalsGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
 edit:boolean;
begin
 edit:=True;
 case Key of
       vk_return: Begin
                   If sparrivalsADOQ.Active and ((sparrivalsDS.State=dsEdit) or (sparrivalsDS.State=dsInsert)) then
                    Try sparrivalsADOQ.Post; edit:=False; Except sparrivalsADOQ.Cancel; End;
                   If edit then EditSpArrivalsActionExecute(Sender);
                   Key:=0;
                  End;
 end;
end;

Constructor TArrival.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TArrival.Clear;
begin
 NREC:=0;
 NUM:=0;
 NCOUNTER:=0;
 ANUM:=EmptyStr;
 ADATE:=Trunc(Now);
 ACTIVE:=False;
end;

Function TArrival.Save(Dataset:TDataset;Prefix:string=''):boolean;
Begin
 result:=True;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 Dataset[Prefix+'NUM']:=NUM;
 Dataset[Prefix+'NCOUNTER']:=NCOUNTER;
 Dataset[Prefix+'ADATE']:=ADATE;
 if ANUM=EmptyStr then ANUM:=space;
 Dataset[Prefix+'ANUM']:=ANUM;
 if ACTIVE then Dataset[Prefix+'ACTIVE']:=1
           else Dataset[Prefix+'ACTIVE']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о задании! ('+e.Message+')');
      End;
 End;

End;

Function TArrival.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 NUM:=Dataset['NUM'];
 NCOUNTER:=Dataset['NCOUNTER'];
 ANUM:=Dataset['ANUM'];
 ADATE:=Dataset.FieldByName('ADATE').AsDateTime;
 ACTIVE:=(Dataset.FieldByName('ACTIVE').AsInteger=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о задании! ('+e.Message+')');
   End;
 End;
End;

Function TArrival.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TArrivalForm;
begin
 Form:=TArrivalForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TArrival.ToForm(Var Form:TArrivalForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 Form.f_ncounter:=ncounter;
 Form.f_new:=New;

 if New then Form.Caption:='Добавление нового задания'
        else Form.Caption:='Задание №'+IntToStr(NUM);


 Form.f_NUM.Text:=IntToStr(NUM);
 Form.f_ANUM.Text:=ANUM;
 Form.f_ADATE.Date:=ADATE;
 Form.f_active.Checked:=ACTIVE;

 Form.sparrivalsADOQ.SQL.Text:='select * from '+SchemaName+'sparrivals'+' where carrivals='+IntToStr(nrec)+' order by GRMATERIALS_S';
 Form.sparrivalsADOQ.Open;

 Form.UpdateGridColumnsVis;


 Form.ActionsEnabling;

 {
 Form.f_yearv.Text:=IntToStr(yearv);
 Form.f_objcount.Text:=IntToStr(objcount);
 Form.f_orgowner_nrec:=cowner;
 Form.UpdateOrgOwnerBtn;
 Form.f_comment.Text:=comment;
 }
 Form.f_active.OnClick:=Form.f_activeClick;
 result:=True;
End;

Function TArrival.FromForm(Var Form:TArrivalForm):boolean;
Begin
 nrec:=Form.f_nrec;
 ncounter:=Form.f_ncounter;
 NUM:=StrToIntM(Form.f_NUM.Text);
 ANUM:=Form.f_ANUM.Text;
 ADATE:=Form.f_ADATE.Date;
 ACTIVE:=Form.f_active.Checked;
 Form.sparrivalsADOQ.Close;
 result:=True;
End;

Destructor TArrival.Destroy;
begin
 Clear;
 inherited Destroy;
end;

Procedure TArrivalForm.ActionsEnabling;
Begin
 AppendSpArrivalsAction.Enabled:=SpArrivalsADOQ.Active and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3)) and Not f_active.Checked;
 EditSpArrivalsAction.Enabled:=SpArrivalsADOQ.Active and (SpArrivalsADOQ.RecNo>0) and (SpArrivalsADOQ.FieldByName('NREC').AsLargeInt<>0);
 DelSpArrivalsAction.Enabled:=SpArrivalsADOQ.Active and (SpArrivalsADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3)) and (SpArrivalsADOQ.FieldByName('NREC').AsLargeInt<>0) and Not f_active.Checked;
 SetAllReceivedAction.Enabled:=SpArrivalsADOQ.Active and (SpArrivalsADOQ.RecordCount>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3)) and Not f_active.Checked;
 ArrivalsReportAction.Enabled:=SpArrivalsADOQ.Active and (SpArrivalsADOQ.RecordCount>0);
 PassportsListAction.Enabled:=SpArrivalsADOQ.Active and (SpArrivalsADOQ.RecNo>0) and (sparrivalsADOQ.FieldByName('STATE').AsInteger=1) and (sparrivalsADOQ.FieldByName('KOLSHT').AsInteger>0);
 f_num.Enabled:=Not f_active.Checked;
 f_adate.Enabled:=Not f_active.Checked;
 f_anum.Enabled:=Not f_active.Checked;
 PrintAllPassportsAction.Enabled:=f_active.Checked;
 SpArrivalsGrid.ReadOnly:=f_active.Checked;
 if f_active.Checked then
  Begin
   SpArrivalsGrid.Color:=clBtnFace;
   SpArrivalsGrid.FooterColor:=clBtnFace;
  End
   else
  Begin
   SpArrivalsGrid.Color:=clWindow;
   SpArrivalsGrid.FooterColor:=clWindow;
  End;
 ReadOnlyColorsUpdateForGrid(SpArrivalsGrid,clWindow,clBtnFace,f_active.Checked);

End;

end.

