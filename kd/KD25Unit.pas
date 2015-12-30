unit KD25Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits, InclFileUnit,
  Spr1LabeledEditUnit, EquipmentUnit, ContractorUnit, DBGridEhGrouping,
  Vcl.DBCtrls, GridsEh, DBGridEh, CmkUserUnit, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, Vcl.Menus, DBAxisGridsEh, UPlugin;


type
  TKD25Form = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DMARKSADOQ: TADOQuery;
    InfoPanel3: TPanel;
    f_ORDERNUM: TLabeledEdit;
    f_ORDERNUM2: TLabeledEdit;
    SPGrid: TDBGridEh;
    DBNavigator1: TDBNavigator;
    DMARKSDS: TDataSource;
    f_ORDN: TLabeledEdit;
    f_MARK: TLabeledEdit;
    f_NAME: TLabeledEdit;
    f_WEIGHT1: TLabeledEdit;
    f_DRAWING: TLabeledEdit;
    DMarksPopupMenu: TPopupMenu;
    Freeze: TMenuItem;
    Defrost: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DMARKSADOQBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FreezeClick(Sender: TObject);
    procedure DefrostClick(Sender: TObject);
    procedure DMarksPopupMenuPopup(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_cmark:int64;
  end;

TKD25 = class
 CMARK: int64;
 ORDERNUM: string[10];
 ORDERNUM2: string[7];
 ORDN: string[5];
 MARK: string[100];
 NAME: string[255];
 WEIGHT1: double;
 DRAWING: string[100];
 Procedure Clear;
 Function ToForm(Var Form:TKD25Form):boolean;
 Function FromForm(Var Form:TKD25Form):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  KD25Form: TKD25Form;

implementation

{$R *.dfm}

uses
  StrUtils;

procedure TKD25Form.DefrostClick(Sender: TObject);
begin
  DMARKSADOQ.Edit;
  DMARKSADOQ['FROZEN'] := 0;
  DMARKSADOQ['PRIM'] := Trim(ReplaceStr(DMARKSADOQ['PRIM'], '[Заморожено]', ''));
  DMARKSADOQ.Post;
end;

procedure TKD25Form.DMARKSADOQBeforePost(DataSet: TDataSet);
begin
 DataSet['CMARK']:=f_CMARK;
 if DataSet.FieldByName('NREC').AsLargeInt=0 then DataSet['INPUTDATE']:=Now;
 if DataSet.FieldByName('NUMP').IsNull then DataSet['NUMP']:=space;
 if DataSet.FieldByName('NUMCOUNT').IsNull then DataSet['NUMCOUNT']:=0;
 if DataSet.FieldByName('WEIGHT1').IsNull then DataSet['WEIGHT1']:=0;
 DataSet['WEIGHT']:=DataSet.FieldByName('WEIGHT1').Value*DataSet.FieldByName('NUMCOUNT').Value;
 if VarIsNull(DataSet['PRIM']) or (DataSet['PRIM'] = '') then DataSet['PRIM'] :=space;
end;

procedure TKD25Form.DMarksPopupMenuPopup(Sender: TObject);
begin
  Freeze.Visible := DMARKSADOQ['FROZEN'] = 0;
  Defrost.Visible := DMARKSADOQ['FROZEN'] = 1;
end;

procedure TKD25Form.FormCreate(Sender: TObject);
begin
 DMARKSADOQ.Connection:=Host.ADOC;
end;

procedure TKD25Form.FormDestroy(Sender: TObject);
begin
 DMARKSADOQ.Close;
end;

procedure TKD25Form.FormShow(Sender: TObject);
begin
 SPGrid.SetFocus;
end;

procedure TKD25Form.FreezeClick(Sender: TObject);
begin
  DMARKSADOQ.Edit;
  DMARKSADOQ['FROZEN'] := 1;
  DMARKSADOQ['PRIM'] := Trim('[Заморожено] ' + DMARKSADOQ['PRIM']);
  DMARKSADOQ.Post;
end;

Constructor TKD25.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TKD25.Clear;
begin
 CMARK:=0;
 ORDERNUM:=EmptyStr;
 ORDERNUM2:=EmptyStr;
 ORDN:=EmptyStr;
 MARK:=EmptyStr;
 NAME:=EmptyStr;
 WEIGHT1:=0;
 DRAWING:=EmptyStr;
end;

Function TKD25.Edit(OForm:TComponent):boolean;
Var
 Form: TKD25Form;
begin
 Form:=TKD25Form.Create(OForm);
 if ToForm(Form) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
   If (Form.DMARKSDS.State=dsEdit) or (Form.DMARKSDS.State=dsInsert) then Try Form.DMARKSADOQ.Post; Except End;
  End;
 Form.Free;
end;

Function TKD25.ToForm(Var Form:TKD25Form):boolean;
Var
 orderby:string;
 wh:string;
 i:integer;
Begin
 Form.f_cmark:=cmark;

 Form.SPGrid.ReadOnly:=(CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=4);
 Form.DBNavigator1.Enabled:=(CurrentUser.CUSERGROUPS<>2) and (CurrentUser.CUSERGROUPS<>4);

 Form.f_ORDERNUM.Text:=ORDERNUM;
 Form.f_ORDERNUM2.Text:=ORDERNUM2;
 Form.f_ORDN.Text:=ORDN;
 Form.f_MARK.Text:=MARK;
 Form.f_NAME.Text:=NAME;
 Form.f_WEIGHT1.Text:=FloatToStr(WEIGHT1);
 Form.f_DRAWING.Text:=DRAWING;


 orderby:=' order by NUMP';
 wh:='CMARK='+IntToStr(CMARK);

 Form.DMARKSADOQ.SQL.Text:='select * from '+SchemaName+'DMARKS'+' where '+wh+orderby;
 Form.DMARKSADOQ.Open;



 result:=True;
End;

Function TKD25.FromForm(Var Form:TKD25Form):boolean;
Begin
 cmark:=Form.f_cmark;
 result:=True;
End;

Destructor TKD25.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

