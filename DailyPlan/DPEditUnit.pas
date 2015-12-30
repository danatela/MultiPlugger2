unit DPEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ImgList, Vcl.ToolWin,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Buttons,
  Datasnap.DBClient, Datasnap.Provider, DBGridEh, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBLookupEh, DBCtrlsEh,
  Vcl.Mask, Vcl.OleServer, ExcelXP;

type
  TDPEditForm = class(TForm)
    SPDailyJobsADOQuery: TADOQuery;
    OKBitBtn: TBitBtn;
    BottomPanel: TPanel;
    CancelBitBtn: TBitBtn;
    NumDBEditEh: TDBEditEh;
    JDateDBDateTimeEditEh: TDBDateTimeEditEh;
    OrderNumDBLookupComboboxEh: TDBLookupComboboxEh;
    ProletDBLookupComboboxEh: TDBLookupComboboxEh;
    OrderNum2DBLookupComboboxEh: TDBLookupComboboxEh;
    OrdNDBLookupComboboxEh: TDBLookupComboboxEh;
    SpDailyJobsDBGridEh: TDBGridEh;
    SpDailyJobsDataSource: TDataSource;
    OperationsADOQuery: TADOQuery;
    OperationsADOQueryNREC: TFloatField;
    OperationsADOQueryACTIVE: TFMTBCDField;
    OperationsADOQueryFREQ: TFMTBCDField;
    OperationsADOQueryNAME: TStringField;
    SPDailyJobsADOQueryID: TFloatField;
    SPDailyJobsADOQueryDAILYJOBS_ID: TFloatField;
    SPDailyJobsADOQueryOPER_NREC: TFloatField;
    SPDailyJobsADOQueryACTIVE: TFMTBCDField;
    SPDailyJobsADOQueryCOMPLETED: TFMTBCDField;
    SPDailyJobsADOQueryOPER_NAME: TStringField;
    NumLabel: TLabel;
    JDateLabel: TLabel;
    OrderNumLabel: TLabel;
    OrderNum2Label: TLabel;
    OrdNLabel: TLabel;
    ClientDataSet: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    ClientDataSetID: TFloatField;
    ClientDataSetDAILYJOBS_ID: TFloatField;
    ClientDataSetOPER_NREC: TFloatField;
    ClientDataSetACTIVE: TFMTBCDField;
    ClientDataSetCOMPLETED: TFMTBCDField;
    ClientDataSetOPER_NAME: TStringField;
    PrintBitBtn: TBitBtn;
    App: TExcelApplication;
    SPDailyJobsADOQueryPRIM: TStringField;
    ClientDataSetPRIM: TStringField;
    ProletLabel: TLabel;
    KolDBEditEh: TDBEditEh;
    KolLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure SpDailyJobsDBGridEhDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  end;

var
  DPEditForm: TDPEditForm;

implementation

{$R *.dfm}
uses DailyPlanUnit;

procedure TDPEditForm.BeforeOpen(DataSet: TDataSet);
begin
  DailyPlanForm.BeforeOpen(DataSet);
end;

procedure TDPEditForm.FormCreate(Sender: TObject);
begin
  SPDailyJobsADOQuery.Parameters.ParamValues['pID'] := DailyPlanForm.DailyJobsADOQuery['ID'];
  SPDailyJobsADOQuery.Open;
  ClientDataSet.Open;
end;

procedure TDPEditForm.OKBitBtnClick(Sender: TObject);
begin
  if VarIsNull(DailyPlanForm.DailyJobsADOQuery['JDATE']) then begin
    MessageDlg('Не задана дата суточного задания!', mtError, [mbCancel], -1);
    Abort;
  end else begin
    Close;
    ModalResult := mrOk;
  end;
end;

procedure TDPEditForm.PrintBitBtnClick(Sender: TObject);
var
  Workbook: _Workbook;
  BaseCorpus: _Worksheet;
  Rng, CycleRng, EndRng: ExcelRange;
  Active, Completed: Integer;
begin
  App.Connect;
  Workbook := App.Workbooks.Add('\\Server1571\CMKNEW\Reports\DailyPlan\DailyJob.xlt', LOCALE_USER_DEFAULT);
  BaseCorpus := Workbook.Worksheets[1] as _Worksheet;
  Rng := BaseCorpus.UsedRange[LOCALE_USER_DEFAULT];
  Rng.Replace('${Date}', DailyPlanForm.DailyJobsADOQuery['JDATE'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  CycleRng := BaseCorpus.Range['CycleOper', EmptyParam];
  EndRng := CycleRng;
  ClientDataSet.DisableControls;
  ClientDataSet.First;
  repeat
    Active := ClientDataSet['ACTIVE'];
    Completed := ClientDataSet['COMPLETED'];
    if ((Active > 0) and (Completed = 0)) or ClientDataSet.Bof then begin
      EndRng := EndRng.Offset[EndRng.Rows.Count, EmptyParam];
      EndRng.Formula := CycleRng.Formula;
      if ClientDataSet.Bof then begin
        EndRng.Replace('${ProlNum}', DailyPlanForm.DailyJobsADOQuery['PROLET_NAME'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OrderNum}', DailyPlanForm.DailyJobsADOQuery['KD_ORDERNUM'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OrderNum2}', DailyPlanForm.DailyJobsADOQuery['KD_ORDERNUM2'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OrdN}', DailyPlanForm.DailyJobsADOQuery['MARKS_ORDN'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${Kol}', DailyPlanForm.DailyJobsADOQuery['QUANTITY'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${Name}', DailyPlanForm.DailyJobsADOQuery['MARKS_NAME'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
      end else begin
        EndRng.Replace('${ProlNum}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OrderNum}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OrderNum2}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OrdN}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${Kol}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${Name}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
      end;
      if (Active > 0) and (Completed = 0) then begin
        EndRng.Replace('${OperName}', ClientDataSet['OPER_NAME'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OperPrim}', ClientDataSet['PRIM'], xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
      end else begin
        EndRng.Replace('${OperName}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        EndRng.Replace('${OperPrim}', '', xlRows, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
      end;
    end;
    ClientDataSet.Next;
  until ClientDataSet.Eof;
  ClientDataSet.EnableControls;
  CycleRng.Delete(xlShiftUp);
  App.Visible[LOCALE_USER_DEFAULT] := True;
  App.Disconnect;
end;

procedure TDPEditForm.SpDailyJobsDBGridEhDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  vDbGrid: TDBGridEh absolute Sender;
begin
  // only do the next line if this event generated for
  // the first columnn (column with index 0)
  if DataCol=0 then
    vDbGrid.Canvas.TextOut(Rect.Left + 2
                           , Rect.Top + 2
                           , IntToStr(vDbGrid.DataSource.DataSet.RecNo));
end;

end.
