unit KDGridUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Data.Win.ADODB, Generics.Collections, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  StrUtils, Vcl.Menus, DBGridEhGrouping, Vcl.Buttons, GridsEh, DBGridEh,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, GlobVars, EhLibADO,
  KDUnit, KD2Unit, KD3Unit, CmkUserUnit, Vcl.ImgList, InclFileUnit,
  MagsoftSharedUnit, KD25Unit, MagsoftMsgDlgUnit, KDFilterUnit, MemTableEh,
  FastReportUnit, MagsoftUniSelector2Unit, frxClass, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, WinAPI.ADOInt, Datasnap.Provider,
  Datasnap.DBClient;

type
  TKDGridForm = class(TForm)
    KDGrid1: TDBGridEh;
    PanelKDL1: TPanel;
    PanelKDL2: TPanel;
    PanelKDL3: TPanel;
    Splitter1: TSplitter;
    KDEditBtn: TBitBtn;
    ActionManager1: TActionManager;
    KDEditMarksAction: TAction;
    KD1Source: TDataSource;
    KD1ADOQ: TADOQuery;
    KDAppendAction: TAction;
    KDDelAction: TAction;
    KDEditAction: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    F101: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    KD2ADOQ: TADOQuery;
    KD2Source: TDataSource;
    KD3ADOQ: TADOQuery;
    KD3Source: TDataSource;
    KDGrid2: TDBGridEh;
    KDGrid3: TDBGridEh;
    InfoPanel2: TPanel;
    InfoPanel1: TPanel;
    InfoPanel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn4: TBitBtn;
    KD2EditDetailsAction: TAction;
    f_ORDERNUM: TLabeledEdit;
    f_INPUTDATE: TLabeledEdit;
    f_CONTRACTOR_S: TLabeledEdit;
    f_ACTDATE: TLabeledEdit;
    KD2AppendAction: TAction;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    KD2EditAction: TAction;
    f_ORDERNUM_: TLabeledEdit;
    f_ORDERNUM2: TLabeledEdit;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PopupMenu3: TPopupMenu;
    BitBtn7: TBitBtn;
    KD3AppendAction: TAction;
    ImageList1: TImageList;
    KD3EditAction: TAction;
    BitBtn8: TBitBtn;
    KD2ESCAction: TAction;
    BitBtn9: TBitBtn;
    KD3ESCAction: TAction;
    BitBtn10: TBitBtn;
    KD2EditSPAction: TAction;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    KD2DelAction: TAction;
    KD1SetFilterAction: TAction;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    KDReportAction: TAction;
    F21: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    CtrlP1: TMenuItem;
    KD3CopyAction: TAction;
    BitBtn15: TBitBtn;
    F91: TMenuItem;
    F41: TMenuItem;
    f_ORDERNUM2_: TLabeledEdit;
    KD3LCopyAction: TAction;
    BitBtn16: TBitBtn;
    f_NUMP: TLabeledEdit;
    KD3L1CopyAction: TAction;
    BitBtn17: TBitBtn;
    F71: TMenuItem;
    F61: TMenuItem;
    F31: TMenuItem;
    N6: TMenuItem;
    KD3DelAction: TAction;
    Delete1: TMenuItem;
    KD3ADOQPROP_STEELMARK: TFloatField;
    KD3ADOQPROP_NORMDOC0: TFloatField;
    KD3ADOQPROP_NORMDOC1: TFloatField;
    KD3ADOQPROP_LINEDENS: TFloatField;
    KD3ADOQPROP_PWIDTH1: TFloatField;
    KD3ADOQPROP_PWIDTH2: TFloatField;
    KD3ADOQPROP_WTHICK: TFloatField;
    KD3ADOQPROP_PROFTYPE: TFloatField;
    KD3ADOQPROP_DIAM: TFloatField;
    KD3ADOQPROP_SIZE: TFloatField;
    KD3ADOQPROP_UW: TFloatField;
    KD3ADOQPROP_PROFILE: TFloatField;
    KD3ADOQPROP_THICK: TFloatField;
    KD3ADOQPROP_WIDTH: TFloatField;
    KD3ADOQPROP_LENGTH: TFloatField;
    KD3ADOQPROP_SIZE1: TFloatField;
    KD3ADOQPROP_SIZE2: TFloatField;
    KD3ADOQPROP_SLENGTH: TFloatField;
    KD3ADOQCMARK: TFloatField;
    KD3ADOQCARRIVAL: TFloatField;
    KD3ADOQWEIGHT1: TFloatField;
    KD3ADOQT_REZKA_CEQ: TFloatField;
    KD3ADOQT_REZKA_M: TFloatField;
    KD3ADOQT_REZKA_NV: TFloatField;
    KD3ADOQT_REZKA_PR: TStringField;
    KD3ADOQT_ZACHIST_CTYPE: TFloatField;
    KD3ADOQT_ZACHIST_NV: TFloatField;
    KD3ADOQT_OTVERST_CEQ: TFloatField;
    KD3ADOQT_OTVERST_DIAM: TStringField;
    KD3ADOQT_OTVERST_COUNT: TFloatField;
    KD3ADOQT_OTVERST_NV: TFloatField;
    KD3ADOQT_OTVERST_PR: TStringField;
    KD3ADOQT_STROZH_CEQ: TFloatField;
    KD3ADOQT_STROZH_M: TFloatField;
    KD3ADOQT_STROZH_NV: TFloatField;
    KD3ADOQT_STROZH_PR: TStringField;
    KD3ADOQT_GIBKA_CEQ: TFloatField;
    KD3ADOQT_GIBKA_NV: TFloatField;
    KD3ADOQT_GIBKA_PR: TStringField;
    KD3ADOQINPUTDATE: TDateTimeField;
    KD3ADOQPRIM: TStringField;
    KD3ADOQPROP_STEELMARK_C: TStringField;
    KD3ADOQPROP_NORMDOC0_C: TStringField;
    KD3ADOQPROP_NORMDOC1_C: TStringField;
    KD3ADOQPROP_PROFTYPE_C: TStringField;
    KD3ADOQPROP_PROFILE_C: TStringField;
    KD3ADOQPROP_THICK_C: TFloatField;
    KD3ADOQPROP_WIDTH_C: TFloatField;
    KD3ADOQPROP_LENGTH_C: TFloatField;
    KD3ADOQT_REZKA_EQ_S: TStringField;
    KD3ADOQT_ZACHIST_TYPE_S: TStringField;
    KD3ADOQT_OTVERST_EQ_S: TStringField;
    KD3ADOQT_STROZH_EQ_S: TStringField;
    KD3ADOQT_GIBKA_EQ_S: TStringField;
    KD3ADOQPROP_PROFNUM: TStringField;
    KD3ADOQCKD: TFloatField;
    KD3ADOQCGRMATERIALS: TFloatField;
    KD3ADOQGRMATERIALS_S: TStringField;
    KD3ADOQNUMP: TStringField;
    KD3ADOQT_RAZMET_EQ_S: TStringField;
    KD3ADOQT_RAZMET_NV: TFloatField;
    KD3ADOQT_RAZMET_PR: TStringField;
    KD3ADOQPROP_FIXTYPE: TFloatField;
    KD3ADOQPROP_CARVTYPE: TFloatField;
    KD3ADOQPROP_STEP: TFloatField;
    KD3ADOQPROP_FIXTYPE_C: TStringField;
    KD3ADOQPROP_CARVTYPE_C: TStringField;
    KD3ADOQCONTROL: TStringField;
    EquipmentADOQ: TADOQuery;
    EquipmentADOQNREC: TFloatField;
    EquipmentADOQACTIVE: TFloatField;
    EquipmentADOQFREQ: TFloatField;
    EquipmentADOQNAME: TStringField;
    EquipmentADOQINVNUM: TFloatField;
    EquipmentADOQCEHNUM: TStringField;
    EquipmentADOQPYEAR: TFloatField;
    EquipmentADOQMODEL: TStringField;
    EquipmentADOQCSITE: TFloatField;
    EquipmentADOQOPERATIONS: TStringField;
    OperationsADOQ: TADOQuery;
    OperationsADOQNREC: TFloatField;
    OperationsADOQACTIVE: TFloatField;
    OperationsADOQFREQ: TFloatField;
    OperationsADOQNAME: TStringField;
    KD3ADOQNREC: TFloatField;
    KD3ADOQT_RAZMET_CEQ: TFloatField;
    KD3ADOQT_SHABLON_EQ: TFloatField;
    KD3ADOQT_SHABLON_EQ_MODEL: TStringField;
    KD3ADOQT_SHABLON_NV: TFloatField;
    KD3ADOQT_SHABLON_PRIM: TStringField;
    KD3ADOQT_PRAVKA_EQ: TFloatField;
    KD3ADOQT_PRAVKA_EQ_MODEL: TStringField;
    KD3ADOQT_PRAVKA_NV: TFloatField;
    KD3ADOQT_PRAVKA_PRIM: TStringField;
    KD3ADOQT_VALCOV_EQ: TFloatField;
    KD3ADOQT_VALCOV_EQ_MODEL: TStringField;
    KD3ADOQT_VALCOV_NV: TFloatField;
    KD3ADOQT_VALCOV_PRIM: TStringField;
    KD3ADOQT_REZKA2_EQ: TFloatField;
    KD3ADOQT_REZKA2_EQ_MODEL: TStringField;
    KD3ADOQT_REZKA2_NV: TFloatField;
    KD3ADOQT_REZKA2_PRIM: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure KDEditMarksActionExecute(Sender: TObject);
    procedure KDAppendActionExecute(Sender: TObject);
    procedure KDEditActionExecute(Sender: TObject);
    procedure KDDelActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure KDLevelUpdate;
    procedure KD2EditDetailsActionExecute(Sender: TObject);
    procedure KD2AppendActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KD2EditActionExecute(Sender: TObject);
    procedure ActionsEnabling;
    procedure KD1SourceDataChange(Sender: TObject; Field: TField);
    procedure KD2SourceDataChange(Sender: TObject; Field: TField);
    procedure KD3SourceDataChange(Sender: TObject; Field: TField);
    procedure KD3AppendActionExecute(Sender: TObject);
    procedure KDGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure KDGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure KDGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure KD3EditActionExecute(Sender: TObject);
