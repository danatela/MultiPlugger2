unit SelectDetailsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, MemTableEh,
  CmkUserUnit, DBGridEhGrouping, GridsEh, KD3Unit, PaspDetailUnit,
  DBGridEh, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList, MemTableDataEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh;

type
  TSelectDetailsForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    spplansGrid: TDBGridEh;
    DS: TDataSource;
    MTE: TMemTableEh;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spplansGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MTEBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    f_CSPPASSPORTS: int64;
  end;

  TSelectDetails = class
    MTE: TMemTableEh;
    Procedure Clear;
    Function ToForm(Var Form: TSelectDetailsForm; PlansFilter: string;
      CSPPASSPORTS: int64): boolean;
    Function FromForm(Var Form: TSelectDetailsForm): boolean;
    Function Edit(OForm: TComponent; PlansFilter: string;
      CSPPASSPORTS: int64): boolean;
    constructor Create;
    destructor Destroy; override;
  end;

var
  SelectDetailsForm: TSelectDetailsForm;

implementation

{$R *.dfm}

procedure TSelectDetailsForm.FormDestroy(Sender: TObject);
begin
  // contractorsADOQ.Close;
end;

procedure TSelectDetailsForm.FormShow(Sender: TObject);
begin
  spplansGrid.SetFocus;
  spplansGrid.Col := 11;
end;

procedure TSelectDetailsForm.MTEBeforePost(DataSet: TDataSet);
begin
  DataSet['WEIGHT'] := DataSet['KOLSHTF'] * DataSet['WEIGHT1F'];
end;

procedure TSelectDetailsForm.spplansGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    vk_return:
      Begin
        If MTE.Active and ((DS.State = dsEdit) or (DS.State = dsInsert)) then
          Try
            MTE.Post;
          Except
            MTE.Cancel;
          End;
        Key := 0;
      End;
  end;
end;

Procedure CreateMTEStruct(Var MTE: TMemTableEh);
Begin
  MTE.FieldDefs.Clear;
  MTE.FieldDefs.Add('PYEAR', ftInteger);
  MTE.FieldDefs.Add('PMONTH', ftInteger);
  MTE.FieldDefs.Add('CSPPLANS', ftLargeInt);
  MTE.FieldDefs.Add('CDETAILS', ftLargeInt);
  MTE.FieldDefs.Add('DATEIZG', ftDate);
  MTE.FieldDefs.Add('ORDERNUM', ftString, 10);
  MTE.FieldDefs.Add('ORDERNUM2', ftString, 7);
  MTE.FieldDefs.Add('ORDN', ftString, 5);
  MTE.FieldDefs.Add('CONTRACTOR_S', ftString, 255);
  MTE.FieldDefs.Add('MARK_S', ftString, 255);
  MTE.FieldDefs.Add('SPPLKOLSHT', ftInteger);
  MTE.FieldDefs.Add('SPPLWEIGHT', ftFloat);
  MTE.FieldDefs.Add('SPPLPRIM', ftString, 255);
  MTE.FieldDefs.Add('DETAILS_S', ftString, 255);
  MTE.FieldDefs.Add('NUMP', ftString, 20);

  MTE.FieldDefs.Add('KOLSHTP', ftInteger);
  MTE.FieldDefs.Add('KOLSHTF', ftInteger);
  MTE.FieldDefs.Add('WEIGHT1', ftFloat);
  MTE.FieldDefs.Add('WEIGHT1F', ftFloat);
  MTE.FieldDefs.Add('WEIGHT', ftFloat);
End;

Constructor TSelectDetails.Create;
begin
  inherited Create;
  MTE := TMemTableEh.Create(nil);
  CreateMTEStruct(MTE);
  Clear;
end;

Procedure TSelectDetails.Clear;
begin
  MTE.Close;
  MTE.DestroyTable;
  MTE.CreateDataSet;
  MTE.Open;
end;

Function TSelectDetails.Edit(OForm: TComponent; PlansFilter: string;
  CSPPASSPORTS: int64): boolean;
Var
  Form: TSelectDetailsForm;
