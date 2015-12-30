unit EditJobUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, DBGridEhGrouping, GridsEh,
  DBGridEh, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Tabs, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, Data.DB, Data.Win.ADODB, EhLibADO, UPlugin, GlobVars;

type
  TEditJobForm = class(TForm)
    JointDBGridEh: TDBGridEh;
    RightPanel: TPanel;
    PrintBitBtn: TBitBtn;
    SwitchTabSet: TTabSet;
    FormJobBitBtn: TBitBtn;
    TopPanel: TPanel;
    ClientPanel: TPanel;
    AllDataSource: TDataSource;
    ADOConnection: TADOConnection;
    AllADOQuery: TADOQuery;
    NumJobLabeledEdit: TLabeledEdit;
    DateLabeledEdit: TLabeledEdit;
    AllADOQueryID: TFloatField;
    AllADOQueryORDERNUM: TStringField;
    AllADOQueryORDERNUM2: TStringField;
    AllADOQueryORDN: TStringField;
    AllADOQueryENTRYDATE: TDateTimeField;
    AllADOQueryNOTE: TStringField;
    AllADOQueryTAKEJOB: TFMTBCDField;
    AllADOQueryPROFILE: TStringField;
    AllADOQueryKOL: TFloatField;
    AllADOQueryWEIGHT1: TFloatField;
    AllADOQueryWEIGHT: TFloatField;
    AllADOQueryT_REZKA_CEQ: TFloatField;
    AllADOQueryT_REZKA_M: TFloatField;
    AllADOQueryT_REZKA_NV: TFloatField;
    AllADOQueryT_REZKA_PR: TStringField;
    AllADOQueryT_OTVERST_CEQ: TFloatField;
    AllADOQueryT_OTVERST_DIAM: TStringField;
    AllADOQueryT_OTVERST_COUNT: TFMTBCDField;
    AllADOQueryT_OTVERST_NV: TFloatField;
    AllADOQueryT_OTVERST_PR: TStringField;
    AllADOQueryT_STROZH_CEQ: TFloatField;
    AllADOQueryT_STROZH_M: TFloatField;
    AllADOQueryT_STROZH_NV: TFloatField;
    AllADOQueryT_STROZH_PR: TStringField;
    AllADOQueryT_GIBKA_CEQ: TFloatField;
    AllADOQueryT_GIBKA_NV: TFloatField;
    AllADOQueryT_GIBKA_PR: TStringField;
    AllADOQueryT_REZKA_EQ_S: TStringField;
    AllADOQueryT_OTVERST_EQ_S: TStringField;
    AllADOQueryT_STROZH_EQ_S: TStringField;
    AllADOQueryT_GIBKA_EQ_S: TStringField;
    MPDOPanel: TGridPanel;
    MPPanel: TPanel;
    MPLabel: TLabel;
    MPDBGridEh: TDBGridEh;
    DOPanel: TPanel;
    DOLabel: TLabel;
    DODBGridEh: TDBGridEh;
    GibkaADOQuery: TADOQuery;
    StrozhADOQuery: TADOQuery;
    OtverstADOQuery: TADOQuery;
    RezkaADOQuery: TADOQuery;
    RezkaADOQueryNREC: TFloatField;
    RezkaADOQueryACTIVE: TFMTBCDField;
    RezkaADOQueryFREQ: TFMTBCDField;
    RezkaADOQueryNAME: TStringField;
    RezkaADOQueryINVNUM: TFMTBCDField;
    RezkaADOQueryCEHNUM: TStringField;
    RezkaADOQueryPYEAR: TFMTBCDField;
    RezkaADOQueryMODEL: TStringField;
    RezkaADOQueryCSITE: TFloatField;
    RezkaADOQueryOPERATIONS: TStringField;
    OtverstADOQueryNREC: TFloatField;
    OtverstADOQueryACTIVE: TFMTBCDField;
    OtverstADOQueryFREQ: TFMTBCDField;
    OtverstADOQueryNAME: TStringField;
    OtverstADOQueryINVNUM: TFMTBCDField;
    OtverstADOQueryCEHNUM: TStringField;
    OtverstADOQueryPYEAR: TFMTBCDField;
    OtverstADOQueryMODEL: TStringField;
    OtverstADOQueryCSITE: TFloatField;
    OtverstADOQueryOPERATIONS: TStringField;
    StrozhADOQueryNREC: TFloatField;
    StrozhADOQueryACTIVE: TFMTBCDField;
    StrozhADOQueryFREQ: TFMTBCDField;
    StrozhADOQueryNAME: TStringField;
    StrozhADOQueryINVNUM: TFMTBCDField;
    StrozhADOQueryCEHNUM: TStringField;
    StrozhADOQueryPYEAR: TFMTBCDField;
    StrozhADOQueryMODEL: TStringField;
    StrozhADOQueryCSITE: TFloatField;
    StrozhADOQueryOPERATIONS: TStringField;
    GibkaADOQueryNREC: TFloatField;
    GibkaADOQueryACTIVE: TFMTBCDField;
    GibkaADOQueryFREQ: TFMTBCDField;
    GibkaADOQueryNAME: TStringField;
    GibkaADOQueryINVNUM: TFMTBCDField;
    GibkaADOQueryCEHNUM: TStringField;
    GibkaADOQueryPYEAR: TFMTBCDField;
    GibkaADOQueryMODEL: TStringField;
    GibkaADOQueryCSITE: TFloatField;
    GibkaADOQueryOPERATIONS: TStringField;
    DODataSource: TDataSource;
    MPDataSource: TDataSource;
    DOADOQuery: TADOQuery;
    MPADOQuery: TADOQuery;
    MPADOQueryNREC: TFloatField;
    MPADOQueryKOLT: TFloatField;
    MPADOQueryPROP_PWIDTH1: TFloatField;
    MPADOQueryPROP_PWIDTH2: TFloatField;
    MPADOQueryPROP_SIZE1: TFloatField;
    MPADOQueryPROP_SIZE2: TFloatField;
    MPADOQueryPROP_WTHICK: TFloatField;
    MPADOQueryPROP_SLENGTH: TFloatField;
    MPADOQueryPROP_DIAM: TFloatField;
    MPADOQueryPROP_SIZE: TFloatField;
    MPADOQueryPROP_THICK_C: TFloatField;
    MPADOQueryPROP_WIDTH_C: TFloatField;
    MPADOQueryPROP_LENGTH_C: TFloatField;
    MPADOQueryCPASSPORTS: TFloatField;
    MPADOQueryNAME: TStringField;
    MPADOQueryMARKIR: TStringField;
    MPADOQueryCSPPASSPORTS: TFloatField;
    MPADOQueryDATEF: TDateTimeField;
    MPADOQueryNREC_1: TFloatField;
    MPADOQueryCSPARRIVALS: TFloatField;
    MPADOQueryNUM: TStringField;
    MPADOQuerySPENT: TFMTBCDField;
    DOADOQueryNREC: TFloatField;
    DOADOQueryKOLT: TFloatField;
    DOADOQueryPROP_PWIDTH1: TFloatField;
    DOADOQueryPROP_PWIDTH2: TFloatField;
    DOADOQueryPROP_SIZE1: TFloatField;
    DOADOQueryPROP_SIZE2: TFloatField;
    DOADOQueryPROP_WTHICK: TFloatField;
    DOADOQueryPROP_SLENGTH: TFloatField;
    DOADOQueryPROP_DIAM: TFloatField;
    DOADOQueryPROP_SIZE: TFloatField;
    DOADOQueryPROP_THICK_C: TFloatField;
    DOADOQueryPROP_WIDTH_C: TFloatField;
    DOADOQueryPROP_LENGTH_C: TFloatField;
    DOADOQueryCPASSPORTS: TFloatField;
    DOADOQueryNAME: TStringField;
    DOADOQueryMARKIR: TStringField;
    DOADOQueryCSPPASSPORTS: TFloatField;
    DOADOQueryDATEF: TDateTimeField;
    DOADOQueryNREC_1: TFloatField;
    DOADOQueryCSPARRIVALS: TFloatField;
    DOADOQueryNUM: TStringField;
    DOADOQuerySPENT: TFMTBCDField;
    DMarksTotalQuery: TADOQuery;
    DMarksTotalQueryNUMP: TStringField;
    StringField4: TStringField;
    RezkaDBGridEh: TDBGridEh;
    OtverstDBGridEh: TDBGridEh;
    StrozhDBGridEh: TDBGridEh;
    GibkaDBGridEh: TDBGridEh;
    MPADOQueryTHICKNESS: TFMTBCDField;
    MPADOQueryLENGTHNESS: TFMTBCDField;
    DOADOQueryTHICKNESS: TFMTBCDField;
    DOADOQueryLENGTHNESS: TFMTBCDField;
    procedure SwitchTabSetChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormJobBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GibkaDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JointDBGridEhEnter(Sender: TObject);
    procedure RezkaDBGridEhEnter(Sender: TObject);
    procedure GibkaDBGridEhEnter(Sender: TObject);
    procedure OtverstDBGridEhEnter(Sender: TObject);
    procedure StrozhDBGridEhEnter(Sender: TObject);
    procedure DOADOQueryBeforeOpen(DataSet: TDataSet);
    procedure ADOConnectionWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditJobForm: TEditJobForm;