//    Procedure ColumnVis(Var Grid:TDBGridEh;ColumnName: String;vis:boolean);
    Procedure UpdateKDGrid2ColumnsVis;
    Procedure UpdateKDGrid3ColumnsVis;
    Procedure UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset;NameField:string='NAME');
    procedure KD2ESCActionExecute(Sender: TObject);
    procedure KD3ESCActionExecute(Sender: TObject);
    procedure KD2EditSPActionExecute(Sender: TObject);
    procedure KD2DelActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    Procedure OpenKD1ADOQ;
    procedure KD1SetFilterActionExecute(Sender: TObject);
    procedure KDGrid2Exit(Sender: TObject);
    procedure KDGrid3Exit(Sender: TObject);
    procedure KD3ADOQBeforePost(DataSet: TDataSet);
    procedure KD2ADOQBeforePost(DataSet: TDataSet);
    procedure KDReportActionExecute(Sender: TObject);
    Procedure KDReportBuild(fr3:string);
    procedure KD3CopyActionExecute(Sender: TObject);
    procedure KD3LCopyActionExecute(Sender: TObject);
    procedure UpdateKD1EmptyField;
    procedure UpdateKD2EmptyField;
    procedure KD3L1CopyActionExecute(Sender: TObject);
    procedure KDGrid3ColEnter(Sender: TObject);
    procedure KD3DelActionExecute(Sender: TObject);
    procedure BeforeOpen(DataSet: TDataSet);
    procedure OPAfterInsert(DataSet: TDataSet);
    procedure LookupFieldChange(Sender: TField);
    procedure OPBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    KDLevel: integer;
  end;

  TADOQueryHelper = class helper for TADOQuery
    procedure RefreshRecord;
    procedure RequeryAndKeepPos;
  end;

var
  KDGridForm: TKDGridForm;
  KDFilter:TKDFilter;

implementation

{$R *.dfm}

procedure TKDGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 KDGrid2Exit(Sender);
 KDGrid3Exit(Sender);

 KD3ADOQ.Close;
 KD2ADOQ.Close;
 KD1ADOQ.Close;
 Action := caFree;
 KDGridForm := nil;
end;

procedure TKDGridForm.OPBeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  BeforeOpen(DataSet);
end;

Procedure TKDGridForm.OpenKD1ADOQ;
Var
 OldNREC:int64;
Begin
 KD1ADOQ.DisableControls;
 if KD1ADOQ.Active and (KD1ADOQ.RecNo>0) then OldNREC:=KD1ADOQ['NREC']
                                         else OldNREC:=0;
 KD1ADOQ.Close;
 KD1ADOQ.Parameters.Clear;
 KD1ADOQ.Parameters.CreateParameter('id1',ftDateTime,pdInput,0,Trunc(KDFilter.INPUTDATE1));
 KD1ADOQ.Parameters.CreateParameter('id2',ftDateTime,pdInput,0,Trunc(KDFilter.INPUTDATE2)+0.99999);
 KD1ADOQ.Parameters.CreateParameter('ad1',ftDateTime,pdInput,0,Trunc(KDFilter.ACTDATE1));
 KD1ADOQ.Parameters.CreateParameter('ad2',ftDateTime,pdInput,0,Trunc(KDFilter.ACTDATE2)+0.99999);

// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE1)));
// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE2)+0.99999));

 KD1ADOQ.SQL.Text:='select * from '+SchemaName+'kd'+' where '+KDFilter.GetFilterString+' order by ORDERNUM2';
// ShowMessage(KD1ADOQ.SQL.Text);
 KD1ADOQ.Open;
// ShowMessage('2');
 if OldNREC<>0 then KD1ADOQ.Locate('NREC',OldNREC,[]);
// ShowMessage('3');
 KD1ADOQ.EnableControls;
// ShowMessage('4');
End;


procedure TKDGridForm.FormCreate(Sender: TObject);
begin
 MHistMTE:=TMemTableEh.Create(nil);
 MHistMTE.FieldDefs.Add('nrec', ftLargeInt);
 MHistMTE.FieldDefs.Add('cnt', ftInteger);
 MHistMTE.CreateDataSet;
 MHistMTE.Open;


 //FRForm:=TFRForm.Create(nil);

 KDFilter:=TKDFilter.Create;

 KDLevel:=1;
 {Host.ADOC.LoginPrompt:=False;
 Host.ADOC.ConnectionString := 'Provider=MSDAORA.1;Data Source='+DataSource+';Password='+Password+';User ID='+Login;}
 Try
  //Host.ADOC.Open;
  KD1ADOQ.Connection:=Host.ADOC;
  KD2ADOQ.Connection:=Host.ADOC;
  KD3ADOQ.Connection:=Host.ADOC;

  OpenKD1ADOQ;
//  KD1ADOQ.SQL.Text:='select * from '+SchemaName+'kd'+' where '+KDFilter.GetFilterString+' order by INPUTDATE desc';
//  KD1ADOQ.Open;
//  ShowMessage(IntToStr(KDADOQ.RecordCount));
  KDLevelUpdate;
 Except on E:Exception do
  Begin
   ShowMessage(E.Message);
  End;
 End;
end;

procedure TKDGridForm.FormDestroy(Sender: TObject);
begin
 KDGrid2Exit(Self);
 KDGrid3Exit(Self);

 KDFilter.Free;
 //FRForm.Free;
 MHistMTE.Close;
 MHistMTE.Free;
end;

Procedure TKDGridForm.UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset;NameField:string='NAME');
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
        Grid.Columns[i].KeyList.Append(ADOQ.FieldByName('NREC').AsString);
        Grid.Columns[i].PickList.Append(ADOQ.FieldByName(NameField).AsString);
        ADOQ.Next;
       End;
//      SendMessage(Grid.Columns[i].PickList.Handle, CB_SETDROPPEDWIDTH, 200, 0);
//        Grid.Columns[i].Perform(CB_SETDROPPEDWIDTH, 1024, 0);
//      Grid.Columns[i].DropDownSizing:=True;
//      Grid.Columns[i].DropDownWidth:=300;
      break;
    end;
  end;
end;

procedure TKDGridForm.KDLevelUpdate;
Var
 ADOQ:TAdoQuery;