begin
  Form := TSelectDetailsForm.Create(OForm);

  if ToForm(Form, PlansFilter, CSPPASSPORTS) then
  Begin
    if Form.ShowModal = mrOK then
    Begin
      result := FromForm(Form);
    End
    else
      result := False;
  End;
  Form.Free;
end;

Function TSelectDetails.ToForm(Var Form: TSelectDetailsForm;
  PlansFilter: string; CSPPASSPORTS: int64): boolean;
Var
  i: integer;
  DetailsADOQ: TAdoQuery;
  kd3: TKD3;
Begin
  Form.f_CSPPASSPORTS := CSPPASSPORTS;
  CreateMTEStruct(Form.MTE);
  Form.MTE.CreateDataSet;
  Form.MTE.Open;

  kd3 := TKD3.Create;

  DetailsADOQ := TAdoQuery.Create(nil);
  DetailsADOQ.Connection := Host.ADOC;

  // DetailsADOQ.SQL.Text:='select * from '+SchemaName+'SPPASSPORTSD'+' where CSPPASSPORTS='+IntToStr(CurrentADOQ['nrec').AsLargeInt)+' order by DATEIZG,DETAILS_S';

  DetailsADOQ.SQL.Text := 'select ' + 'pl.pyear as pyear, ' +
    'pl.pmonth as pmonth, ' + 'sppl.NREC as cspplans, ' +
    'sppl.CONTRACTOR_S as CONTRACTOR_S, ' + 'sppl.ORDERNUM as ORDERNUM, ' +
    'sppl.ORDERNUM2 as ORDERNUM2, ' + 'sppl.ORDN as ORDN, ' +
    'sppl.MARK_S as MARK_S, ' + 'sppl.KOLSHT as SPPLKOLSHT, ' +
    'sppl.WEIGHT as SPPLWEIGHT, ' + 'sppl.PRIM as SPPLPRIM,' +
    'det.NUMP as NUMP,' + '(md.NUMCOUNT*sppl.KOLSHT) as KOLSHTP,' +
    'det.NREC as CDETAILS,' + 'det.WEIGHT1 as WEIGHT1,' +
  // 'det.GRMATERIALS_S as DETAILS_S'+
    '         CASE GRM.CPARENT' + '            WHEN 3' + '            THEN' +
    '               det.GRMATERIALS_S                            ' +
    '            WHEN 4' + '            THEN' + '                  ''Лист ''' +
    '               || det.PROP_WIDTH_C' + '               || ''*''' +
    '               || det.PROP_THICK_C' + '               || ''*''' +
    '               || det.PROP_LENGTH_C' + '            WHEN 5' +
    '            THEN' + '                  ''Квадрат ''' +
    '               || det.PROP_SIZE' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 6' +
    '            THEN' + '                  ''Гнутый профиль ''' +
    '               || det.PROP_SIZE1' + '               || ''*''' +
    '               || det.PROP_SIZE2' + '               || ''*''' +
    '               || det.PROP_WTHICK' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 7' +
    '            THEN' + '                  ''Круг '#7443#39 +
    '               || det.PROP_DIAM' + '               || ''*''' +
    '               || det.PROP_WTHICK' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 8' +
    '            THEN' + '                  ''Балка ''' +
    '               || det.PROP_PROFNUM' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 9' +
    '            THEN' + '                  ''Балка ''' +
    '               || det.PROP_PROFNUM' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 10' +
    '            THEN' + '                  ''Уголок ''' +
    '               || det.PROP_PWIDTH1' + '               || ''*''' +
    '               || det.PROP_PWIDTH2' + '               || ''*''' +
    '               || det.PROP_WTHICK' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 11' +
    '            THEN' + '                  ''Швеллер ''' +
    '               || det.PROP_PROFNUM' + '               || ''*''' +
    '               || det.PROP_SLENGTH' + '            WHEN 100' +
    '            THEN' + '                  ''Круг '#7443#39 +
    '               || det.PROP_DIAM' + '               || ''*''' +
    '               || det.PROP_SLENGTH' +
    '            WHEN 101                                            ' +
    '            THEN' + '                  det.PROP_FIXTYPE_C' +
    '               || '' ''' + '               || det.PROP_CARVTYPE_C' +
    '               || '' ''' + '               || det.PROP_DIAM' +
    '               || ''*''' + '               || det.PROP_SLENGTH' +
    '         END' + '            DETAILS_S' + ' from ' + SchemaName +
    'plans pl, ' + SchemaName + 'spplans sppl,' + SchemaName + 'kd kd,' +
    SchemaName + 'marks marks,' + SchemaName + 'dmarks md,' + SchemaName +
    'details det,' + SchemaName + 'grmaterials grm' + ' where ' +
    'sppl.cplans=pl.nrec' + andd + 'sppl.ORDERNUM=kd.ORDERNUM' + andd +
    'marks.CKD=kd.NREC' + andd +
  // 'marks.ORDERNUM2=sppl.ORDERNUM2'+andd+
    'kd.ORDERNUM2=sppl.ORDERNUM2' + andd + 'marks.ORDN=sppl.ORDN' + andd +
    'det.CKD=kd.NREC' + andd + 'det.cgrmaterials=grm.nrec' + andd +
    'Not (det.NUMP is NULL)' + andd + 'Not (md.NUMP is NULL)' + andd +
    'Not (md.NUMCOUNT is NULL)' + andd + 'det.NUMP=md.NUMP' + andd +
    'md.CMARK=marks.nrec' + andd + 'md.NUMCOUNT>0' + andd + PlansFilter +
    ' order by pl.pyear,pl.pmonth,sppl.ORDERNUM,sppl.ORDERNUM2,sppl.ORDN,det.NUMP';
  // ToLog(DetailsADOQ.SQL.Text);
  DetailsADOQ.Open;

  while Not DetailsADOQ.Eof do
  Begin
    Form.MTE.Append;
    Form.MTE.CopyFields(DetailsADOQ);
    Form.MTE['WEIGHT1'] := Form.MTE['WEIGHT1'] / 1000;
    Form.MTE['DATEIZG'] := Trunc(Now);
    if kd3.GetByNrec(int64(Form.MTE['CDETAILS'])) then
      Form.MTE['WEIGHT1F'] := CalcWEIGHT1(Real(Form.MTE['WEIGHT1']),
        Form.f_CSPPASSPORTS, kd3)
      // Пересчет веса в зависимости от габаритов детали
    else
      Form.MTE['WEIGHT1F'] := Form.MTE['WEIGHT1'];
    if VarIsNull(Form.MTE['KOLSHTF']) then
      Form.MTE['KOLSHTF'] := 0;
    Form.MTE.Post;
    DetailsADOQ.Next;
  End;

  {
    for i := 0 to CSPPLANS.Count-1 do
    Begin
    if Form.spplansADOQ.Locate('cspplans',StrToIntM(CSPPLANS[i]),[]) then Form.spplansGrid.SelectedRows.CurrentRowSelected := True;
    End;
  }
  // if CSPPLANS<>0 then Form.spplansADOQ.Locate('cspplans',CSPPLANS,[])
  { else } Form.MTE.First;

  DetailsADOQ.Close;
  DetailsADOQ.Free;
  kd3.Free;

  ReadOnlyColorsUpdateForGrid(Form.spplansGrid, clWindow, clBtnFace);

  result := True;
End;

Function TSelectDetails.FromForm(Var Form: TSelectDetailsForm): boolean;
Var
  i: integer;
Begin
  Form.MTE.DisableControls;
  Clear;
  If Form.MTE.Active and ((Form.DS.State = dsEdit) or (Form.DS.State = dsInsert))
  then
    Try
      Form.MTE.Post;
    Except
      Form.MTE.Cancel;
    End;
  Form.MTE.First;
  while Not Form.MTE.Eof do
  Begin
    if Not VarIsNull(Form.MTE['KOLSHTF']) then
    Begin
      if Form.MTE['KOLSHTF'] > 0 then
      Begin
        MTE.Append;
        MTE.CopyFields(Form.MTE);
        MTE.Post;
      End;
    End;
    Form.MTE.Next;
  End;
  Form.MTE.Close;
  Form.MTE.EnableControls;
  result := True;
End;

Destructor TSelectDetails.Destroy;
begin
  Clear;
  MTE.Free;
  inherited Destroy;
end;

end.
