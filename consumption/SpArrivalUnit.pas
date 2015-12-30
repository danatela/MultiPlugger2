unit SpArrivalUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits,
  Spr1LabeledEditUnit, SteelMarkUnit, Spr1JvCalcEditUnit, DBGridEhGrouping,
  Vcl.PlatformDefaultStyleActnCtrls, GridsEh, DBGridEh, Vcl.ComCtrls,
  UniversalSpr2Unit, CmkUserUnit, Vcl.ImgList, MemTableDataEh, MemTableEh,
  GrMaterialsUnit, SelectSpPlansUnit, Vcl.Menus, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, DBAxisGridsEh;


type
  TSpArrivalForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    PROP_LENGTHADOQ: TADOQuery;
    PROP_WIDTHADOQ: TADOQuery;
    PROP_THICKADOQ: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Splitter2: TSplitter;
    SpArrivalsGrid: TDBGridEh;
    ImageList1: TImageList;
    ActionManager1: TActionManager;
    AppendSpPlansAction: TAction;
    DelSpPlansAction: TAction;
    OrdersMTE: TMemTableEh;
    OrdersMTECSPPLANS: TLargeintField;
    OrdersMTEORDERNUM: TStringField;
    OrdersMTEORDERNUM2: TStringField;
    OrdersMTEORDN: TStringField;
    OrdersMTEMARK_S: TStringField;
    OrdersDS: TDataSource;
    OrdersMTEPLANINFO: TStringField;
    GRMATERIALSADOQ: TADOQuery;
    PMATERIALADOQ: TADOQuery;
    Panel2: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    f_STATE: TRadioGroup;
    f_KOLT: TJvCalcEdit;
    f_PRIM: TLabeledEdit;
    Panel6: TPanel;
    Label18: TLabel;
    CGRMATERIALSComboUpdateBtn: TBitBtn;
    CGRMATERIALSAppendBtn: TBitBtn;
    f_CGRMATERIALS: TComboBox;
    f_CPMATERIAL: TComboBox;
    PropGroupBox: TGroupBox;
    f_PROP_PWIDTH1Label: TLabel;
    f_PROP_PWIDTH2Label: TLabel;
    f_PROP_SIZE1Label: TLabel;
    f_PROP_SIZE2Label: TLabel;
    f_PROP_WTHICKLabel: TLabel;
    f_PROP_SLENGTHLabel: TLabel;
    f_PROP_DIAMLabel: TLabel;
    f_PROP_SIZELabel: TLabel;
    f_PROP_THICKLabel: TLabel;
    f_PROP_WIDTHLabel: TLabel;
    f_PROP_LENGTHLabel: TLabel;
    f_PROP_PWIDTH1: TJvCalcEdit;
    f_PROP_PWIDTH2: TJvCalcEdit;
    f_PROP_SIZE1: TJvCalcEdit;
    f_PROP_SIZE2: TJvCalcEdit;
    f_PROP_WTHICK: TJvCalcEdit;
    f_PROP_SLENGTH: TJvCalcEdit;
    f_PROP_DIAM: TJvCalcEdit;
    f_PROP_SIZE: TJvCalcEdit;
    f_PROP_THICK: TComboBox;
    PROP_THICKComboUpdateBtn: TBitBtn;
    f_PROP_WIDTH: TComboBox;
    PROP_WIDTHComboUpdateBtn: TBitBtn;
    f_PROP_LENGTH: TComboBox;
    PROP_LENGTHComboUpdateBtn: TBitBtn;
    PROP_THICKAppendBtn: TBitBtn;
    PROP_WIDTHAppendBtn: TBitBtn;
    PROP_LENGTHAppendBtn: TBitBtn;
    f_KOLSHT: TLabeledEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PROP_THICKAppendBtnClick(Sender: TObject);
    procedure PROP_THICKComboUpdateBtnClick(Sender: TObject);
    procedure PROP_WIDTHAppendBtnClick(Sender: TObject);
    procedure PROP_WIDTHComboUpdateBtnClick(Sender: TObject);
    procedure PROP_LENGTHAppendBtnClick(Sender: TObject);
    procedure PROP_LENGTHComboUpdateBtnClick(Sender: TObject);
    procedure f_CPMATERIALChange(Sender: TObject);
    procedure f_CGRMATERIALSChange(Sender: TObject);
    procedure UpdatePropList;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CGRMATERIALSAppendBtnClick(Sender: TObject);
    procedure CGRMATERIALSComboUpdateBtnClick(Sender: TObject);
    procedure f_KOLSHTChange(Sender: TObject);
    procedure DelSpPlansActionExecute(Sender: TObject);
    procedure AppendSpPlansActionExecute(Sender: TObject);
    procedure OrdersDSDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure ActionsEnabling;
  public
    { Public declarations }
    f_nrec:int64;
    f_carrivals:int64;
    f_ToFormFlag:boolean;
    f_EditRights:boolean;
  end;

TSpArrival = class
 NREC: int64;
 CARRIVALS: int64;
 NUM: integer;
 CGRMATERIALS: int64;
 GRMATERIALS_S: string[255];
 KOLSHT: integer;
 KOLT: double;
 SPPLANS: string;
 SPPLANS_S: string[255];
 PRIM: string[255];
 STATE: boolean;
 PROP_PWIDTH1: double;
 PROP_PWIDTH2: double;
 PROP_SIZE1: double;
 PROP_SIZE2	: double;
 PROP_WTHICK	: double;
 PROP_SLENGTH	: double;
 PROP_DIAM	: double;
 PROP_SIZE	: double;
 PROP_THICK: int64;
 PROP_WIDTH: int64;
 PROP_LENGTH: int64;
 PROP_THICK_C	: double;
 PROP_WIDTH_C	: double;
 PROP_LENGTH_C	: double;
 Procedure Clear;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Function GetByNrec(vnrec:int64):boolean;
 Function Save(OForm:TComponent;Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TSpArrivalForm;New:boolean):boolean;
 Function FromForm(Var Form:TSpArrivalForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False;EditRights:boolean=True):boolean;
 Procedure PropsToForm(Form:TComponent);
 Procedure UpdateGRMATERIALS_S;
 Procedure UpdatePROP_THICK_C;
 Procedure UpdatePROP_WIDTH_C;
 Procedure UpdatePROP_LENGTH_C;
 Function GetRazmernostStr(CPARENT:int64):string;
 constructor Create;
 destructor Destroy; override;