Begin
 KDGrid2Exit(Self);
 KDGrid3Exit(Self);

 InfoPanel1.Visible:=(KDLevel=1);
 InfoPanel2.Visible:=(KDLevel=2);
 InfoPanel3.Visible:=(KDLevel=3);

 PanelKDL1.Visible:=(KDLevel=1);
 PanelKDL2.Visible:=(KDLevel=2);
 PanelKDL3.Visible:=(KDLevel=3);

 KDGrid1.Visible:=(KDLevel=1);
 KDGrid2.Visible:=(KDLevel=2);
 KDGrid3.Visible:=(KDLevel=3);

 if KDGrid1.Visible then KDGrid1.Align:=alClient;
 if KDGrid2.Visible then KDGrid2.Align:=alClient;
 if KDGrid3.Visible then KDGrid3.Align:=alClient;

 case KDLevel of
  1: Begin
      UpdateKD1EmptyField;
     End;
  2: Begin
      adoq:=TAdoQuery.Create(nil);
      adoq.Connection:=Host.ADOC;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=2)'+' and '+'(active=1)'+ // 2 - Сварка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid2,'T_SVARKA_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=3)'+' and '+'(active=1)'+ // 3 - Зачистка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid2,'T_ZACHIST_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=5)'+' and '+'(active=1)'+ // 5 - Доводка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid2,'T_DOVODKA_CEQ',ADOQ); adoq.Close;

      adoq.Free;
      UpdateKD2EmptyField;
     End;
  3: Begin
      adoq:=TAdoQuery.Create(nil);
      adoq.Connection:=Host.ADOC;
      {


 T_GIBKA_EQADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=9)'+' and '+'(active=1)'; // 9 - Гибка
 T_GIBKA_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_GIBKA_EQADOQ.Open;

 T_ZACHIST_TYPEADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1';
 T_ZACHIST_TYPEADOQ.SQL.Text:='select * from '+SchemaName+'ZACHTYPES'+' where '+wh+orderby;
 T_ZACHIST_TYPEADOQ.Open;
}
      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=10)'+' and '+'(active=1)'+ // 10 - Разметка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'T_RAZMET_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=6)'+' and '+'(active=1)'+ // 6 - Резка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'T_REZKA_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=7)'+' and '+'(active=1)'+ // 7 - Отверстия
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'T_OTVERST_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=8)'+' and '+'(active=1)'+ // 8 - Строжка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'T_STROZH_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,model as name from '+SchemaName+'EQUIPMENT'+' where '+
      'NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=9)'+' and '+'(active=1)'+ // // 9 - Гибка
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'T_GIBKA_CEQ',ADOQ); adoq.Close;

      adoq.SQL.Text:='select nrec,name from '+SchemaName+'ZACHTYPES'+' where '+
      '(active=1)'+
      ' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'T_ZACHIST_CTYPE',ADOQ); adoq.Close;

      // --------------------
      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'GRMATERIALS'+' where '+'active=1 and cparent in ('+TrueGrMaterialsParents_+')'+' order by name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'CGRMATERIALS',ADOQ); adoq.Close;

      ADOQ.SQL.Text:='select nrec,shortname from '+SchemaName+'STEELMARKS'+' where '+'active=1'+' order by freq desc,shortname';
      adoq.Open;
      UpdateColumnPicks(KDGrid3,'PROP_STEELMARK',ADOQ,'SHORTNAME'); adoq.Close;

      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'NORMDOC'+' where '+'active=1 and normtype=2'+' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'PROP_PROFILE',ADOQ); adoq.Close;

      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'NORMDOC'+' where '+'active=1 and normtype=0'+' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'PROP_NORMDOC0',ADOQ); adoq.Close;

      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'NORMDOC'+' where '+'active=1 and normtype=1'+' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'PROP_NORMDOC1',ADOQ); adoq.Close;

      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'PROFTYPES'+' where '+'active=1'+' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'PROP_PROFTYPE',ADOQ); adoq.Close;

      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'FIXTYPES'+' where '+'active=1'+' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'PROP_FIXTYPE',ADOQ); adoq.Close;

      ADOQ.SQL.Text:='select nrec,name from '+SchemaName+'CARVTYPES'+' where '+'active=1'+' order by freq desc,name';
      adoq.Open; UpdateColumnPicks(KDGrid3,'PROP_CARVTYPE',ADOQ); adoq.Close;
      // --------------------

      adoq.Free;

     End;

 end;
 ActionsEnabling;
End;

Procedure TKDGridForm.KDReportBuild(fr3:string);
Begin

// Application := TApplication(App);
// Screen := TScreen(Scr);


 FRForm.Report.Clear;
 FRForm.Report.LoadFromFile(fr3);

// MTE2.SortOrder:='table';

// FRForm.DBDataset.DataSet:=MTE;
// FRForm.DBDataset2.DataSet:=MTE2;

 FRForm.Report.PrepareReport();
 FRForm.Report.ShowPreparedReport;
End;

procedure TKDGridForm.KDReportActionExecute(Sender: TObject);
Var
 ReportsList:TMemTableEh;
 KD:TKD;
begin
 if KDReportAction.Enabled then
  Begin
   KD:=TKD.Create;
   ReportsList:=TMemTableEh.Create(nil);
   FRForm := TFRForm.Create(Self);
   if GetReportsList(Self,ReportsList,'KD') and (ReportsList.RecordCount>0) then
    Begin
   //   ShowMessage('печать');
     ReportsList.First;
     while Not ReportsList.Eof do
      Begin
//       ShowMessage('fr3: '+ReportsList.FieldByName('fr3').AsString);
//       ShowMessage('descr: '+ReportsList.FieldByName('descr').AsString);
       if KD.Read(KD1ADOQ) then KD.Report(Self,ReportsList.FieldByName('fr3').AsString);
       ReportsList.Next;
      End;
    End;
   ReportsList.Close;
   ReportsList.Free;
   KD.Free;
   FRForm.Free;
   KDGrid1.SetFocus;
  End;
end;

procedure TKDGridForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
 edit:boolean;
begin
// ShowMessage(IntToStr(Key));
 case KDLevel of
  1: Begin
      case Key of
       Ord('P'),Ord('p'),Ord('З'),Ord('з'):
              Begin
               if ssCtrl in Shift then KDReportActionExecute(Sender);
               Key:=0;
              End;
       vk_F2: Begin
               KD1SetFilterActionExecute(Sender);
               Key:=0;
              End;

       vk_F4: Begin
               KDEditActionExecute(Sender);
               Key:=0;
              End;
       vk_F7: Begin
               KDAppendActionExecute(Sender);
               Key:=0;
              End;
   vk_Delete: Begin
               KDDelActionExecute(Sender);
               Key:=0;
              End;
   vk_F10,vk_return:
              Begin
               KDEditMarksActionExecute(Sender);
               Key:=0;
              End;
      end;
     End;
  2: Begin
      case Key of
       vk_F4: Begin
               KD2EditActionExecute(Sender);
               Key:=0;
              End;
       vk_F7: Begin
               KD2AppendActionExecute(Sender);
               Key:=0;
              End;
   vk_Delete: if not KDGrid2.EditorMode then Begin
               KD2DelActionExecute(Sender);
               Key:=0;
              End;
   vk_ESCAPE:
              Begin
               KD2ESCActionExecute(Sender);
               Key:=0;
              End;
   vk_F10,vk_return:
              Begin
               edit:=True;
               if Key=vk_return then
                If KD2ADOQ.Active and ((KD2Source.State=dsEdit) or (KD2Source.State=dsInsert)) then
                 Try KD2ADOQ.Post; edit:=False; Except KD2ADOQ.Cancel; End;
               If edit then KD2EditSPActionExecute(Sender);
               Key:=0;
              End;
   vk_F12:
              Begin
               KD2EditDetailsActionExecute(Sender);
               Key:=0;
              End;
      end;
     End;
  3: Begin
      case Key of
vk_F4,vk_F10,vk_return: Begin
               edit:=True;
               if Key=vk_return then
                If KD3ADOQ.Active and ((KD3Source.State=dsEdit) or (KD3Source.State=dsInsert)) then
                 Try KD3ADOQ.Post; edit:=False; UpdateKDGrid3ColumnsVis; Except KD3ADOQ.Cancel; End;
               If edit then KD3EditActionExecute(Sender);
               Key:=0;
              End;
       vk_F7: Begin
