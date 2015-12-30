unit SelectSpPlansUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, MemTableEh,
  CmkUserUnit, DBGridEhGrouping, GridsEh,
  DBGridEh, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh;


type
  TSelectSpPlansForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    spplansADOQ: TADOQuery;
    Panel3: TPanel;
    spplansGrid: TDBGridEh;
    spplansDS: TDataSource;
    PlansDBGridEh: TDBGridEh;
    PlansDS: TDataSource;
    PlansADOT: TADOTable;
    PlansADOTNREC: TFloatField;
    PlansADOTPYEAR: TFMTBCDField;
    PlansADOTPMONTH: TFMTBCDField;
    PlansADOTPRIM: TStringField;
    PlansADOTPPONREC: TFloatField;
    PlansADOTORAUSER: TStringField;
    PlansADOTMONTH: TStringField;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spplansGridDblClick(Sender: TObject);
    procedure spplansGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PlansADOTCalcFields(DataSet: TDataSet);
    procedure PlansADOTAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TSelectSpPlans = class
 CSPPLANS: TStringList;
 Procedure Clear;
 Function ToForm(Var Form:TSelectSpPlansForm;PlansFilter:string):boolean;
 Function FromForm(Var Form:TSelectSpPlansForm):boolean;
 Function Edit(OForm:TComponent;PlansFilter:string):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SelectSpPlansForm: TSelectSpPlansForm;

implementation

{$R *.dfm}

procedure TSelectSpPlansForm.FormCreate(Sender: TObject);
Var
 orderby:string;
begin
// orderby:=' order by freq desc,name';
 spplansADOQ.Connection:=Host.ADOC;
 PlansADOT.Connection := Host.ADOC;
end;

procedure TSelectSpPlansForm.FormDestroy(Sender: TObject);
begin
// contractorsADOQ.Close;
end;

procedure TSelectSpPlansForm.FormShow(Sender: TObject);
begin
 spplansGrid.SetFocus;
end;

procedure TSelectSpPlansForm.PlansADOTAfterScroll(DataSet: TDataSet);
begin
  spplansADOQ.Filter := 'CPLANS=' + VarToStr(DataSet['NREC']);
end;

procedure TSelectSpPlansForm.PlansADOTCalcFields(DataSet: TDataSet);
begin
  case DataSet['PMONTH'] of
  1: DataSet['MONTH'] := 'январь';
  2: DataSet['MONTH'] := 'февраль';
  3: DataSet['MONTH'] := 'март';
  4: DataSet['MONTH'] := 'апрель';
  5: DataSet['MONTH'] := 'май';
  6: DataSet['MONTH'] := 'июнь';
  7: DataSet['MONTH'] := 'июль';
  8: DataSet['MONTH'] := 'август';
  9: DataSet['MONTH'] := 'сентябрь';
  10: DataSet['MONTH'] := 'октябрь';
  11: DataSet['MONTH'] := 'ноябрь';
  12: DataSet['MONTH'] := 'декабрь';
  else
    DataSet['MONTH'] := 'неизвестно';
  end;
end;

procedure TSelectSpPlansForm.spplansGridDblClick(Sender: TObject);
begin
 Close();
 Self.ModalResult:=mrOK;
end;

procedure TSelectSpPlansForm.spplansGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=vk_insert) or (Key=VK_SPACE) then
  Begin
//   ShowMessage('test');
   if spplansGrid.SelectedRows.CurrentRowSelected then spplansGrid.SelectedRows.CurrentRowSelected:=False
                                                  else spplansGrid.SelectedRows.CurrentRowSelected := True;
   if Not spplansADOQ.Eof then spplansADOQ.Next;
   Key:=0;
  End;
end;

Constructor TSelectSpPlans.Create;
begin
 inherited Create;
 CSPPLANS:=TStringList.Create;
 Clear;
end;

Procedure TSelectSpPlans.Clear;
begin
 CSPPLANS.Clear;
end;

Function TSelectSpPlans.Edit(OForm:TComponent;PlansFilter:string):boolean;
Var
 Form: TSelectSpPlansForm;
begin
 Form:=TSelectSpPlansForm.Create(OForm);

 if ToForm(Form,PlansFilter) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSelectSpPlans.ToForm(Var Form:TSelectSpPlansForm;PlansFilter:string):boolean;
Var
 i:integer;
Begin
 Form.spplansADOQ.SQL.Text:='select '+
 'pl.nrec as cplans, '+
 'pl.pyear as pyear, '+
 'pl.pmonth as pmonth, '+
 'sppl.NREC as cspplans, '+
 'sppl.CONTRACTOR_S as CONTRACTOR_S, '+
 'sppl.ORDERNUM as ORDERNUM, '+
 'sppl.ORDERNUM2 as ORDERNUM2, '+
 'sppl.ORDN as ORDN, '+
 'sppl.MARK_S as MARK_S, '+
 'sppl.KOLSHT as KOLSHT, '+
 'sppl.WEIGHT as WEIGHT, '+
 'sppl.PRIM as PRIM'+
 ' from '+SchemaName+'plans pl, '+SchemaName+'spplans sppl'+' where sppl.cplans=pl.nrec and '+PlansFilter+' order by pl.pyear,pl.pmonth,sppl.ORDERNUM,sppl.ORDERNUM2,sppl.ORDN';
 Form.spplansADOQ.Open;
 Form.PlansADOT.Open;

 Form.spplansADOQ.Filtered := False;
 for i := 0 to CSPPLANS.Count-1 do
  Begin
   if Form.spplansADOQ.Locate('cspplans',StrToIntM(CSPPLANS[i]),[]) then begin
     if Form.PlansADOT.Locate('NREC', Form.SpPlansADOQ['CPLANS'], []) then
       Form.spplansGrid.SelectedRows.CurrentRowSelected := True;
   end;
  End;
 Form.spplansADOQ.Filtered := True;

{// if CSPPLANS<>0 then Form.spplansADOQ.Locate('cspplans',CSPPLANS,[])
 {              else Form.spplansADOQ.First;}
 result:=True;
End;

Function TSelectSpPlans.FromForm(Var Form:TSelectSpPlansForm):boolean;
Var
 i:integer;
Begin
 Form.spplansADOQ.DisableControls;
 CSPPLANS.Clear;
 if Form.spplansADOQ.Active and (Form.spplansADOQ.RecordCount>0) then
  Begin
   if Form.spplansGrid.SelectedRows.Count>0 then
    Begin
   for i:=0 to Form.spplansGrid.SelectedRows.Count-1 do
    Begin
     Try
      Form.spplansADOQ.GotoBookmark(Pointer(Form.spplansGrid.SelectedRows.Items[i]));
      CSPPLANS.Append(VarToStr(Form.spplansADOQ['CSPPLANS']));
//      CSPPLANS:=Form.spplansADOQ['CSPPLANS'];
     Except
     End;
    End
    End
     else
    Begin
     if Form.spplansADOQ.RecNo>0 then CSPPLANS.Append(VarToStr(Form.spplansADOQ['CSPPLANS']));
    End;
  End;
 Form.spplansADOQ.Close;
 Form.spplansADOQ.EnableControls;
 result:=True;
End;

Destructor TSelectSpPlans.Destroy;
begin
 Clear;
 CSPPLANS.Free;
 inherited Destroy;
end;

end.