end;

var
  SpArrivalForm: TSpArrivalForm;

implementation

{$R *.dfm}

Function TSpArrival.GetRazmernostStr(CPARENT:int64):string;
Begin
 result:=EmptyStr;
   case CPARENT of
{Лист}     4: Begin
               if PROP_THICK_C<>0 then result:=FloatToStr(PROP_THICK_C);
               if PROP_WIDTH_C<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_WIDTH_C);
                End;
               if PROP_LENGTH_C<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_LENGTH_C);
                End;
              End;
{Квадрат}  5: Begin
               if PROP_SIZE<>0 then result:=FloatToStr(PROP_SIZE);
               if PROP_SLENGTH<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SLENGTH);
                End;
              End;
{Гнутый
 профиль}  6: Begin
               if PROP_SIZE1<>0 then result:=FloatToStr(PROP_SIZE1);
               if PROP_SIZE2<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SIZE2);
                End;
               if PROP_WTHICK<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_WTHICK);
                End;
               if PROP_SLENGTH<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SLENGTH);
                End;
              End;
{труба}    7: Begin
               if PROP_DIAM<>0 then
                Begin
                 result:='диам.'+FloatToStr(PROP_DIAM);
                End;
               if PROP_WTHICK<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_WTHICK);
                End;
               if PROP_SLENGTH<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SLENGTH);
                End;
              End;
{балка}  8,9: Begin
               if PROP_SLENGTH<>0 then
                Begin
                 result:=FloatToStr(PROP_SLENGTH);
                End;
              End;
{Уголок}  10: Begin
               if PROP_PWIDTH1<>0 then result:=FloatToStr(PROP_PWIDTH1);
               if PROP_PWIDTH2<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_PWIDTH2);
                End;
               if PROP_WTHICK<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_WTHICK);
                End;
               if PROP_SLENGTH<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SLENGTH);
                End;
              End;
{Швеллер} 11: Begin
               if PROP_SLENGTH<>0 then
                Begin
                 result:=FloatToStr(PROP_SLENGTH);
                End;
              End;
  {Круг} 100: Begin
               if PROP_DIAM<>0 then
                Begin
                 result:='диам.'+FloatToStr(PROP_DIAM);
                End;
               if PROP_SLENGTH<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SLENGTH);
                End;
              End;
  {Крепеж} 101: Begin
               if PROP_DIAM<>0 then
                Begin
                 result:='диам.'+FloatToStr(PROP_DIAM);
                End;
               if PROP_SLENGTH<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_SLENGTH);
                End;
              End;
   end;
End;