//               if ssCtrl in Shift then KD3CopyActionExecute(Sender)
               KD3AppendActionExecute(Sender);
               Key:=0;
              End;
   vk_Delete: if not KDGrid3.EditorMode then Begin
               KD3DelActionExecute(Sender);
               Key:=0;
              End;
       vk_F6: Begin
               KD3LCopyActionExecute(Sender);
               Key:=0;
              End;
       vk_F3: Begin
               KD3L1CopyActionExecute(Sender);
               Key:=0;
              End;
       vk_F9: Begin
               KD3CopyActionExecute(Sender);
               Key:=0;
              End;
   vk_ESCAPE:
              Begin
               KD3ESCActionExecute(Sender);
               Key:=0;
              End;
      end;
     End;
 end;

end;

procedure TKDGridForm.FormShow(Sender: TObject);
begin
// BringToFront;
end;

procedure TKDGridForm.KD1SetFilterActionExecute(Sender: TObject);
begin
 if KD1SetFilterAction.Enabled then
  Begin
   if KDFilter.Edit(Self) then OpenKD1ADOQ;
   KDGrid1.SetFocus;
//   ShowMessage('5');
  End;
end;

procedure TKDGridForm.KD1SourceDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TKDGridForm.KD2ADOQBeforePost(DataSet: TDataSet);
begin
// ReplEmptyToSpace(DataSet,'ORDERNUM2');
 ReplEmptyToSpace(DataSet,'ORDN');
 ReplEmptyToSpace(DataSet,'QUEUE');
 ReplEmptyToSpace(DataSet,'MARK');
 ReplEmptyToSpace(DataSet,'NAME');
 ReplEmptyToSpace(DataSet,'DRAWING');
 ReplEmptyToSpace(DataSet,'T_SBORKA_PR');
 ReplEmptyToSpace(DataSet,'T_GRPOKR_GR');
 ReplEmptyToSpace(DataSet,'T_GRPOKR_POKR');
 ReplEmptyToSpace(DataSet,'T_DOVODKA_PR');
 ReplEmptyToSpace(DataSet,'PRIM');
end;

procedure TKDGridForm.KD2AppendActionExecute(Sender: TObject);
Var
 kd2:TKD2;
begin
 if KD2AppendAction.Enabled then
  Begin
   kd2:=TKD2.Create;
   kd2.CKD:=KD1ADOQ['NREC'];
   kd2.ORDERNUM:=KD1ADOQ.FieldByName('ORDERNUM').AsString;
   If kd2.Edit(Self,True) then
    Begin
      KD2ADOQ.DisableControls;
      KD2ADOQ.Append;
      if Not kd2.Save(KD2ADOQ) then KD2ADOQ.Cancel;
      KD2ADOQ.Requery;
      KD2ADOQ.Locate('ckd;ordn',VarArrayOf([kd2.CKD,kd2.ordn]),[loCaseInsensitive]);
      KDGrid2.SetFocus;
      KD2ADOQ.EnableControls;
    End;
   kd2.Free;
  End;
end;

procedure TKDGridForm.KD2DelActionExecute(Sender: TObject);
Var
 OldRecNo:int64;
begin
 if KD2DelAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что хотите удалить "'+KD2ADOQ.FieldByName('NAME').AsString+'" ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     Host.ADOC.Execute('delete from '+SchemaName+'DMARKS where CMARK='+KD2ADOQ.FieldByName('NREC').AsString);
     DeleteIncFile('marks',KD2ADOQ['NREC']);
     OldRecNo:=KD2ADOQ.RecNo;
     KD2ADOQ.Delete;
     Try KD2ADOQ.RecNo:=OldRecNo; Except End;
    End;
  End;
end;

procedure TKDGridForm.KD2EditActionExecute(Sender: TObject);
Var
 kd2:TKD2;
begin
 if KD2EditAction.Enabled then
  Begin
   kd2:=TKD2.Create;
   KD2ADOQ.DisableControls;
   if kd2.Read(KD2ADOQ) then
   Begin
    If kd2.Edit(Self,False) then
     Begin
      KD2ADOQ.Requery;
      if KD2ADOQ.Locate('nrec',kd2.NREC,[]) then
       Begin
        KD2ADOQ.Edit;
        if Not kd2.Save(KD2ADOQ) then KD2ADOQ.Cancel;
        KD2ADOQ.Requery;
        KD2ADOQ.Locate('nrec',kd2.NREC,[]);
       End;
     End
   End;
   KD2ADOQ.EnableControls;
   kd2.Free;
  End;
end;

procedure TKDGridForm.KDAppendActionExecute(Sender: TObject);
Var
 kd:TKD;
begin
 if KDAppendAction.Enabled then
  Begin
   kd:=TKD.Create;
   If kd.Edit(Self,True) then
    Begin
      KD1ADOQ.DisableControls;
      KD1ADOQ.Append;
      if Not kd.Save(KD1ADOQ) then KD1ADOQ.Cancel;
      KD1ADOQ.Requery;
      KD1ADOQ.Locate('ordernum;ordernum2',VarArrayOf([kd.ORDERNUM,kd.ORDERNUM2]),[loCaseInsensitive]);
      KDGrid1.SetFocus;
      KD1ADOQ.EnableControls;
    End;
   kd.Free;
  End;
end;

procedure TKDGridForm.KDDelActionExecute(Sender: TObject);
Var
 mlist,dlist:TStringList;
 adoq:TAdoQuery;
 OldRecNo:int64;
 i:integer;
begin
 if KDDelAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что хотите удалить заказ "'+KD1ADOQ.FieldByName('ORDERNUM').AsString+'" ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     mlist:=TStringList.Create;
     dlist:=TStringList.Create;

     adoq:=TAdoQuery.Create(nil);
     adoq.Connection:=Host.ADOC;
     adoq.SQL.Text:='select NREC from '+SchemaName+'MARKS'+' where CKD='+KD1ADOQ.FieldByName('NREC').AsString;
     adoq.Open;
     while Not adoq.Eof do
      Begin
       mlist.Append(adoq.FieldByName('NREC').AsString);
       adoq.Next;
      End;
     adoq.Close;

     adoq.SQL.Text:='select NREC from '+SchemaName+'DETAILS'+' where CKD='+KD1ADOQ.FieldByName('NREC').AsString;
     adoq.Open;
     while Not adoq.Eof do
      Begin
       dlist.Append(adoq.FieldByName('NREC').AsString);
       adoq.Next;
      End;
     adoq.Close;

     adoq.Free;

     for i:=0 to mlist.Count-1 do
      Begin
       Host.ADOC.Execute('delete from '+SchemaName+'DMARKS where CMARK='+mlist[i]);
       DeleteIncFile('marks',StrToInt(mlist[i]));
       Host.ADOC.Execute('delete from '+SchemaName+'MARKS where NREC='+mlist[i]);
      End;

     for i:=0 to dlist.Count-1 do
      Begin
       DeleteIncFile('details',StrToInt(dlist[i]));
       Host.ADOC.Execute('delete from '+SchemaName+'DETAILS where NREC='+dlist[i]);
      End;

     OldRecNo:=KD1ADOQ.RecNo;

     dlist.Free;
     mlist.Free;
     KD1ADOQ.Delete;
     Try KD1ADOQ.RecNo:=OldRecNo; Except End;
    End;
  End;
end;

procedure TKDGridForm.KDEditActionExecute(Sender: TObject);
Var
 kd:TKD;
begin
 if KDEditAction.Enabled then
  Begin
   kd:=TKD.Create;
   KD1ADOQ.DisableControls;
   if kd.Read(KD1ADOQ) then
   Begin
    If kd.Edit(Self,False) then
     Begin
      KD1ADOQ.Requery;
      if KD1ADOQ.Locate('nrec',kd.NREC,[]) then
       Begin
        KD1ADOQ.Edit;
        if Not kd.Save(KD1ADOQ) then KD1ADOQ.Cancel;
        KD1ADOQ.Requery;
        KD1ADOQ.Locate('nrec',kd.NREC,[]);
       End;
     End
   End;
   KD1ADOQ.EnableControls;
   kd.Free;
   KDGrid1.SetFocus;
  End;
