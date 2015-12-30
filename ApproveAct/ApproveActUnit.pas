unit ApproveActUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, ADODB,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, Datasnap.DBClient, Datasnap.Provider,
  Vcl.OleServer, WordXP, UPlugin, GlobVars, EhLibADO;

type
  TApproveActForm = class(TForm)
    RightPanel: TPanel;
    PrintBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    EditBitBtn: TBitBtn;
    NewBitBtn: TBitBtn;
    ActsDBGridEh: TDBGridEh;
    ActsADOQuery: TADOQuery;
    ADOConnection: TADOConnection;
    ActsDataSource: TDataSource;
    MasterADOQuery: TADOQuery;
    MasterADOQueryFIO: TStringField;
    ControllerADOQuery: TADOQuery;
    ControllerADOQueryFIO: TStringField;
    ControllerADOQueryID: TFloatField;
    MasterADOQueryID: TFloatField;
    KDADOQuery: TADOQuery;
    ContractorsADOQuery: TADOQuery;
    ContractorsADOQueryNREC: TFloatField;
    ContractorsADOQueryCONTRTYPE: TFloatField;
    ContractorsADOQueryACTIVE: TFloatField;
    ContractorsADOQueryFREQ: TFloatField;
    ContractorsADOQueryNAME: TStringField;
    ContractorsADOQueryABBR: TStringField;
    ContractorsADOQueryCODE: TStringField;
    ContractorsADOQueryGALNREC: TStringField;
    ContractorsADOQueryPPONREC: TFloatField;
    ActsADOQueryID: TFloatField;
    ActsADOQueryACTNO: TFloatField;
    ActsADOQueryMASTER_ID: TFloatField;
    ActsADOQueryCONTROLLER_ID: TFloatField;
    ActsADOQueryKD_NREC: TFloatField;
    ActsADOQueryCUSTOMER_NREC: TFloatField;
    ActsADOQueryPIPES: TStringField;
    ActsADOQueryPRESSURE: TFloatField;
    ActsADOQueryRECEIVER_NREC: TFloatField;
    ActsADOQuerySIGNED: TFloatField;
    ActsADOQueryACTDATE: TDateTimeField;
    ActsADOQuerySIGNDATE: TDateTimeField;
    ActsADOQueryMASTERFIO: TStringField;
    ActsADOQueryCONTROLLERFIO: TStringField;
    ActsADOQueryCUSTOMER_S: TStringField;
    ActsADOQueryRECEIVER_S: TStringField;
    ActsADOQueryKD_ORDERNUM: TStringField;
    KDADOQueryNREC: TFloatField;
    KDADOQueryORDNUM: TStringField;
    MarksADOQuery: TADOQuery;
    App: TWordApplication;
    ActsADOQueryBRUSHED: TFloatField;
    MarksADOQueryNREC: TFloatField;
    MarksADOQueryWEIGHT1: TFloatField;
    MarksADOQueryORDN: TStringField;
    MarksADOQueryDRAWING: TStringField;
    MarksADOQueryNAME: TStringField;
    MarksADOQueryQUEUE: TStringField;
    KDADOQueryCCONTRACTOR: TFloatField;
    MarksADOQueryCRECIPIENT: TFloatField;
    SpADOQuery: TADOQuery;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField2: TStringField;
    StringField8: TStringField;
    FloatField14: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    SpADOQueryID: TFloatField;
    DataSetProvider: TDataSetProvider;
    ClientDataSet: TClientDataSet;
    SpDataSource: TDataSource;
    ClientDataSetWEIGHT1: TFloatField;
    ClientDataSetQUANTITY: TFloatField;
    ClientDataSetWEIGHT: TFloatField;
    ClientDataSetPRICE: TFloatField;
    ClientDataSetSUM: TFloatField;
    ClientDataSetNUM: TStringField;
    ClientDataSetDRAWING: TStringField;
    ClientDataSetMARKS_NREC: TFloatField;
    ClientDataSetTITLE: TStringField;
    ClientDataSetQUEUE: TStringField;
    ClientDataSetFIXPRICE: TFloatField;
    ClientDataSetACTS_ID: TFloatField;
    ClientDataSetID: TFloatField;
    KDADOQueryORDERNUM: TStringField;
    KDADOQueryORDERNUM2: TStringField;
    ActsADOQueryKD_ORDERNUM2: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditBitBtnClick(Sender: TObject);
    procedure NewBitBtnClick(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure ActsADOQueryAfterScroll(DataSet: TDataSet);
    procedure ActsADOQueryKD_NRECChange(Sender: TField);
    procedure ActsADOQuerySIGNEDChange(Sender: TField);
    procedure ActsADOQueryQUANTITYChange(Sender: TField);
    procedure ActsADOQueryPRICEChange(Sender: TField);
    procedure PrintBitBtnClick(Sender: TObject);
    procedure ActsADOQueryMARKS_NRECChange(Sender: TField);
    procedure BeforeOpen(DataSet: TDataSet);
    procedure ADOConnectionWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
    procedure ActsDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TMyFind = record
  private
    FFind: Find;
  public
    property InnerFind: Find read FFind;
    procedure FindReplace;
    procedure AssignField(Query: TADOQuery; Field: string; MatchField: string = ''; Emptify: Boolean = False);
    class operator Implicit(AFind: Find): TMyFind;
  end;

var
  ApproveActForm: TApproveActForm;
  PicturesDir: string;

implementation

{$R *.dfm}
uses
  EditActUnit, StrUtils, DateUtils;

procedure TApproveActForm.ActsADOQueryAfterScroll(DataSet: TDataSet);
begin
  EditBitBtn.Enabled := not VarIsNull(DataSet['ID']);
  DelBitBtn.Enabled := not VarIsNull(DataSet['ID']);
  MarksADOQuery.Parameters.ParamValues['PCKD'] := DataSet['KD_NREC'];
  if not VarIsNull(DataSet['KD_NREC']) then
    MarksADOQuery.Requery;
  SpADOQuery.Parameters.ParamValues['PID'] := DataSet['ID'];
  SpADOQuery.Requery;
end;

procedure TApproveActForm.ActsADOQueryKD_NRECChange(Sender: TField);
begin
  MarksADOQuery.Parameters.ParamValues['PCKD'] := ActsADOQuery['KD_NREC'];
  if not VarIsNull(ActsADOQuery['KD_NREC']) then
    MarksADOQuery.Requery;
  if KDADOQuery.Locate('NREC', ActsADOQuery['KD_NREC'], []) then
    ActsADOQuery['CUSTOMER_NREC'] := KDADOQuery['CCONTRACTOR'];
end;

procedure TApproveActForm.ActsADOQueryMARKS_NRECChange(Sender: TField);
begin
  ActsADOQueryQUANTITYChange(Sender);
  if MarksADOQuery.Locate('NREC', Sender.DataSet['MARKS_NREC'], []) then
    ActsADOQuery['RECEIVER_NREC'] := MarksADOQuery['CRECIPIENT'];
end;

procedure TApproveActForm.ActsADOQueryPRICEChange(Sender: TField);
begin
  if Sender.DataSet['FIXPRICE'] > 0 then
    Sender.DataSet['SUM'] := Sender.DataSet['FIXPRICE'] * Sender.DataSet['QUANTITY']
  else if Sender.DataSet['PRICE'] > 0 then
    Sender.DataSet['SUM'] := Sender.DataSet['PRICE'] * Sender.DataSet['WEIGHT'] / 1000;
end;

procedure TApproveActForm.ActsADOQueryQUANTITYChange(Sender: TField);
begin
  Sender.DataSet['WEIGHT'] := Sender.DataSet['WEIGHT1'] * Sender.DataSet['QUANTITY'];
  ActsADOQueryPRICEChange(Sender);
end;

procedure TApproveActForm.ActsADOQuerySIGNEDChange(Sender: TField);
begin
  if Sender.DataSet['SIGNED'] = 1 then
    Sender.DataSet['SIGNDATE'] := Now
  else
    Sender.DataSet['SIGNDATE'] := Null;
end;

procedure TApproveActForm.ActsDBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_RETURN: EditBitBtnClick(Sender);
  end;
end;

procedure TApproveActForm.ADOConnectionWillConnect(Connection: TADOConnection;
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

procedure TMyFind.FindReplace;
begin
  FFind.Execute(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, wdReplaceOne, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
end;

class operator TMyFind.Implicit(AFind: Find): TMyFind;
begin
  Result.FFind := AFind;
end;

procedure TMyFind.AssignField(Query: TADOQuery; Field: string; MatchField: string = ''; Emptify: Boolean = False);
begin
  if MatchField = '' then
    MatchField := MidStr(Field, 3, Length(Field) - 3);
  with FFind do
  begin
    Text := Field;
    try Replacement.Text := VarToStr(Query[MatchField]); except end;
    if Emptify and (Query.FieldByName(MatchField).AsFloat = 0.0) then
      Replacement.Text := '';
    FindReplace;
  end;
end;

procedure TApproveActForm.BeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

procedure TApproveActForm.DelBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Действительно удалить акт №' + VarToStr(ActsADOQuery['ACTNO']) + '?', mtConfirmation, mbYesNo, -1) = mrYes then
    ActsADOQuery.Delete;
end;

procedure TApproveActForm.EditBitBtnClick(Sender: TObject);
begin
  ActsADOQuery.Edit;
  ClientDataSet.Open;
  EditActForm := TEditActForm.Create(nil);
  if EditActForm.ShowModal = mrOK then begin
    ActsADOQuery.Post;
    ActsADOQuery.Refresh;
    SpADOQuery.First;
    while not SpADOQuery.Eof do
      if not ClientDataSet.Locate('ID', SpADOQuery['ID'], []) then
        SpADOQuery.Delete
      else
        SpADOQuery.Next;
    SpADOQuery.FieldList.Delimiter := ';';
    ClientDataSet.First;
    while not ClientDataSet.Eof do begin
      if SpADOQuery.Locate('ID', ClientDataSet['ID'], []) then begin
        SpADOQuery.Edit;
        SpADOQuery['MARKS_NREC;QUANTITY;PRICE;FIXPRICE;SUM;WEIGHT'] := ClientDataSet['MARKS_NREC;QUANTITY;PRICE;FIXPRICE;SUM;WEIGHT'];
        SpADOQuery.Post;
      end
      else begin
        SpADOQuery.Append;
        SpADOQuery['MARKS_NREC;QUANTITY;PRICE;FIXPRICE;SUM;WEIGHT'] := ClientDataSet['MARKS_NREC;QUANTITY;PRICE;FIXPRICE;SUM;WEIGHT'];
        SpADOQuery['ACTS_ID'] := ActsADOQuery['ID'];
        SpADOQuery.Post;
        SpADOQuery.Refresh;
      end;
      ClientDataSet.Next;
    end;
  end
  else
    ActsADOQuery.Cancel;
  EditActForm.Free;
  ClientDataSet.Close;
end;

procedure TApproveActForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ApproveActForm := nil;
end;

procedure TApproveActForm.FormCreate(Sender: TObject);
begin
  SpADOQuery.Open;
  ActsADOQuery.Open;
  ActsADOQueryAfterScroll(ActsADOQuery);
end;

procedure TApproveActForm.NewBitBtnClick(Sender: TObject);
begin
  ActsADOQuery.Insert;
  ActsADOQuery['ACTDATE;SIGNED;BRUSHED'] := VarArrayOf([Now, 0, 0]);
  ClientDataSet.Open;
  EditActForm := TEditActForm.Create(nil);
  if EditActForm.ShowModal = mrOK then begin
    ActsADOQuery.Post;
    ActsADOQuery.Refresh;
    SpADOQuery.FieldList.Delimiter := ';';
    ClientDataSet.First;
    while not ClientDataSet.Eof do begin
      SpADOQuery.Append;
      SpADOQuery['MARKS_NREC;QUANTITY;PRICE;FIXPRICE;SUM;WEIGHT'] := ClientDataSet['MARKS_NREC;QUANTITY;PRICE;FIXPRICE;SUM;WEIGHT'];
      SpADOQuery['ACTS_ID'] := ActsADOQuery['ID'];
      SpADOQuery.Post;
      SpADOQuery.Refresh;
      ClientDataSet.Next;
    end;
  end
  else
    ActsADOQuery.Cancel;
  EditActForm.Free;
  ClientDataSet.Close;
end;

procedure TApproveActForm.PrintBitBtnClick(Sender: TObject);
var
  Doc: _Document;
  CycleRange, EndRange, ItogRange: WordRange;
  ItogKol, ItogWall, ItogSum: Double;
  DD, Month, Year: string;
begin
  App.Connect;
  Doc := App.Documents.Add(ExtractFilePath(Application.ExeName) + 'Reports\ACTS\Act.dotx', EmptyParam, EmptyParam, True);
  with TMyFind(Doc.Content.Find) do begin
    InnerFind.Text := '${Brushed}';
    if ActsADOQuery['BRUSHED'] > 0 then
      InnerFind.Replacement.Text := 'Покраска'
    else
      InnerFind.Replacement.Text := '';
    FindReplace;
  end;
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${Koef}');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${Rustless}');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${ActNo}');
  if not VarIsNull(ActsADOQuery['ACTDATE']) then begin
    DD := IntToStr(DayOf(ActsADOQuery['ACTDATE']));
    Month := FormatDateTime('mmmm', ActsADOQuery['ACTDATE']);
    Year := IntToStr(YearOf(ActsADOQuery['ACTDATE']));
  end;
  with TMyFind(Doc.Content.Find) do begin
    InnerFind.Text := '${ActDD}';
    InnerFind.Replacement.Text := DD;
    FindReplace;
    InnerFind.Text := '${ActMonth}';
    InnerFind.Replacement.Text := Month;
    FindReplace;
    InnerFind.Text := '${ActYear}';
    InnerFind.Replacement.Text := Year;
    FindReplace;
  end;
  // Gj ekbwfv ckjyf djlbkb?
  // Rfr dblyj? yfgjrfp
  // bpdtcnyj? xnj ckjys d lbrjdbyre e yfc
  // Nfr pf ckjyjv njkgs ptdfr [jlbkb
  // Jnrelf yb djpmvbcm? yfdcnhtxe Vjcmrf bv
  // Edbltdib ckjyf? ye yf ytuj vtnfnmcz
  // B kfznm? b dbp;fnm b hdfnmcz
  // Ye? nfr b ktptn d lhfre c ybv
  // - Cjctlrf? gthtcnfym chfvbnmcz -
  // Tq ifdrf ujdjhbn - Nt,t km c ckjyjv djpbnmcz
  // Cvjnhb^ ns e; [hbgbim? f jy bl`n ct,t dgth`l
  // B kf. ndjtuj cjdctv yt ghbvtxftn
  // "[? '[ - tq Vjcmrf jndtxftn
  // - Djn nj-nj vyt b le[e ghblf`n?
  // Xnj z? cjdctv ,tp lhfrb?
  // Vjue gjgfcnm d ,jkmibt pf,bzrb
  // Gecrfq ;t ujdjhzn cj,frb^
  // Fq? Vjcmrf! Pyfnm? jyf cbkmyf?
  // Xnj kftn yf ckjyf!
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${MasterFIO}');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${ControllerFIO}');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${Customer}', 'CUSTOMER_S');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${ORDNUM}', 'KD_ORDERNUM');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${Pipes}');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${Pressure}');
  TMyFind(Doc.Content.Find).AssignField(ActsADOQuery, '${Receiver}', 'RECEIVER_S');
  CycleRange := Doc.Bookmarks.Item('Cycle').Range;
  ItogRange := Doc.Bookmarks.Item('Itog').Range;
  EndRange := CycleRange.FormattedText;
  SpADOQuery.First;
  ItogKol := 0.0; ItogWall := 0.0; ItogSum := 0.0;
  while not SpADOQuery.Eof do begin
    EndRange.Collapse(wdCollapseEnd);
    EndRange.FormattedText := CycleRange;
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Drawing}');
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Title}');
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Num}');
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Kol}', 'QUANTITY');
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${W1}', 'WEIGHT1');
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Wall}', 'WEIGHT');
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Price}', 'PRICE', True);
    TMyFind(EndRange.FormattedText.Find).AssignField(SpADOQuery, '${Sum}', 'SUM', True);
    ItogKol := ItogKol + SpADOQuery.FieldByName('QUANTITY').AsFloat;
    ItogWall := ItogWall + SpADOQuery.FieldByName('WEIGHT').AsFloat;
    ItogSum := ItogSum + SpADOQuery.FieldByName('SUM').AsFloat;
    SpADOQuery.Next;
  end;
  CycleRange.Rows.Delete;
  EndRange := ItogRange;
  with TMyFind(EndRange.FormattedText.Find) do begin
    InnerFind.Text := '${ItogKol}';
    InnerFind.Replacement.Text := FloatToStr(ItogKol);
    FindReplace;
  end;
  with TMyFind(EndRange.FormattedText.Find) do begin
    InnerFind.Text := '${ItogWall}';
    InnerFind.Replacement.Text := FloatToStr(ItogWall);
    FindReplace;
  end;
  with TMyFind(EndRange.FormattedText.Find) do begin
    InnerFind.Text := '${ItogSum}';
    InnerFind.Replacement.Text := FloatToStr(ItogSum);
    FindReplace;
  end;
  App.Visible := True;
  App.Disconnect;
end;

end.
