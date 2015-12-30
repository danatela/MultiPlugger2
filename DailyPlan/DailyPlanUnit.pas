unit DailyPlanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, GridsEh, DBAxisGridsEh, DBGridEh, ExcelXP, GlobVars;

type
  TDailyPlanForm = class(TForm)
    DailyJobsDBGridEh: TDBGridEh;
    RightPanel: TPanel;
    NewBitBtn: TBitBtn;
    EditBitBtn: TBitBtn;
    DeleteBitBtn: TBitBtn;
    DailyJobsADOQuery: TADOQuery;
    DailyJobsDataSource: TDataSource;
    DailyJobsADOQueryID: TFloatField;
    DailyJobsADOQueryNUM: TStringField;
    DailyJobsADOQueryJDATE: TDateTimeField;
    DailyJobsADOQueryPROLET_ID: TFloatField;
    DailyJobsADOQueryKD_NREC: TFloatField;
    DailyJobsADOQueryMARKS_NREC: TFloatField;
    ProletADOQuery: TADOQuery;
    KDADOQuery: TADOQuery;
    MarksADOQuery: TADOQuery;
    ProletADOQueryID: TFloatField;
    ProletADOQueryPROL_NAME: TStringField;
    ProletADOQueryPROL_TYPE: TFMTBCDField;
    MarksADOQueryNREC: TFloatField;
    MarksADOQueryCKD: TFloatField;
    MarksADOQueryORDN: TStringField;
    MarksADOQueryQUEUE: TStringField;
    MarksADOQueryMARK: TStringField;
    MarksADOQueryNAME: TStringField;
    MarksADOQueryRKOEF: TFloatField;
    MarksADOQueryCMKGROUP: TFloatField;
    MarksADOQueryWEIGHT1: TFloatField;
    MarksADOQueryWEIGHTZ: TFloatField;
    MarksADOQueryDRAWING: TStringField;
    MarksADOQueryINPUTDATE: TDateTimeField;
    MarksADOQueryLUPDDATE: TDateTimeField;
    MarksADOQueryCRECIPIENT: TFloatField;
    MarksADOQueryT_SBORKA_NV: TFloatField;
    MarksADOQueryT_SBORKA_PR: TStringField;
    MarksADOQueryT_SVARKA_WE: TFloatField;
    MarksADOQueryT_SVARKA_M: TFloatField;
    MarksADOQueryT_SVARKA_CEQ: TFloatField;
    MarksADOQueryT_SVARKA_NV: TFloatField;
    MarksADOQueryT_ZACHIST_CEQ: TFloatField;
    MarksADOQueryT_ZACHIST_NV: TFloatField;
    MarksADOQueryT_GRPOKR_GR: TStringField;
    MarksADOQueryT_GRPOKR_POKR: TStringField;
    MarksADOQueryT_GRPOKR_NV: TFloatField;
    MarksADOQueryT_DOVODKA_CEQ: TFloatField;
    MarksADOQueryT_DOVODKA_NV: TFloatField;
    MarksADOQueryT_DOVODKA_PR: TStringField;
    MarksADOQueryPRIM: TStringField;
    MarksADOQueryMKGROUP_S: TStringField;
    MarksADOQueryRECIPIENT_S: TStringField;
    MarksADOQueryT_SVARKA_EQ_S: TStringField;
    MarksADOQueryT_ZACHIST_EQ_S: TStringField;
    MarksADOQueryT_DOVODKA_EQ_S: TStringField;
    MarksADOQueryEMPTY: TFMTBCDField;
    MarksADOQueryCONTROL: TStringField;
    DailyJobsADOQueryPROLET_NAME: TStringField;
    KDADOQueryNREC: TFloatField;
    KDADOQueryORDERNUM: TStringField;
    KDADOQueryINPUTDATE: TDateTimeField;
    KDADOQueryLUPDDATE: TDateTimeField;
    KDADOQueryCCONTRACTOR: TFloatField;
    KDADOQueryACTDATE: TDateTimeField;
    KDADOQueryCONTRACTOR_S: TStringField;
    KDADOQueryORAUSER: TStringField;
    KDADOQueryORDERNUM2: TStringField;
    KDADOQueryEMPTY: TFMTBCDField;
    KDADOQueryCONTROL: TStringField;
    DailyJobsADOQueryKD_ORDERNUM: TStringField;
    DailyJobsADOQueryKD_ORDERNUM2: TStringField;
    DailyJobsADOQueryMARKS_ORDN: TStringField;
    ADOConnection: TADOConnection;
    DailyJobsADOQueryPRIM: TStringField;
    PrintBitBtn: TBitBtn;
    DailyJobsADOQueryMARKS_NAME: TStringField;
    DailyJobsADOQueryQUANTITY: TFMTBCDField;
    ProletsADOQuery: TADOQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FMTBCDField1: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DeleteBitBtnClick(Sender: TObject);
    procedure DailyJobsADOQueryAfterScroll(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DailyJobsADOQueryKD_NRECChange(Sender: TField);
    procedure NewBitBtnClick(Sender: TObject);
    procedure EditBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure BeforeOpen(DataSet: TDataSet);
    procedure ADOConnectionWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DailyPlanForm: TDailyPlanForm;
  PicturesDir: string;

implementation

{$R *.dfm}

uses DPEditUnit, SelectPassUnit;

procedure TDailyPlanForm.ADOConnectionWillConnect(Connection: TADOConnection;
  var ConnectionString, UserID, Password: WideString;
  var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
var
  I: Integer;
begin
  for I := ADOConnection.DataSetCount - 1 downto 0 do
    if Assigned(ADOConnection.DataSets[I]) then
      ADOConnection.DataSets[I].Connection := Host.ADOC;
  EventStatus := esCancel;
end;

procedure TDailyPlanForm.BeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

procedure TDailyPlanForm.DailyJobsADOQueryAfterScroll(DataSet: TDataSet);
begin
  EditBitBtn.Enabled := not VarIsNull(DataSet['ID']);
  DeleteBitBtn.Enabled := not VarIsNull(DataSet['ID']);
  DailyJobsADOQueryKD_NRECChange(DailyJobsADOQueryKD_NREC);
end;

procedure TDailyPlanForm.DailyJobsADOQueryKD_NRECChange(Sender: TField);
begin
  MarksADOQuery.Parameters.ParamValues['PCKD'] := DailyJobsADOQuery['KD_NREC'];
  MarksADOQuery.Requery;
end;

procedure TDailyPlanForm.DeleteBitBtnClick(Sender: TObject);
begin
  DailyJobsADOQuery.Delete;
end;

procedure TDailyPlanForm.EditBitBtnClick(Sender: TObject);
begin
  DailyJobsADOQuery.Edit;
  DPEditForm := TDPEditForm.Create(Application);
  with DPEditForm, ClientDataSet do begin
    if ShowModal = mrOK then begin
      DailyJobsADOQuery.Post;
      First;
      while not Eof do begin
        if SPDailyJobsADOQuery.Locate('ID', ClientDataSet['ID'], []) then begin
          SPDailyJobsADOQuery.Edit;
          SPDailyJobsADOQuery['DAILYJOBS_ID;OPER_NREC;ACTIVE;COMPLETED;PRIM'] := ClientDataSet['DAILYJOBS_ID;OPER_NREC;ACTIVE;COMPLETED;PRIM'];
          SPDailyJobsADOQuery.Post;
        end;
        Next;
      end;
    end
    else
      DailyJobsADOQuery.Cancel;
    end;
  DPEditForm.Free;
end;

procedure TDailyPlanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  DailyPlanForm := nil;
end;

procedure TDailyPlanForm.FormCreate(Sender: TObject);
begin
  KDADOQuery.Open;
  DailyJobsADOQuery.Open;
end;

procedure TDailyPlanForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F4: EditBitBtnClick(Sender);
  VK_F7: NewBitBtnClick(Sender);
  VK_F8: DeleteBitBtnClick(Sender);
  Ord('P'): if ssCtrl in Shift then PrintBitBtnClick(Sender);
  end;
end;

procedure TDailyPlanForm.NewBitBtnClick(Sender: TObject);
begin
  DailyJobsADOQuery.Insert;
  DPEditForm := TDPEditForm.Create(Application);
  with DPEditForm, ClientDataSet do begin
    Append;
    ClientDataSet['OPER_NREC'] := 1;
    Post;
    Append;
    ClientDataSet['OPER_NREC'] := 2;
    Post;
    Append;
    ClientDataSet['OPER_NREC'] := 3;
    Post;
    Append;
    ClientDataSet['OPER_NREC'] := 61;
    Post;
    Append;
    ClientDataSet['OPER_NREC'] := 62;
    Post;
    if ShowModal = mrOK then begin
      DailyJobsADOQuery.Post;
      DailyJobsADOQuery.Refresh;
      First;
      while not Eof do begin
        Edit;
        ClientDataSet['DAILYJOBS_ID'] := DailyJobsADOQuery['ID'];
        Post;
        SPDailyJobsADOQuery.Append;
        SPDailyJobsADOQuery['DAILYJOBS_ID;OPER_NREC;ACTIVE;COMPLETED;PRIM'] := ClientDataSet['DAILYJOBS_ID;OPER_NREC;ACTIVE;COMPLETED;PRIM'];
        SPDailyJobsADOQuery.Post;
        Next;
      end;
      // никогда не вызывайте этот метод!!! ClientDataSet.ApplyUpdates(-1);
    end
    else
      DailyJobsADOQuery.Cancel;
  end;
  DPEditForm.Free;
  DailyJobsADOQueryAfterScroll(DailyJobsADOQuery);
end;

procedure TDailyPlanForm.PrintBitBtnClick(Sender: TObject);
var
  Workbook: _Workbook;
  BaseCorpus: _Worksheet;
  Rng, CycleRng, EndRng: ExcelRange;
  Active_, Completed: Integer;
  BaseFilter: string;
  Filtered: Boolean;
  function CombineFilters(Base, Additional: string): string;
  begin
    if Base <> '' then
      Result := Base + ' AND (' + Additional + ')'
    else
      Result := Additional;
  end;
begin
  DailyJobsADOQuery.DisableControls;
  ProletsADOQuery.Open;
  Filtered := DailyJobsADOQuery.Filtered;
  BaseFilter := DailyJobsADOQuery.Filter;
  DailyJobsADOQuery.Filtered := True;
  DPEditForm := TDPEditForm.Create(Application);
  DPEditForm.App.Connect;
  Workbook := DPEditForm.App.Workbooks.Add('\\Server1571\CMKNEW\Reports\DailyPlan\DailyJob.xlt', LOCALE_USER_DEFAULT);
  BaseCorpus := Workbook.Worksheets[1] as _Worksheet;
  Rng := BaseCorpus.UsedRange[LOCALE_USER_DEFAULT];
  Rng.Replace('${Date}', DailyJobsADOQuery['JDATE'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  CycleRng := BaseCorpus.Range['CycleOper', EmptyParam];
  EndRng := CycleRng;
  while not ProletsAdoQuery.Eof do begin
    DailyJobsADOQuery.Filter := CombineFilters(BaseFilter, 'PROLET_ID=' + VarToStr(ProletsADOQuery['ID']));
    DailyJobsADOQuery.First;
    DPEditForm.ClientDataSet.DisableControls;
    while not DailyJobsADOQuery.Eof do with DPEditForm do begin
      SPDailyJobsADOQuery.Parameters.ParamValues['pID'] := DailyJobsADOQuery['ID'];
      SPDailyJobsADOQuery.Requery;
      ClientDataSet.Refresh;
      ClientDataSet.First;
      repeat
        Active_ := ClientDataSet['ACTIVE'];
        Completed := ClientDataSet['COMPLETED'];
        if ((Active_ > 0) and (Completed = 0)) or ClientDataSet.Bof then begin
          EndRng := EndRng.Offset[EndRng.Rows.Count, EmptyParam];
          EndRng.Formula := CycleRng.Formula;
          if ClientDataSet.Bof then begin
            EndRng.Rows.Insert(xlShiftDown, EmptyParam);
            EndRng.Replace('${ProlNum}', DailyJobsADOQuery['PROLET_NAME'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OrderNum}', DailyJobsADOQuery['KD_ORDERNUM'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OrderNum2}', DailyJobsADOQuery['KD_ORDERNUM2'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OrdN}', DailyJobsADOQuery['MARKS_ORDN'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${Kol}', DailyJobsADOQuery['QUANTITY'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${Name}', DailyJobsADOQuery['MARKS_NAME'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
          end else begin
            EndRng.Replace('${ProlNum}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OrderNum}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OrderNum2}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OrdN}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${Kol}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${Name}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
          end;
          if (Active_ > 0) and (Completed = 0) then begin
            EndRng.Replace('${OperName}', ClientDataSet['OPER_NAME'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OperPrim}', ClientDataSet['PRIM'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
          end else begin
            EndRng.Replace('${OperName}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
            EndRng.Replace('${OperPrim}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
          end;
        end;
        ClientDataSet.Next;
      until ClientDataSet.Eof;
      DailyJobsADOQuery.Next;
    end;
    ProletsADOQuery.Next;
  end;
  DPEditForm.ClientDataSet.EnableControls;
  CycleRng.Resize[CycleRng.Rows.Count + 1, EmptyParam].Delete(xlShiftUp);
  DPEditForm.App.Visible[LOCALE_USER_DEFAULT] := True;
  DPEditForm.App.Disconnect;
  DPEditForm.Free;
  DPEditForm := nil;
  DailyJobsADOQuery.Filter := BaseFilter;
  DailyJobsADOQuery.Filtered := Filtered;
  DailyJobsADOQuery.EnableControls;
end;

end.