end;

procedure TKDGridForm.KD2EditDetailsActionExecute(Sender: TObject);
Var
 adoq,adoq2:TAdoQuery;
 DelList,DelNList:TStringList;
 i:integer;
begin
 if KD2EditDetailsAction.Enabled then
  Begin
   f_ORDERNUM_.Text:=KD1ADOQ.FieldByName('ORDERNUM').AsString;
   f_ORDERNUM2.Text:=KD1ADOQ.FieldByName('ORDERNUM2').AsString;

{
   f_ORDERNUM2.Text:=EmptyStr;
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.SQL.Text:='select ORDERNUM2 from '+SchemaName+'MARKS'+' where CKD='+KD1ADOQ.FieldByName('NREC').AsString+' group by ORDERNUM2';
   adoq.Open;
   while Not adoq.Eof do
    Begin
     if Not Empty(adoq.FieldByName('ORDERNUM2').AsString) then
      Begin
       if Not Empty(f_ORDERNUM2.Text) then f_ORDERNUM2.Text:=f_ORDERNUM2.Text+comma+space;
       f_ORDERNUM2.Text:=f_ORDERNUM2.Text+Trim(adoq.FieldByName('ORDERNUM2').AsString);
      End;
     adoq.Next;
    End;
   adoq.Close;
   adoq.Free;
}


