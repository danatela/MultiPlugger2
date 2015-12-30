unit KD3Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits, InclFileUnit,
  DBGridEhGrouping, GridsEh, DBGridEh, MemTableDataEh, MemTableEh, Vcl.ComCtrls,
  SteelMarkUnit, Spr1LabeledEditUnit, Spr1JvCalcEditUnit, EquipmentUnit,
  Vcl.ImgList, GrMaterialsUnit, CmkUserUnit, HolesUnit, UPlugin;


type
  TKD3Form = class(TForm)
    Panel1: TPanel;
    CancelBtn: TBitBtn;
    OKBtn: TBitBtn;
    InclFileBtn: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PropGroupBox: TGroupBox;
    GRMATERIALSADOQ: TADOQuery;
    PROP_STEELMARKADOQ: TADOQuery;
    PROP_PROFILEADOQ: TADOQuery;
    PROP_NORMDOC0ADOQ: TADOQuery;
    PROP_PROFTYPEADOQ: TADOQuery;
    PROP_NORMDOC1ADOQ: TADOQuery;
    T_REZKA_EQADOQ: TADOQuery;
    T_ZACHIST_TYPEADOQ: TADOQuery;
    T_OTVERST_EQADOQ: TADOQuery;
    T_STROZH_EQADOQ: TADOQuery;
    T_GIBKA_EQADOQ: TADOQuery;
    GroupBox5: TGroupBox;
    f_T_GIBKA_NVLabel: TLabel;
    Label16: TLabel;
    f_T_GIBKA_NV: TJvCalcEdit;
    f_T_GIBKA_PR: TLabeledEdit;
    T_GIBKA_CEQComboUpdateBtn: TBitBtn;
    f_T_GIBKA_CEQ: TComboBox;
    GroupBox4: TGroupBox;
    f_T_STROZH_NVLabel: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    f_T_STROZH_NV: TJvCalcEdit;
    f_T_STROZH_PR: TLabeledEdit;
    f_T_STROZH_CEQ: TComboBox;
    T_STROZH_CEQComboUpdateBtn: TBitBtn;
    f_T_STROZH_M: TJvCalcEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    f_T_OTVERST_NVLabel: TLabel;
    Label14: TLabel;
    f_T_OTVERST_DIAM: TJvCalcEdit;
    f_T_OTVERST_COUNT: TJvCalcEdit;
    f_T_OTVERST_NV: TJvCalcEdit;
    f_T_OTVERST_CEQ: TComboBox;
    T_OTVERST_CEQComboUpdateBtn: TBitBtn;
    f_T_OTVERST_PR: TLabeledEdit;
    GroupBox3: TGroupBox;
    f_T_ZACHIST_NVLabel: TLabel;
    Label15: TLabel;
    f_T_ZACHIST_NV: TJvCalcEdit;
    T_ZACHIST_CTYPEComboUpdateBtn: TBitBtn;
    f_T_ZACHIST_CTYPE: TComboBox;
    GroupBox1: TGroupBox;
    f_T_REZKA_NVLabel: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    f_T_REZKA_NV: TJvCalcEdit;
    f_T_REZKA_PR: TLabeledEdit;
    f_T_REZKA_CEQ: TComboBox;
    T_REZKA_CEQComboUpdateBtn: TBitBtn;
    f_T_REZKA_M: TJvCalcEdit;
    Panel2: TPanel;
    Label2: TLabel;
    f_INPUTDATE: TLabel;
    f_PRIM: TLabeledEdit;
    Panel3: TPanel;
    f_NUMP: TLabeledEdit;
    f_CGRMATERIALS: TComboBox;
    Label18: TLabel;
    CGRMATERIALSComboUpdateBtn: TBitBtn;
    f_WEIGHT1: TJvCalcEdit;
    Label3: TLabel;
    f_PROP_PROFNUMLabel: TLabel;
    f_PROP_STEELMARK: TComboBox;
    f_PROP_STEELMARKLabel: TLabel;
    PROP_STEELMARKComboUpdateBtn: TBitBtn;
    f_PROP_NORMDOC0: TComboBox;
    PROP_NORMDOC0ComboUpdateBtn: TBitBtn;
    f_PROP_NORMDOC0Label: TLabel;
    f_PROP_NORMDOC1: TComboBox;
    PROP_NORMDOC1ComboUpdateBtn: TBitBtn;
    f_PROP_NORMDOC1Label: TLabel;
    f_PROP_LINEDENS: TJvCalcEdit;
    f_PROP_LINEDENSLabel: TLabel;
    f_PROP_PWIDTH1: TJvCalcEdit;
    f_PROP_PWIDTH1Label: TLabel;
    f_PROP_PWIDTH2: TJvCalcEdit;
    f_PROP_PWIDTH2Label: TLabel;
    f_PROP_SIZE1: TJvCalcEdit;
    f_PROP_SIZE1Label: TLabel;
    f_PROP_SIZE2: TJvCalcEdit;
    f_PROP_SIZE2Label: TLabel;
    f_PROP_WTHICK: TJvCalcEdit;
    f_PROP_WTHICKLabel: TLabel;
    f_PROP_SLENGTH: TJvCalcEdit;
    f_PROP_SLENGTHLabel: TLabel;
    PROP_PROFTYPEComboUpdateBtn: TBitBtn;
    f_PROP_PROFTYPELabel: TLabel;
    f_PROP_PROFTYPE: TComboBox;
    f_PROP_DIAM: TJvCalcEdit;
    f_PROP_DIAMLabel: TLabel;
    f_PROP_SIZE: TJvCalcEdit;
    f_PROP_SIZELabel: TLabel;
    f_PROP_UW: TJvCalcEdit;
    f_PROP_UWLabel: TLabel;
    f_PROP_PROFILE: TComboBox;
    PROP_PROFILEComboUpdateBtn: TBitBtn;
    f_PROP_PROFILELabel: TLabel;
    f_PROP_THICKLabel: TLabel;
    f_PROP_WIDTHLabel: TLabel;
    f_PROP_LENGTHLabel: TLabel;
    f_CPMATERIAL: TComboBox;
    PMATERIALADOQ: TADOQuery;
    PROP_STEELMARKAppendBtn: TBitBtn;
    PROP_NORMDOC0AppendBtn: TBitBtn;
    PROP_NORMDOC1AppendBtn: TBitBtn;
    PROP_PROFTYPEAppendBtn: TBitBtn;
    PROP_PROFILEAppendBtn: TBitBtn;
    T_ZACHIST_CTYPEAppendBtn: TBitBtn;
    T_REZKA_CEQAppendBtn: TBitBtn;
    T_OTVERST_CEQAppendBtn: TBitBtn;
    T_STROZH_CEQAppendBtn: TBitBtn;
    T_GIBKA_CEQAppendBtn: TBitBtn;
    ImageList1: TImageList;
    CGRMATERIALSAppendBtn: TBitBtn;
    f_PROP_THICK: TJvCalcEdit;
    f_PROP_WIDTH: TJvCalcEdit;
    f_PROP_LENGTH: TJvCalcEdit;
    PropCopyBtn: TBitBtn;
    f_PROP_PROFNUM: TEdit;
    T_RAZMET_EQADOQ: TADOQuery;
    GroupBox6: TGroupBox;
    f_T_RAZMET_NVLabel: TLabel;
    Label20: TLabel;
    f_T_RAZMET_NV: TJvCalcEdit;
    f_T_RAZMET_PR: TLabeledEdit;
    T_RAZMET_CEQComboUpdateBtnClick: TBitBtn;
    f_T_RAZMET_CEQ: TComboBox;
    T_RAZMET_CEQAppendBtn: TBitBtn;
    PROP_CARVTYPEADOQ: TADOQuery;
    PROP_FIXTYPEADOQ: TADOQuery;
    f_PROP_FIXTYPE: TComboBox;
    PROP_CARVTYPEComboUpdateBtn: TBitBtn;
    PROP_FIXTYPEComboUpdateBtn: TBitBtn;
    PROP_CARVTYPEAppendBtn: TBitBtn;
    PROP_FIXTYPEAppendBtn: TBitBtn;
    f_PROP_STEP: TJvCalcEdit;
    f_PROP_CARVTYPE: TComboBox;
    f_PROP_STEPLabel: TLabel;
    f_PROP_CARVTYPELabel: TLabel;
    f_PROP_FIXTYPELabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InclFileBtnClick(Sender: TObject);
    procedure UpdatePropList;
    procedure f_CGRMATERIALSChange(Sender: TObject);
    procedure CGRMATERIALSComboUpdateBtnClick(Sender: TObject);
    procedure f_CPMATERIALChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PROP_STEELMARKComboUpdateBtnClick(Sender: TObject);
    procedure PROP_NORMDOC0ComboUpdateBtnClick(Sender: TObject);
    procedure PROP_NORMDOC1ComboUpdateBtnClick(Sender: TObject);
    procedure PROP_PROFTYPEComboUpdateBtnClick(Sender: TObject);
    procedure PROP_PROFILEComboUpdateBtnClick(Sender: TObject);
    procedure PROP_STEELMARKAppendBtnClick(Sender: TObject);
    procedure PROP_NORMDOC0AppendBtnClick(Sender: TObject);
    procedure PROP_NORMDOC1AppendBtnClick(Sender: TObject);
    procedure PROP_PROFTYPEAppendBtnClick(Sender: TObject);
    procedure PROP_PROFILEAppendBtnClick(Sender: TObject);
    procedure T_ZACHIST_CTYPEAppendBtnClick(Sender: TObject);
    procedure T_REZKA_CEQAppendBtnClick(Sender: TObject);
//    procedure NewEQUIPMENT(Var ADOQ:TAdoQuery;InitOper:string;Var f_CEQ:TComboBox);
    procedure T_OTVERST_CEQAppendBtnClick(Sender: TObject);
    procedure T_STROZH_CEQAppendBtnClick(Sender: TObject);
    procedure T_GIBKA_CEQAppendBtnClick(Sender: TObject);
    procedure T_ZACHIST_CTYPEComboUpdateBtnClick(Sender: TObject);
    procedure T_REZKA_CEQComboUpdateBtnClick(Sender: TObject);
    procedure T_OTVERST_CEQComboUpdateBtnClick(Sender: TObject);
    procedure T_STROZH_CEQComboUpdateBtnClick(Sender: TObject);
    procedure T_GIBKA_CEQComboUpdateBtnClick(Sender: TObject);
    procedure CGRMATERIALSAppendBtnClick(Sender: TObject);
    procedure PropCopyBtnClick(Sender: TObject);
    procedure T_RAZMET_CEQAppendBtnClick(Sender: TObject);
    procedure T_RAZMET_CEQComboUpdateBtnClickClick(Sender: TObject);
    Procedure SetVisiblityRights;
    procedure PROP_FIXTYPEAppendBtnClick(Sender: TObject);
    procedure PROP_CARVTYPEAppendBtnClick(Sender: TObject);
    procedure PROP_FIXTYPEComboUpdateBtnClick(Sender: TObject);
    procedure PROP_CARVTYPEComboUpdateBtnClick(Sender: TObject);
    procedure GroupBox2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
    f_CKD:int64;
  end;