implementation

{$R *.dfm}

uses FormJobUnit;

procedure TEditJobForm.ADOConnectionWillConnect(Connection: TADOConnection;
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

procedure TEditJobForm.DOADOQueryBeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

procedure TEditJobForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  EditJobForm := nil;
end;

procedure TEditJobForm.FormCreate(Sender: TObject);
begin
  AllADOQuery.Open;
  RezkaADOQuery.Open;
  OtverstADOQuery.Open;
  StrozhADOQuery.Open;
  GibkaADOQuery.Open;
  MPADOQuery.Open;
  DOADOQuery.Open;
  SwitchTabSet.TabIndex := 0;
end;

procedure TEditJobForm.FormJobBitBtnClick(Sender: TObject);
begin
  if not Assigned(FormJobForm) then
    FormJobForm := TFormJobForm.Create(Self);
  FormJobForm.ShowModal;
end;

procedure TEditJobForm.GibkaDBGridEhEnter(Sender: TObject);
begin
  AllADOQuery.Filter := '(T_GIBKA_CEQ <> 0) or or (T_GIBKA_NV <> 0) or (T_GIBKA_PR <> '' '')';
  AllADOQuery.Filtered := True;
end;

procedure TEditJobForm.GibkaDBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_DELETE: if not (Sender as TDBGridEh).EditorMode then AllADOQuery.Delete;
  end;
end;

procedure TEditJobForm.JointDBGridEhEnter(Sender: TObject);
begin
  AllADOQuery.Filter := '';
  AllADOQuery.Filtered := False;
end;

procedure TEditJobForm.OtverstDBGridEhEnter(Sender: TObject);
begin
  AllADOQuery.Filter := '(T_OTVERST_CEQ <> 0) or (T_OTVERST_COUNT <> 0) or (T_OTVERST_NV <> 0) or (T_OTVERST_PR <> '' '') or (T_OTVERST_DIAM <> '' '')';
  AllADOQuery.Filtered := True;
end;

procedure TEditJobForm.RezkaDBGridEhEnter(Sender: TObject);
begin
  AllADOQuery.Filter := '(T_REZKA_CEQ <> 0) or (T_REZKA_M <> 0) or (T_REZKA_NV <> 0) or (T_REZKA_PR <> '' '')';
  AllADOQuery.Filtered := True;
end;

procedure TEditJobForm.StrozhDBGridEhEnter(Sender: TObject);
begin
  AllADOQuery.Filter := '(T_STROZH_CEQ <> 0) or (T_STROZH_M <> 0) or (T_STROZH_NV <> 0) or (T_STROZH_PR <> '' '')';
  AllADOQuery.Filtered := True;
end;

procedure TEditJobForm.SwitchTabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  case NewTab of
  0: JointDBGridEh.BringToFront;
  1: RezkaDBGridEh.BringToFront;
  2: OtverstDBGridEh.BringToFront;
  3: StrozhDBGridEh.BringToFront;
  4: GibkaDBGridEh.BringToFront;
  5: MPDOPanel.BringToFront;
  else
    raise Exception.Create('Неверный параметр NewTab!');
  end;
end;

end.