//   f_ORDERNUM2.Text:=KD2ADOQ.FieldByName('ORDERNUM2').AsString;

   KDLevel:=3;
   KD3ADOQ.Close;
   KD3ADOQ.SQL.LoadFromFile(ExtractFilePath(Application.ExeName) +
      'SQL\KD\' + 'KD3ADOQ.sql');
   KD3ADOQ.Parameters.ParamValues['CKD'] := KD1ADOQ['NREC'];
   KD3ADOQ.Open;

   KDLevelUpdate;
   UpdateKDGrid3ColumnsVis;

 KD3ADOQ.DisableControls;
 adoq2:=TAdoQuery.Create(nil);
 adoq2.Connection:=Host.ADOC;
 adoq2.SQL.Text:='select * from '+SchemaName+'details where ckd='+KD1ADOQ.FieldByName('nrec').AsString;
 adoq2.Open;


 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select NUMP from '+SchemaName+'DMARKS'+' where CMARK in (select NREC from '+SchemaName+'MARKS'+' where CKD='+KD1ADOQ.FieldByName('NREC').AsString+') group by NUMP order by NUMP';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   if Not ADOQ2.Locate('NUMP',adoq.FieldByName('NUMP').AsString,[loCaseInsensitive]) then
    Begin
     ADOQ2.Append;
//     ShowMessage('Test1');
     ADOQ2['CKD']:=KD1ADOQ.FieldByName('nrec').Value;
     ADOQ2.FieldByName('NUMP').AsString:=adoq.FieldByName('NUMP').AsString;
//     ShowMessage('Test2');
     ADOQ2.Post;
//     ShowMessage('Test3');
    End;
   adoq.Next;
  End;

// ShowMessage('Test4');
 DelList:=TStringList.Create;
 DelNList:=TStringList.Create;
 ADOQ2.Requery;
 ADOQ2.First;
// ShowMessage('Test5');
 while Not ADOQ2.Eof do
  Begin
//   ShowMessage('Test6');
   if Not ADOQ.Locate('NUMP',ADOQ2.FieldByName('NUMP').AsString,[]) then
    Begin
//     ShowMessage('Test7');
     if UniCheckLinks('SPPASSPORTSD','CDETAILS',ADOQ2.FieldByName('NREC').AsLargeInt) then
      Begin
       DelList.Append(ADOQ2.FieldByName('NREC').AsString);
       DelNList.Append(ADOQ2.FieldByName('NUMP').AsString);
      End else ShowMessage('Ссылка на деталь №'+ADOQ2.FieldByName('NUMP').AsString+' имеется в одном из паспортов матариала, поэтому ее удаление невозможно!');
    End;
   ADOQ2.Next;
//   ShowMessage('Test8');
  End;
 adoq.Close;
 adoq.Free;

 adoq2.Close;
 adoq2.Free;

// ShowMessage('Test9');
 if (DelList.Count>0) and (CurrentUser.CUSERGROUPS<>2) then
  Begin
//   ShowMessage('Test10');
   If (MagsoftMessageDlg('Следующие порядковые номера отсутствуют в спецификациях марок: '+DelNList.CommaText+'. Удалить соответствующие описания деталей?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
//     ShowMessage('Test11');
     for i:=0 to DelList.Count-1 do
      Begin
       DeleteIncFile('details',StrToInt(DelList[i]));
       Host.ADOC.Execute('delete from '+SchemaName+'details where nrec='+DelList[i]);
      End;
    End;
  End;

// ShowMessage('Test12');


 KD3ADOQ.Requery;

 DelList.Free;
 DelNList.Free;
 KD3ADOQ.EnableControls;
// ShowMessage('Test13');


   KDGrid3.SetFocus;
// ShowMessage('Test14');
  End;
end;

procedure TKDGridForm.KD2EditSPActionExecute(Sender: TObject);
Var
 kd25:TKD25;
begin
 if KD2EditSPAction.Enabled then
  Begin

 Host.ADOC.Execute('update '+SchemaName+'DMARKS dm'+
 ' set WEIGHT1='+
 '(select sum(WEIGHT1) from '+SchemaName+'DETAILS where CKD='+KD1ADOQ.FieldByName('NREC').AsString+' and NUMP=dm.NUMP)'+
 ' where CMARK='+KD2ADOQ.FieldByName('NREC').AsString+' and Not ('+
 '(select sum(WEIGHT1) from '+SchemaName+'DETAILS where CKD='+KD1ADOQ.FieldByName('NREC').AsString+' and NUMP=dm.NUMP)'+
 ' is NULL)'
 );


 Host.ADOC.Execute('update '+SchemaName+'DMARKS dm'+
 ' set WEIGHT=WEIGHT1*NUMCOUNT'+
 ' where CMARK='+KD2ADOQ.FieldByName('NREC').AsString
 );


   kd25:=TKD25.Create;
   kd25.CMARK:=KD2ADOQ['NREC'];
   kd25.ORDERNUM:=KD1ADOQ['ORDERNUM'];
//   kd25.ORDERNUM2:=KD2ADOQ['ORDERNUM2'];
   kd25.ORDERNUM2:=KD1ADOQ['ORDERNUM2'];
   kd25.ORDN:=KD2ADOQ['ORDN'];
   kd25.MARK:=KD2ADOQ['MARK'];
   kd25.NAME:=KD2ADOQ['NAME'];
   kd25.WEIGHT1:=KD2ADOQ['WEIGHT1'];
   kd25.DRAWING:=KD2ADOQ['DRAWING'];

//   kd3.CKD:=KD1ADOQ['NREC'];
//   kd3.ORDERNUM:=KD1ADOQ.FieldByName('ORDERNUM').AsString;
//   kd3.ORDERNUM2:=KD2ADOQ.FieldByName('ORDERNUM2').AsString;
//   kd3.CMATERIAL:=4;
   kd25.Edit(Self);
   KDGrid2.SetFocus;
   kd25.Free;
  End;
 UpdateKD2EmptyField;
end;

procedure TKDGridForm.KD2ESCActionExecute(Sender: TObject);
begin
 if KD2ESCAction.Enabled then
  Begin
   KD2ADOQ.Close;
   KDLevel:=1;
   KDLevelUpdate;
   KDGrid1.SetFocus;
  End;
end;

procedure TKDGridForm.KD2SourceDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TKDGridForm.KD3ADOQBeforePost(DataSet: TDataSet);
begin
  ReplEmptyToSpace(DataSet,'NUMP');
  ReplEmptyToSpace(DataSet,'PROP_PROFNUM');
  ReplEmptyToSpace(DataSet,'T_RAZMET_PR');
  ReplEmptyToSpace(DataSet,'T_REZKA_PR');
  ReplEmptyToSpace(DataSet,'T_OTVERST_DIAM');
  ReplEmptyToSpace(DataSet,'T_OTVERST_PR');
  ReplEmptyToSpace(DataSet,'T_STROZH_PR');
  ReplEmptyToSpace(DataSet,'T_GIBKA_PR');
  ReplEmptyToSpace(DataSet,'PRIM');
end;

procedure TKDGridForm.OPAfterInsert(DataSet: TDataSet);
begin
  DataSet['COPER'] := DataSet.Tag;
  DataSet['CDETAIL'] := KD3ADOQ['NREC'];
end;

procedure TKDGridForm.LookupFieldChange(Sender: TField);
begin
  if not Assigned(Sender) then
    Exit;
  Sender.OnChange := nil;
  if not Assigned(Sender.LookupDataSet) then
    Exit;
  if Sender.LookupDataSet.Locate(Sender.LookupKeyFields + ';COPER', VarArrayOf([Sender.DataSet[Sender.KeyFields], Sender.LookupDataSet.Tag]), []) then
    Sender.LookupDataSet.Edit
  else
    Sender.LookupDataSet.Append;
  if Assigned(KDGrid3.InplaceEditor) and (KDGrid3.SelectedField = Sender) then begin
    Sender.Value := KDGrid3.InplaceEditor.Text;
    Sender.LookupDataSet.FieldValues[Sender.LookupResultField] := Sender.Value;
  end;
  Sender.LookupDataSet.Post;
  Sender.OnChange := LookupFieldChange;
end;

procedure TKDGridForm.BeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

procedure TKDGridForm.KD3AppendActionExecute(Sender: TObject);
Var
 kd3:TKD3;
begin
 if KD3AppendAction.Enabled then
  Begin
   kd3:=TKD3.Create;
//   kd3.CMARK:=KD2ADOQ['NREC'];
   kd3.CKD:=KD1ADOQ['NREC'];
   kd3.ORDERNUM:=KD1ADOQ.FieldByName('ORDERNUM').AsString;
//   kd3.ORDERNUM2:=KD2ADOQ.FieldByName('ORDERNUM2').AsString;
//   kd3.CMATERIAL:=4;
   If kd3.Edit(Self,True) then
    Begin
      KD3ADOQ.DisableControls;
      KD3ADOQ.Append;
      if Not kd3.Save(KD3ADOQ) then KD3ADOQ.Cancel;
      KD3ADOQ.Requery;
      KD3ADOQ.Locate('ckd;nump',VarArrayOf([kd3.CKD,kd3.NUMP]),[loCaseInsensitive]);
      UpdateKDGrid3ColumnsVis;
      KDGrid3.SetFocus;
      KD3ADOQ.EnableControls;
    End;
   KDLevelUpdate;
   kd3.Free;
  End;
end;

procedure TKDGridForm.KD3CopyActionExecute(Sender: TObject);
Var
 kd3,kd3sour:TKD3;
 list:TStringList;
 adoq:TAdoQuery;
 s:string;
 n:integer;
begin
 if KD3CopyAction.Enabled then
  Begin
   kd3sour:=TKD3.Create;
   kd3:=TKD3.Create;
   KD3ADOQ.DisableControls;
   if kd3.Read(KD3ADOQ) then
   Begin

   list:=TStringList.Create;
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.SQL.Text:='select * from '+SchemaName+'DETAILS'+' where CKD='+IntToStr(kd3.CKD)+' and NREC<>'+IntToStr(kd3.NREC)+' order by NUMP';
   adoq.Open;
   while Not adoq.Eof do
    Begin
     s:=adoq.FieldByName('NUMP').AsString;
     if Not Empty(adoq.FieldByName('GRMATERIALS_S').AsString) then s:=s+' - '+adoq.FieldByName('GRMATERIALS_S').AsString;
     list.Append(s);
     adoq.Next;
    End;

   n:=GetUniSelect2Result(Owner,list,0,'Из какой детали копировать описание?');
   if n<>-1 then
    Begin
     adoq.RecNo:=n+1;
     if kd3sour.Read(ADOQ) then
      Begin
       kd3sour.NREC:=kd3.NREC;
       kd3sour.NUMP:=kd3.NUMP;
       KD3ADOQ.Edit;
       if Not kd3sour.Save(KD3ADOQ) then KD3ADOQ.Cancel;
       KD3ADOQ.Requery;
       KD3ADOQ.Locate('nrec',kd3sour.NREC,[]);
      End;
    End;

   adoq.Close;
   adoq.Free;
   list.Free;


   End;
   KD3ADOQ.EnableControls;
   kd3sour.Free;
   kd3.Free;
  End;
end;

procedure TKDGridForm.KD3DelActionExecute(Sender: TObject);
Var
 OldRecNo:int64;
begin
 if KD3DelAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что хотите удалить описание детали № '+KD3ADOQ.FieldByName('NUMP').AsString+' ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     DeleteIncFile('details',KD3ADOQ['NREC']);
     OldRecNo:=KD3ADOQ.RecNo;
     KD3ADOQ.Delete;
     Try KD3ADOQ.RecNo:=OldRecNo; Except End;
    End;
  End;
end;

procedure TKDGridForm.KD3EditActionExecute(Sender: TObject);
Var
 kd3:TKD3;
begin
 if KD3EditAction.Enabled then
  Begin
   kd3:=TKD3.Create;
   KD3ADOQ.DisableControls;
   if kd3.Read(KD3ADOQ) then
   Begin
    If kd3.Edit(Self,False) then
     Begin
      KD3ADOQ.Requery;
      if KD3ADOQ.Locate('nrec',kd3.NREC,[]) then
       Begin
        KD3ADOQ.Edit;
        if Not kd3.Save(KD3ADOQ) then KD3ADOQ.Cancel;
        KD3ADOQ.Requery;
        KD3ADOQ.Locate('nrec',kd3.NREC,[]);
        UpdateKDGrid3ColumnsVis;
       End;
     End;
    KDLevelUpdate;
   End;
   KD3ADOQ.EnableControls;
   kd3.Free;
  End;
end;

procedure TKDGridForm.KD3ESCActionExecute(Sender: TObject);
begin
 if KD3ESCAction.Enabled then
  Begin
   KDLevel:=2;
   UpdateKDGrid2ColumnsVis;
   KDLevelUpdate;
   KDGrid2.SetFocus;
  End;
end;


procedure TKDGridForm.KD3L1CopyActionExecute(Sender: TObject);
Var
 n:integer;
 fieldName,fieldTitle:string;
 content:variant;
begin
 if KD3L1CopyAction.Enabled then
  Begin
   fieldName:=KDGrid3.Columns[KDGrid3.Col-1].FieldName;
   fieldTitle:=KDGrid3.Columns[KDGrid3.Col-1].Title.Caption;
   If (MagsoftMessageDlg('Скопировать в ячейку "'+fieldTitle+'" данные из предыдущей детали?',mtConfirmation,[mbNo,mbYes],0,mbYes)=mrYes) then
    Begin
     KD3ADOQ.DisableControls;
     n:=KD3ADOQ.RecNo;
     KD3ADOQ.Prior;
     content:=KD3ADOQ[fieldName];
     KD3ADOQ.RecNo:=n;
     KD3ADOQ.Edit;
     KD3ADOQ[fieldName]:=content;
     KD3ADOQ.Post;
//       KD3ADOQ.Requery;
//       KD3ADOQ.Locate('nrec',kd3sour.NREC,[]);
     KD3ADOQ.EnableControls;
    End;
  End;
end;

procedure TKDGridForm.KD3LCopyActionExecute(Sender: TObject);
Var
 kd3,kd3sour:TKD3;
 n:integer;
begin
 if KD3LCopyAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Скопировать описание для текущей детали из предыдущей?',mtConfirmation,[mbNo,mbYes],0,mbYes)=mrYes) then
    Begin
     kd3sour:=TKD3.Create;
     kd3:=TKD3.Create;
     KD3ADOQ.DisableControls;
     if kd3.Read(KD3ADOQ) then
      Begin
       n:=KD3ADOQ.RecNo;
       KD3ADOQ.Prior;
       if kd3sour.Read(KD3ADOQ) then
        Begin
         KD3ADOQ.RecNo:=n;
         kd3sour.NREC:=kd3.NREC;
         kd3sour.NUMP:=kd3.NUMP;
         KD3ADOQ.Edit;
         if Not kd3sour.Save(KD3ADOQ) then KD3ADOQ.Cancel;
         KD3ADOQ.Requery;
         KD3ADOQ.Locate('nrec',kd3sour.NREC,[]);
        End;
      End;
     KD3ADOQ.EnableControls;
     kd3sour.Free;
     kd3.Free;
    End;
  End;
end;

{
Procedure TKDGridForm.ColumnVis(Var Grid:TDBGridEh;ColumnName: String;vis:boolean);
var
  i: Integer;
begin
 ColumnName:=UpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if UpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].Visible:=Vis;
      break;
    end;
  end;
end;
}

Procedure TKDGridForm.UpdateKDGrid3ColumnsVis;
Var
 OldRecNo:integer;
 PropList:TStringList;
 ExclColumnNameList:TStringList;
 i:integer;
Begin
 PropList:=TStringList.Create;
 KD3ADOQ.DisableControls;
 OldRecNo:=KD3ADOQ.RecNo;
 KD3ADOQ.First;
 while Not KD3ADOQ.Eof do
  Begin
   GetPropListOfMATERIAL2(KD3ADOQ['CGRMATERIALS'],PropList);
   KD3ADOQ.Next;
  End;

 for I := 0 to PropList.Count - 1 do
   if MatchStr(PropList[I], ['PROP_THICK', 'PROP_WIDTH', 'PROP_LENGTH', 'PROP_STEELMARK', 'PROP_NORMDOC0', 'PROP_NORMDOC1', 'PROP_PROFTYPE', 'PROP_PROFILE']) then
     PropList[I] := PropList[I] + '_C'
   else if MatchStr(PropList[I], ['PROP_FIXTYPE', 'PROP_CARVTYPE']) then
     PropList.Add(PropList[I] + '_C');

// *************************************
 ExclColumnNameList:=TStringList.Create;
 ExclColumnNameList.Append('T_RAZMET_NV');
 ExclColumnNameList.Append('T_REZKA_NV');
 ExclColumnNameList.Append('T_ZACHIST_NV');
 ExclColumnNameList.Append('T_OTVERST_NV');
 ExclColumnNameList.Append('T_STROZH_NV');
 ExclColumnNameList.Append('T_GIBKA_NV');

 for I := 0 to KDGrid3.Columns.Count - 1 do
   if StartsStr('PROP_', KDGrid3.Columns[I].FieldName) then
     if KDGrid3.Columns[I].FieldName <> 'PROP_LINEDENS' then
       KDGrid3.Columns[I].Visible := PropList.IndexOf(KDGrid3.Columns[I].FieldName) > -1
     else
       KDGrid3.Columns[I].Visible := False
   else if ExclColumnNameList.IndexOf(KDGrid3.Columns[I].FieldName) > -1 then
     KDGrid3.Columns[I].Visible := (CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4)
     else if CurrentUser.CUSERGROUPS=4 then
       KDGrid3.Columns[I].ReadOnly := True;
  if CurrentUser.CUSERGROUPS=4 then
    ReadOnlyColorsUpdateForGrid(KDGrid3,clWindow,clBtnFace);
 ExclColumnNameList.Free;
// *************************************



 if KD3ADOQ.RecordCount>0 then KD3ADOQ.RecNo:=OldRecNo;
 KD3ADOQ.EnableControls;
 PropList.Free;
End;

Procedure TKDGridForm.UpdateKDGrid2ColumnsVis;
Var
 ExclColumnNameList:TStringList;
 i:integer;
Begin
 ExclColumnNameList:=TStringList.Create;
 ExclColumnNameList.Append('T_SBORKA_NV');
 ExclColumnNameList.Append('T_SVARKA_NV');
 ExclColumnNameList.Append('T_ZACHIST_NV');
 ExclColumnNameList.Append('T_GRPOKR_NV');
 ExclColumnNameList.Append('T_DOVODKA_NV');
 for I := 0 to KDGrid2.Columns.Count - 1 do
   if ExclColumnNameList.IndexOf(KDGrid2.Columns[I].FieldName) > -1 then
     KDGrid2.Columns[I].Visible := (CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4)
   else
     if CurrentUser.CUSERGROUPS=4 then
       KDGrid2.Columns[I].ReadOnly := True;

 if CurrentUser.CUSERGROUPS=4 then
  Begin
   ReadOnlyColorsUpdateForGrid(KDGrid2,clWindow,clBtnFace);
  End;
 ExclColumnNameList.Free;
End;

procedure TKDGridForm.KD3SourceDataChange(Sender: TObject; Field: TField);
begin
  ActionsEnabling;
  if (KDLevel=3) and KD3ADOQ.Active and (KD3ADOQ.RecNo>0) then
    f_NUMP.Text:=KD3ADOQ.FieldByName('NUMP').AsString
  else
    f_NUMP.Text:=EmptyStr;
end;

procedure TKDGridForm.KDEditMarksActionExecute(Sender: TObject);
begin
 if KDEditMarksAction.Enabled then
  Begin
   f_ORDERNUM.Text:=KD1ADOQ.FieldByName('ORDERNUM').AsString;
   f_ORDERNUM2_.Text:=KD1ADOQ.FieldByName('ORDERNUM2').AsString;
   f_INPUTDATE.Text:=DateToStr(Trunc(KD1ADOQ.FieldByName('INPUTDATE').AsDateTime));
   f_CONTRACTOR_S.Text:=KD1ADOQ.FieldByName('CONTRACTOR_S').AsString;
   if KD1ADOQ.FieldByName('ACTDATE').AsDateTime=0 then f_ACTDATE.Text:=EmptyStr
                                                  else f_ACTDATE.Text:=KD1ADOQ.FieldByName('ACTDATE').AsString;

   KDLevel:=2;
   KD2ADOQ.Close;
   KD2ADOQ.SQL.Text:='select * from '+SchemaName+'marks where ckd='+KD1ADOQ.FieldByName('nrec').AsString+' order by ORDN';
   KD2ADOQ.Open;
   UpdateKDGrid2ColumnsVis;
   KDLevelUpdate;
   KDGrid2.SetFocus;
  End;
end;

procedure TKDGridForm.KDGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
 Im1: TPicture;
 Dir:string;
 tname:string;
 empt:boolean;
begin
if KD1ADOQ.Active and (KD1ADOQ.RecNo>0) then
Begin
 Try empt:=KD1ADOQ.FieldByName('empty').AsInteger=1; Except empt:=False; End;
 if empt then KDGrid1.Canvas.Font.Color := clMaroon
         else KDGrid1.Canvas.Font.Color := clBlack;
 KDGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

if Column.FieldName='' then
 begin
  Im1:=TPicture.Create;
  with (Sender as TDBGridEh).Canvas do
   begin
    Brush.Color:=clWhite;
    FillRect(Rect);
    Dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+'kd';
    tname:=GetThumbName(Dir,KD1ADOQ['nrec']);
    if Not FileExists(tname) then MakeIcon(Dir,KD1ADOQ['nrec'],ThumbW,ThumbH);
    if FileExists(tname) then
    Begin
    im1.loadfromfile(tname);
    Draw(round((Rect.Left+Rect.Right-Im1.Width)/2),Rect.Top,Im1.Graphic);
    End;
   end;
  Im1.Free;
 end;
End;
end;

procedure TKDGridForm.KDGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
 Im1: TPicture;
 Dir:string;
 tname:string;
 empt:boolean;
begin
if KD2ADOQ.Active and (KD2ADOQ.RecNo>0) then
Begin
 Try empt:=KD2ADOQ.FieldByName('empty').AsInteger=1; Except empt:=False; End;
 if empt then KDGrid2.Canvas.Font.Color := clMaroon
         else KDGrid2.Canvas.Font.Color := clBlack;
 KDGrid2.DefaultDrawColumnCell(Rect, DataCol, Column, State);

if Column.FieldName='' then
 begin
  Im1:=TPicture.Create;
  with (Sender as TDBGridEh).Canvas do
   begin
    Brush.Color:=clWhite;
    FillRect(Rect);
    Dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+'marks';
    tname:=GetThumbName(Dir,KD2ADOQ['nrec']);
    if Not FileExists(tname) then MakeIcon(Dir,KD2ADOQ['nrec'],ThumbW,ThumbH);
    if FileExists(tname) then
    Begin
    im1.loadfromfile(tname);
    Draw(round((Rect.Left+Rect.Right-Im1.Width)/2),Rect.Top,Im1.Graphic);
    End;
   end;
  Im1.Free;
 end;
End;
end;

procedure TKDGridForm.KDGrid2Exit(Sender: TObject);
begin
 If KD2ADOQ.Active and ((KD2Source.State=dsEdit) or (KD2Source.State=dsInsert)) then Try KD2ADOQ.Post; Except KD2ADOQ.Cancel; End;
end;

procedure TKDGridForm.KDGrid3ColEnter(Sender: TObject);
begin
 ActionsEnabling;
end;

procedure TKDGridForm.KDGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
var
 Im1: TPicture;
 Dir:string;
 tname:string;
begin
if KD3ADOQ.Active and (KD3ADOQ.RecNo>0) then
Begin
if Column.FieldName='' then
 begin
  Im1:=TPicture.Create;
  with (Sender as TDBGridEh).Canvas do
   begin
    Brush.Color:=clWhite;
    FillRect(Rect);
    Dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+'details';
    tname:=GetThumbName(Dir,KD3ADOQ['nrec']);
    if Not FileExists(tname) then MakeIcon(Dir,KD3ADOQ['nrec'],ThumbW,ThumbH);
    if FileExists(tname) then
    Begin
    im1.loadfromfile(tname);
    Draw(round((Rect.Left+Rect.Right-Im1.Width)/2),Rect.Top,Im1.Graphic);
    End;
   end;
  Im1.Free;
 end;
End;
end;

procedure TKDGridForm.KDGrid3Exit(Sender: TObject);
begin
 If KD3ADOQ.Active and ((KD3Source.State=dsEdit) or (KD3Source.State=dsInsert)) then Try KD3ADOQ.Post; Except KD3ADOQ.Cancel; End;
end;

procedure TKDGridForm.ActionsEnabling;
Begin
 KDAppendAction.Enabled:=(KDLevel=1) and KD1ADOQ.Active and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=6) or (CurrentUser.CUSERGROUPS=7));
 KDEditAction.Enabled:=(KDLevel=1) and KD1ADOQ.Active and (KD1ADOQ.RecNo>0) and (KD1ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KDDelAction.Enabled:=(KDLevel=1) and KD1ADOQ.Active and (KD1ADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=6) or (CurrentUser.CUSERGROUPS=7)) and (KD1ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KDEditMarksAction.Enabled:=(KDLevel=1) and KD1ADOQ.Active and (KD1ADOQ.RecNo>0) and (KD1ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KD1SetFilterAction.Enabled:=(KDLevel=1) and KD1ADOQ.Active;
 KDReportAction.Enabled:=(KDLevel=1) and KD1ADOQ.Active and (KD1ADOQ.RecNo>0) and (KD1ADOQ.FieldByName('NREC').AsLargeInt<>0);

 KD2AppendAction.Enabled:=(KDLevel=2) and KD2ADOQ.Active and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=6) or (CurrentUser.CUSERGROUPS=7));
 KD2EditAction.Enabled:=(KDLevel=2) and KD2ADOQ.Active and (KD2ADOQ.RecNo>0) and (KD2ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KD2EditDetailsAction.Enabled:=(KDLevel=2) and KD2ADOQ.Active;
 KD2ESCAction.Enabled:=(KDLevel=2);
 KD2EditSPAction.Enabled:=(KDLevel=2) and KD2ADOQ.Active and (KD2ADOQ.RecNo>0) and (KD2ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KD2DelAction.Enabled:=(KDLevel=2) and KD2ADOQ.Active and (KD2ADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=6) or (CurrentUser.CUSERGROUPS=7)) and (KD2ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KDGrid2.ReadOnly:=(CurrentUser.CUSERGROUPS=2);

 KD3AppendAction.Enabled:=(KDLevel=3) and KD3ADOQ.Active and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=6));
 KD3EditAction.Enabled:=(KDLevel=3) and KD3ADOQ.Active and (KD3ADOQ.RecNo>0) and (KD3ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KD3CopyAction.Enabled:=(KDLevel=3) and KD3ADOQ.Active and (KD3ADOQ.RecNo>0) and (KD3ADOQ.FieldByName('NREC').AsLargeInt<>0) and ((KD3ADOQ.RecordCount>1)) and (CurrentUser.CUSERGROUPS<>2) and (CurrentUser.CUSERGROUPS<>4) and (CurrentUser.CUSERGROUPS<>7);
 KD3LCopyAction.Enabled:=KD3CopyAction.Enabled and (KD3ADOQ.RecNo>1);
 KD3L1CopyAction.Enabled:=KD3CopyAction.Enabled and (KD3ADOQ.RecNo>1) and (KDGrid3.Col>1);
 KD3ESCAction.Enabled:=(KDLevel=3);
 KD3DelAction.Enabled:=(KDLevel=3) and KD3ADOQ.Active and (KD3ADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=6)) and (KD3ADOQ.FieldByName('NREC').AsLargeInt<>0);
 KDGrid3.ReadOnly:=(CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=7);
