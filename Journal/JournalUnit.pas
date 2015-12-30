unit JournalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits, InclFileUnit,
  Spr1LabeledEditUnit, EquipmentUnit, ContractorUnit, DBGridEhGrouping,
  Vcl.DBCtrls, GridsEh, DBGridEh, Vcl.PlatformDefaultStyleActnCtrls,
  ActnCtrls,  SteelMarkUnit, MagsoftMsgDlgUnit, Vcl.ImgList, EhLibADO, Vcl.Menus,
  Spr1JvCalcEditUnit, NormdocUnit, CMKUserUnit, JournalFilterUnit,
  FastReportUnit, MemTableEh;


type
  TJournalForm = class(TForm)
    ADOQ: TADOQuery;
    DS: TDataSource;
    Panel2: TPanel;
    Grid: TDBGridEh;
    Panel3: TPanel;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    ActionManager1: TActionManager;
    AppendRecordAction: TAction;
    EditRecordAction: TAction;
    DeleteRecordAction: TAction;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SetFilterAction: TAction;
    BitBtn14: TBitBtn;
    ReportAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionsEnabling;
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure ADOQBeforePost(DataSet: TDataSet);
    procedure SetFilterActionExecute(Sender: TObject);
    Procedure OpenADOQ;
    procedure ReportActionExecute(Sender: TObject);
    Procedure Report(fr3:string);
  private
    { Private declarations }
  public
    { Public declarations }
    f_EditRights:boolean;
    f_SprFilterString,f_SprTableName,f_UnicalField: string;
    f_BeforePostField1: string;
    f_BeforePostValue1: int64;
    f_BeforePostField2: string;
    f_BeforePostValue2: int64;
    JournalFilter:TJournalFilter;
  end;

TJournal = class
 SprTableName: string;
 SprVisibleFieldNames: string;
 SprVisibleFieldTitles: string;
 SprVisibleFieldWidths: string;
 SprFilterString: string;
 SprOrderByString: string;
 SprDescription: string;
 UnicalField: string;
 BeforePostField1: string;
 BeforePostValue1: int64;
 BeforePostField2: string;
 BeforePostValue2: int64;
 EditRights: boolean;
 Procedure Clear;
 Function ToForm(Var Form:TJournalForm):boolean;
 Function FromForm(Var Form:TJournalForm):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  JournalForm: TJournalForm;

implementation

{$R *.dfm}

procedure TJournalForm.ADOQBeforePost(DataSet: TDataSet);
begin
 if Not Empty(f_BeforePostField1) then DataSet[f_BeforePostField1]:=f_BeforePostValue1;
 if Not Empty(f_BeforePostField2) then DataSet[f_BeforePostField2]:=f_BeforePostValue2;
end;



procedure TJournalForm.DSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TJournalForm.FormCreate(Sender: TObject);
begin
 ADOQ.Connection:=Host.ADOC;
 JournalFilter:=TJournalFilter.Create;
end;

procedure TJournalForm.FormDestroy(Sender: TObject);
begin
 ADOQ.Close;
 JournalFilter.Free;
end;

procedure TJournalForm.FormShow(Sender: TObject);
begin
 Grid.SetFocus;
end;

procedure TJournalForm.SetFilterActionExecute(Sender: TObject);
begin
 if SetFilterAction.Enabled then
  Begin
   if JournalFilter.Edit(Self) then OpenADOQ;
   Grid.SetFocus;
//   ShowMessage('5');
  End;
end;

Constructor TJournal.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TJournal.Clear;
begin
 SprTableName:=EmptyStr;
 SprVisibleFieldNames:=EmptyStr;
 SprVisibleFieldTitles:=EmptyStr;
 SprVisibleFieldWidths:=EmptyStr;
 SprFilterString:=EmptyStr;
 SprOrderByString:=EmptyStr;
 SprDescription:=EmptyStr;
 UnicalField:='NAME';
 BeforePostField1:=EmptyStr;
 BeforePostValue1:=0;
 BeforePostField2:=EmptyStr;
 BeforePostValue2:=0;
 EditRights:=True;
end;

Function TJournal.Edit(OForm:TComponent):boolean;
Var
 Form: TJournalForm;
begin
 Form:=TJournalForm.Create(OForm);
 if ToForm(Form) then
  Begin
   Form.ShowModal;
   result:=FromForm(Form);
  End;
 Form.Free;
end;

Procedure TJournalForm.OpenADOQ;
Var
 OldNREC:int64;