Procedure TSpArrival.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CARRIVALS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'NUM', ftInteger);
 MTE.FieldDefs.Add(Prefix+'CGRMATERIALS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'GRMATERIALS_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'KOLSHT', ftInteger);
 MTE.FieldDefs.Add(Prefix+'KOLT', ftFloat);
 MTE.FieldDefs.Add(Prefix+'SPPLANS', ftMemo);
 MTE.FieldDefs.Add(Prefix+'SPPLANS_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'PRIM', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'STATE', ftInteger);
 MTE.FieldDefs.Add(Prefix+'PROP_PWIDTH1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_PWIDTH2', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE2', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_WTHICK', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SLENGTH', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_DIAM', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_THICK', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_WIDTH', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_LENGTH', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_THICK_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_WIDTH_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_LENGTH_C', ftFloat);
End;

Procedure GetPropListOfPARENT(CPARENT:int64;Var PropList:TStringList);
Var
 i:integer;
Begin
 PropList.Clear;
 if CPARENT>0 then
  Begin
   PropList.CommaText:=UpperCase(GetTextValueOfPointer(IntToStr(cparent),SchemaName+'MATERIALS','nrec','CHILDPROP',False));
  End;
End;

procedure TSpArrivalForm.UpdatePropList;
Var
 tempValue:int64;
 i,CTop:integer;
 PropList:TStringList;
 vis:boolean;
 Gr:TGrMaterials;
Procedure CheckVisible(PropName:string);
Var
 c1,c2,c3,c4:TComponent;
Begin
 c1:=FindComponent('f_'+PropName);
 c2:=FindComponent('f_'+PropName+'Label');
 c3:=FindComponent(PropName+'ComboUpdateBtn');
 c4:=FindComponent(PropName+'AppendBtn');
 if PropList.IndexOf(PropName)=-1 then
  Begin
   if Assigned(c1) then
    Begin
     if (c1 is TEdit) then (c1 as TEdit).Visible:=False;
     if (c1 is TJvCalcEdit) then (c1 as TJvCalcEdit).Visible:=False;
     if (c1 is TComboBox) then (c1 as TComboBox).Visible:=False;
    End;
   if Assigned(c2) then (c2 as TLabel).Visible:=False;
   if Assigned(c3) then (c3 as TBitBtn).Visible:=False;
   if Assigned(c4) then (c4 as TBitBtn).Visible:=False;
  End
   else
  Begin
//   ShowMessage(PropName+' - CTop='+IntToStr(CTop));
   if Assigned(c1) then
    Begin
//     ShowMessage('c1 нашли');
     if (c1 is TEdit) then
      Begin
       if Not vis then Try (c1 as TEdit).SetFocus; Except End;
       vis:=True;
       (c1 as TEdit).Visible:=True;
       (c1 as TEdit).Top:=CTop;
      End;
     if (c1 is TJvCalcEdit) then
      Begin
       if Not vis then Try (c1 as TJvCalcEdit).SetFocus; Except End;
       vis:=True;
       (c1 as TJvCalcEdit).Visible:=True;
       (c1 as TJvCalcEdit).Top:=CTop;
      End;
     if (c1 is TComboBox) then
      Begin
       if Not vis then Try (c1 as TComboBox).SetFocus; Except End;
       vis:=True;
       (c1 as TComboBox).Visible:=True;
       (c1 as TComboBox).Top:=CTop;
      End;
    End;
   if Assigned(c2) then
    Begin
//     ShowMessage('c2 нашли');
     vis:=True;
     (c2 as TLabel).Visible:=True;
     (c2 as TLabel).Top:=CTop+3;
    End;
   if Assigned(c3) then
    Begin
//     ShowMessage('c3 нашли');
     vis:=True;
     (c3 as TBitBtn).Visible:=True;
     (c3 as TBitBtn).Top:=CTop-2;
    End;
   if Assigned(c4) then
    Begin
     vis:=True;
     (c4 as TBitBtn).Visible:=True;
     (c4 as TBitBtn).Top:=CTop-2;
    End;
   Inc(CTop,27);
  End;
End;
begin
// ShowMessage('UpdatePropList Begin');
 PropList:=TStringList.Create;
 tempValue:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
// ShowMessage('1');
 GetPropListOfGRMATERIAL(tempValue,PropList);
// ShowMessage('2');

 Gr:=TGrMaterials.Create;
// ShowMessage('3');
 If Gr.GetByNrec(tempValue) then Gr.DelFilledProps(PropList);
 Gr.Free;

// ShowMessage('4');
 CTop:=16; vis:=False;
 CheckVisible('PROP_PWIDTH1');
 CheckVisible('PROP_PWIDTH2');
 CheckVisible('PROP_SIZE1');
 CheckVisible('PROP_SIZE2');
 CheckVisible('PROP_WTHICK');
 CheckVisible('PROP_SLENGTH');
 CheckVisible('PROP_DIAM');
 CheckVisible('PROP_SIZE');
 CheckVisible('PROP_THICK');
 CheckVisible('PROP_WIDTH');
 CheckVisible('PROP_LENGTH');
// ShowMessage('5');
 PropGroupBox.Visible:=vis;
// ShowMessage('6');
 if WindowState<>wsMaximized then Height:=CTop+Panel6.Height+Panel5.Height+Panel3.Height+120;
 PropList.Free;
// ShowMessage('UpdatePropList End');
end;


Function TSpArrival.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'SPARRIVALS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

procedure TSpArrivalForm.f_CGRMATERIALSChange(Sender: TObject);
begin
 UpdatePropList;
 f_KOLSHTChange(Sender);
end;

procedure TSpArrivalForm.AppendSpPlansActionExecute(Sender: TObject);
Var
 CSPPLANS:int64;
 sp:TSelectSpPlans;
 adoq:TAdoQuery;
 i:integer;
begin
 if AppendSpPlansAction.Enabled then
  Begin
   sp:=TSelectSpPlans.Create;
   OrdersMTE.DisableControls;
   OrdersMTE.First;
   while Not OrdersMTE.Eof do
    Begin
     sp.CSPPLANS.Append(OrdersMTE.FieldByName('CSPPLANS').AsString);
     OrdersMTE.Next;
    End;
   OrdersMTE.First;
   OrdersMTE.EnableControls;
   if sp.Edit(Self,'1=1') then
    Begin
     OrdersMTE.DisableControls;
     for I := 0 to sp.CSPPLANS.Count-1 do
     Begin
     if Not OrdersMTE.Locate('CSPPLANS',sp.CSPPLANS[i],[]) then
     Begin
     OrdersMTE.Append;
     OrdersMTE.FieldByName('CSPPLANS').AsLargeInt:=StrToIntM(sp.CSPPLANS[i]);
     adoq:=TAdoQuery.Create(nil);
     adoq.Connection:=Host.ADOC;
     adoq.SQL.Text:='select PL.PYEAR as pyear,'+
                           'PL.PMONTH as pmonth,'+
                           'SPPL.ORDERNUM as ORDERNUM,'+
                           'SPPL.ORDERNUM2 as ORDERNUM2,'+
                           'SPPL.ORDN as ORDN,'+
                           'SPPL.MARK_S as MARK_S'+
                           ' from '+SchemaName+'PLANS PL,'+SchemaName+'SPPLANS SPPL'+' where SPPL.nrec='+sp.CSPPLANS[i]+' and SPPL.CPLANS=PL.nrec';
     adoq.Open;
     if adoq.RecordCount=1 then
      Begin
       OrdersMTE.FieldByName('PLANINFO').AsString:=Padl(adoq.FieldByName('PMONTH').AsString,2,zero)+dot+adoq.FieldByName('PYEAR').AsString;
       OrdersMTE.FieldByName('ORDERNUM').AsString:=adoq.FieldByName('ORDERNUM').AsString;
       OrdersMTE.FieldByName('ORDERNUM2').AsString:=adoq.FieldByName('ORDERNUM2').AsString;
       OrdersMTE.FieldByName('ORDN').AsString:=adoq.FieldByName('ORDN').AsString;
       OrdersMTE.FieldByName('MARK_S').AsString:=adoq.FieldByName('MARK_S').AsString;
      End;
     adoq.Close;
     adoq.Free;
     OrdersMTE.Post;
     End;
     End;
     OrdersMTE.First;
     OrdersMTE.EnableControls;
    End;
   sp.Free;
  End;
end;

procedure TSpArrivalForm.BitBtn1Click(Sender: TObject);
begin
 if False{(f_CPARENT<>3) and (f_CPARENT<>4)} then
  Begin
//   ShowMessage('К сожалению, корректное формирование имени группы материалов из этого интерфейса реализовано пока только для "Листа" и "Прочих материалов"...');
  End
   else
  Begin
    Close();
    Self.ModalResult:=mrOK;
  End;
end;

procedure TSpArrivalForm.CGRMATERIALSAppendBtnClick(Sender: TObject);
Var
 tempValue:int64;
 Material:TGrMaterials;
begin
 tempValue:=LookupItemFromForm2(f_CPMATERIAL.ItemIndex,PMATERIALADOQ,SchemaName+'GRMATERIALS');
 if tempValue in TrueGrMaterialsParents {(tempValue=3) or (tempValue=4) or (tempValue=5) or (tempValue=6) or (tempValue=7) or (tempValue=8) or (tempValue=9) or (tempValue=10) or (tempValue=11)} then
 Begin
 Material:=TGrMaterials.Create;
 Material.CPARENT:=tempValue;
 if Material.Edit(Self,True) then
  Begin
  if Not GRMATERIALSADOQ.Locate('NAME',Material.NAME,[loCaseInsensitive]) then
   Begin
    GRMATERIALSADOQ.Append;
    if Not Material.Save(Self,GRMATERIALSADOQ) then GRMATERIALSADOQ.Cancel;
    GRMATERIALSADOQ.Requery;
    if GRMATERIALSADOQ.Locate('NAME',Material.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_CGRMATERIALS,GRMATERIALSADOQ,GRMATERIALSADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Material.NAME+'" уже присутствует в справочнике!');
  End;
 Material.Free;
 End
  else
  Begin
   ShowMessage('Укажите правильный вид материала!');
   Try f_CPMATERIAL.SetFocus; Except End;
  End;
end;

procedure TSpArrivalForm.CGRMATERIALSComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
 GRMATERIALSADOQ.Requery;
 LookupItemToForm(f_CGRMATERIALS,GRMATERIALSADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TSpArrivalForm.DelSpPlansActionExecute(Sender: TObject);
begin
 if DelSpPlansAction.Enabled then OrdersMTE.Delete;
end;

procedure TSpArrivalForm.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
 f_ToFormFlag:=False;
 PMATERIALADOQ.Connection:=Host.ADOC;
 orderby:=' order by ord';
 wh:='nrec in ('+GrMaterialsParents+')';
 PMATERIALADOQ.SQL.Text:='select * from '+SchemaName+'MATERIALS'+' where '+wh+orderby;
 PMATERIALADOQ.Open;

 GRMATERIALSADOQ.Connection:=Host.ADOC;

 PROP_THICKADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,value';
 wh:='active=1';
 PROP_THICKADOQ.SQL.Text:='select * from '+SchemaName+'THICKS'+' where '+wh+orderby;
 PROP_THICKADOQ.Open;

 PROP_WIDTHADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,value';
 wh:='active=1';
 PROP_WIDTHADOQ.SQL.Text:='select * from '+SchemaName+'WIDTHS'+' where '+wh+orderby;
 PROP_WIDTHADOQ.Open;

 PROP_LENGTHADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,value';
 wh:='active=1';
 PROP_LENGTHADOQ.SQL.Text:='select * from '+SchemaName+'LENGTHS'+' where '+wh+orderby;
 PROP_LENGTHADOQ.Open;
end;

procedure TSpArrivalForm.FormDestroy(Sender: TObject);
begin
 PMATERIALADOQ.Close;
 GRMATERIALSADOQ.Close;
 PROP_THICKADOQ.Close;
 PROP_WIDTHADOQ.Close;
 PROP_LENGTHADOQ.Close;
end;

procedure TSpArrivalForm.FormShow(Sender: TObject);
begin
 PageControl1.ActivePage:=TabSheet1;
 Try f_CGRMATERIALS.SetFocus; Except End;
end;

procedure TSpArrivalForm.f_CPMATERIALChange(Sender: TObject);
Var
 tempValue,tempValue2:int64;
 orderby,wh:string;
begin
// ShowMessage('f_CPMATERIALChange Begin');
 tempValue:=LookupItemFromForm2(f_CPMATERIAL.ItemIndex,PMATERIALADOQ,SchemaName+'MATERIALS');
 {if PMATERIALADOQ.Locate('NAME', f_CPMATERIAL.Items[f_CPMATERIAL.ItemIndex], [loCaseInsensitive]) then
  tempValue := PMATERIALADOQ['NREC'];
 ShowMessage(IntToStr(tempValue));   }
{ if GRMATERIALSADOQ.Locate('NAME', f_CGRMATERIALS.Items[f_CGRMATERIALS.ItemIndex], [loCaseInsensitive]) then
   tempValue2:=GRMATERIALSADOQ['NREC']; //}
   tempValue2:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
 //ShowMessage(IntToStr(tempValue2));
 GRMATERIALSADOQ.Close;
// ShowMessage('3');
 orderby:=' order by name';
// ShowMessage('4');
 wh:='active=1 and cparent='+IntToStr(tempValue);
// ShowMessage('5');
 GRMATERIALSADOQ.SQL.Text:='select * from '+SchemaName+'GRMATERIALS'+' where '+wh+orderby;
// ShowMessage(GRMATERIALSADOQ.SQL.Text);
 GRMATERIALSADOQ.Open;
// ShowMessage('6');
 LookupItemToForm(f_CGRMATERIALS,GRMATERIALSADOQ,tempValue2,'name','','',False);
// ShowMessage('7');
 f_CGRMATERIALSChange(Sender);
// ShowMessage('8');
 Try f_CGRMATERIALS.SetFocus; Except End;
end;

procedure TSpArrivalForm.f_KOLSHTChange(Sender: TObject);
Var
 tempValue,CGRMATERIALS:int64;
 Gr:TGrMaterials;
 cw,cl,ct:int64;
 w,l,t,uw:double;
begin
 if Not f_ToFormFlag then
 Begin
 CGRMATERIALS:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS',False);
 tempValue:=LookupItemFromForm2(f_CPMATERIAL.ItemIndex,PMATERIALADOQ,SchemaName+'GRMATERIALS');
 if tempValue=4 then
  Begin
   Gr:=TGrMaterials.Create;
   If Gr.GetByNrec(CGRMATERIALS) then
    Begin
     uw:=StrToFloatM(GetTextValueOfPointer(IntToStr(Gr.PROP_STEELMARK),SchemaName+'STEELMARKS','nrec','UW',False));

       w:=Gr.PROP_WIDTH_C; l:=Gr.PROP_LENGTH_C; t:=Gr.PROP_THICK_C;
       if f_PROP_WIDTH.Visible then
        Begin
         cw:=LookupItemFromForm2(f_PROP_WIDTH.ItemIndex,PROP_WIDTHADOQ,SchemaName+'WIDTHS');
         w:=StrToFloatM(GetTextValueOfPointer(IntToStr(cw),SchemaName+'WIDTHS','nrec','value',False));
        End;
       if f_PROP_THICK.Visible then
        Begin
         ct:=LookupItemFromForm2(f_PROP_THICK.ItemIndex,PROP_THICKADOQ,SchemaName+'THICKS');
         t:=StrToFloatM(GetTextValueOfPointer(IntToStr(ct),SchemaName+'THICKS','nrec','value',False));
        End;
       if f_PROP_LENGTH.Visible then
        Begin
         cl:=LookupItemFromForm2(f_PROP_LENGTH.ItemIndex,PROP_LENGTHADOQ,SchemaName+'LENGTHS');
         l:=StrToFloatM(GetTextValueOfPointer(IntToStr(cl),SchemaName+'LENGTHS','nrec','value',False));
        End;
//       ShowMessage('w='+FloatToStr(w)+', '+'t='+FloatToStr(t)+', '+'l='+FloatToStr(l)+', '+'kolsht='+f_kolsht.Text+', '+'uw='+FloatToStr(uw));
       f_kolt.Value:=StrToIntM(f_kolsht.Text)*w*l*t*uw/1000000000;
//       f_kolt.SetFocus;
    End;
   Gr.Free;
  End;
 End;
end;

procedure TSpArrivalForm.OrdersDSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TSpArrivalForm.PROP_LENGTHAppendBtnClick(Sender: TObject);
Var
 Spr1JvCalcEdit:TSpr1JvCalcEdit;
begin
 Spr1JvCalcEdit:=TSpr1JvCalcEdit.Create;
 if Spr1JvCalcEdit.Edit(Self,True,'Длина','Значение') then
  Begin
  if Not PROP_LENGTHADOQ.Locate('VALUE',Spr1JvCalcEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_LENGTHADOQ.Append;
    PROP_LENGTHADOQ['freq']:=0;
    PROP_LENGTHADOQ['active']:=1;
    if Not Spr1JvCalcEdit.Save(PROP_LENGTHADOQ,'VALUE') then PROP_LENGTHADOQ.Cancel;
    PROP_LENGTHADOQ.Requery;
    if PROP_LENGTHADOQ.Locate('VALUE',Spr1JvCalcEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_LENGTH,PROP_LENGTHADOQ,PROP_LENGTHADOQ['nrec'],'value',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1JvCalcEdit.Free;
end;

procedure TSpArrivalForm.PROP_LENGTHComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_LENGTH.ItemIndex,PROP_LENGTHADOQ,SchemaName+'LENGTHS');
 PROP_LENGTHADOQ.Requery;
 LookupItemToForm(f_PROP_LENGTH,PROP_LENGTHADOQ,tempValue,'value',EmptyStr,EmptyStr,False);
end;

procedure TSpArrivalForm.PROP_THICKAppendBtnClick(Sender: TObject);
Var
 Spr1JvCalcEdit:TSpr1JvCalcEdit;
begin
 Spr1JvCalcEdit:=TSpr1JvCalcEdit.Create;
 if Spr1JvCalcEdit.Edit(Self,True,'Толщина','Значение') then
  Begin
  if Not PROP_THICKADOQ.Locate('VALUE',Spr1JvCalcEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_THICKADOQ.Append;
    PROP_THICKADOQ['freq']:=0;
    PROP_THICKADOQ['active']:=1;
    if Not Spr1JvCalcEdit.Save(PROP_THICKADOQ,'VALUE') then PROP_THICKADOQ.Cancel;
    PROP_THICKADOQ.Requery;
    if PROP_THICKADOQ.Locate('VALUE',Spr1JvCalcEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_THICK,PROP_THICKADOQ,PROP_THICKADOQ['nrec'],'value',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1JvCalcEdit.Free;
end;

procedure TSpArrivalForm.PROP_THICKComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_THICK.ItemIndex,PROP_THICKADOQ,SchemaName+'THICKS');
 PROP_THICKADOQ.Requery;
 LookupItemToForm(f_PROP_THICK,PROP_THICKADOQ,tempValue,'value',EmptyStr,EmptyStr,False);
end;

procedure TSpArrivalForm.PROP_WIDTHAppendBtnClick(Sender: TObject);
Var
 Spr1JvCalcEdit:TSpr1JvCalcEdit;
begin
 Spr1JvCalcEdit:=TSpr1JvCalcEdit.Create;
 if Spr1JvCalcEdit.Edit(Self,True,'Ширина','Значение') then
  Begin
  if Not PROP_WIDTHADOQ.Locate('VALUE',Spr1JvCalcEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_WIDTHADOQ.Append;
    PROP_WIDTHADOQ['freq']:=0;
    PROP_WIDTHADOQ['active']:=1;
    if Not Spr1JvCalcEdit.Save(PROP_WIDTHADOQ,'VALUE') then PROP_WIDTHADOQ.Cancel;
    PROP_WIDTHADOQ.Requery;
    if PROP_WIDTHADOQ.Locate('VALUE',Spr1JvCalcEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_WIDTH,PROP_WIDTHADOQ,PROP_WIDTHADOQ['nrec'],'value',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1JvCalcEdit.Free;
end;

procedure TSpArrivalForm.PROP_WIDTHComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_WIDTH.ItemIndex,PROP_WIDTHADOQ,SchemaName+'WIDTHS');
 PROP_WIDTHADOQ.Requery;
 LookupItemToForm(f_PROP_WIDTH,PROP_WIDTHADOQ,tempValue,'value',EmptyStr,EmptyStr,False);
end;

Constructor TSpArrival.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSpArrival.Clear;
begin
 NREC:=0;
 CARRIVALS:=0;
 NUM:=0;
 CGRMATERIALS:=0;
 GRMATERIALS_S:=EmptyStr;
 KOLSHT:=1;
 KOLT:=0;
 SPPLANS:=EmptyStr;
 SPPLANS_S:=EmptyStr;
 PRIM:=EmptyStr;
 STATE:=False;
 PROP_PWIDTH1:=0;
 PROP_PWIDTH2:=0;
 PROP_SIZE1:=0;
 PROP_SIZE2:=0;
 PROP_WTHICK:=0;
 PROP_SLENGTH:=0;
 PROP_DIAM:=0;
 PROP_SIZE:=0;
 PROP_THICK:=0;
 PROP_WIDTH:=0;
 PROP_LENGTH:=0;
 PROP_THICK_C:=0;
 PROP_WIDTH_C:=0;
 PROP_LENGTH_C:=0;
end;

Function TSpArrival.Save(OForm:TComponent;Dataset:TDataset;Prefix:string=''):boolean;
Var
 PropList:TStringList;
Begin
 result:=True;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 PropList:=TStringList.Create;
 GetPropListOfGRMATERIAL(CGRMATERIALS,PropList);
 UpdateGRMATERIALS_S;
 if PropList.IndexOf('PROP_THICK')<>-1 then UpdatePROP_THICK_C;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then UpdatePROP_WIDTH_C;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then UpdatePROP_LENGTH_C;
 UpdateGRMATERIALS_S;
 Dataset[Prefix+'CARRIVALS']:=CARRIVALS;
 Dataset[Prefix+'NUM']:=NUM;
 Dataset[Prefix+'CGRMATERIALS']:=CGRMATERIALS;
 Dataset[Prefix+'GRMATERIALS_S']:=GRMATERIALS_S;
 Dataset[Prefix+'KOLSHT']:=KOLSHT;
 Dataset[Prefix+'KOLT']:=KOLT;
 if SPPLANS=EmptyStr then SPPLANS:=space;
 Dataset[Prefix+'SPPLANS']:=SPPLANS;
 Dataset[Prefix+'SPPLANS_S']:=SPPLANS_S;
 if PRIM=EmptyStr then PRIM:=space;
 Dataset[Prefix+'PRIM']:=PRIM;
 if STATE then Dataset.FieldByName(Prefix+'STATE').AsInteger:=1
          else Dataset.FieldByName(Prefix+'STATE').AsInteger:=0;
 if PropList.IndexOf('PROP_PWIDTH1')<>-1 then
  Begin
   Dataset[Prefix+'PROP_PWIDTH1']:=PROP_PWIDTH1;
  End;
 if PropList.IndexOf('PROP_PWIDTH2')<>-1 then
  Begin
   Dataset[Prefix+'PROP_PWIDTH2']:=PROP_PWIDTH2;
  End;
 if PropList.IndexOf('PROP_SIZE1')<>-1 then
  Begin
   Dataset[Prefix+'PROP_SIZE1']:=PROP_SIZE1;
  End;
 if PropList.IndexOf('PROP_SIZE2')<>-1 then
  Begin
   Dataset[Prefix+'PROP_SIZE2']:=PROP_SIZE2;
  End;
 if PropList.IndexOf('PROP_WTHICK')<>-1 then
  Begin
   Dataset[Prefix+'PROP_WTHICK']:=PROP_WTHICK;
  End;
 if PropList.IndexOf('PROP_SLENGTH')<>-1 then
  Begin
   Dataset[Prefix+'PROP_SLENGTH']:=PROP_SLENGTH;
  End;
 if PropList.IndexOf('PROP_DIAM')<>-1 then
  Begin
   Dataset[Prefix+'PROP_DIAM']:=PROP_DIAM;
  End;
 if PropList.IndexOf('PROP_SIZE')<>-1 then
  Begin
   Dataset[Prefix+'PROP_SIZE']:=PROP_SIZE;
  End;
 if PropList.IndexOf('PROP_THICK')<>-1 then
  Begin
   Dataset[Prefix+'PROP_THICK']:=PROP_THICK;
   Dataset[Prefix+'PROP_THICK_C']:=PROP_THICK_C;
  End;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then
  Begin
   Dataset[Prefix+'PROP_WIDTH']:=PROP_WIDTH;
   Dataset[Prefix+'PROP_WIDTH_C']:=PROP_WIDTH_C;
  End;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then
  Begin
   Dataset[Prefix+'PROP_LENGTH']:=PROP_LENGTH;
   Dataset[Prefix+'PROP_LENGTH_C']:=PROP_LENGTH_C;
  End;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о позиции задания! ('+e.Message+')');
      End;
 End;
 PropList.Free;
End;

Function TSpArrival.Read(Var Dataset:TAdoQuery):boolean;
Var
 PropList:TStringList;
Begin
 result:=True;
 PropList:=TStringList.Create;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 CARRIVALS:=Dataset['CARRIVALS'];
 NUM:=Dataset['NUM'];
 CGRMATERIALS:=Dataset['CGRMATERIALS'];
 GRMATERIALS_S:=Dataset['GRMATERIALS_S'];
 KOLSHT:=Dataset['KOLSHT'];
 KOLT:=Dataset['KOLT'];
 SPPLANS:=Dataset['SPPLANS'];
 SPPLANS_S:=Dataset['SPPLANS_S'];
 PRIM:=Dataset['PRIM'];
 STATE:=(Dataset.FieldByName('STATE').AsInteger=1);

 GetPropListOfGRMATERIAL(CGRMATERIALS,PropList);

 if PropList.IndexOf('PROP_PWIDTH1')<>-1 then
  Begin
   PROP_PWIDTH1:=Dataset['PROP_PWIDTH1'];
  End;
 if PropList.IndexOf('PROP_PWIDTH2')<>-1 then
  Begin
   PROP_PWIDTH2:=Dataset['PROP_PWIDTH2'];
  End;
 if PropList.IndexOf('PROP_SIZE1')<>-1 then
  Begin
   PROP_SIZE1:=Dataset['PROP_SIZE1'];
  End;
 if PropList.IndexOf('PROP_SIZE2')<>-1 then
  Begin
   PROP_SIZE2:=Dataset['PROP_SIZE2'];
  End;
 if PropList.IndexOf('PROP_WTHICK')<>-1 then
  Begin
   PROP_WTHICK:=Dataset['PROP_WTHICK'];
  End;
 if PropList.IndexOf('PROP_SLENGTH')<>-1 then
  Begin
   PROP_SLENGTH:=Dataset['PROP_SLENGTH'];
  End;
 if PropList.IndexOf('PROP_DIAM')<>-1 then
  Begin
   PROP_DIAM:=Dataset['PROP_DIAM'];
  End;
 if PropList.IndexOf('PROP_SIZE')<>-1 then
  Begin
   PROP_SIZE:=Dataset['PROP_SIZE'];
  End;
 if PropList.IndexOf('PROP_THICK')<>-1 then
  Begin
   PROP_THICK:=Dataset['PROP_THICK'];
   PROP_THICK_C:=Dataset['PROP_THICK_C'];
  End;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then
  Begin
   PROP_WIDTH:=Dataset['PROP_WIDTH'];
   PROP_WIDTH_C:=Dataset['PROP_WIDTH_C'];
  End;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then
  Begin
   PROP_LENGTH:=Dataset['PROP_LENGTH'];
   PROP_LENGTH_C:=Dataset['PROP_LENGTH_C'];
  End;
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о позиции задания! ('+e.Message+')');
   End;
 End;

 PropList.Free;
End;

Function TSpArrival.Edit(OForm:TComponent;New:boolean=False;EditRights:boolean=True):boolean;
Var
 Form: TSpArrivalForm;
begin
 //ShowMessage('1234');
 Form:=TSpArrivalForm.Create(OForm);
 //ShowMessage('12345');
 Form.f_EditRights:=EditRights;
 if ToForm(Form,New) then
  Begin
  //ShowMessage('ToForm OK');
   if Form.ShowModal=mrOK then
    Begin
     //ShowMessage('ShowModal OK');
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSpArrival.ToForm(Var Form:TSpArrivalForm;New:boolean):boolean;
Var
 i:integer;
 orderby,wh:string;
 CPMATERIAL:int64;
 SPPLANSList:TStringList;
 adoq:TAdoQuery;
Begin
// ShowMessage('Enter ToForm OK');
 Form.f_ToFormFlag:=True;
 Form.f_nrec:=nrec;
 Form.f_carrivals:=carrivals;
// if New then Form.Caption:=GetTextValueOfPointer(IntToStr(CPARENT),SchemaName+'MATERIALS','nrec','name',False)
//        else Form.Caption:=NAME;

 //ShowMessage('Host.ADOC=' + Host.ADOC.Name);
 if New then CPMATERIAL:=0
        else CPMATERIAL:=StrToIntM(GetTextValueOfPointer(IntToStr(CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','cparent',False));
 //ShowMessage('1');
 LookupItemToForm(Form.f_CPMATERIAL,Form.PMATERIALADOQ,CPMATERIAL,'name',EmptyStr,EmptyStr,True);
 //ShowMessage('2');
 Form.f_CPMATERIALChange(Form);

 //ShowMessage('3');
 LookupItemToForm(Form.f_CGRMATERIALS,Form.GRMATERIALSADOQ,CGRMATERIALS,'name',EmptyStr,EmptyStr,False);
// ShowMessage('4');
 Form.f_CGRMATERIALSChange(Form);

// ShowMessage('5');
 Form.f_KOLSHT.Text:=IntToStr(KOLSHT);
// ShowMessage('6');
 Form.f_KOLT.Value:=KOLT;

// ShowMessage('7');
 SPPLANSList:=TStringList.Create;
// ShowMessage('8');
 SPPLANSList.CommaText:=SPPLANS;
// ShowMessage('9');
 Form.OrdersMTE.DisableControls;
// ShowMessage('10');
 Form.OrdersMTE.Close;
// ShowMessage('11');
 Form.OrdersMTE.DestroyTable;
// ShowMessage('12');
 Form.OrdersMTE.CreateDataSet;
// ShowMessage('13');
 Form.OrdersMTE.Open;
// ShowMessage('14');
 adoq:=TAdoQuery.Create(nil);
// ShowMessage('15');
 adoq.Connection:=Host.ADOC;
// ShowMessage('adoq=' + adoq.ToString);
 for i:=0 to SPPLANSList.Count-1 do
  Begin
   Form.OrdersMTE.Append;
   Form.OrdersMTE.FieldByName('CSPPLANS').AsLargeInt:=StrToIntM(SPPLANSList[i]);
   adoq.SQL.Text:='select PL.PYEAR as pyear,'+
                         'PL.PMONTH as pmonth,'+
                         'SPPL.ORDERNUM as ORDERNUM,'+
                         'SPPL.ORDERNUM2 as ORDERNUM2,'+
                         'SPPL.ORDN as ORDN,'+
                         'SPPL.MARK_S as MARK_S'+
                         ' from '+SchemaName+'PLANS PL,'+SchemaName+'SPPLANS SPPL'+' where SPPL.nrec='+Form.OrdersMTE.FieldByName('CSPPLANS').AsString+' and SPPL.CPLANS=PL.nrec';
   adoq.Open;
   if adoq.RecordCount=1 then
    Begin
     Form.OrdersMTE.FieldByName('PLANINFO').AsString:=Padl(adoq.FieldByName('PMONTH').AsString,2,zero)+dot+adoq.FieldByName('PYEAR').AsString;
     Form.OrdersMTE.FieldByName('ORDERNUM').AsString:=adoq.FieldByName('ORDERNUM').AsString;
     Form.OrdersMTE.FieldByName('ORDERNUM2').AsString:=adoq.FieldByName('ORDERNUM2').AsString;
     Form.OrdersMTE.FieldByName('ORDN').AsString:=adoq.FieldByName('ORDN').AsString;
     Form.OrdersMTE.FieldByName('MARK_S').AsString:=adoq.FieldByName('MARK_S').AsString;
    End;
   adoq.Close;
   Form.OrdersMTE.Post;
  End;
 Form.OrdersMTE.First;
 Form.OrdersMTE.EnableControls;
 adoq.Free;
 SPPLANSList.Free;

 Form.f_PRIM.Text:=Trim(PRIM);

 if STATE then Form.f_STATE.ItemIndex:=1
          else Form.f_STATE.ItemIndex:=0;

 Form.UpdatePropList;
 Form.f_PROP_PWIDTH1.Value:=PROP_PWIDTH1;
 Form.f_PROP_PWIDTH2.Value:=PROP_PWIDTH2;
 Form.f_PROP_SIZE1.Value:=PROP_SIZE1;
 Form.f_PROP_SIZE2.Value:=PROP_SIZE2;
 Form.f_PROP_WTHICK.Value:=PROP_WTHICK;
 Form.f_PROP_SLENGTH.Value:=PROP_SLENGTH;
 Form.f_PROP_DIAM.Value:=PROP_DIAM;
 Form.f_PROP_SIZE.Value:=PROP_SIZE;
 LookupItemToForm(Form.f_PROP_THICK,Form.PROP_THICKADOQ,PROP_THICK,'value',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_WIDTH,Form.PROP_WIDTHADOQ,PROP_WIDTH,'value',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_LENGTH,Form.PROP_LENGTHADOQ,PROP_LENGTH,'value',EmptyStr,EmptyStr,False);


 Form.f_ToFormFlag:=False;

 Form.CGRMATERIALSAppendBtn.Enabled:=CurrentUser.SprEditRights;
 Form.PROP_THICKAppendBtn.Enabled:=CurrentUser.SprEditRights;
 Form.PROP_WIDTHAppendBtn.Enabled:=CurrentUser.SprEditRights;
 Form.PROP_LENGTHAppendBtn.Enabled:=CurrentUser.SprEditRights;

 Form.ActionsEnabling;
 result:=True;
End;

Function TSpArrival.FromForm(Var Form:TSpArrivalForm):boolean;
Var
 SPPLANS_SList:TStringList;
Begin
 nrec:=Form.f_nrec;
 carrivals:=Form.f_carrivals;

 CGRMATERIALS:=LookupItemFromForm2(Form.f_CGRMATERIALS.ItemIndex,Form.GRMATERIALSADOQ,SchemaName+'GRMATERIALS',False);
 KOLSHT:=StrToIntM(Form.f_KOLSHT.Text);
 KOLT:=Form.f_KOLT.Value;

 Form.OrdersMTE.DisableControls;
 Form.OrdersMTE.First;
 SPPLANS:=EmptyStr;
 SPPLANS_SList:=TStringList.Create;
 while Not Form.OrdersMTE.Eof do
  Begin
   if Not Empty(SPPLANS) then SPPLANS:=SPPLANS+comma;
   SPPLANS:=SPPLANS+Form.OrdersMTE.FieldByName('CSPPLANS').AsString;
   if SPPLANS_SList.IndexOf(Form.OrdersMTE.FieldByName('ORDERNUM2').AsString)=-1 then SPPLANS_SList.Append(Form.OrdersMTE.FieldByName('ORDERNUM2').AsString);
   Form.OrdersMTE.Next;
  End;
 SPPLANS_SList.Sort;
 SPPLANS_S:=SPPLANS_SList.CommaText;
 if SPPLANS_S=EmptyStr then SPPLANS_S:=space;
 SPPLANS_SList.Free;
 Form.OrdersMTE.EnableControls;

 PRIM:=Trim(Form.f_PRIM.Text);
 if PRIM=EmptyStr then PRIM:=space;

 STATE:=(Form.f_STATE.ItemIndex=1);

 PROP_PWIDTH1:=Form.f_PROP_PWIDTH1.Value;
 PROP_PWIDTH2:=Form.f_PROP_PWIDTH2.Value;
 PROP_SIZE1:=Form.f_PROP_SIZE1.Value;
 PROP_SIZE2:=Form.f_PROP_SIZE2.Value;
 PROP_WTHICK:=Form.f_PROP_WTHICK.Value;
 PROP_SLENGTH:=Form.f_PROP_SLENGTH.Value;
 PROP_DIAM:=Form.f_PROP_DIAM.Value;
 PROP_SIZE:=Form.f_PROP_SIZE.Value;
 PROP_THICK:=LookupItemFromForm2(Form.f_PROP_THICK.ItemIndex,Form.PROP_THICKADOQ,SchemaName+'THICKS');
 PROP_WIDTH:=LookupItemFromForm2(Form.f_PROP_WIDTH.ItemIndex,Form.PROP_WIDTHADOQ,SchemaName+'WIDTHS');
 PROP_LENGTH:=LookupItemFromForm2(Form.f_PROP_LENGTH.ItemIndex,Form.PROP_LENGTHADOQ,SchemaName+'LENGTHS');

 result:=True;
End;


Procedure TSpArrival.UpdateGRMATERIALS_S;
Begin
 GRMATERIALS_S:=GetTextValueOfPointer(IntToStr(CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','name',False);
 if GRMATERIALS_S=EmptyStr then GRMATERIALS_S:=space;
End;

Procedure TSpArrival.UpdatePROP_THICK_C;
Begin
 PROP_THICK_C:=StrToFloatM(GetTextValueOfPointer(IntToStr(PROP_THICK),SchemaName+'THICKS','nrec','value',False));
// if PROP_THICK_C=EmptyStr then PROP_THICK_C:=space;
End;

Procedure TSpArrival.UpdatePROP_WIDTH_C;
Begin
 PROP_WIDTH_C:=StrToFloatM(GetTextValueOfPointer(IntToStr(PROP_WIDTH),SchemaName+'WIDTHS','nrec','value',False));
// if PROP_WIDTH_C=EmptyStr then PROP_WIDTH_C:=space;
End;

Procedure TSpArrival.UpdatePROP_LENGTH_C;
Begin
 PROP_LENGTH_C:=StrToFloatM(GetTextValueOfPointer(IntToStr(PROP_LENGTH),SchemaName+'LENGTHS','nrec','value',False));
// if PROP_LENGTH_C=EmptyStr then PROP_LENGTH_C:=space;
End;

Procedure TSpArrival.PropsToForm(Form:TComponent);
Var
 c,cadoq:TComponent;
Begin
 c:=Form.FindComponent('f_PROP_PWIDTH1'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_PWIDTH1;
 c:=Form.FindComponent('f_PROP_PWIDTH2'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_PWIDTH2;
 c:=Form.FindComponent('f_PROP_SIZE1'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SIZE1;
 c:=Form.FindComponent('f_PROP_SIZE2'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SIZE2;
 c:=Form.FindComponent('f_PROP_WTHICK'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_WTHICK;
 c:=Form.FindComponent('f_PROP_SLENGTH'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SLENGTH;
 c:=Form.FindComponent('f_PROP_DIAM'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_DIAM;
 c:=Form.FindComponent('f_PROP_SIZE'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SIZE;
 c:=Form.FindComponent('f_PROP_THICK'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_THICK_C;
 c:=Form.FindComponent('f_PROP_WIDTH'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_WIDTH_C;
 c:=Form.FindComponent('f_PROP_LENGTH'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_LENGTH_C;
End;

Destructor TSpArrival.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSpArrivalForm.ActionsEnabling;
Begin
 AppendSpPlansAction.Enabled:=OrdersMTE.Active and f_EditRights;
 DelSpPlansAction.Enabled:=OrdersMTE.Active and (OrdersMTE.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=5) or (CurrentUser.CUSERGROUPS=6)) and f_EditRights;
 BitBtn1.Enabled:=f_EditRights;
 CGRMATERIALSAppendBtn.Enabled:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3) or (CurrentUser.CUSERGROUPS=5) or (CurrentUser.CUSERGROUPS=6));
 PROP_THICKAppendBtn.Enabled:=CGRMATERIALSAppendBtn.Enabled;
 PROP_WIDTHAppendBtn.Enabled:=CGRMATERIALSAppendBtn.Enabled;
 PROP_LENGTHAppendBtn.Enabled:=CGRMATERIALSAppendBtn.Enabled;
End;

end.