End;

Procedure TKDGridForm.UpdateKD1EmptyField;
Var
 adoq:TAdoQuery;
 empt:boolean;
 empti:integer;
Begin
 if KD1ADOQ.Active and (KD1ADOQ.RecNo>0) and (KD1ADOQ.FieldByName('NREC').AsLargeInt<>0) then
  Begin
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.SQL.Text:='select count(*) as cnt from '+SchemaName+'DETAILS'+' where CKD='+KD1ADOQ.FieldByName('NREC').AsString;
   adoq.Open;
   empt:=adoq.FieldByName('cnt').AsInteger=0;
   adoq.Close;
   if Not empt then
    Begin
     adoq.SQL.Text:='select MARKS.NREC as NREC,count(DMARKS.NREC) as cnt from '+SchemaName+'MARKS MARKS,'+SchemaName+'DMARKS DMARKS'+' where MARKS.CKD='+KD1ADOQ.FieldByName('NREC').AsString+' group by MARKS.NREC';
     adoq.Open;
     while Not adoq.Eof and Not empt do
      Begin
       empt:=(adoq.FieldByName('cnt').AsInteger=0);
       adoq.Next;
      End;
     adoq.Close;
    End;
   adoq.Free;
   if empt then empti:=1 else empti:=0;
   if KD1ADOQ.FieldByName('empty').AsInteger<>empti then
    Begin
     KD1ADOQ.Edit;
     KD1ADOQ.FieldByName('empty').AsInteger:=empti;
     KD1ADOQ.Post;
    End;
  End;