Begin
 ADOQ.DisableControls;
 if ADOQ.Active and (ADOQ.RecNo>0) then OldNREC:=ADOQ['NREC']
                                   else OldNREC:=0;
 ADOQ.Close;
 ADOQ.Parameters.Clear;
 ADOQ.Parameters.CreateParameter('ot1',ftDateTime,pdInput,0,Trunc(JournalFilter.OPERTIME1));
 ADOQ.Parameters.CreateParameter('ot2',ftDateTime,pdInput,0,Trunc(JournalFilter.OPERTIME2)+0.99999);

// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE1)));
// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE2)+0.99999));

 ADOQ.SQL.Text:='select * from '+SchemaName+'journal'+' where '+JournalFilter.GetFilterString+' order by OPERTIME desc,NREC desc';
// ShowMessage(KD1ADOQ.SQL.Text);
 ADOQ.Open;
// ShowMessage('2');
 if OldNREC<>0 then ADOQ.Locate('NREC',OldNREC,[]);
// ShowMessage('3');
 ADOQ.EnableControls;
// ShowMessage('4');
End;

Procedure TJournalForm.Report(fr3:string);
Var
 MTE:TMemTableEh;
 adoqq:TAdoQuery;
Begin
 FRForm.Report.Clear;
 FRForm.Report.LoadFromFile(fr3);


 adoqq:=TAdoQuery.Create(nil);
 adoqq.Connection:=Host.ADOC;
 adoqq.SQL.Text:='select * from '+SchemaName+'persons';
 adoqq.Open;

 MTE:=TMemTableEh.Create(nil);

 MTE.FieldDefs.Add('NREC', ftLargeInt);
 MTE.FieldDefs.Add('TABLENAME', ftString, 20);
 MTE.FieldDefs.Add('TABLENREC', ftLargeInt);
 MTE.FieldDefs.Add('OPERTYPE', ftInteger);
 MTE.FieldDefs.Add('OPERTIME', ftDateTime);
 MTE.FieldDefs.Add('USERNAME', ftString, 20);
 MTE.FieldDefs.Add('CHANGES', ftMemo);
 MTE.FieldDefs.Add('TABLEDESCR', ftString, 100);
 MTE.FieldDefs.Add('OPERTYPE_S', ftString, 50);
 MTE.FieldDefs.Add('USERFIO', ftString, 182);
 MTE.CreateDataSet;
 MTE.Open;

 adoq.DisableControls;
 adoq.Last;
 while Not adoq.Bof do
  Begin
   mte.Append;
   mte.FieldByName('NREC').AsLargeInt:=adoq.FieldByName('NREC').AsLargeInt;
   mte.FieldByName('TABLENAME').AsString:=adoq.FieldByName('TABLENAME').AsString;
   mte.FieldByName('TABLENREC').AsLargeInt:=adoq.FieldByName('TABLENREC').AsLargeInt;
   mte.FieldByName('OPERTYPE').AsInteger:=adoq.FieldByName('OPERTYPE').AsInteger;
   mte.FieldByName('OPERTIME').AsDateTime:=adoq.FieldByName('OPERTIME').AsDateTime;
   mte.FieldByName('USERNAME').AsString:=adoq.FieldByName('USERNAME').AsString;
   mte.FieldByName('CHANGES').AsString:=adoq.FieldByName('CHANGES').AsString;
   mte.FieldByName('TABLEDESCR').AsString:=GetTableDescription(adoq.FieldByName('TABLENAME').AsString);
   mte.FieldByName('OPERTYPE_S').AsString:=GetOperTypeDescription(adoq.FieldByName('OPERTYPE').AsInteger);
   if adoqq.Locate('ORAUSER',mte.FieldByName('USERNAME').AsString,[loCaseInsensitive]) then mte.FieldByName('USERFIO').AsString:=Trim(adoqq.FieldByName('LNAME').AsString+space+adoqq.FieldByName('FNAME').AsString+space+adoqq.FieldByName('MNAME').AsString)+space+'('+mte.FieldByName('USERNAME').AsString+')'
                                                                                    else mte.FieldByName('USERFIO').AsString:=mte.FieldByName('USERNAME').AsString;
   mte.Post;
   adoq.Prior;
  End;
 adoqq.Close;
 adoqq.Free;

 adoq.EnableControls;

 FRForm.Report.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;


 FRForm.DBDataset.DataSet:=MTE;
 FRForm.Report.PrepareReport();
 FRForm.Report.ShowPreparedReport;
 MTE.Close;
 MTE.Free;