TKD3 = class
 NREC: int64;
 CKD: int64;
 ORDERNUM: string[10];
 ORDERNUM2: string;
 NUMP: string[20];
 CGRMATERIALS: int64;
 GRMATERIALS_S: string[255];
 PROP_PROFNUM: string[20];
 PROP_STEELMARK: int64;
 PROP_NORMDOC0: int64;
 PROP_NORMDOC1: int64;
 PROP_LINEDENS: double;
 PROP_PWIDTH1: double;
 PROP_PWIDTH2: double;
 PROP_SIZE1: double;
 PROP_SIZE2	: double;
 PROP_WTHICK	: double;
 PROP_SLENGTH	: double;
 PROP_PROFTYPE: int64;
 PROP_FIXTYPE: int64;
 PROP_CARVTYPE: int64;
 PROP_DIAM	: double;
 PROP_SIZE	: double;
 PROP_UW	: double;
 PROP_STEP	: double;
 PROP_PROFILE: int64;
// PROP_THICK: int64;
// PROP_WIDTH: int64;
// PROP_LENGTH: int64;
 PROP_STEELMARK_C: string[50];
 PROP_NORMDOC0_C: string[100];
 PROP_NORMDOC1_C: string[100];
 PROP_PROFTYPE_C: string[255];
 PROP_FIXTYPE_C: string[255];
 PROP_CARVTYPE_C: string[255];
 PROP_PROFILE_C: string[100];
 PROP_THICK_C	: double;
 PROP_WIDTH_C	: double;
 PROP_LENGTH_C	: double;
 WEIGHT1	: double;
 T_RAZMET_CEQ: int64;
 T_RAZMET_EQ_S: string[255];
 T_RAZMET_NV	: double;
 T_RAZMET_PR: string[255];
 T_REZKA_CEQ: int64;
 T_REZKA_EQ_S: string[255];
 T_REZKA_M	: double;
 T_REZKA_NV	: double;
 T_REZKA_PR: string[255];
 T_ZACHIST_CTYPE: int64;
 T_ZACHIST_TYPE_S: string[255];
 T_ZACHIST_NV	: double;
 T_OTVERST_CEQ: int64;
 T_OTVERST_EQ_S: string[255];
 T_OTVERST_DIAM: string[100];
 T_OTVERST_COUNT: integer;
 T_OTVERST_NV	: double;
 T_OTVERST_PR: string[255];
 T_STROZH_CEQ: int64;
 T_STROZH_EQ_S: string[255];
 T_STROZH_M	: double;
 T_STROZH_NV	: double;
 T_STROZH_PR: string[255];
 T_GIBKA_CEQ: int64;
 T_GIBKA_EQ_S: string[255];
 T_GIBKA_NV	: double;
 T_GIBKA_PR: string[255];
 INPUTDATE: TDateTime;
 PRIM: string[255];
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Function Save(Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TKD3Form;New:boolean):boolean;
 Function FromForm(Var Form:TKD3Form):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetTechnologyDescription(ttip:string;totalcount:integer):string;
 Procedure UpdateGRMATERIALS_S;
 Procedure UpdatePROP_STEELMARK_C;
 Procedure UpdatePROP_NORMDOC0_C;
 Procedure UpdatePROP_NORMDOC1_C;
 Procedure UpdatePROP_PROFTYPE_C;
 Procedure UpdatePROP_CARVTYPE_C;
 Procedure UpdatePROP_FIXTYPE_C;
 Procedure UpdatePROP_PROFILE_C;
// Procedure UpdatePROP_THICK_C;
// Procedure UpdatePROP_WIDTH_C;
// Procedure UpdatePROP_LENGTH_C;
 Procedure UpdateT_RAZMET_EQ_S;
 Procedure UpdateT_REZKA_EQ_S;
 Procedure UpdateT_ZACHIST_TYPE_S;
 Procedure UpdateT_OTVERST_EQ_S;
 Procedure UpdateT_STROZH_EQ_S;
 Procedure UpdateT_GIBKA_EQ_S;
 Function GetDetailDescription:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  KD3Form: TKD3Form;

implementation

{$R *.dfm}

Function TKD3.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'DETAILS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TKD3.GetDetailDescription:string;
Var
 CPARENT:int64;
 mname:string;