End;

Procedure TKDGridForm.UpdateKD2EmptyField;
Var
 adoq:TAdoQuery;
 empt:boolean;
 empti:integer;
Begin
 if KD2ADOQ.Active and (KD2ADOQ.RecNo>0) and (KD2ADOQ.FieldByName('NREC').AsLargeInt<>0) then
  Begin
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.SQL.Text:='select count(*) as cnt from '+SchemaName+'DMARKS'+' where CMARK='+KD2ADOQ.FieldByName('NREC').AsString;
   adoq.Open;
   empt:=(adoq.FieldByName('cnt').AsInteger=0);
   adoq.Close;
   adoq.Free;
   if empt then empti:=1 else empti:=0;
   if KD2ADOQ.FieldByName('empty').AsInteger<>empti then
    Begin
     KD2ADOQ.Edit;
     KD2ADOQ.FieldByName('empty').AsInteger:=empti;
     KD2ADOQ.Post;
    End;
  End;
End;

{ TADOQueryHelper }

procedure TADOQueryHelper.RefreshRecord;
begin
  Self.UpdateCursorPos;
  Self.Recordset.Resync(adAffectCurrent, adResyncAllValues);
  Self.Resync([]);
end;

procedure TADOQueryHelper.RequeryAndKeepPos;
var
  Bmk: TBookmark;
begin
  Self.DisableControls;
  Bmk := Self.Bookmark;
  Self.Requery;
  Self.GotoBookmark(Bmk);
  Self.FreeBookmark(Bmk);
  Self.EnableControls;
end;

end.