End;


procedure TJournalForm.ReportActionExecute(Sender: TObject);
Var
 ReportsList:TMemTableEh;
begin
 if ReportAction.Enabled then
  Begin
   ReportsList:=TMemTableEh.Create(nil);
   if GetReportsList(Self,ReportsList,'JOURNAL') and (ReportsList.RecordCount>0) then
    Begin
     ReportsList.First;
     while Not ReportsList.Eof do
      Begin
//       ShowMessage('fr3: '+ReportsList.FieldByName('fr3').AsString);
//       ShowMessage('descr: '+ReportsList.FieldByName('descr').AsString);
       Report(ReportsList.FieldByName('fr3').AsString);
       ReportsList.Next;
      End;
    End;
   ReportsList.Close;
   ReportsList.Free;
   Grid.SetFocus;
  End;
end;

Function TJournal.ToForm(Var Form:TJournalForm):boolean;
Var
 i:integer;
 orderby:string;
 wh:string;
 column:TColumnEh;
 ColumnsList,ColumnsTitlesList,ColumnsWidthsList:TStringList;
Begin
 result:=False;
 Form.f_EditRights:=EditRights;
 Form.f_SprTableName:=UpperCase(SprTableName);
 Form.f_UnicalField:=UnicalField;
 Form.f_SprFilterString:=SprFilterString;
 Form.f_BeforePostField1:=BeforePostField1;
 Form.f_BeforePostValue1:=BeforePostValue1;
 Form.f_BeforePostField2:=BeforePostField2;
 Form.f_BeforePostValue2:=BeforePostValue2;
 if Not Empty(SprTableName) then
  Begin
   if Not Empty(SprDescription) then Form.Caption:=SprDescription;
   if Empty(SprFilterString) then wh:=Truu
                             else wh:=SprFilterString;
   if Empty(SprOrderByString) then orderby:=EmptyStr
                              else orderby:=' order by '+SprOrderByString;
//   Form.ADOQ.SQL.Text:='select * from '+SchemaName+SprTableName+' where '+wh+orderby;
//   Form.ADOQ.Open;
   Form.OpenADOQ;

   if Not Empty(SprVisibleFieldNames) then
    Begin
      ColumnsList:=TStringList.Create;
      ColumnsList.CommaText:=SprVisibleFieldNames;
      ColumnsTitlesList:=TStringList.Create;
      ColumnsTitlesList.CommaText:=SprVisibleFieldTitles;
      ColumnsWidthsList:=TStringList.Create;
      ColumnsWidthsList.CommaText:=SprVisibleFieldWidths;

      for i:=0 to ColumnsList.Count-1 do
       Begin
        column:=Form.grid.columns.Add;
        column.AutoDropDown:=True;
        column.ToolTips:=True;
        column.DropDownSizing:=True;
        column.FieldName:=ColumnsList[i];
        column.Visible:=True;
//        ShowMessage(ColumnsTitlesList[i]);
        if i<ColumnsTitlesList.Count then
         column.Title.Caption:=DeQuoted(ColumnsTitlesList[i]);
        if i<(ColumnsList.Count-1) then
         column.Title.TitleButton:=True
          else column.WordWrap:=True;
        column.Title.ToolTips:=True;
        column.ToolTips:=True;
        if i<ColumnsWidthsList.Count then
         Begin
          if ColumnsWidthsList[i]=zero then
           Begin
            column.AutoFitColWidth:=True;
           End
            else
           Begin
            column.AutoFitColWidth:=False;
            column.Width:=StrToIntM(ColumnsWidthsList[i]);
           End;
         End;
       End;
      ColumnsWidthsList.Free;
      ColumnsTitlesList.Free;
      ColumnsList.Free;

    End;


   Form.ActionsEnabling;
   result:=True;
  End
End;

Function TJournal.FromForm(Var Form:TJournalForm):boolean;
Begin
 EditRights:=Form.f_EditRights;
 result:=True;
End;

Destructor TJournal.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TJournalForm.ActionsEnabling;
Begin
 AppendRecordAction.Enabled:=f_EditRights and ADOQ.Active;
 EditRecordAction.Enabled:=ADOQ.Active and (ADOQ.RecNo>0);
 DeleteRecordAction.Enabled:=f_EditRights and ADOQ.Active and (ADOQ.RecNo>0);

 AppendRecordAction.Enabled:=False;
 EditRecordAction.Enabled:=False;
 DeleteRecordAction.Enabled:=False;
End;

end.
