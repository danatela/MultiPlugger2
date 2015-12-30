unit HolesUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, Data.Win.ADODB, GridsEh, DBAxisGridsEh,
  DBGridEh, MagsoftSharedUnit, GlobVars;

type
  THolesForm = class(TForm)
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    f_T_OTVERST_CEQ: TComboBox;
    MachineLabel: TLabel;
    T_OTVERST_CEQAppendBtn: TBitBtn;
    T_OTVERST_CEQComboUpdateBtn: TBitBtn;
    HolesDBGridEh: TDBGridEh;
    HolesDataSource: TDataSource;
    HolesClientDataSet: TClientDataSet;
    HolesDataSetProvider: TDataSetProvider;
    HolesADOQuery: TADOQuery;
    HolesADOQueryNREC: TFloatField;
    HolesADOQueryCDETAIL: TFloatField;
    HolesADOQueryDIAM: TStringField;
    HolesADOQueryCNT: TFMTBCDField;
    HolesADOQueryNV: TFloatField;
    HolesADOQueryPRIM: TStringField;
    HolesClientDataSetNREC: TFloatField;
    HolesClientDataSetCDETAIL: TFloatField;
    HolesClientDataSetDIAM: TStringField;
    HolesClientDataSetCNT: TFMTBCDField;
    HolesClientDataSetNV: TFloatField;
    HolesClientDataSetPRIM: TStringField;
    procedure OKBitBtnClick(Sender: TObject);
    procedure ClientDataSetAfterInsert(DataSet: TDataSet);
    procedure T_OTVERST_CEQAppendBtnClick(Sender: TObject);
    procedure T_OTVERST_CEQComboUpdateBtnClick(Sender: TObject);
    procedure OtverstDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure UpdateHoles;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HolesForm: THolesForm;

implementation

{$R *.dfm}
uses KD3Unit, EquipmentUnit;

procedure THolesForm.ClientDataSetAfterInsert(DataSet: TDataSet);
begin
  DataSet.Edit;
  DataSet['CDETAIL'] := HolesADOQuery.Parameters.ParamValues['pDetail'];
  DataSet.Post;
end;

procedure THolesForm.OKBitBtnClick(Sender: TObject);
var
  OForm: TKD3Form;
begin
  // вместо одной простой строчки HolesClientDataSet.ApplyUpdates(-1) пришлось написать вот это:
  HolesClientDataSet.DisableControls;
  UpdateHoles;
  UpdateHoles;
  UpdateHoles;
  HolesClientDataSet.First;
  while not HolesClientDataSet.Eof do
  begin
    if HolesADOQuery.Locate('NREC', HolesClientDataSet['NREC'], []) then
    begin
      HolesADOQuery.Edit;
      HolesADOQuery['DIAM;CNT;NV;PRIM'] := HolesClientDataSet['DIAM;CNT;NV;PRIM'];
    end
    else
    begin
      HolesADOQuery.Append;
      HolesADOQuery['CDETAIL;DIAM;CNT;NV;PRIM'] := HolesClientDataSet['CDETAIL;DIAM;CNT;NV;PRIM'];
    end;
    HolesADOQuery.Post;
    HolesClientDataSet.Next;
  end;
  HolesClientDataSet.EnableControls;
  OForm := Owner as TKD3Form;
  LookupItemToForm(OForm.f_T_OTVERST_CEQ, OForm.T_OTVERST_EQADOQ, LookupItemFromForm2(f_T_OTVERST_CEQ.ItemIndex,OForm.T_OTVERST_EQADOQ,SchemaName+'EQUIPMENT'),'model',EmptyStr,EmptyStr,False);
end;

procedure THolesForm.OtverstDBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_DELETE: if not HolesDBGridEh.EditorMode then HolesClientDataSet.Delete;
  end;
end;

procedure THolesForm.UpdateHoles;
begin
  HolesADOQuery.First;
  while not HolesADOQuery.Eof do
  begin
    if not HolesClientDataSet.Locate('NREC', HolesADOQuery['NREC'], []) then
      HolesADOQuery.Delete
    else
      HolesADOQuery.Next;
  end;
end;

procedure THolesForm.T_OTVERST_CEQAppendBtnClick(Sender: TObject);
begin
  NewEQUIPMENT(Self, (Owner as TKD3Form).T_OTVERST_EQADOQ, '7', f_T_OTVERST_CEQ);
end;

procedure THolesForm.T_OTVERST_CEQComboUpdateBtnClick(Sender: TObject);
begin
  EQUIPMENTComboUpdate((Owner as TKD3Form).T_OTVERST_EQADOQ, f_T_OTVERST_CEQ);
end;

end.
