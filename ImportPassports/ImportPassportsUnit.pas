unit ImportPassportsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UPlugin, Data.Win.ADODB, Data.DB,
  Datasnap.DBClient, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ActnList, Vcl.StdActns, Vcl.ImgList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.OleServer, ExcelXP, GlobVars, ADOInt;

type
  TImportPassportsForm = class(TForm)
    ADOConnection: TADOConnection;
    PreviewClientDataSet: TClientDataSet;
    BackingADOQuery: TADOQuery;
    Panel: TPanel;
    Splitter: TSplitter;
    OpenBitBtn: TBitBtn;
    ImportBitBtn: TBitBtn;
    DataSource: TDataSource;
    BackingSpADOQuery: TADOQuery;
    PassportsDBGridEh: TDBGridEh;
    ActionManager: TActionManager;
    ImageList: TImageList;
    FileOpen: TFileOpen;
    App: TExcelApplication;
    PreviewClientDataSetKOLT: TFloatField;
    PreviewClientDataSetPROP_DIAM: TFloatField;
    PreviewClientDataSetPROP_THICK_C: TFloatField;
    PreviewClientDataSetPROP_WIDTH_C: TFloatField;
    PreviewClientDataSetPROP_LENGTH_C: TFloatField;
    PreviewClientDataSetNAME: TStringField;
    PreviewClientDataSetMARKIR: TStringField;
    PreviewClientDataSetDATEF: TDateTimeField;
    PreviewClientDataSetTRIMTYPE: TFloatField;
    PreviewClientDataSetMARKIR_PARENT: TStringField;
    SteelMarksADOQuery: TADOQuery;
    BackingSpADOQueryNREC: TFloatField;
    BackingSpADOQueryKOLT: TFloatField;
    BackingSpADOQueryPROP_PWIDTH1: TFloatField;
    BackingSpADOQueryPROP_PWIDTH2: TFloatField;
    BackingSpADOQueryPROP_SIZE1: TFloatField;
    BackingSpADOQueryPROP_SIZE2: TFloatField;
    BackingSpADOQueryPROP_WTHICK: TFloatField;
    BackingSpADOQueryPROP_SLENGTH: TFloatField;
    BackingSpADOQueryPROP_DIAM: TFloatField;
    BackingSpADOQueryPROP_SIZE: TFloatField;
    BackingSpADOQueryPROP_THICK_C: TFloatField;
    BackingSpADOQueryPROP_WIDTH_C: TFloatField;
    BackingSpADOQueryPROP_LENGTH_C: TFloatField;
    BackingSpADOQueryCPASSPORTS: TFloatField;
    BackingSpADOQueryNAME: TStringField;
    BackingSpADOQueryMARKIR: TStringField;
    BackingSpADOQueryCSPPASSPORTS: TFloatField;
    BackingSpADOQueryDATEF: TDateTimeField;
    BackingSpADOQueryPROP_A: TFloatField;
    BackingSpADOQueryPROP_B: TFloatField;
    BackingSpADOQueryPROP_C: TFloatField;
    BackingSpADOQueryPROP_D: TFloatField;
    BackingSpADOQueryTRIMTYPE: TFloatField;
    BackingSpADOQueryPROP_SQUARE: TFloatField;
    BackingSpADOQueryISLOM: TFMTBCDField;
    BackingSpADOQueryLOMDATE: TDateTimeField;
    BackingSpADOQueryLOMPERSON: TFloatField;
    BackingSpADOQueryLOMCOMMENT: TStringField;
    BackingADOQueryNREC: TFloatField;
    BackingADOQueryCSPARRIVALS: TFloatField;
    BackingADOQueryNUM: TStringField;
    BackingADOQuerySPENT: TFloatField;
    PreviewClientDataSetCSTEELMARK: TFloatField;
    PreviewClientDataSetSHORTNAME: TStringField;
    PreviewClientDataSetNUM: TStringField;
    SaveBitBtn: TBitBtn;
    FileSaveAs: TFileSaveAs;
    PreviewClientDataSetStringField: TStringField;
    SteelMarksADOQueryNREC: TFloatField;
    SteelMarksADOQueryUW: TFloatField;
    SteelMarksADOQueryACTIVE: TFloatField;
    SteelMarksADOQueryFREQ: TFloatField;
    SteelMarksADOQueryPRIM: TStringField;
    SteelMarksADOQueryGALNREC: TStringField;
    SteelMarksADOQuerySHORTNAME: TStringField;
    SteelMarksADOQueryCNORMDOC: TFloatField;
    procedure FileOpenAccept(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure BeforeOpen(DataSet: TDataSet);
    procedure FileSaveAsAccept(Sender: TObject);
    procedure ADOConnectionBeforeConnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PassportsDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ImportBitBtnClick(Sender: TObject);
    procedure RefreshRecord(DataSet: TDataSet);
    procedure BackingSpADOQueryAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportPassportsForm: TImportPassportsForm;

implementation

{$R *.dfm}

procedure TImportPassportsForm.ADOConnectionBeforeConnect(Sender: TObject);
begin
  ShowMessage('Алярма!');
end;

procedure TImportPassportsForm.BackingSpADOQueryAfterInsert(DataSet: TDataSet);
begin
  DataSet['PROP_PWIDTH1;PROP_PWIDTH2;PROP_SIZE1;PROP_SIZE2;PROP_WTHICK;PROP_SLENGTH;PROP_SIZE;PROP_A;PROP_B;PROP_C;PROP_D;PROP_SQUARE'] :=
  VarArrayOf([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
end;

procedure TImportPassportsForm.BeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

procedure TImportPassportsForm.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  ImportBitBtn.Enabled := PreviewClientDataSet.RecordCount > 0;
  FileSaveAs.Enabled := PreviewClientDataSet.RecordCount > 0;
end;

procedure TImportPassportsForm.FileOpenAccept(Sender: TObject);
var
  Book: _Workbook;
  Sheet: _Worksheet;
  Range, UsedRange: ExcelRange;
begin
  if FileOpen.Dialog.FileName <> '' then
    case FileOpen.Dialog.FilterIndex of
    1:
      try
        App.Connect;
        App.DisplayAlerts[LOCALE_USER_DEFAULT] := False;
        Book := App.Workbooks.Open(FileOpen.Dialog.FileName, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
          LOCALE_USER_DEFAULT);
        // TODO: add sheet selector
        Sheet := Book.Worksheets.Item[1] as _Worksheet;
        UsedRange := Sheet.UsedRange[LOCALE_USER_DEFAULT];
        Range := UsedRange.Range['3:3', EmptyParam];
        PreviewClientDataSet.DisableControls;
        PreviewClientDataSet.Close;
        PreviewClientDataSet.CreateDataSet;
        SteelMarksADOQuery.Close;
        SteelMarksADOQuery.Open;
        while App.Intersect(Range, UsedRange) <> nil do begin
          PreviewClientDataSet.Append;
          PreviewClientDataSet['MARKIR'] := Range.Range['A1', EmptyParam].Value2;
          PreviewClientDataSet['PROP_THICK_C;PROP_WIDTH_C;PROP_LENGTH_C'] :=
          VarArrayOf([Range.Range['B1', EmptyParam].Value2, Range.Range['C1', EmptyParam].Value2, Range.Range['D1', EmptyParam].Value2]);
          if SteelMarksADOQuery.Locate('SHORTNAME', Range.Range['E1', EmptyParam].Value2, [loCaseInsensitive]) then
            PreviewClientDataSet['CSTEELMARK'] := SteelMarksADOQuery['NREC'];
          PreviewClientDataSet['NAME'] := 'Лист ' + VarToStr(Range.Range['E1', EmptyParam].Value2);
          PreviewClientDataSet['PASPNUM'] := Range.Range['F1', EmptyParam].Value2;
          PreviewClientDataSet['DATEF'] := Range.Range['G1', EmptyParam].Value2;
          PreviewClientDataSet['MARKIR_PARENT'] := Range.Range['H1', EmptyParam].Value2;
          PreviewClientDataSet['KOLT'] := Range.Range['I1', EmptyParam].Value2;
          PreviewClientDataSet['COMMENT'] := Range.Range['J1', EmptyParam].Value2;
          PreviewClientDataSet['TRIMTYPE'] := 6;
          PreviewClientDataSet.Post;
          Range := Range.Offset[1, 0];
        end;
      finally
        App.DisplayAlerts[LOCALE_USER_DEFAULT] := True;
        App.Visible[LOCALE_USER_DEFAULT] := True;
        App.Disconnect;
        PreviewClientDataSet.EnableControls;
        PassportsDBGridEh.Visible := True;
        Splitter.Visible := True;
      end;
    2: PreviewClientDataSet.LoadFromFile(FileOpen.Dialog.FileName);
    else
      raise Exception.Create('Не умею читать из форматов файлов, отличных от Экселя!');
    end;
end;

procedure TImportPassportsForm.FileSaveAsAccept(Sender: TObject);
begin
  case FileSaveAs.Dialog.FilterIndex of
  1: PreviewClientDataSet.SaveToFile(FileSaveAs.Dialog.FileName, dfXML);
  2: PreviewClientDataSet.SaveToFile(FileSaveAs.Dialog.FileName, dfBinary);
  else
    PreviewClientDataSet.SaveToFile(FileSaveAs.Dialog.FileName, dfXMLUTF8);
  end;
end;

procedure TImportPassportsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ImportPassportsForm := nil;
end;

procedure TImportPassportsForm.ImportBitBtnClick(Sender: TObject);
var
  PaspNum: string;
  CSPPASSPORTS: Int64;
begin
  PreviewClientDataSet.DisableControls;
  PreviewClientDataSet.First;
  BackingADOQuery.Close;
  BackingSpADOQuery.Close;
  // disable passports genpaspnum trigger
  Host.ADOC.Execute('alter trigger CMKNEW.PASSPORTS_GENPASPNUM disable');
  BackingADOQuery.Open;
  BackingSpADOQuery.Open;
  try
    while not PreviewClientDataSet.Eof do begin
      PaspNum := 'A' + VarToStr(PreviewClientDataSet['PASPNUM']);
      if not BackingADOQuery.Locate('NUM', PaspNum, [loCaseInsensitive]) then begin
        BackingADOQuery.Append;
        BackingADOQuery['NUM'] := PaspNum;
        BackingADOQuery.Post;
      end;
      // SPPassports has a triigger which sets MARKIR to Passports.Num when
      // it's root passport specification (CSPPASSPORTS=0),
      // so we will search for NUM instead of MARKIR_PARENT... be cautious and
      // keep in mind that fact... you were warned ;)
      if not BackingSpADOQuery.Locate('MARKIR', PreviewClientDataSet['MARKIR_PARENT'], [loCaseInsensitive]) then
        if not BackingSpADOQuery.Locate('MARKIR', BackingADOQuery['NUM'], [loCaseInsensitive]) then
          BackingSpADOQuery.Append
        else
          BackingSpADOQuery.Edit
      else
        BackingSpADOQuery.Edit;
      BackingSpADOQuery['KOLT;PROP_DIAM;PROP_THICK_C;PROP_WIDTH_C;PROP_LENGTH_C;DATEF;LOMCOMMENT;MARKIR;NAME'] :=
      PreviewClientDataSet['KOLT;PROP_DIAM;PROP_THICK_C;PROP_WIDTH_C;PROP_LENGTH_C;DATEF;COMMENT;MARKIR_PARENT;NAME'];
      if VarIsNull(BackingSpADOQuery['PROP_DIAM']) then
        BackingSpADOQuery['PROP_DIAM'] := 0;
      BackingSpADOQuery['CPASSPORTS'] := BackingADOQuery['NREC'];
      BackingSpADOQuery.Post;
      CSPPASSPORTS := BackingSpADOQuery['NREC'];
      if not BackingSpADOQuery.Locate('MARKIR', PreviewClientDataSet['MARKIR'], [loCaseInsensitive]) then
        BackingSpADOQuery.Append
      else
        BackingSpADOQuery.Edit;
      BackingSpADOQuery['KOLT;PROP_DIAM;PROP_THICK_C;PROP_WIDTH_C;PROP_LENGTH_C;DATEF;LOMCOMMENT;MARKIR;NAME'] :=
      PreviewClientDataSet['KOLT;PROP_DIAM;PROP_THICK_C;PROP_WIDTH_C;PROP_LENGTH_C;DATEF;COMMENT;MARKIR;NAME'];
      BackingSpADOQuery['CSPPASSPORTS'] := CSPPASSPORTS;
      if VarIsNull(BackingSpADOQuery['PROP_DIAM']) then
        BackingSpADOQuery['PROP_DIAM'] := 0;
      BackingSpADOQuery['CPASSPORTS'] := BackingADOQuery['NREC'];
      BackingSpADOQuery.Post;
      PreviewClientDataSet.Next;
    end;
  finally
    Host.ADOC.Execute('alter trigger CMKNEW.PASSPORTS_GENPASPNUM enable');
    PreviewClientDataSet.EnableControls;
  end;
end;

procedure TImportPassportsForm.RefreshRecord(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.UpdateCursorPos;
  Query.Recordset.Resync(adAffectCurrent, adResyncAllValues);
  Query.Resync([]);
end;

procedure TImportPassportsForm.PassportsDBGridEhKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
  VK_F3: if PassportsDBGridEh.Columns[PassportsDBGridEh.Col - 1].FieldName = 'STEELMARK_S' then Host.RunPlugin('TSteelMarksSprPlugin');
  end;
end;

end.
