unit KDWeldingUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MagsoftSharedUnit, GlobVars, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Data.Win.ADODB, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Buttons, Datasnap.DBClient,
  Datasnap.Provider;

type
  TKDWeldingForm = class(TForm)
    f_T_SVARKA_CEQ: TComboBox;
    EquipmentLabel: TLabel;
    T_SVARKA_CEQAppendBtn: TBitBtn;
    T_SVARKA_CEQComboUpdateBtn: TBitBtn;
    WeldingDBGridEh: TDBGridEh;
    SpWeldingADOQuery: TADOQuery;
    SpWeldingDataSource: TDataSource;
    SpWeldingADOQueryNREC: TFloatField;
    SpWeldingADOQueryCMARK: TFloatField;
    SpWeldingADOQueryFOOTAGE: TFloatField;
    SpWeldingADOQueryWEIGHT: TFloatField;
    SpWeldingADOQueryNV: TFloatField;
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    SpWeldingClientDataSet: TClientDataSet;
    SpWeldingDataSetProvider: TDataSetProvider;
    SpWeldingClientDataSetNREC: TFloatField;
    SpWeldingClientDataSetCMARK: TFloatField;
    SpWeldingClientDataSetFOOTAGE: TFloatField;
    SpWeldingClientDataSetWEIGHT: TFloatField;
    SpWeldingClientDataSetNV: TFloatField;
    SpWeldingADOQueryNVZ: TFloatField;
    SpWeldingClientDataSetNVZ: TFloatField;
    SpWeldingADOQueryTLS: TStringField;
    SpWeldingClientDataSetTLS: TStringField;
    procedure WeldingDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpWeldingClientDataSetAfterInsert(DataSet: TDataSet);
    procedure OKBitBtnClick(Sender: TObject);
    procedure T_SVARKA_CEQAppendBtnClick(Sender: TObject);
    procedure T_SVARKA_CEQComboUpdateBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KDWeldingForm: TKDWeldingForm;

implementation

{$R *.dfm}
uses KD2Unit, EquipmentUnit;

procedure TKDWeldingForm.OKBitBtnClick(Sender: TObject);
var
  OForm: TKD2Form;
begin
  SpWeldingClientDataSet.DisableControls;
  SpWeldingADOQuery.First;
  while not SpWeldingADOQuery.Eof do
  begin
    if not SpWeldingClientDataSet.Locate('NREC', SpWeldingADOQuery['NREC'], []) then
      SpWeldingADOQuery.Delete
    else
      SpWeldingADOQuery.Next;
  end;
  SpWeldingClientDataSet.First;
  while not SpWeldingClientDataSet.Eof do
  begin
    if SpWeldingADOQuery.Locate('NREC', SpWeldingClientDataSet['NREC'], []) then
    begin
      SpWeldingADOQuery.Edit;
      SpWeldingADOQuery['FOOTAGE;WEIGHT;NV;NVZ;TLS'] := SpWeldingClientDataSet['FOOTAGE;WEIGHT;NV;NVZ;TLS'];
    end
    else
    begin
      SpWeldingADOQuery.Append;
      SpWeldingADOQuery['CMARK;FOOTAGE;WEIGHT;NV;NVZ;TLS'] := SpWeldingClientDataSet['CMARK;FOOTAGE;WEIGHT;NV;NVZ;TLS'];
    end;
    SpWeldingADOQuery.Post;
    SpWeldingClientDataSet.Next;
  end;
  SpWeldingClientDataSet.EnableControls;
  OForm := Owner as TKD2Form;
  LookupItemToForm(OForm.f_T_SVARKA_CEQ, OForm.T_SVARKA_EQADOQ, LookupItemFromForm2(f_T_SVARKA_CEQ.ItemIndex, OForm.T_SVARKA_EQADOQ, SchemaName+'EQUIPMENT'), 'model', EmptyStr, EmptyStr, False);
  OForm.f_T_SVARKA_M.Text := WeldingDBGridEh.Columns[1].Footer.SumValue;
  OForm.f_T_SVARKA_WE.Text := WeldingDBGridEh.Columns[2].Footer.SumValue;
  OForm.f_T_SVARKA_NV.Text := WeldingDBGridEh.Columns[3].Footer.SumValue;
  OForm.f_T_ZACHIST_NV.Text := WeldingDBGridEh.Columns[4].Footer.SumValue;
end;

procedure TKDWeldingForm.SpWeldingClientDataSetAfterInsert(DataSet: TDataSet);
begin
  DataSet.Edit;
  DataSet['CMARK'] := SpWeldingADOQuery.Parameters.ParamValues['pcMark'];
  DataSet.Post;
end;

procedure TKDWeldingForm.T_SVARKA_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self, (Owner as TKD2Form).T_SVARKA_EQADOQ, '2', f_T_SVARKA_CEQ);
end;

procedure TKDWeldingForm.T_SVARKA_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate((Owner as TKD2Form).T_SVARKA_EQADOQ, f_T_SVARKA_CEQ);
end;

procedure TKDWeldingForm.WeldingDBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_DELETE: if not WeldingDBGridEh.EditorMode then SpWeldingClientDataSet.Delete;
  end;
end;

end.