begin
 result:=EmptyStr;

 UpdateGRMATERIALS_S;
 CPARENT:=StrToIntM(GetTextValueOfPointer(IntToStr(CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','cparent',False));

 if CPARENT=3 then mname:=GRMATERIALS_S
              else mname:=GetTextValueOfPointer(IntToStr(CPARENT),SchemaName+'GRMATERIALS','nrec','NAME',False);

   case CPARENT of
{Лист}     4: Begin
               if PROP_WIDTH_C<>0 then result:=FloatToStr(PROP_WIDTH_C);
               if PROP_THICK_C<>0 then
                Begin
                 if Not Empty(result) then result:=result+'*';
                 result:=result+FloatToStr(PROP_THICK_C);
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
               mname:=PROP_FIXTYPE_C;
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

 result:=NUMP+space+'{'+Trim(mname+space+result)+'}';

end;

Function TKD3.GetTechnologyDescription(ttip:string;totalcount:integer):string;
Begin
 result:=EmptyStr;
 if ttip='STROZHKA' then
  Begin
   if (T_STROZH_CEQ<>0) or Not Empty(T_STROZH_PR) or (T_STROZH_M<>0) or (T_STROZH_NV<>0) then
    Begin
     if T_STROZH_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_STROZH_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_STROZH_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_STROZH_NV)+'/'+FloatToStr(T_STROZH_NV*totalcount);
      End;
     if T_STROZH_M<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'метраж '+FloatToStr(T_STROZH_M)+'/'+FloatToStr(T_STROZH_M*totalcount);
      End;
     if Not Empty(T_STROZH_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_STROZH_PR;
      End;
    End;
  End;
 if ttip='OTVERST' then
  Begin
   if (T_OTVERST_CEQ<>0) or Not Empty(T_OTVERST_PR) or (T_OTVERST_COUNT>0) or Not Empty(T_OTVERST_DIAM) or (T_OTVERST_NV<>0) then
    Begin
     if T_OTVERST_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_OTVERST_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_OTVERST_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_OTVERST_NV)+'/'+FloatToStr(T_OTVERST_NV*totalcount);
      End;
     if Not Empty(T_OTVERST_DIAM) then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+{'ᴓ'}'диам.'+T_OTVERST_DIAM{+'/'+FloatToStr(StrToFloatM(T_OTVERST_DIAM)*totalcount)};
      End;
     if T_OTVERST_COUNT>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'кол-во отв.'+IntToStr(T_OTVERST_COUNT)+'/'+IntToStr(T_OTVERST_COUNT*totalcount);
      End;
     if Not Empty(T_OTVERST_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_OTVERST_PR;
      End;
    End;
  End;
 if ttip='RAZMETKA' then
  Begin
   if (T_RAZMET_CEQ<>0) or Not Empty(T_RAZMET_PR) or (T_RAZMET_NV<>0) then
    Begin
     if T_RAZMET_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_RAZMET_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_RAZMET_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_RAZMET_NV)+'/'+FloatToStr(T_RAZMET_NV*totalcount);
      End;
     if Not Empty(T_RAZMET_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_RAZMET_PR;
      End;
    End;
  End;
 if ttip='REZKA' then
  Begin
   if (T_REZKA_CEQ<>0) or Not Empty(T_REZKA_PR) or (T_REZKA_M<>0) or (T_REZKA_NV<>0) then
    Begin
     if T_REZKA_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_REZKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_REZKA_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_REZKA_NV)+'/'+FloatToStr(T_REZKA_NV*totalcount);
      End;
     if T_REZKA_M<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'метраж '+FloatToStr(T_REZKA_M)+'/'+FloatToStr(T_REZKA_M*totalcount);
      End;
     if Not Empty(T_REZKA_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_REZKA_PR;
      End;
    End;
  End;
 if ttip='GIBKA' then
  Begin
   if (T_GIBKA_CEQ<>0) or Not Empty(T_GIBKA_PR) or (T_GIBKA_NV<>0) then
    Begin
     if T_GIBKA_CEQ<>0 then result:=GetTextValueOfPointer(IntToStr(T_GIBKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
     if T_GIBKA_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_GIBKA_NV)+'/'+FloatToStr(T_GIBKA_NV*totalcount);
      End;
     if Not Empty(T_GIBKA_PR) then
      Begin
       if Not Empty(result) then result:=result+comma+space;
       result:=result+T_GIBKA_PR;
      End;
    End;
  End;
 if ttip='ZACHISTKA' then
  Begin
   UpdateT_ZACHIST_TYPE_S;
   if Not Empty(T_ZACHIST_TYPE_S) or (T_ZACHIST_NV<>0) then
    Begin
     if Not Empty(T_ZACHIST_TYPE_S) then result:=T_ZACHIST_TYPE_S;
     if T_ZACHIST_NV<>0 then
      Begin
       if Not Empty(result) then result:=result+space;
       result:=result+'н/в-'+FloatToStr(T_ZACHIST_NV)+'/'+FloatToStr(T_ZACHIST_NV*totalcount);
      End;
    End;
  End;
End;

Procedure TKD3.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CKD', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'NUMP', ftString, 20);
 MTE.FieldDefs.Add(Prefix+'CGRMATERIALS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'GRMATERIALS_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'PROP_PROFNUM', ftString, 20);
 MTE.FieldDefs.Add(Prefix+'PROP_STEELMARK', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_NORMDOC0', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_NORMDOC1', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_LINEDENS', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_PWIDTH1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_PWIDTH2', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE2', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_WTHICK', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SLENGTH', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_PROFTYPE', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_FIXTYPE', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_CARVTYPE', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_DIAM', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_UW', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_STEP', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_PROFILE', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'PROP_STEELMARK_C', ftString, 50);
 MTE.FieldDefs.Add(Prefix+'PROP_NORMDOC0_C', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'PROP_NORMDOC1_C', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'PROP_PROFTYPE_C', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'PROP_FIXTYPE_C', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'PROP_CARVTYPE_C', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'PROP_PROFILE_C', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'PROP_THICK_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_WIDTH_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_LENGTH_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'WEIGHT1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_RAZMET_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_RAZMET_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_RAZMET_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_RAZMET_PR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_REZKA_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_REZKA_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_REZKA_M', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_REZKA_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_REZKA_PR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_ZACHIST_CTYPE', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_ZACHIST_TYPE_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_ZACHIST_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_OTVERST_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_OTVERST_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_OTVERST_DIAM', ftString, 100);
 MTE.FieldDefs.Add(Prefix+'T_OTVERST_COUNT', ftInteger);
 MTE.FieldDefs.Add(Prefix+'T_OTVERST_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_OTVERST_PR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_STROZH_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_STROZH_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_STROZH_M', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_STROZH_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_STROZH_PR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_GIBKA_CEQ', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'T_GIBKA_EQ_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'T_GIBKA_NV', ftFloat);
 MTE.FieldDefs.Add(Prefix+'T_GIBKA_PR', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'INPUTDATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'PRIM', ftString, 255);
End;

Procedure TKD3.UpdateGRMATERIALS_S;
Begin
 GRMATERIALS_S:=GetTextValueOfPointer(IntToStr(CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','name',False);
 if GRMATERIALS_S=EmptyStr then GRMATERIALS_S:=space;
End;

Procedure TKD3.UpdatePROP_STEELMARK_C;
Begin
 PROP_STEELMARK_C:=GetTextValueOfPointer(IntToStr(PROP_STEELMARK),SchemaName+'STEELMARKS','nrec','shortname',False);
 if PROP_STEELMARK_C=EmptyStr then PROP_STEELMARK_C:=space;
End;

Procedure TKD3.UpdatePROP_NORMDOC0_C;
Begin
 PROP_NORMDOC0_C:=GetTextValueOfPointer(IntToStr(PROP_NORMDOC0),SchemaName+'NORMDOC','nrec','name',False);
 if PROP_NORMDOC0_C=EmptyStr then PROP_NORMDOC0_C:=space;
End;

Procedure TKD3.UpdatePROP_NORMDOC1_C;
Begin
 PROP_NORMDOC1_C:=GetTextValueOfPointer(IntToStr(PROP_NORMDOC1),SchemaName+'NORMDOC','nrec','name',False);
 if PROP_NORMDOC1_C=EmptyStr then PROP_NORMDOC1_C:=space;
End;

Procedure TKD3.UpdatePROP_PROFTYPE_C;
Begin
 PROP_PROFTYPE_C:=GetTextValueOfPointer(IntToStr(PROP_PROFTYPE),SchemaName+'PROFTYPES','nrec','name',False);
 if PROP_PROFTYPE_C=EmptyStr then PROP_PROFTYPE_C:=space;
End;

Procedure TKD3.UpdatePROP_FIXTYPE_C;
Begin
 PROP_FIXTYPE_C:=GetTextValueOfPointer(IntToStr(PROP_FIXTYPE),SchemaName+'FIXTYPES','nrec','name',False);
 if PROP_FIXTYPE_C=EmptyStr then PROP_FIXTYPE_C:=space;
End;

Procedure TKD3.UpdatePROP_CARVTYPE_C;
Begin
 PROP_CARVTYPE_C:=GetTextValueOfPointer(IntToStr(PROP_CARVTYPE),SchemaName+'CARVTYPES','nrec','name',False);
 if PROP_CARVTYPE_C=EmptyStr then PROP_CARVTYPE_C:=space;
End;

Procedure TKD3.UpdatePROP_PROFILE_C;
Begin
 PROP_PROFILE_C:=GetTextValueOfPointer(IntToStr(PROP_PROFILE),SchemaName+'NORMDOC','nrec','name',False);
 if PROP_PROFILE_C=EmptyStr then PROP_PROFILE_C:=space;
End;

Procedure TKD3.UpdateT_RAZMET_EQ_S;
Begin
 T_RAZMET_EQ_S:=GetTextValueOfPointer(IntToStr(T_RAZMET_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_RAZMET_EQ_S=EmptyStr then T_RAZMET_EQ_S:=space;
End;

Procedure TKD3.UpdateT_REZKA_EQ_S;
Begin
 T_REZKA_EQ_S:=GetTextValueOfPointer(IntToStr(T_REZKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_REZKA_EQ_S=EmptyStr then T_REZKA_EQ_S:=space;
End;

Procedure TKD3.UpdateT_ZACHIST_TYPE_S;
Begin
 T_ZACHIST_TYPE_S:=GetTextValueOfPointer(IntToStr(T_ZACHIST_CTYPE),SchemaName+'ZACHTYPES','nrec','name',False);
 if T_ZACHIST_TYPE_S=EmptyStr then T_ZACHIST_TYPE_S:=space;
End;

Procedure TKD3.UpdateT_OTVERST_EQ_S;
Begin
 T_OTVERST_EQ_S:=GetTextValueOfPointer(IntToStr(T_OTVERST_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_OTVERST_EQ_S=EmptyStr then T_OTVERST_EQ_S:=space;
End;

Procedure TKD3.UpdateT_STROZH_EQ_S;
Begin
 T_STROZH_EQ_S:=GetTextValueOfPointer(IntToStr(T_STROZH_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_STROZH_EQ_S=EmptyStr then T_STROZH_EQ_S:=space;
End;

Procedure TKD3.UpdateT_GIBKA_EQ_S;
Begin
 T_GIBKA_EQ_S:=GetTextValueOfPointer(IntToStr(T_GIBKA_CEQ),SchemaName+'EQUIPMENT','nrec','model',False);
 if T_GIBKA_EQ_S=EmptyStr then T_GIBKA_EQ_S:=space;
End;

procedure TKD3Form.CGRMATERIALSAppendBtnClick(Sender: TObject);
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

procedure TKD3Form.CGRMATERIALSComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
 GRMATERIALSADOQ.Requery;
 LookupItemToForm(f_CGRMATERIALS,GRMATERIALSADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

Procedure TKD3Form.SetVisiblityRights;
Var
 ExclControlNameList:TStringList;
Begin
 f_T_RAZMET_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_RAZMET_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_REZKA_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_REZKA_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_ZACHIST_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_ZACHIST_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_OTVERST_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_OTVERST_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_STROZH_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_STROZH_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 f_T_GIBKA_NV.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));
 f_T_GIBKA_NVLabel.Visible:=((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=4));

 ExclControlNameList:=TStringList.Create;
 ExclControlNameList.Append('F_T_RAZMET_NV');
 ExclControlNameList.Append('F_T_REZKA_NV');
 ExclControlNameList.Append('F_T_ZACHIST_NV');
 ExclControlNameList.Append('F_T_OTVERST_NV');
 ExclControlNameList.Append('F_T_STROZH_NV');
 ExclControlNameList.Append('F_T_GIBKA_NV');
 ExclControlNameList.Append('F_T_RAZMET_NVLABEL');
 ExclControlNameList.Append('F_T_REZKA_NVLABEL');
 ExclControlNameList.Append('F_T_ZACHIST_NVLABEL');
 ExclControlNameList.Append('F_T_OTVERST_NVLABEL');
 ExclControlNameList.Append('F_T_STROZH_NVLABEL');
 ExclControlNameList.Append('F_T_GIBKA_NVLABEL');
 ExclControlNameList.Append('INCLFILEBTN');
 ExclControlNameList.Append('CANCELBTN');
 ExclControlNameList.Append('OKBTN');
 if CurrentUser.CUSERGROUPS=4 then ControlDisabledIfNotInList(Self,ExclControlNameList);
 ExclControlNameList.Free;

 PROP_STEELMARKAppendBtn.Enabled:=CurrentUser.SprEditRights;
 PROP_NORMDOC0AppendBtn.Enabled:=CurrentUser.SprEditRights;
 PROP_NORMDOC1AppendBtn.Enabled:=CurrentUser.SprEditRights;
 PROP_PROFTYPEAppendBtn.Enabled:=CurrentUser.SprEditRights;
 PROP_PROFILEAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_ZACHIST_CTYPEAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_REZKA_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_OTVERST_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_STROZH_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_GIBKA_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 CGRMATERIALSAppendBtn.Enabled:=CurrentUser.SprEditRights;
 T_RAZMET_CEQAppendBtn.Enabled:=CurrentUser.SprEditRights;
 PROP_CARVTYPEAppendBtn.Enabled:=CurrentUser.SprEditRights;
 PROP_FIXTYPEAppendBtn.Enabled:=CurrentUser.SprEditRights;
End;


procedure TKD3Form.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
// ShowMessage('FormCreate start');

 SetVisiblityRights;

 PMATERIALADOQ.Connection:=Host.ADOC;
 orderby:=' order by ord';
 wh:='nrec in ('+GrMaterialsParents+')';
 PMATERIALADOQ.SQL.Text:='select * from '+SchemaName+'MATERIALS'+' where '+wh+orderby;
 PMATERIALADOQ.Open;

 GRMATERIALSADOQ.Connection:=Host.ADOC;


 PROP_STEELMARKADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,shortname';
 wh:='active=1';
 PROP_STEELMARKADOQ.SQL.Text:='select * from '+SchemaName+'STEELMARKS'+' where '+wh+orderby;
 PROP_STEELMARKADOQ.Open;

 PROP_PROFILEADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1 and normtype=2';
 PROP_PROFILEADOQ.SQL.Text:='select * from '+SchemaName+'NORMDOC'+' where '+wh+orderby;
 PROP_PROFILEADOQ.Open;

 PROP_NORMDOC0ADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1 and normtype=0';
 PROP_NORMDOC0ADOQ.SQL.Text:='select * from '+SchemaName+'NORMDOC'+' where '+wh+orderby;
 PROP_NORMDOC0ADOQ.Open;

 PROP_NORMDOC1ADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1 and normtype=1';
 PROP_NORMDOC1ADOQ.SQL.Text:='select * from '+SchemaName+'NORMDOC'+' where '+wh+orderby;
 PROP_NORMDOC1ADOQ.Open;

 PROP_PROFTYPEADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1';
 PROP_PROFTYPEADOQ.SQL.Text:='select * from '+SchemaName+'PROFTYPES'+' where '+wh+orderby;
 PROP_PROFTYPEADOQ.Open;

 PROP_FIXTYPEADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1';
 PROP_FIXTYPEADOQ.SQL.Text:='select * from '+SchemaName+'FIXTYPES'+' where '+wh+orderby;
 PROP_FIXTYPEADOQ.Open;

 PROP_CARVTYPEADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='active=1';
 PROP_CARVTYPEADOQ.SQL.Text:='select * from '+SchemaName+'CARVTYPES'+' where '+wh+orderby;
 PROP_CARVTYPEADOQ.Open;

 T_RAZMET_EQADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=10)'+' and '+'(active=1)'; // 10 - Разметка
 T_RAZMET_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_RAZMET_EQADOQ.Open;

 T_REZKA_EQADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=6)'+' and '+'(active=1)'; // 6 - Резка
 T_REZKA_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_REZKA_EQADOQ.Open;

 T_OTVERST_EQADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=7)'+' and '+'(active=1)'; // 7 - Отверстия
 T_OTVERST_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_OTVERST_EQADOQ.Open;

 T_STROZH_EQADOQ.Connection:=Host.ADOC;
 orderby:=' order by freq desc,name';
 wh:='NREC in (select CEQUIPMENT from '+SchemaName+'OPEREQUIP where COPERATION=8)'+' and '+'(active=1)'; // 8 - Строжка
 T_STROZH_EQADOQ.SQL.Text:='select * from '+SchemaName+'EQUIPMENT'+' where '+wh+orderby;
 T_STROZH_EQADOQ.Open;

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
// ShowMessage('FormCreate finish');
end;

procedure TKD3Form.FormDestroy(Sender: TObject);
begin
 PMATERIALADOQ.Close;
 GRMATERIALSADOQ.Close;
 PROP_STEELMARKADOQ.Close;
 PROP_PROFILEADOQ.Close;
 PROP_NORMDOC0ADOQ.Close;
 PROP_NORMDOC1ADOQ.Close;
 PROP_PROFTYPEADOQ.Close;
 PROP_FIXTYPEADOQ.Close;
 PROP_CARVTYPEADOQ.Close;
 T_RAZMET_EQADOQ.Close;
 T_REZKA_EQADOQ.Close;
 T_OTVERST_EQADOQ.Close;
 T_STROZH_EQADOQ.Close;
 T_GIBKA_EQADOQ.Close;
 T_ZACHIST_TYPEADOQ.Close;
end;

procedure TKD3Form.FormShow(Sender: TObject);
begin
 if CurrentUser.CUSERGROUPS=4 then
  Begin
   PageControl1.ActivePage:=TabSheet2;
   f_T_RAZMET_NV.SetFocus;
  End
   else
  Begin
   PageControl1.ActivePage:=TabSheet1;
   f_NUMP.SetFocus;
  End;
end;

procedure TKD3Form.f_CGRMATERIALSChange(Sender: TObject);
begin

 UpdatePropList;
 {
 Try
  f_CGRMATERIALS.SetFocus;
  f_CGRMATERIALS.DroppedDown:=True;
 Except
 End;
 }
end;

procedure TKD3Form.f_CPMATERIALChange(Sender: TObject);
Var
 tempValue,tempValue2:int64;
 orderby,wh:string;
begin
 tempValue:=LookupItemFromForm2(f_CPMATERIAL.ItemIndex,PMATERIALADOQ,SchemaName+'MATERIALS');
 tempValue2:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
 GRMATERIALSADOQ.Close;
 orderby:=' order by name';
 wh:='active=1 and cparent='+IntToStr(tempValue);
 GRMATERIALSADOQ.SQL.Text:='select * from '+SchemaName+'GRMATERIALS'+' where '+wh+orderby;
// ShowMessage(MATERIALADOQ.SQL.Text);
 GRMATERIALSADOQ.Open;
 LookupItemToForm(f_CGRMATERIALS,GRMATERIALSADOQ,tempValue2,'name','','',False);
 f_CGRMATERIALSChange(Sender);
// Try f_CGRMATERIALS.SetFocus; Except End;
// Try f_CPMATERIAL.SetFocus; f_CPMATERIAL.DroppedDown:=True; Except End;
end;

procedure TKD3Form.GroupBox2DblClick(Sender: TObject);
begin
  if not Assigned(HolesForm) then begin
    HolesForm := THolesForm.Create(Self);
    HolesForm.HolesADOQuery.Connection := Host.ADOC;
    HolesForm.HolesADOQuery.Parameters.ParamValues['pDetail'] := f_nrec;
    HolesForm.HolesADOQuery.Open;
    HolesForm.HolesClientDataSet.Open;
  end;
  LookupItemToForm(HolesForm.f_T_OTVERST_CEQ,T_OTVERST_EQADOQ,LookupItemFromForm2(f_T_OTVERST_CEQ.ItemIndex,T_OTVERST_EQADOQ,SchemaName+'EQUIPMENT'),'model',EmptyStr,EmptyStr,False);
  HolesForm.ShowModal;
  HolesForm.Free;
  HolesForm := nil;
end;

procedure TKD3Form.UpdatePropList;
Var
 tempValue:int64;
 i,CTop:integer;
 PropList:TStringList;
 vis:boolean;
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
//       if Not vis then Try (c1 as TEdit).SetFocus; Except End;
       vis:=True;
       (c1 as TEdit).Visible:=True;
       (c1 as TEdit).Top:=CTop;
      End;
     if (c1 is TJvCalcEdit) then
      Begin
//       if Not vis then Try (c1 as TJvCalcEdit).SetFocus; Except End;
       vis:=True;
       (c1 as TJvCalcEdit).Visible:=True;
       (c1 as TJvCalcEdit).Top:=CTop;
      End;
     if (c1 is TComboBox) then
      Begin
//       if Not vis then Try (c1 as TComboBox).SetFocus; Except End;
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
 PropList:=TStringList.Create;
 tempValue:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
 GetPropListOfGRMATERIAL(tempValue,PropList);

 PropCopyBtn.Enabled:=(tempValue<>0) and (CurrentUser.CUSERGROUPS<>4);

 CTop:=50; vis:=False;
 CheckVisible('PROP_FIXTYPE');
 CheckVisible('PROP_CARVTYPE');
 CheckVisible('PROP_PROFNUM');
 CheckVisible('PROP_STEELMARK');
 CheckVisible('PROP_NORMDOC0');
 CheckVisible('PROP_NORMDOC1');
 CheckVisible('PROP_LINEDENS');
 CheckVisible('PROP_PWIDTH1');
 CheckVisible('PROP_PWIDTH2');
 CheckVisible('PROP_SIZE1');
 CheckVisible('PROP_SIZE2');
 CheckVisible('PROP_WTHICK');
 CheckVisible('PROP_SLENGTH');
 CheckVisible('PROP_PROFTYPE');
 CheckVisible('PROP_DIAM');
 CheckVisible('PROP_SIZE');
 CheckVisible('PROP_UW');
 CheckVisible('PROP_STEP');
 CheckVisible('PROP_PROFILE');
 CheckVisible('PROP_THICK');
 CheckVisible('PROP_WIDTH');
 CheckVisible('PROP_LENGTH');
 PropGroupBox.Visible:=vis;
 if WindowState<>wsMaximized then Height:=CTop+330;
 PropList.Free;
end;

procedure TKD3Form.InclFileBtnClick(Sender: TObject);
Var
 InclFile:TInclFile;
begin
 InclFile:=TInclFile.Create;
 InclFile.dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+'details';
 InclFile.nrec:=f_nrec;
 InclFile.Descr:=f_NUMP.Text;
 InclFile.Edit(Self);
 InclFile.Free;
end;

procedure TKD3Form.PropCopyBtnClick(Sender: TObject);
Var
 PropList:TStringList;
 tempValue: int64;
 m: TGrMaterials;
begin
 PropList:=TStringList.Create;
 tempValue:=LookupItemFromForm2(f_CGRMATERIALS.ItemIndex,GRMATERIALSADOQ,SchemaName+'GRMATERIALS');
 GetPropListOfGRMATERIAL(tempValue,PropList);

 m:=TGrMaterials.Create;
 if m.GetByNrec(tempValue) then
  Begin
   m.PropsToForm(Self);
  End;
 m.Free;

 PropList.Free;
end;

procedure TKD3Form.PROP_CARVTYPEAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Вид резьбы','Наименование') then
  Begin
  if Not PROP_CARVTYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_CARVTYPEADOQ.Append;
    PROP_CARVTYPEADOQ['freq']:=0;
    PROP_CARVTYPEADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(PROP_CARVTYPEADOQ,'NAME') then PROP_CARVTYPEADOQ.Cancel;
    PROP_CARVTYPEADOQ.Requery;
    if PROP_CARVTYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_CARVTYPE,PROP_CARVTYPEADOQ,PROP_CARVTYPEADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.PROP_CARVTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_CARVTYPE.ItemIndex,PROP_CARVTYPEADOQ,SchemaName+'CARVTYPES');
 PROP_CARVTYPEADOQ.Requery;
 LookupItemToForm(f_PROP_CARVTYPE,PROP_CARVTYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.PROP_FIXTYPEAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Вид крепежа','Наименование') then
  Begin
  if Not PROP_FIXTYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_FIXTYPEADOQ.Append;
    PROP_FIXTYPEADOQ['freq']:=0;
    PROP_FIXTYPEADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(PROP_FIXTYPEADOQ,'NAME') then PROP_FIXTYPEADOQ.Cancel;
    PROP_FIXTYPEADOQ.Requery;
    if PROP_FIXTYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_FIXTYPE,PROP_FIXTYPEADOQ,PROP_FIXTYPEADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.PROP_FIXTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_FIXTYPE.ItemIndex,PROP_FIXTYPEADOQ,SchemaName+'FIXTYPES');
 PROP_FIXTYPEADOQ.Requery;
 LookupItemToForm(f_PROP_FIXTYPE,PROP_FIXTYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.PROP_NORMDOC0AppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Нормативный документ по сортаменту','Наименование') then
  Begin
  if Not PROP_NORMDOC0ADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_NORMDOC0ADOQ.Append;
    PROP_NORMDOC0ADOQ['freq']:=0;
    PROP_NORMDOC0ADOQ['normtype']:=0;
    PROP_NORMDOC0ADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(PROP_NORMDOC0ADOQ,'NAME') then PROP_NORMDOC0ADOQ.Cancel;
    PROP_NORMDOC0ADOQ.Requery;
    if PROP_NORMDOC0ADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_NORMDOC0,PROP_NORMDOC0ADOQ,PROP_NORMDOC0ADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Spr1LabeledEdit.NAME+'" уже присутствует в справочнике!');
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.PROP_NORMDOC0ComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_NORMDOC0.ItemIndex,PROP_NORMDOC0ADOQ,SchemaName+'NORMDOC');
 PROP_NORMDOC0ADOQ.Requery;
 LookupItemToForm(f_PROP_NORMDOC0,PROP_NORMDOC0ADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.PROP_NORMDOC1AppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Нормативный документ по материалу','Наименование') then
  Begin
  if Not PROP_NORMDOC1ADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_NORMDOC1ADOQ.Append;
    PROP_NORMDOC1ADOQ['freq']:=0;
    PROP_NORMDOC1ADOQ['normtype']:=1;
    PROP_NORMDOC1ADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(PROP_NORMDOC1ADOQ,'NAME') then PROP_NORMDOC1ADOQ.Cancel;
    PROP_NORMDOC1ADOQ.Requery;
    if PROP_NORMDOC1ADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_NORMDOC1,PROP_NORMDOC1ADOQ,PROP_NORMDOC1ADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Spr1LabeledEdit.NAME+'" уже присутствует в справочнике!');
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.PROP_NORMDOC1ComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_NORMDOC1.ItemIndex,PROP_NORMDOC1ADOQ,SchemaName+'NORMDOC');
 PROP_NORMDOC1ADOQ.Requery;
 LookupItemToForm(f_PROP_NORMDOC1,PROP_NORMDOC1ADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.PROP_PROFILEAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Профиль','Наименование') then
  Begin
  if Not PROP_PROFILEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_PROFILEADOQ.Append;
    PROP_PROFILEADOQ['freq']:=0;
    PROP_PROFILEADOQ['normtype']:=2;
    PROP_PROFILEADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(PROP_PROFILEADOQ,'NAME') then PROP_PROFILEADOQ.Cancel;
    PROP_PROFILEADOQ.Requery;
    if PROP_PROFILEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_PROFILE,PROP_PROFILEADOQ,PROP_PROFILEADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Spr1LabeledEdit.NAME+'" уже присутствует в справочнике!');
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.PROP_PROFILEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_PROFILE.ItemIndex,PROP_PROFILEADOQ,SchemaName+'NORMDOC');
 PROP_PROFILEADOQ.Requery;
 LookupItemToForm(f_PROP_PROFILE,PROP_PROFILEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.PROP_PROFTYPEAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Вид профиля','Наименование') then
  Begin
  if Not PROP_PROFTYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    PROP_PROFTYPEADOQ.Append;
    PROP_PROFTYPEADOQ['freq']:=0;
    PROP_PROFTYPEADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(PROP_PROFTYPEADOQ,'NAME') then PROP_PROFTYPEADOQ.Cancel;
    PROP_PROFTYPEADOQ.Requery;
    if PROP_PROFTYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_PROFTYPE,PROP_PROFTYPEADOQ,PROP_PROFTYPEADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Spr1LabeledEdit.NAME+'" уже присутствует в справочнике!');
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.PROP_PROFTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_PROFTYPE.ItemIndex,PROP_PROFTYPEADOQ,SchemaName+'PROFTYPES');
 PROP_PROFTYPEADOQ.Requery;
 LookupItemToForm(f_PROP_PROFTYPE,PROP_PROFTYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.PROP_STEELMARKAppendBtnClick(Sender: TObject);
Var
 SteelMark:TSteelMark;
begin
 SteelMark:=TSteelMark.Create;
 if SteelMark.Edit(Self,True) then
  Begin
  if Not PROP_STEELMARKADOQ.Locate('SHORTNAME',SteelMark.SHORTNAME,[loCaseInsensitive]) then
   Begin
    PROP_STEELMARKADOQ.Append;
    if Not SteelMark.Save(PROP_STEELMARKADOQ) then PROP_STEELMARKADOQ.Cancel;
    PROP_STEELMARKADOQ.Requery;
    if PROP_STEELMARKADOQ.Locate('SHORTNAME',SteelMark.SHORTNAME,[loCaseInsensitive]) then
     LookupItemToForm(f_PROP_STEELMARK,PROP_STEELMARKADOQ,PROP_STEELMARKADOQ['nrec'],'shortname',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+SteelMark.SHORTNAME+'" уже присутствует в справочнике!');
  End;
 SteelMark.Free;
end;

procedure TKD3Form.PROP_STEELMARKComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_STEELMARK.ItemIndex,PROP_STEELMARKADOQ,SchemaName+'STEELMARKS');
 PROP_STEELMARKADOQ.Requery;
 LookupItemToForm(f_PROP_STEELMARK,PROP_STEELMARKADOQ,tempValue,'shortname',EmptyStr,EmptyStr,False);
end;

procedure TKD3Form.T_GIBKA_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_GIBKA_EQADOQ,'9',f_T_GIBKA_CEQ);
end;

procedure TKD3Form.T_GIBKA_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_GIBKA_EQADOQ,f_T_GIBKA_CEQ);
end;

procedure TKD3Form.T_OTVERST_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_OTVERST_EQADOQ,'7',f_T_OTVERST_CEQ);
end;

procedure TKD3Form.T_OTVERST_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_OTVERST_EQADOQ,f_T_OTVERST_CEQ);
end;

procedure TKD3Form.T_RAZMET_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_RAZMET_EQADOQ,'10',f_T_RAZMET_CEQ);
end;

procedure TKD3Form.T_RAZMET_CEQComboUpdateBtnClickClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_RAZMET_EQADOQ,f_T_RAZMET_CEQ);
end;

procedure TKD3Form.T_REZKA_CEQAppendBtnClick(Sender: TObject);
{
Var
 eq:TEquipment;}
begin
 NewEQUIPMENT(Self,T_REZKA_EQADOQ,'6',f_T_REZKA_CEQ);

{
 eq:=TEquipment.Create;
 eq.OPERLIST.Append('6'); // Резка
 if eq.Edit(Self,True) then
  Begin
  if Not T_REZKA_EQADOQ.Locate('NAME',eq.NAME,[loCaseInsensitive]) then
   Begin
    T_REZKA_EQADOQ.Append;
    T_REZKA_EQADOQ['freq']:=0;
    T_REZKA_EQADOQ['active']:=1;
    if Not eq.Save(T_REZKA_EQADOQ) then T_REZKA_EQADOQ.Cancel;
    T_REZKA_EQADOQ.Requery;
    if T_REZKA_EQADOQ.Locate('NAME',eq.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_T_REZKA_CEQ,T_REZKA_EQADOQ,T_REZKA_EQADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End;
  End;
 eq.Free;
}
end;

procedure TKD3Form.T_REZKA_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_REZKA_EQADOQ,f_T_REZKA_CEQ);
end;

procedure TKD3Form.T_STROZH_CEQAppendBtnClick(Sender: TObject);
begin
 NewEQUIPMENT(Self,T_STROZH_EQADOQ,'8',f_T_STROZH_CEQ);
end;

procedure TKD3Form.T_STROZH_CEQComboUpdateBtnClick(Sender: TObject);
begin
 EQUIPMENTComboUpdate(T_STROZH_EQADOQ,f_T_STROZH_CEQ);
end;

procedure TKD3Form.T_ZACHIST_CTYPEAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Способ зачистки','Наименование') then
  Begin
  if Not T_ZACHIST_TYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    T_ZACHIST_TYPEADOQ.Append;
    T_ZACHIST_TYPEADOQ['freq']:=0;
    T_ZACHIST_TYPEADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(T_ZACHIST_TYPEADOQ,'NAME') then T_ZACHIST_TYPEADOQ.Cancel;
    T_ZACHIST_TYPEADOQ.Requery;
    if T_ZACHIST_TYPEADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_T_ZACHIST_CTYPE,T_ZACHIST_TYPEADOQ,T_ZACHIST_TYPEADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End else ShowMessage('Элемент с именем "'+Spr1LabeledEdit.NAME+'" уже присутствует в справочнике!');
  End;
 Spr1LabeledEdit.Free;
end;

procedure TKD3Form.T_ZACHIST_CTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_T_ZACHIST_CTYPE.ItemIndex,T_ZACHIST_TYPEADOQ,SchemaName+'ZACHTYPES');
 T_ZACHIST_TYPEADOQ.Requery;
 LookupItemToForm(f_T_ZACHIST_CTYPE,T_ZACHIST_TYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

Constructor TKD3.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TKD3.Clear;
begin
 NREC:=0;
 CKD:=0;
 ORDERNUM:=EmptyStr;
 ORDERNUM2:=EmptyStr;
 NUMP:=zero;
 CGRMATERIALS:=0;
 GRMATERIALS_S:=EmptyStr;
 PROP_PROFNUM:=EmptyStr;
 PROP_STEELMARK:=0;
 PROP_NORMDOC0:=0;
 PROP_NORMDOC1:=0;
 PROP_LINEDENS:=0;
 PROP_PWIDTH1:=0;
 PROP_PWIDTH2:=0;
 PROP_SIZE1:=0;
 PROP_SIZE2:=0;
 PROP_WTHICK:=0;
 PROP_SLENGTH:=0;
 PROP_PROFTYPE:=0;
 PROP_FIXTYPE:=0;
 PROP_CARVTYPE:=0;
 PROP_DIAM:=0;
 PROP_SIZE:=0;
 PROP_UW:=0;
 PROP_STEP:=0;
 PROP_PROFILE:=0;
 PROP_STEELMARK_C:=EmptyStr;
 PROP_NORMDOC0_C:=EmptyStr;
 PROP_NORMDOC1_C:=EmptyStr;
 PROP_PROFTYPE_C:=EmptyStr;
 PROP_FIXTYPE_C:=EmptyStr;
 PROP_CARVTYPE_C:=EmptyStr;
 PROP_PROFILE_C:=EmptyStr;
 PROP_THICK_C:=0;
 PROP_WIDTH_C:=0;
 PROP_LENGTH_C:=0;
 WEIGHT1:=0;
 T_RAZMET_CEQ:=0;
 T_RAZMET_EQ_S:=EmptyStr;
 T_RAZMET_NV:=0;
 T_RAZMET_PR:=EmptyStr;
 T_REZKA_CEQ:=0;
 T_REZKA_EQ_S:=EmptyStr;
 T_REZKA_M:=0;
 T_REZKA_NV:=0;
 T_REZKA_PR:=EmptyStr;
 T_ZACHIST_CTYPE:=0;
 T_ZACHIST_TYPE_S:=EmptyStr;
 T_ZACHIST_NV:=0;
 T_OTVERST_CEQ:=0;
 T_OTVERST_EQ_S:=EmptyStr;
 T_OTVERST_DIAM:=EmptyStr;
 T_OTVERST_COUNT:=0;
 T_OTVERST_NV:=0;
 T_OTVERST_PR:=EmptyStr;
 T_STROZH_CEQ:=0;
 T_STROZH_EQ_S:=EmptyStr;
 T_STROZH_M:=0;
 T_STROZH_NV:=0;
 T_STROZH_PR:=EmptyStr;
 T_GIBKA_CEQ:=0;
 T_GIBKA_EQ_S:=EmptyStr;
 T_GIBKA_NV:=0;
 T_GIBKA_PR:=EmptyStr;
 INPUTDATE:=Now;
 PRIM:=EmptyStr;
end;

Function TKD3.Save(Dataset:TDataset;Prefix:string=''):boolean;
Var
 PropList:TStringList;
Begin
 result:=True;
 PropList:=TStringList.Create;
 GetPropListOfGRMATERIAL(CGRMATERIALS,PropList);
 UpdateGRMATERIALS_S;
 if PropList.IndexOf('PROP_STEELMARK')<>-1 then UpdatePROP_STEELMARK_C;
 if PropList.IndexOf('PROP_NORMDOC0')<>-1 then UpdatePROP_NORMDOC0_C;
 if PropList.IndexOf('PROP_NORMDOC1')<>-1 then UpdatePROP_NORMDOC1_C;
 if PropList.IndexOf('PROP_PROFTYPE')<>-1 then UpdatePROP_PROFTYPE_C;
 if PropList.IndexOf('PROP_FIXTYPE')<>-1 then UpdatePROP_FIXTYPE_C;
 if PropList.IndexOf('PROP_CARVTYPE')<>-1 then UpdatePROP_CARVTYPE_C;
 if PropList.IndexOf('PROP_PROFILE')<>-1 then UpdatePROP_PROFILE_C;
 UpdateT_RAZMET_EQ_S;
 UpdateT_REZKA_EQ_S;
 UpdateT_ZACHIST_TYPE_S;
 UpdateT_OTVERST_EQ_S;
 UpdateT_STROZH_EQ_S;
 UpdateT_GIBKA_EQ_S;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 Dataset[Prefix+'CKD']:=CKD;
 Dataset[Prefix+'NUMP']:=NUMP;
 Dataset[Prefix+'CGRMATERIALS']:=CGRMATERIALS;
 Dataset[Prefix+'GRMATERIALS_S']:=GRMATERIALS_S;
 if PropList.IndexOf(Prefix+'PROP_PROFNUM')<>-1 then
  Begin
   Dataset[Prefix+'PROP_PROFNUM']:=PROP_PROFNUM;
  End;
 if PropList.IndexOf(Prefix+'PROP_STEELMARK')<>-1 then
  Begin
   Dataset[Prefix+'PROP_STEELMARK']:=PROP_STEELMARK;
   Dataset[Prefix+'PROP_STEELMARK_C']:=PROP_STEELMARK_C;
  End;
 if PropList.IndexOf(Prefix+'PROP_NORMDOC0')<>-1 then
  Begin
   Dataset[Prefix+'PROP_NORMDOC0']:=PROP_NORMDOC0;
   Dataset[Prefix+'PROP_NORMDOC0_C']:=PROP_NORMDOC0_C;
  End;
 if PropList.IndexOf('PROP_NORMDOC1')<>-1 then
  Begin
   Dataset[Prefix+'PROP_NORMDOC1']:=PROP_NORMDOC1;
   Dataset[Prefix+'PROP_NORMDOC1_C']:=PROP_NORMDOC1_C;
  End;
 if PropList.IndexOf('PROP_LINEDENS')<>-1 then
  Begin
   Dataset[Prefix+'PROP_LINEDENS']:=PROP_LINEDENS;
  End;
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
 if PropList.IndexOf('PROP_PROFTYPE')<>-1 then
  Begin
   Dataset[Prefix+'PROP_PROFTYPE']:=PROP_PROFTYPE;
   Dataset[Prefix+'PROP_PROFTYPE_C']:=PROP_PROFTYPE_C;
  End;
 if PropList.IndexOf('PROP_FIXTYPE')<>-1 then
  Begin
   Dataset[Prefix+'PROP_FIXTYPE']:=PROP_FIXTYPE;
   Dataset[Prefix+'PROP_FIXTYPE_C']:=PROP_FIXTYPE_C;
  End;
 if PropList.IndexOf('PROP_CARVTYPE')<>-1 then
  Begin
   Dataset[Prefix+'PROP_CARVTYPE']:=PROP_CARVTYPE;
   Dataset[Prefix+'PROP_CARVTYPE_C']:=PROP_CARVTYPE_C;
  End;
 if PropList.IndexOf('PROP_DIAM')<>-1 then
  Begin
   Dataset[Prefix+'PROP_DIAM']:=PROP_DIAM;
  End;
 if PropList.IndexOf('PROP_SIZE')<>-1 then
  Begin
   Dataset[Prefix+'PROP_SIZE']:=PROP_SIZE;
  End;
 if PropList.IndexOf('PROP_UW')<>-1 then
  Begin
   Dataset[Prefix+'PROP_UW']:=PROP_UW;
  End;
 if PropList.IndexOf('PROP_STEP')<>-1 then
  Begin
   Dataset[Prefix+'PROP_STEP']:=PROP_STEP;
  End;
 if PropList.IndexOf('PROP_PROFILE')<>-1 then
  Begin
   Dataset[Prefix+'PROP_PROFILE']:=PROP_PROFILE;
   Dataset[Prefix+'PROP_PROFILE_C']:=PROP_PROFILE_C;
  End;
 if PropList.IndexOf('PROP_THICK')<>-1 then
  Begin
   Dataset[Prefix+'PROP_THICK_C']:=PROP_THICK_C;
  End;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then
  Begin
   Dataset[Prefix+'PROP_WIDTH_C']:=PROP_WIDTH_C;
  End;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then
  Begin
   Dataset[Prefix+'PROP_LENGTH_C']:=PROP_LENGTH_C;
  End;
 Dataset[Prefix+'WEIGHT1']:=WEIGHT1;
 Dataset[Prefix+'T_RAZMET_CEQ']:=T_RAZMET_CEQ;
 Dataset[Prefix+'T_RAZMET_EQ_S']:=T_RAZMET_EQ_S;
 Dataset[Prefix+'T_RAZMET_NV']:=T_RAZMET_NV;
 Dataset[Prefix+'T_RAZMET_PR']:=T_RAZMET_PR;
 Dataset[Prefix+'T_REZKA_CEQ']:=T_REZKA_CEQ;
 Dataset[Prefix+'T_REZKA_EQ_S']:=T_REZKA_EQ_S;
 Dataset[Prefix+'T_REZKA_M']:=T_REZKA_M;
 Dataset[Prefix+'T_REZKA_NV']:=T_REZKA_NV;
 Dataset[Prefix+'T_REZKA_PR']:=T_REZKA_PR;
 Dataset[Prefix+'T_ZACHIST_CTYPE']:=T_ZACHIST_CTYPE;
 Dataset[Prefix+'T_ZACHIST_TYPE_S']:=T_ZACHIST_TYPE_S;
 Dataset[Prefix+'T_ZACHIST_NV']:=T_ZACHIST_NV;
 Dataset[Prefix+'T_OTVERST_CEQ']:=T_OTVERST_CEQ;
 Dataset[Prefix+'T_OTVERST_EQ_S']:=T_OTVERST_EQ_S;
 Dataset[Prefix+'T_OTVERST_DIAM']:=T_OTVERST_DIAM;
 Dataset[Prefix+'T_OTVERST_COUNT']:=T_OTVERST_COUNT;
 Dataset[Prefix+'T_OTVERST_NV']:=T_OTVERST_NV;
 Dataset[Prefix+'T_OTVERST_PR']:=T_OTVERST_PR;
 Dataset[Prefix+'T_STROZH_CEQ']:=T_STROZH_CEQ;
 Dataset[Prefix+'T_STROZH_EQ_S']:=T_STROZH_EQ_S;
 Dataset[Prefix+'T_STROZH_M']:=T_STROZH_M;
 Dataset[Prefix+'T_STROZH_NV']:=T_STROZH_NV;
 Dataset[Prefix+'T_STROZH_PR']:=T_STROZH_PR;
 Dataset[Prefix+'T_GIBKA_CEQ']:=T_GIBKA_CEQ;
 Dataset[Prefix+'T_GIBKA_EQ_S']:=T_GIBKA_EQ_S;
 Dataset[Prefix+'T_GIBKA_NV']:=T_GIBKA_NV;
 Dataset[Prefix+'T_GIBKA_PR']:=T_GIBKA_PR;
 Dataset[Prefix+'INPUTDATE']:=INPUTDATE;
 Dataset[Prefix+'PRIM']:=PRIM;
 Try
     Dataset.Post;
     if Empty(Prefix) then
     Begin
     FreqInc(SchemaName+'GRMATERIALS',CGRMATERIALS);
     if PropList.IndexOf('PROP_STEELMARK')<>-1 then FreqInc(SchemaName+'STEELMARKS',PROP_STEELMARK);
     if PropList.IndexOf('PROP_NORMDOC0')<>-1 then FreqInc(SchemaName+'NORMDOC',PROP_NORMDOC0);
     if PropList.IndexOf('PROP_NORMDOC1')<>-1 then FreqInc(SchemaName+'NORMDOC',PROP_NORMDOC1);
     if PropList.IndexOf('PROP_PROFILE')<>-1 then FreqInc(SchemaName+'NORMDOC',PROP_PROFILE);
     if PropList.IndexOf('PROP_PROFTYPE')<>-1 then FreqInc(SchemaName+'PROFTYPES',PROP_PROFTYPE);
     if PropList.IndexOf('PROP_FIXTYPE')<>-1 then FreqInc(SchemaName+'FIXTYPES',PROP_FIXTYPE);
     if PropList.IndexOf('PROP_CARVTYPE')<>-1 then FreqInc(SchemaName+'CARVTYPES',PROP_CARVTYPE);
     FreqInc(SchemaName+'EQUIPMENT',T_RAZMET_CEQ);
     FreqInc(SchemaName+'EQUIPMENT',T_REZKA_CEQ);
     FreqInc(SchemaName+'EQUIPMENT',T_OTVERST_CEQ);
     FreqInc(SchemaName+'EQUIPMENT',T_STROZH_CEQ);
     FreqInc(SchemaName+'EQUIPMENT',T_GIBKA_CEQ);
     FreqInc(SchemaName+'ZACHTYPES',T_ZACHIST_CTYPE);
     End;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о детали! ('+e.Message+')');
      End;
 End;
 PropList.Free;
End;

Function TKD3.Read(Var Dataset:TAdoQuery):boolean;
Var
 PropList:TStringList;
// CKD:string;
 adoq:TAdoQuery;
Begin
 result:=True;
 PropList:=TStringList.Create;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 CKD:=Dataset['CKD'];

{
 ORDERNUM2:=EmptyStr;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select ORDERNUM2 from '+SchemaName+'MARKS'+' where CKD='+IntToStr(ckd)+' group by ORDERNUM2';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   if Not Empty(adoq.FieldByName('ORDERNUM2').AsString) then
    Begin
     if Not Empty(ORDERNUM2) then ORDERNUM2:=ORDERNUM2+comma+space;
     ORDERNUM2:=ORDERNUM2+Trim(adoq.FieldByName('ORDERNUM2').AsString);
    End;
   adoq.Next;
  End;
 adoq.Close;
 adoq.Free;
}

// ORDERNUM2:=GetTextValueOfPointer(IntToStr(CMARK),SchemaName+'marks','nrec','ORDERNUM2',False);
// CKD:=GetTextValueOfPointer(IntToStr(CMARK),SchemaName+'marks','nrec','CKD',False);
 ORDERNUM:=GetTextValueOfPointer(IntToStr(CKD),SchemaName+'kd','nrec','ORDERNUM',False);
 ORDERNUM2:=GetTextValueOfPointer(IntToStr(CKD),SchemaName+'kd','nrec','ORDERNUM2',False);
 NUMP:=Dataset['NUMP'];
 CGRMATERIALS:=Dataset['CGRMATERIALS'];
// ShowMessage('CGRMATERIALS='+IntToStr(CGRMATERIALS));
 GRMATERIALS_S:=Dataset['GRMATERIALS_S'];
 GetPropListOfGRMATERIAL(CGRMATERIALS,PropList);
 if PropList.IndexOf('PROP_PROFNUM')<>-1 then
  Begin
   PROP_PROFNUM:=Dataset['PROP_PROFNUM'];
  End;
 if PropList.IndexOf('PROP_STEELMARK')<>-1 then
  Begin
   PROP_STEELMARK:=Dataset['PROP_STEELMARK'];
   PROP_STEELMARK_C:=Dataset['PROP_STEELMARK_C'];
  End;
 if PropList.IndexOf('PROP_NORMDOC0')<>-1 then
  Begin
   PROP_NORMDOC0:=Dataset['PROP_NORMDOC0'];
   PROP_NORMDOC0_C:=Dataset['PROP_NORMDOC0_C'];
  End;
 if PropList.IndexOf('PROP_NORMDOC1')<>-1 then
  Begin
   PROP_NORMDOC1:=Dataset['PROP_NORMDOC1'];
   PROP_NORMDOC1_C:=Dataset['PROP_NORMDOC1_C'];
  End;
 if PropList.IndexOf('PROP_LINEDENS')<>-1 then
  Begin
   PROP_LINEDENS:=Dataset['PROP_LINEDENS'];
  End;
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
 if PropList.IndexOf('PROP_PROFTYPE')<>-1 then
  Begin
   PROP_PROFTYPE:=Dataset['PROP_PROFTYPE'];
   PROP_PROFTYPE_C:=Dataset['PROP_PROFTYPE_C'];
  End;
 if PropList.IndexOf('PROP_FIXTYPE')<>-1 then
  Begin
   PROP_FIXTYPE:=Dataset['PROP_FIXTYPE'];
   PROP_FIXTYPE_C:=Dataset['PROP_FIXTYPE_C'];
  End;
 if PropList.IndexOf('PROP_CARVTYPE')<>-1 then
  Begin
   PROP_CARVTYPE:=Dataset['PROP_CARVTYPE'];
   PROP_CARVTYPE_C:=Dataset['PROP_CARVTYPE_C'];
  End;
 if PropList.IndexOf('PROP_DIAM')<>-1 then
  Begin
   PROP_DIAM:=Dataset['PROP_DIAM'];
  End;
 if PropList.IndexOf('PROP_SIZE')<>-1 then
  Begin
   PROP_SIZE:=Dataset['PROP_SIZE'];
  End;
 if PropList.IndexOf('PROP_UW')<>-1 then
  Begin
   PROP_UW:=Dataset['PROP_UW'];
  End;
 if PropList.IndexOf('PROP_STEP')<>-1 then
  Begin
   PROP_STEP:=Dataset['PROP_STEP'];
  End;
 if PropList.IndexOf('PROP_PROFILE')<>-1 then
  Begin
   PROP_PROFILE:=Dataset['PROP_PROFILE'];
   PROP_PROFILE_C:=Dataset['PROP_PROFILE_C'];
  End;
 if PropList.IndexOf('PROP_THICK')<>-1 then
  Begin
   PROP_THICK_C:=Dataset['PROP_THICK_C'];
  End;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then
  Begin
   PROP_WIDTH_C:=Dataset['PROP_WIDTH_C'];
  End;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then
  Begin
   PROP_LENGTH_C:=Dataset['PROP_LENGTH_C'];
  End;
 WEIGHT1:=Dataset['WEIGHT1'];
 T_RAZMET_CEQ:=Dataset['T_RAZMET_CEQ'];
 T_RAZMET_EQ_S:=Dataset['T_RAZMET_EQ_S'];
 T_RAZMET_NV:=Dataset['T_RAZMET_NV'];
 T_RAZMET_PR:=Dataset['T_RAZMET_PR'];
 T_REZKA_CEQ:=Dataset['T_REZKA_CEQ'];
 T_REZKA_EQ_S:=Dataset['T_REZKA_EQ_S'];
 T_REZKA_M:=Dataset['T_REZKA_M'];
 T_REZKA_NV:=Dataset['T_REZKA_NV'];
 T_REZKA_PR:=Dataset['T_REZKA_PR'];
 T_ZACHIST_CTYPE:=Dataset['T_ZACHIST_CTYPE'];
 T_ZACHIST_TYPE_S:=Dataset['T_ZACHIST_TYPE_S'];
 T_ZACHIST_NV:=Dataset['T_ZACHIST_NV'];
 T_OTVERST_CEQ:=Dataset['T_OTVERST_CEQ'];
 T_OTVERST_EQ_S:=Dataset['T_OTVERST_EQ_S'];
 T_OTVERST_DIAM:=Dataset['T_OTVERST_DIAM'];
 T_OTVERST_COUNT:=Dataset['T_OTVERST_COUNT'];
 T_OTVERST_NV:=Dataset['T_OTVERST_NV'];
 T_OTVERST_PR:=Dataset['T_OTVERST_PR'];
 T_STROZH_CEQ:=Dataset['T_STROZH_CEQ'];
 T_STROZH_EQ_S:=Dataset['T_STROZH_EQ_S'];
 T_STROZH_M:=Dataset['T_STROZH_M'];
 T_STROZH_NV:=Dataset['T_STROZH_NV'];
 T_STROZH_PR:=Dataset['T_STROZH_PR'];
 T_GIBKA_CEQ:=Dataset['T_GIBKA_CEQ'];
 T_GIBKA_EQ_S:=Dataset['T_GIBKA_EQ_S'];
 T_GIBKA_NV:=Dataset['T_GIBKA_NV'];
 T_GIBKA_PR:=Dataset['T_GIBKA_PR'];
 INPUTDATE:=Dataset['INPUTDATE'];
 PRIM:=Dataset['PRIM'];
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о детали! ('+e.Message+')');
   End;
 End;
 PropList.Free;
End;

Function TKD3.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TKD3Form;
begin
 Form:=TKD3Form.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TKD3.ToForm(Var Form:TKD3Form;New:boolean):boolean;
Var
 i:integer;
 CPMATERIAL:int64;
Begin
 Form.f_nrec:=nrec;
 Form.f_CKD:=CKD;

 Form.OKBtn.Enabled:=(CurrentUser.CUSERGROUPS<>2) and (CurrentUser.CUSERGROUPS<>7);

 if New then Form.Caption:='Добавление новой детали для заказа МРК № '+ORDERNUM+', заказа ЦМК № '+ORDERNUM2
        else Form.Caption:='Заказ МРК № '+ORDERNUM+', ЦМК заказ № '+ORDERNUM2+comma+space+'деталь '+NUMP;

 Form.InclFileBtn.Enabled:=Not New and Not Empty(Host.PicturesDir);

 if New then CPMATERIAL:=4
        else CPMATERIAL:=StrToIntM(GetTextValueOfPointer(IntToStr(CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','cparent',False));
 LookupItemToForm(Form.f_CPMATERIAL,Form.PMATERIALADOQ,CPMATERIAL,'name',EmptyStr,EmptyStr,True);
 Form.f_CPMATERIALChange(Form);

 LookupItemToForm(Form.f_CGRMATERIALS,Form.GRMATERIALSADOQ,CGRMATERIALS,'name',EmptyStr,EmptyStr,False);
 Form.f_CGRMATERIALSChange(Form);

 Form.f_NUMP.Text:=NUMP;
 Form.f_PROP_PROFNUM.Text:=PROP_PROFNUM;
 LookupItemToForm(Form.f_PROP_STEELMARK,Form.PROP_STEELMARKADOQ,PROP_STEELMARK,'shortname',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_NORMDOC0,Form.PROP_NORMDOC0ADOQ,PROP_NORMDOC0,'name',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_NORMDOC1,Form.PROP_NORMDOC1ADOQ,PROP_NORMDOC1,'name',EmptyStr,EmptyStr,False);
 Form.f_PROP_LINEDENS.Value:=PROP_LINEDENS;
 Form.f_PROP_PWIDTH1.Value:=PROP_PWIDTH1;
 Form.f_PROP_PWIDTH2.Value:=PROP_PWIDTH2;
 Form.f_PROP_SIZE1.Value:=PROP_SIZE1;
 Form.f_PROP_SIZE2.Value:=PROP_SIZE2;
 Form.f_PROP_WTHICK.Value:=PROP_WTHICK;
 Form.f_PROP_SLENGTH.Value:=PROP_SLENGTH;
 LookupItemToForm(Form.f_PROP_PROFTYPE,Form.PROP_PROFTYPEADOQ,PROP_PROFTYPE,'name',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_FIXTYPE,Form.PROP_FIXTYPEADOQ,PROP_FIXTYPE,'name',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_CARVTYPE,Form.PROP_CARVTYPEADOQ,PROP_CARVTYPE,'name',EmptyStr,EmptyStr,False);
 Form.f_PROP_DIAM.Value:=PROP_DIAM;
 Form.f_PROP_SIZE.Value:=PROP_SIZE;
 Form.f_PROP_UW.Value:=PROP_UW;
 Form.f_PROP_STEP.Value:=PROP_STEP;
 LookupItemToForm(Form.f_PROP_PROFILE,Form.PROP_PROFILEADOQ,PROP_PROFILE,'name',EmptyStr,EmptyStr,False);
 Form.f_PROP_THICK.Value:=PROP_THICK_C;
 Form.f_PROP_WIDTH.Value:=PROP_WIDTH_C;
 Form.f_PROP_LENGTH.Value:=PROP_LENGTH_C;
// LookupItemToForm(Form.f_PROP_THICK,Form.PROP_THICKADOQ,PROP_THICK,'value',EmptyStr,EmptyStr,False);
// LookupItemToForm(Form.f_PROP_WIDTH,Form.PROP_WIDTHADOQ,PROP_WIDTH,'value',EmptyStr,EmptyStr,False);
// LookupItemToForm(Form.f_PROP_LENGTH,Form.PROP_LENGTHADOQ,PROP_LENGTH,'value',EmptyStr,EmptyStr,False);
 Form.f_WEIGHT1.Value:=WEIGHT1;
 LookupItemToForm(Form.f_T_RAZMET_CEQ,Form.T_RAZMET_EQADOQ,T_RAZMET_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_RAZMET_NV.Value:=T_RAZMET_NV;
 Form.f_T_RAZMET_PR.Text:=T_RAZMET_PR;
 LookupItemToForm(Form.f_T_REZKA_CEQ,Form.T_REZKA_EQADOQ,T_REZKA_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_REZKA_M.Value:=T_REZKA_M;
 Form.f_T_REZKA_NV.Value:=T_REZKA_NV;
 Form.f_T_REZKA_PR.Text:=T_REZKA_PR;
 LookupItemToForm(Form.f_T_ZACHIST_CTYPE,Form.T_ZACHIST_TYPEADOQ,T_ZACHIST_CTYPE,'name',EmptyStr,EmptyStr,False);
 Form.f_T_ZACHIST_NV.Value:=T_ZACHIST_NV;
 LookupItemToForm(Form.f_T_OTVERST_CEQ,Form.T_OTVERST_EQADOQ,T_OTVERST_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_OTVERST_DIAM.Text:=T_OTVERST_DIAM;
 Form.f_T_OTVERST_COUNT.Value:=T_OTVERST_COUNT;
 Form.f_T_OTVERST_NV.Value:=T_OTVERST_NV;
 Form.f_T_OTVERST_PR.Text:=T_OTVERST_PR;
 LookupItemToForm(Form.f_T_STROZH_CEQ,Form.T_STROZH_EQADOQ,T_STROZH_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_STROZH_M.Value:=T_STROZH_M;
 Form.f_T_STROZH_NV.Value:=T_STROZH_NV;
 Form.f_T_STROZH_PR.Text:=T_STROZH_PR;
 LookupItemToForm(Form.f_T_GIBKA_CEQ,Form.T_GIBKA_EQADOQ,T_GIBKA_CEQ,'model',EmptyStr,EmptyStr,False);
 Form.f_T_GIBKA_NV.Value:=T_GIBKA_NV;
 Form.f_T_GIBKA_PR.Text:=T_GIBKA_PR;
 Form.f_INPUTDATE.Caption:=DateToStr(INPUTDATE);
 Form.f_PRIM.Text:=PRIM;
 result:=True;
End;

Function TKD3.FromForm(Var Form:TKD3Form):boolean;
Begin
 nrec:=Form.f_nrec;
 NUMP:=Form.f_NUMP.Text;
 if NUMP=EmptyStr then NUMP:=space;
 CKD:=Form.f_CKD;
// CMATERIAL:=LookupItemFromForm2(Form.f_CMATERIAL.ItemIndex,Form.MATERIALADOQ,SchemaName+'MATERIALS',False);
 CGRMATERIALS:=LookupItemFromForm2(Form.f_CGRMATERIALS.ItemIndex,Form.GRMATERIALSADOQ,SchemaName+'GRMATERIALS',False);
 PROP_PROFNUM:=Trim(Form.f_PROP_PROFNUM.Text);
 if PROP_PROFNUM=EmptyStr then PROP_PROFNUM:=space;
 PROP_STEELMARK:=LookupItemFromForm2(Form.f_PROP_STEELMARK.ItemIndex,Form.PROP_STEELMARKADOQ,SchemaName+'STEELMARKS');
 PROP_NORMDOC0:=LookupItemFromForm2(Form.f_PROP_NORMDOC0.ItemIndex,Form.PROP_NORMDOC0ADOQ,SchemaName+'NORMDOC');
 PROP_NORMDOC1:=LookupItemFromForm2(Form.f_PROP_NORMDOC1.ItemIndex,Form.PROP_NORMDOC1ADOQ,SchemaName+'NORMDOC');
 PROP_LINEDENS:=Form.f_PROP_LINEDENS.Value;
 PROP_PWIDTH1:=Form.f_PROP_PWIDTH1.Value;
 PROP_PWIDTH2:=Form.f_PROP_PWIDTH2.Value;
 PROP_SIZE1:=Form.f_PROP_SIZE1.Value;
 PROP_SIZE2:=Form.f_PROP_SIZE2.Value;
 PROP_WTHICK:=Form.f_PROP_WTHICK.Value;
 PROP_SLENGTH:=Form.f_PROP_SLENGTH.Value;
 PROP_PROFTYPE:=LookupItemFromForm2(Form.f_PROP_PROFTYPE.ItemIndex,Form.PROP_PROFTYPEADOQ,SchemaName+'PROFTYPES');
 PROP_FIXTYPE:=LookupItemFromForm2(Form.f_PROP_FIXTYPE.ItemIndex,Form.PROP_FIXTYPEADOQ,SchemaName+'FIXTYPES');
 PROP_CARVTYPE:=LookupItemFromForm2(Form.f_PROP_CARVTYPE.ItemIndex,Form.PROP_CARVTYPEADOQ,SchemaName+'CARVTYPES');
 PROP_DIAM:=Form.f_PROP_DIAM.Value;
 PROP_SIZE:=Form.f_PROP_SIZE.Value;
 PROP_UW:=Form.f_PROP_UW.Value;
 PROP_STEP:=Form.f_PROP_STEP.Value;
 PROP_PROFILE:=LookupItemFromForm2(Form.f_PROP_PROFILE.ItemIndex,Form.PROP_PROFILEADOQ,SchemaName+'NORMDOC');
 PROP_THICK_C:=Form.f_PROP_THICK.Value;
 PROP_WIDTH_C:=Form.f_PROP_WIDTH.Value;
 PROP_LENGTH_C:=Form.f_PROP_LENGTH.Value;
// PROP_THICK:=LookupItemFromForm2(Form.f_PROP_THICK.ItemIndex,Form.PROP_THICKADOQ,SchemaName+'THICKS');
// PROP_WIDTH:=LookupItemFromForm2(Form.f_PROP_WIDTH.ItemIndex,Form.PROP_WIDTHADOQ,SchemaName+'WIDTHS');
// PROP_LENGTH:=LookupItemFromForm2(Form.f_PROP_LENGTH.ItemIndex,Form.PROP_LENGTHADOQ,SchemaName+'LENGTHS');
 WEIGHT1:=Form.f_WEIGHT1.Value;
 T_RAZMET_CEQ:=LookupItemFromForm2(Form.f_T_RAZMET_CEQ.ItemIndex,Form.T_RAZMET_EQADOQ,SchemaName+'EQUIPMENT');
 T_RAZMET_NV:=Form.f_T_RAZMET_NV.Value;
 T_RAZMET_PR:=Trim(Form.f_T_RAZMET_PR.Text);
 if T_RAZMET_PR=EmptyStr then T_RAZMET_PR:=space;
 T_REZKA_CEQ:=LookupItemFromForm2(Form.f_T_REZKA_CEQ.ItemIndex,Form.T_REZKA_EQADOQ,SchemaName+'EQUIPMENT');
 T_REZKA_M:=Form.f_T_REZKA_M.Value;
 T_REZKA_NV:=Form.f_T_REZKA_NV.Value;
 T_REZKA_PR:=Trim(Form.f_T_REZKA_PR.Text);
 if T_REZKA_PR=EmptyStr then T_REZKA_PR:=space;
 T_ZACHIST_CTYPE:=LookupItemFromForm2(Form.f_T_ZACHIST_CTYPE.ItemIndex,Form.T_ZACHIST_TYPEADOQ,SchemaName+'ZACHTYPES');
 T_ZACHIST_NV:=Form.f_T_ZACHIST_NV.Value;
 T_OTVERST_CEQ:=LookupItemFromForm2(Form.f_T_OTVERST_CEQ.ItemIndex,Form.T_OTVERST_EQADOQ,SchemaName+'EQUIPMENT');
 T_OTVERST_DIAM:=Trim(Form.f_T_OTVERST_DIAM.Text);
 if T_OTVERST_DIAM=EmptyStr then T_OTVERST_DIAM:=space;
 T_OTVERST_COUNT:=RoundUp(Form.f_T_OTVERST_COUNT.Value);
 T_OTVERST_NV:=Form.f_T_OTVERST_NV.Value;
 T_OTVERST_PR:=Trim(Form.f_T_OTVERST_PR.Text);
 if T_OTVERST_PR=EmptyStr then T_OTVERST_PR:=space;
 T_STROZH_CEQ:=LookupItemFromForm2(Form.f_T_STROZH_CEQ.ItemIndex,Form.T_STROZH_EQADOQ,SchemaName+'EQUIPMENT');
 T_STROZH_M:=Form.f_T_STROZH_M.Value;
 T_STROZH_NV:=Form.f_T_STROZH_NV.Value;
 T_STROZH_PR:=Trim(Form.f_T_STROZH_PR.Text);
 if T_STROZH_PR=EmptyStr then T_STROZH_PR:=space;
 T_GIBKA_CEQ:=LookupItemFromForm2(Form.f_T_GIBKA_CEQ.ItemIndex,Form.T_GIBKA_EQADOQ,SchemaName+'EQUIPMENT');
 T_GIBKA_NV:=Form.f_T_GIBKA_NV.Value;
 T_GIBKA_PR:=Trim(Form.f_T_GIBKA_PR.Text);
 if T_GIBKA_PR=EmptyStr then T_GIBKA_PR:=space;
 PRIM:=Trim(Form.f_PRIM.Text);
 if PRIM=EmptyStr then PRIM:=space;
 result:=True;
End;

Destructor TKD3.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

