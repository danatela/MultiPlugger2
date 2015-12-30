unit GrMaterialsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits,
  Spr1LabeledEditUnit, SteelMarkUnit, Spr1JvCalcEditUnit, DBGridEhGrouping,
  Vcl.PlatformDefaultStyleActnCtrls, GridsEh, DBGridEh, Vcl.ComCtrls,
  UniversalSpr2Unit, CmkUserUnit, frxClass;


type
  TGrMaterialsForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    PROP_LENGTHADOQ: TADOQuery;
    PROP_STEELMARKADOQ: TADOQuery;
    PROP_WIDTHADOQ: TADOQuery;
    PROP_PROFTYPEADOQ: TADOQuery;
    PROP_THICKADOQ: TADOQuery;
    PROP_NORMDOC1ADOQ: TADOQuery;
    PROP_NORMDOC0ADOQ: TADOQuery;
    PROP_PROFILEADOQ: TADOQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    PropGroupBox: TGroupBox;
    f_PROP_PROFNUMLabel: TLabel;
    f_PROP_STEELMARKLabel: TLabel;
    f_PROP_NORMDOC0Label: TLabel;
    f_PROP_NORMDOC1Label: TLabel;
    f_PROP_LINEDENSLabel: TLabel;
    f_PROP_PWIDTH1Label: TLabel;
    f_PROP_PWIDTH2Label: TLabel;
    f_PROP_SIZE1Label: TLabel;
    f_PROP_SIZE2Label: TLabel;
    f_PROP_WTHICKLabel: TLabel;
    f_PROP_SLENGTHLabel: TLabel;
    f_PROP_PROFTYPELabel: TLabel;
    f_PROP_DIAMLabel: TLabel;
    f_PROP_SIZELabel: TLabel;
    f_PROP_UWLabel: TLabel;
    f_PROP_PROFILELabel: TLabel;
    f_PROP_THICKLabel: TLabel;
    f_PROP_WIDTHLabel: TLabel;
    f_PROP_LENGTHLabel: TLabel;
    f_PROP_STEELMARK: TComboBox;
    PROP_STEELMARKComboUpdateBtn: TBitBtn;
    f_PROP_NORMDOC0: TComboBox;
    PROP_NORMDOC0ComboUpdateBtn: TBitBtn;
    f_PROP_NORMDOC1: TComboBox;
    PROP_NORMDOC1ComboUpdateBtn: TBitBtn;
    f_PROP_LINEDENS: TJvCalcEdit;
    f_PROP_PWIDTH1: TJvCalcEdit;
    f_PROP_PWIDTH2: TJvCalcEdit;
    f_PROP_SIZE1: TJvCalcEdit;
    f_PROP_SIZE2: TJvCalcEdit;
    f_PROP_WTHICK: TJvCalcEdit;
    f_PROP_SLENGTH: TJvCalcEdit;
    PROP_PROFTYPEComboUpdateBtn: TBitBtn;
    f_PROP_PROFTYPE: TComboBox;
    f_PROP_DIAM: TJvCalcEdit;
    f_PROP_SIZE: TJvCalcEdit;
    f_PROP_UW: TJvCalcEdit;
    f_PROP_PROFILE: TComboBox;
    PROP_PROFILEComboUpdateBtn: TBitBtn;
    f_PROP_THICK: TComboBox;
    PROP_THICKComboUpdateBtn: TBitBtn;
    f_PROP_WIDTH: TComboBox;
    PROP_WIDTHComboUpdateBtn: TBitBtn;
    f_PROP_LENGTH: TComboBox;
    PROP_LENGTHComboUpdateBtn: TBitBtn;
    PROP_STEELMARKAppendBtn: TBitBtn;
    PROP_NORMDOC0AppendBtn: TBitBtn;
    PROP_NORMDOC1AppendBtn: TBitBtn;
    PROP_PROFTYPEAppendBtn: TBitBtn;
    PROP_PROFILEAppendBtn: TBitBtn;
    PROP_THICKAppendBtn: TBitBtn;
    PROP_WIDTHAppendBtn: TBitBtn;
    PROP_LENGTHAppendBtn: TBitBtn;
    f_PROP_PROFNUM: TEdit;
    Panel2: TPanel;
    f_ACTIVE: TCheckBox;
    f_NAME: TLabeledEdit;
    MaterialsBtn: TBitBtn;
    PROP_FIXTYPEADOQ: TADOQuery;
    PROP_CARVTYPEADOQ: TADOQuery;
    f_PROP_FIXTYPE: TComboBox;
    PROP_FIXTYPEComboUpdateBtn: TBitBtn;
    PROP_FIXTYPEAppendBtn: TBitBtn;
    f_PROP_FIXTYPELabel: TLabel;
    f_PROP_CARVTYPE: TComboBox;
    PROP_CARVTYPEComboUpdateBtn: TBitBtn;
    PROP_CARVTYPEAppendBtn: TBitBtn;
    f_PROP_CARVTYPELabel: TLabel;
    f_PROP_STEP: TJvCalcEdit;
    f_PROP_STEPLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PROP_STEELMARKAppendBtnClick(Sender: TObject);
    procedure PROP_STEELMARKComboUpdateBtnClick(Sender: TObject);
    procedure PROP_NORMDOC0AppendBtnClick(Sender: TObject);
    procedure PROP_NORMDOC0ComboUpdateBtnClick(Sender: TObject);
    procedure PROP_NORMDOC1AppendBtnClick(Sender: TObject);
    procedure PROP_PROFTYPEAppendBtnClick(Sender: TObject);
    procedure PROP_PROFTYPEComboUpdateBtnClick(Sender: TObject);
    procedure PROP_PROFILEAppendBtnClick(Sender: TObject);
    procedure PROP_PROFILEComboUpdateBtnClick(Sender: TObject);
    procedure PROP_THICKAppendBtnClick(Sender: TObject);
    procedure PROP_THICKComboUpdateBtnClick(Sender: TObject);
    procedure PROP_WIDTHAppendBtnClick(Sender: TObject);
    procedure PROP_WIDTHComboUpdateBtnClick(Sender: TObject);
    procedure PROP_LENGTHAppendBtnClick(Sender: TObject);
    procedure PROP_LENGTHComboUpdateBtnClick(Sender: TObject);
    procedure UpdatePropList;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaterialsBtnClick(Sender: TObject);
    procedure PROP_FIXTYPEAppendBtnClick(Sender: TObject);
    procedure PROP_CARVTYPEAppendBtnClick(Sender: TObject);
    procedure PROP_FIXTYPEComboUpdateBtnClick(Sender: TObject);
    procedure PROP_CARVTYPEComboUpdateBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
    f_CPARENT:int64;
  end;

TGrMaterials = class
 NREC: int64;
 CPARENT: int64;
// CGRMATERIALS: int64;
 NAME: string[255];
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
 PROP_THICK: int64;
 PROP_WIDTH: int64;
 PROP_LENGTH: int64;
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
 ACTIVE: boolean;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Function GetByName(vname:string):boolean;
 Function Save(OForm:TComponent;Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TGrMaterialsForm;New:boolean):boolean;
 Function FromForm(Var Form:TGrMaterialsForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Procedure PropsToForm(Form:TComponent);
 Procedure UpdateNAME(OForm:TComponent);
 Procedure UpdatePROP_STEELMARK_C;
 Procedure UpdatePROP_NORMDOC0_C;
 Procedure UpdatePROP_NORMDOC1_C;
 Procedure UpdatePROP_PROFTYPE_C;
 Procedure UpdatePROP_FIXTYPE_C;
 Procedure UpdatePROP_CARVTYPE_C;
 Procedure UpdatePROP_PROFILE_C;
 Procedure UpdatePROP_THICK_C;
 Procedure UpdatePROP_WIDTH_C;
 Procedure UpdatePROP_LENGTH_C;
 Procedure FieldsToReport(Var rep:TfrxReport;Prefix:string='');
 Function GetUnicalFieldValue:string;
 Procedure DelFilledProps(Var PropList:TStringList);
 Function GetProfileName(detail:boolean=False):string;
 Function GetMTypeRP:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  GrMaterialsForm: TGrMaterialsForm;

implementation

{$R *.dfm}

Procedure TGrMaterials.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
 CmkUser:TCmkUser;
Begin
 if Empty(Prefix) then Pr:='GRMATERIALS'
                  else Pr:=Prefix;

 rep.Variables[Pr+dot+'NREC']:=NREC;
 rep.Variables[Pr+dot+'CPARENT']:=CPARENT;
 rep.Variables[Pr+dot+'NAME']:=kav+AddSlashes(NAME)+kav;
 rep.Variables[Pr+dot+'PROP_PROFNUM']:=kav+AddSlashes(PROP_PROFNUM)+kav;
 rep.Variables[Pr+dot+'PROP_STEELMARK']:=PROP_STEELMARK;
 rep.Variables[Pr+dot+'PROP_NORMDOC0']:=PROP_NORMDOC0;
 rep.Variables[Pr+dot+'PROP_NORMDOC1']:=PROP_NORMDOC1;
 rep.Variables[Pr+dot+'PROP_LINEDENS']:=PROP_LINEDENS;
 rep.Variables[Pr+dot+'PROP_PWIDTH1']:=PROP_PWIDTH1;
 rep.Variables[Pr+dot+'PROP_PWIDTH2']:=PROP_PWIDTH2;
 rep.Variables[Pr+dot+'PROP_SIZE1']:=PROP_SIZE1;
 rep.Variables[Pr+dot+'PROP_SIZE2']:=PROP_SIZE2;
 rep.Variables[Pr+dot+'PROP_WTHICK']:=PROP_WTHICK;
 rep.Variables[Pr+dot+'PROP_SLENGTH']:=PROP_SLENGTH;
 rep.Variables[Pr+dot+'PROP_PROFTYPE']:=PROP_PROFTYPE;
 rep.Variables[Pr+dot+'PROP_FIXTYPE']:=PROP_FIXTYPE;
 rep.Variables[Pr+dot+'PROP_CARVTYPE']:=PROP_CARVTYPE;
 rep.Variables[Pr+dot+'PROP_DIAM']:=PROP_DIAM;
 rep.Variables[Pr+dot+'PROP_SIZE']:=PROP_SIZE;
 rep.Variables[Pr+dot+'PROP_UW']:=PROP_UW;
 rep.Variables[Pr+dot+'PROP_STEP']:=PROP_STEP;
 rep.Variables[Pr+dot+'PROP_PROFILE']:=PROP_PROFILE;
 rep.Variables[Pr+dot+'PROP_THICK']:=PROP_THICK;
 rep.Variables[Pr+dot+'PROP_WIDTH']:=PROP_WIDTH;
 rep.Variables[Pr+dot+'PROP_LENGTH']:=PROP_LENGTH;
 rep.Variables[Pr+dot+'PROP_STEELMARK_C']:=kav+AddSlashes(PROP_STEELMARK_C)+kav;
 rep.Variables[Pr+dot+'PROP_NORMDOC0_C']:=kav+AddSlashes(PROP_NORMDOC0_C)+kav;
 rep.Variables[Pr+dot+'PROP_NORMDOC1_C']:=kav+AddSlashes(PROP_NORMDOC1_C)+kav;
 rep.Variables[Pr+dot+'PROP_PROFTYPE_C']:=kav+AddSlashes(PROP_PROFTYPE_C)+kav;
 rep.Variables[Pr+dot+'PROP_FIXTYPE_C']:=kav+AddSlashes(PROP_FIXTYPE_C)+kav;
 rep.Variables[Pr+dot+'PROP_CARVTYPE_C']:=kav+AddSlashes(PROP_CARVTYPE_C)+kav;
 rep.Variables[Pr+dot+'PROP_PROFILE_C']:=kav+AddSlashes(PROP_PROFILE_C)+kav;
 rep.Variables[Pr+dot+'PROP_THICK_C']:=PROP_THICK_C;
 rep.Variables[Pr+dot+'PROP_WIDTH_C']:=PROP_WIDTH_C;
 rep.Variables[Pr+dot+'PROP_LENGTH_C']:=PROP_LENGTH_C;
 rep.Variables[Pr+dot+'ACTIVE']:=ACTIVE;

 rep.Variables[Pr+dot+'MTYPE']:=kav+AddSlashes(GetMTypeRP)+kav;

 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;
End;

Function TGrMaterials.GetMTypeRP:string;
Begin
 result:='материала';
 case cparent of
  4: Begin // Лист
      result:='листа';
     End;
  5: Begin // Квадрат
      result:='квадрата';
     End;
  6: Begin // Гнутый профиль
      result:='гн.профиля';
     End;
  7: Begin // Труба
      result:='трубы';
     End;
  8,9: Begin // Тавровая балка
      result:='тавр.балки';
     End;
  10: Begin // Уголок
      result:='уголка';
     End;
  11: Begin // Швеллер
      result:='швеллера';
     End;
  100: Begin // Круг
      result:='круга';
     End;
  101: Begin // Крепёж
      result:='крепежа';
     End;
 end;

End;

Function TGrMaterials.GetProfileName(detail:boolean=False):string;
Begin
 result:=EmptyStr;
 if (cparent=3) then result:=NAME
 else
 Begin
 result:=GetTextValueOfPointer(IntToStr(CPARENT),SchemaName+'GRMATERIALS','nrec','name',False);
 if detail then
 case cparent of
  4: Begin // Лист
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_PROFILE_C) then result:=result+space+PROP_PROFILE_C;
     End;
  5: Begin // Квадрат
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  6: Begin // Гнутый профиль
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  7: Begin // Труба
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  8,9: Begin // Тавровая балка
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_PROFNUM) then result:=result+space+PROP_PROFNUM;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  10: Begin // Уголок
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  11: Begin // Швеллер
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_PROFNUM) then result:=result+space+PROP_PROFNUM;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  100: Begin // Круг
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
  101: Begin // Крепёж
      if Not Empty(PROP_FIXTYPE_C) then result:=PROP_FIXTYPE_C;
      if Not Empty(PROP_CARVTYPE_C) then result:=result+space+PROP_CARVTYPE_C;
      if Not Empty(PROP_STEELMARK_C) then result:=result+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then result:=result+space+PROP_NORMDOC1_C;
     End;
 end;

 End;
End;


Procedure TGrMaterials.DelFilledProps(Var PropList:TStringList);
Var
 DelList:TStringList;
 i,n:integer;
Begin
 DelList:=TStringList.Create;
 for i:=0 to PropList.Count-1 do
  Begin
   if PropList[i]='PROP_STEELMARK' then if PROP_STEELMARK<>0 then DelList.Append('PROP_STEELMARK');
   if PropList[i]='PROP_NORMDOC0' then if PROP_NORMDOC0<>0 then DelList.Append('PROP_NORMDOC0');
   if PropList[i]='PROP_NORMDOC1' then if PROP_NORMDOC1<>0 then DelList.Append('PROP_NORMDOC1');
   if PropList[i]='PROP_PROFTYPE' then if PROP_PROFTYPE<>0 then DelList.Append('PROP_PROFTYPE');
   if PropList[i]='PROP_FIXTYPE' then if PROP_FIXTYPE<>0 then DelList.Append('PROP_FIXTYPE');
   if PropList[i]='PROP_CARVTYPE' then if PROP_CARVTYPE<>0 then DelList.Append('PROP_CARVTYPE');
   if PropList[i]='PROP_PROFILE' then if PROP_PROFILE<>0 then DelList.Append('PROP_PROFILE');
   if PropList[i]='PROP_THICK' then if (PROP_THICK<>0) and (PROP_THICK_C<>0) then DelList.Append('PROP_THICK');
   if PropList[i]='PROP_WIDTH' then if (PROP_WIDTH<>0) and (PROP_WIDTH_C<>0) then DelList.Append('PROP_WIDTH');
   if PropList[i]='PROP_LENGTH' then if (PROP_LENGTH<>0) and (PROP_LENGTH_C<>0) then DelList.Append('PROP_LENGTH');
   if PropList[i]='PROP_THICK_C' then if (PROP_THICK_C<>0) then DelList.Append('PROP_THICK_C');
   if PropList[i]='PROP_WIDTH_C' then if (PROP_WIDTH_C<>0) then DelList.Append('PROP_WIDTH_C');
   if PropList[i]='PROP_LENGTH_C' then if (PROP_LENGTH_C<>0) then DelList.Append('PROP_LENGTH_C');
   if PropList[i]='PROP_PROFNUM' then if Not Empty(PROP_PROFNUM) then DelList.Append('PROP_PROFNUM');
   if PropList[i]='PROP_LINEDENS' then if PROP_LINEDENS<>0 then DelList.Append('PROP_LINEDENS');
   if PropList[i]='PROP_PWIDTH1' then if PROP_PWIDTH1<>0 then DelList.Append('PROP_PWIDTH1');
   if PropList[i]='PROP_PWIDTH2' then if PROP_PWIDTH2<>0 then DelList.Append('PROP_PWIDTH2');
   if PropList[i]='PROP_SIZE1' then if PROP_SIZE1<>0 then DelList.Append('PROP_SIZE1');
   if PropList[i]='PROP_SIZE2' then if PROP_SIZE2<>0 then DelList.Append('PROP_SIZE2');
   if PropList[i]='PROP_WTHICK' then if PROP_WTHICK<>0 then DelList.Append('PROP_WTHICK');
   if PropList[i]='PROP_SLENGTH' then if PROP_SLENGTH<>0 then DelList.Append('PROP_SLENGTH');
   if PropList[i]='PROP_DIAM' then if PROP_DIAM<>0 then DelList.Append('PROP_DIAM');
   if PropList[i]='PROP_SIZE' then if PROP_SIZE<>0 then DelList.Append('PROP_SIZE');
   if PropList[i]='PROP_UW' then if PROP_UW<>0 then DelList.Append('PROP_UW');
   if PropList[i]='PROP_STEP' then if PROP_STEP<>0 then DelList.Append('PROP_STEP');
  End;

 For i:=0 to DelList.Count-1 do
  Begin
   n:=PropList.IndexOf(DelList[i]);
   if i<>-1 then PropList.Delete(n);
  End;

 DelList.Free;
End;


Function TGrMaterials.GetUnicalFieldValue:string;
Begin
 result:=Name;
End;

Procedure TGrMaterials.UpdateNAME(OForm:TComponent);
Var
 nnn:TSpr1LabeledEdit;
Begin
 if (cparent<>3) then
 Begin
 NAME:=GetTextValueOfPointer(IntToStr(CPARENT),SchemaName+'GRMATERIALS','nrec','name',False);
 case cparent of
  4: Begin // Лист
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if PROP_THICK_C<>0 then NAME:=NAME+space+FloatToStr(PROP_THICK_C);
      if PROP_WIDTH_C<>0 then NAME:=NAME+'*'+FloatToStr(PROP_WIDTH_C);
      if PROP_LENGTH_C<>0 then NAME:=NAME+'*'+FloatToStr(PROP_LENGTH_C);
      if (PROP_THICK_C<>0) or (PROP_WIDTH_C<>0) or (PROP_LENGTH_C<>0) then NAME:=NAME+space+'мм';
      if Not Empty(PROP_PROFILE_C) then NAME:=NAME+space+PROP_PROFILE_C;
     End;
  5: Begin // Квадрат
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if PROP_SIZE<>0 then NAME:=NAME+space+FloatToStr(PROP_SIZE);
      if PROP_SLENGTH<>0 then NAME:=NAME+'*'+FloatToStr(PROP_SLENGTH);
      if (PROP_SIZE<>0) or (PROP_SLENGTH<>0) then NAME:=NAME+space+'мм';
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  6: Begin // Гнутый профиль
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if PROP_SIZE1<>0 then NAME:=NAME+space+FloatToStr(PROP_SIZE1);
      if PROP_SIZE2<>0 then NAME:=NAME+'*'+FloatToStr(PROP_SIZE2);
      if PROP_WTHICK<>0 then NAME:=NAME+'*'+FloatToStr(PROP_WTHICK);
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  7: Begin // Труба
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if PROP_DIAM<>0 then NAME:=NAME+space+'d '+FloatToStr(PROP_DIAM);
      if PROP_WTHICK<>0 then NAME:=NAME+'*'+FloatToStr(PROP_WTHICK);
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  8,9: Begin // Тавровая балка
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if Not Empty(PROP_PROFNUM) then NAME:=NAME+space+PROP_PROFNUM;
      if PROP_SLENGTH<>0 then NAME:=NAME+space+' '+FloatToStr(PROP_SLENGTH);
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  10: Begin // Уголок
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if PROP_PWIDTH1<>0 then NAME:=NAME+space+FloatToStr(PROP_PWIDTH1);
      if PROP_PWIDTH2<>0 then NAME:=NAME+'*'+FloatToStr(PROP_PWIDTH2);
      if PROP_WTHICK<>0 then NAME:=NAME+space+FloatToStr(PROP_WTHICK)+'мм';
      if PROP_SLENGTH<>0 then NAME:=NAME+space+FloatToStr(PROP_SLENGTH);
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  11: Begin // Швеллер
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if Not Empty(PROP_PROFNUM) then NAME:=NAME+space+PROP_PROFNUM;
      if PROP_SLENGTH<>0 then NAME:=NAME+space+' '+FloatToStr(PROP_SLENGTH);
      if PROP_LINEDENS<>0 then NAME:=NAME+space+' '+FloatToStr(PROP_LINEDENS);
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  100: Begin // Круг
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if PROP_DIAM<>0 then NAME:=NAME+space+'d '+FloatToStr(PROP_DIAM);
      if PROP_SLENGTH<>0 then NAME:=NAME+space+' '+FloatToStr(PROP_SLENGTH);
      if PROP_LINEDENS<>0 then NAME:=NAME+space+' '+FloatToStr(PROP_LINEDENS);
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
  101: Begin // Крепеж
      if Not Empty(PROP_FIXTYPE_C) then NAME:=PROP_FIXTYPE_C;
      if Not Empty(PROP_CARVTYPE_C) then NAME:=NAME+space+PROP_CARVTYPE_C;
      if PROP_DIAM<>0 then NAME:=NAME+space+FloatToStr(PROP_DIAM);
      if PROP_SLENGTH<>0 then NAME:=NAME+'*'+FloatToStr(PROP_SLENGTH);
      if PROP_STEP<>0 then NAME:=NAME+space+'шаг '+FloatToStr(PROP_STEP);
      if Not Empty(PROP_STEELMARK_C) then NAME:=NAME+space+PROP_STEELMARK_C;
      if Not Empty(PROP_NORMDOC1_C) then NAME:=NAME+space+PROP_NORMDOC1_C;
     End;
 end;

 nnn:=TSpr1LabeledEdit.Create;
 nnn.NAME:=NAME;
 if nnn.Edit(OForm,False,'Уточните наименование группы','Наименование',False) then NAME:=nnn.NAME;
 nnn.Free;
// NORMDOC_S:=GetTextValueOfPointer(IntToStr(CNORMDOC),SchemaName+'NORMDOC','nrec','name',False);
 End;
 if NAME=EmptyStr then NAME:=space;
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

procedure TGrMaterialsForm.UpdatePropList;
Var
// tempValue:int64;
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
 PropList:=TStringList.Create;
 GetPropListOfPARENT(f_cparent,PropList);
// PropList.Append('CGRMATERIALS');

 CTop:=24; vis:=False;
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
 if WindowState<>wsMaximized then Height:=CTop+170;
 PropList.Free;
end;


Function TGrMaterials.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'GRMATERIALS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TGrMaterials.GetByName(vname:string):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.Parameters.CreateParameter('name',ftString,pdInput,0,UpperCase(vname));
 adoq.SQL.Text:='select * from '+SchemaName+'GRMATERIALS'+' where NAME=:name';
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;


procedure TGrMaterialsForm.BitBtn1Click(Sender: TObject);
begin
 if False{(f_CPARENT<>3) and (f_CPARENT<>4)} then
  Begin
   ShowMessage('К сожалению, корректное формирование имени группы материалов из этого интерфейса реализовано пока только для "Листа" и "Прочих материалов"...');
  End
   else
  Begin
    Close();
    Self.ModalResult:=mrOK;
  End;
end;

procedure TGrMaterialsForm.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
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

procedure TGrMaterialsForm.FormDestroy(Sender: TObject);
begin
 PROP_STEELMARKADOQ.Close;
 PROP_PROFILEADOQ.Close;
 PROP_NORMDOC0ADOQ.Close;
 PROP_NORMDOC1ADOQ.Close;
 PROP_PROFTYPEADOQ.Close;
 PROP_FIXTYPEADOQ.Close;
 PROP_CARVTYPEADOQ.Close;
 PROP_THICKADOQ.Close;
 PROP_WIDTHADOQ.Close;
 PROP_LENGTHADOQ.Close;
end;

procedure TGrMaterialsForm.FormShow(Sender: TObject);
begin
 PageControl1.ActivePage:=TabSheet1;
 Try f_NAME.SetFocus; Except End;
end;

procedure TGrMaterialsForm.MaterialsBtnClick(Sender: TObject);
Var
 Spr:TSpr2;
begin
 Spr:=TSpr2.Create;
 Spr.SprTableName:='MATERIALS';
 Spr.SprVisibleFieldNames :='NAME,ACTIVE';
 Spr.SprVisibleFieldTitles:='"Наименование материала","Активность"';
 Spr.SprVisibleFieldWidths:='0,80';
 Spr.SprOrderByString:='NAME';
 Spr.UnicalField:='NAME';
 Spr.SprDescription:='Каталог материалов - '+UpperCase(GetTextValueOfPointer(IntToStr(f_cparent),SchemaName+'MATERIALS','nrec','NAME',False));
 Spr.EditRights:=(CurrentUser.CUSERGROUPS<>4);
 Spr.SprFilterString:='CPARENT='+IntToStr(f_cparent)+' and CGRMATERIALS='+IntToStr(f_nrec);
 Spr.BeforePostField1:='CPARENT';
 Spr.BeforePostValue1:=f_cparent;
 Spr.BeforePostField2:='CGRMATERIALS';
 Spr.BeforePostValue2:=f_nrec;
 Spr.Edit(Self);
 Spr.Free;
end;

procedure TGrMaterialsForm.PROP_CARVTYPEAppendBtnClick(Sender: TObject);
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

procedure TGrMaterialsForm.PROP_CARVTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_CARVTYPE.ItemIndex,PROP_CARVTYPEADOQ,SchemaName+'CARVTYPES');
 PROP_CARVTYPEADOQ.Requery;
 LookupItemToForm(f_PROP_CARVTYPE,PROP_CARVTYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_FIXTYPEAppendBtnClick(Sender: TObject);
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

procedure TGrMaterialsForm.PROP_FIXTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_FIXTYPE.ItemIndex,PROP_FIXTYPEADOQ,SchemaName+'FIXTYPES');
 PROP_FIXTYPEADOQ.Requery;
 LookupItemToForm(f_PROP_FIXTYPE,PROP_FIXTYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_LENGTHAppendBtnClick(Sender: TObject);
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

procedure TGrMaterialsForm.PROP_LENGTHComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_LENGTH.ItemIndex,PROP_LENGTHADOQ,SchemaName+'LENGTHS');
 PROP_LENGTHADOQ.Requery;
 LookupItemToForm(f_PROP_LENGTH,PROP_LENGTHADOQ,tempValue,'value',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_NORMDOC0AppendBtnClick(Sender: TObject);
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
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TGrMaterialsForm.PROP_NORMDOC0ComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_NORMDOC0.ItemIndex,PROP_NORMDOC0ADOQ,SchemaName+'NORMDOC');
 PROP_NORMDOC0ADOQ.Requery;
 LookupItemToForm(f_PROP_NORMDOC0,PROP_NORMDOC0ADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_NORMDOC1AppendBtnClick(Sender: TObject);
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
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TGrMaterialsForm.PROP_PROFILEAppendBtnClick(Sender: TObject);
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
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TGrMaterialsForm.PROP_PROFILEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_PROFILE.ItemIndex,PROP_PROFILEADOQ,SchemaName+'NORMDOC');
 PROP_PROFILEADOQ.Requery;
 LookupItemToForm(f_PROP_PROFILE,PROP_PROFILEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_PROFTYPEAppendBtnClick(Sender: TObject);
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
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TGrMaterialsForm.PROP_PROFTYPEComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_PROFTYPE.ItemIndex,PROP_PROFTYPEADOQ,SchemaName+'PROFTYPES');
 PROP_PROFTYPEADOQ.Requery;
 LookupItemToForm(f_PROP_PROFTYPE,PROP_PROFTYPEADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_STEELMARKAppendBtnClick(Sender: TObject);
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
   End;
  End;
 SteelMark.Free;
end;

procedure TGrMaterialsForm.PROP_STEELMARKComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_STEELMARK.ItemIndex,PROP_STEELMARKADOQ,SchemaName+'STEELMARKS');
 PROP_STEELMARKADOQ.Requery;
 LookupItemToForm(f_PROP_STEELMARK,PROP_STEELMARKADOQ,tempValue,'shortname',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_THICKAppendBtnClick(Sender: TObject);
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

procedure TGrMaterialsForm.PROP_THICKComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_THICK.ItemIndex,PROP_THICKADOQ,SchemaName+'THICKS');
 PROP_THICKADOQ.Requery;
 LookupItemToForm(f_PROP_THICK,PROP_THICKADOQ,tempValue,'value',EmptyStr,EmptyStr,False);
end;

procedure TGrMaterialsForm.PROP_WIDTHAppendBtnClick(Sender: TObject);
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

procedure TGrMaterialsForm.PROP_WIDTHComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_PROP_WIDTH.ItemIndex,PROP_WIDTHADOQ,SchemaName+'WIDTHS');
 PROP_WIDTHADOQ.Requery;
 LookupItemToForm(f_PROP_WIDTH,PROP_WIDTHADOQ,tempValue,'value',EmptyStr,EmptyStr,False);
end;

Constructor TGrMaterials.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TGrMaterials.Clear;
begin
 NREC:=0;
 CPARENT:=0;
 NAME:=EmptyStr;
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
 PROP_THICK:=0;
 PROP_WIDTH:=0;
 PROP_LENGTH:=0;
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
 ACTIVE:=True;
end;

Function TGrMaterials.Save(OForm:TComponent;Var Dataset:TAdoQuery):boolean;
Var
 PropList:TStringList;
Begin
 result:=True;
 PropList:=TStringList.Create;
 GetPropListOfPARENT(CPARENT,PropList);
 if PropList.IndexOf('PROP_STEELMARK')<>-1 then UpdatePROP_STEELMARK_C;
 if PropList.IndexOf('PROP_NORMDOC0')<>-1 then UpdatePROP_NORMDOC0_C;
 if PropList.IndexOf('PROP_NORMDOC1')<>-1 then UpdatePROP_NORMDOC1_C;
 if PropList.IndexOf('PROP_PROFTYPE')<>-1 then UpdatePROP_PROFTYPE_C;
 if PropList.IndexOf('PROP_FIXTYPE')<>-1 then UpdatePROP_FIXTYPE_C;
 if PropList.IndexOf('PROP_CARVTYPE')<>-1 then UpdatePROP_CARVTYPE_C;
 if PropList.IndexOf('PROP_PROFILE')<>-1 then UpdatePROP_PROFILE_C;
 if PropList.IndexOf('PROP_THICK')<>-1 then UpdatePROP_THICK_C;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then UpdatePROP_WIDTH_C;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then UpdatePROP_LENGTH_C;
 UpdateNAME(OForm);
 Dataset['CPARENT']:=CPARENT;
 Dataset['NAME']:=NAME;
 if PropList.IndexOf('PROP_PROFNUM')<>-1 then
  Begin
   Dataset['PROP_PROFNUM']:=PROP_PROFNUM;
  End;
 if PropList.IndexOf('PROP_STEELMARK')<>-1 then
  Begin
   Dataset['PROP_STEELMARK']:=PROP_STEELMARK;
   Dataset['PROP_STEELMARK_C']:=PROP_STEELMARK_C;
  End;
 if PropList.IndexOf('PROP_NORMDOC0')<>-1 then
  Begin
   Dataset['PROP_NORMDOC0']:=PROP_NORMDOC0;
   Dataset['PROP_NORMDOC0_C']:=PROP_NORMDOC0_C;
  End;
 if PropList.IndexOf('PROP_NORMDOC1')<>-1 then
  Begin
   Dataset['PROP_NORMDOC1']:=PROP_NORMDOC1;
   Dataset['PROP_NORMDOC1_C']:=PROP_NORMDOC1_C;
  End;
 if PropList.IndexOf('PROP_LINEDENS')<>-1 then
  Begin
   Dataset['PROP_LINEDENS']:=PROP_LINEDENS;
  End;
 if PropList.IndexOf('PROP_PWIDTH1')<>-1 then
  Begin
   Dataset['PROP_PWIDTH1']:=PROP_PWIDTH1;
  End;
 if PropList.IndexOf('PROP_PWIDTH2')<>-1 then
  Begin
   Dataset['PROP_PWIDTH2']:=PROP_PWIDTH2;
  End;
 if PropList.IndexOf('PROP_SIZE1')<>-1 then
  Begin
   Dataset['PROP_SIZE1']:=PROP_SIZE1;
  End;
 if PropList.IndexOf('PROP_SIZE2')<>-1 then
  Begin
   Dataset['PROP_SIZE2']:=PROP_SIZE2;
  End;
 if PropList.IndexOf('PROP_WTHICK')<>-1 then
  Begin
   Dataset['PROP_WTHICK']:=PROP_WTHICK;
  End;
 if PropList.IndexOf('PROP_SLENGTH')<>-1 then
  Begin
   Dataset['PROP_SLENGTH']:=PROP_SLENGTH;
  End;
 if PropList.IndexOf('PROP_PROFTYPE')<>-1 then
  Begin
   Dataset['PROP_PROFTYPE']:=PROP_PROFTYPE;
   Dataset['PROP_PROFTYPE_C']:=PROP_PROFTYPE_C;
  End;
 if PropList.IndexOf('PROP_FIXTYPE')<>-1 then
  Begin
   Dataset['PROP_FIXTYPE']:=PROP_FIXTYPE;
   Dataset['PROP_FIXTYPE_C']:=PROP_FIXTYPE_C;
  End;
 if PropList.IndexOf('PROP_CARVTYPE')<>-1 then
  Begin
   Dataset['PROP_CARVTYPE']:=PROP_CARVTYPE;
   Dataset['PROP_CARVTYPE_C']:=PROP_CARVTYPE_C;
  End;
 if PropList.IndexOf('PROP_DIAM')<>-1 then
  Begin
   Dataset['PROP_DIAM']:=PROP_DIAM;
  End;
 if PropList.IndexOf('PROP_SIZE')<>-1 then
  Begin
   Dataset['PROP_SIZE']:=PROP_SIZE;
  End;
 if PropList.IndexOf('PROP_UW')<>-1 then
  Begin
   Dataset['PROP_UW']:=PROP_UW;
  End;
 if PropList.IndexOf('PROP_STEP')<>-1 then
  Begin
   Dataset['PROP_STEP']:=PROP_STEP;
  End;
 if PropList.IndexOf('PROP_PROFILE')<>-1 then
  Begin
   Dataset['PROP_PROFILE']:=PROP_PROFILE;
   Dataset['PROP_PROFILE_C']:=PROP_PROFILE_C;
  End;
 if PropList.IndexOf('PROP_THICK')<>-1 then
  Begin
   Dataset['PROP_THICK']:=PROP_THICK;
   Dataset['PROP_THICK_C']:=PROP_THICK_C;
  End;
 if PropList.IndexOf('PROP_WIDTH')<>-1 then
  Begin
   Dataset['PROP_WIDTH']:=PROP_WIDTH;
   Dataset['PROP_WIDTH_C']:=PROP_WIDTH_C;
  End;
 if PropList.IndexOf('PROP_LENGTH')<>-1 then
  Begin
   Dataset['PROP_LENGTH']:=PROP_LENGTH;
   Dataset['PROP_LENGTH_C']:=PROP_LENGTH_C;
  End;
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о материале! ('+e.Message+')');
      End;
 End;
 PropList.Free;
End;

Function TGrMaterials.Read(Var Dataset:TAdoQuery):boolean;
Var
 PropList:TStringList;
Begin
 result:=True;
 PropList:=TStringList.Create;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 CPARENT:=Dataset['CPARENT'];
 NAME:=Dataset['NAME'];
 GetPropListOfPARENT(CPARENT,PropList);
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

 ACTIVE:=(Dataset['ACTIVE']=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о материале! ('+e.Message+')');
   End;
 End;

 PropList.Free;
End;

Function TGrMaterials.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TGrMaterialsForm;
begin
 Form:=TGrMaterialsForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TGrMaterials.ToForm(Var Form:TGrMaterialsForm;New:boolean):boolean;
Var
 i:integer;
 orderby,wh:string;
Begin
 Form.f_nrec:=nrec;
 Form.f_cparent:=cparent;
 if New then Form.Caption:=GetTextValueOfPointer(IntToStr(CPARENT),SchemaName+'MATERIALS','nrec','name',False)
        else Form.Caption:=NAME;

 Form.MaterialsBtn.Visible:=Not New;

 Form.f_NAME.Visible:=(cparent=3);
 if Form.f_NAME.Visible then Form.f_NAME.Text:=NAME;
 Form.UpdatePropList;
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
 LookupItemToForm(Form.f_PROP_THICK,Form.PROP_THICKADOQ,PROP_THICK,'value',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_WIDTH,Form.PROP_WIDTHADOQ,PROP_WIDTH,'value',EmptyStr,EmptyStr,False);
 LookupItemToForm(Form.f_PROP_LENGTH,Form.PROP_LENGTHADOQ,PROP_LENGTH,'value',EmptyStr,EmptyStr,False);


 Form.f_ACTIVE.Checked:=ACTIVE;
 result:=True;
End;

Function TGrMaterials.FromForm(Var Form:TGrMaterialsForm):boolean;
Begin
 nrec:=Form.f_nrec;
 cparent:=Form.f_cparent;

 if (cparent=3) then
  Begin
   NAME:=Trim(Form.f_NAME.Text);
   if NAME=EmptyStr then NAME:=space;
  End;
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
 PROP_THICK:=LookupItemFromForm2(Form.f_PROP_THICK.ItemIndex,Form.PROP_THICKADOQ,SchemaName+'THICKS');
 PROP_WIDTH:=LookupItemFromForm2(Form.f_PROP_WIDTH.ItemIndex,Form.PROP_WIDTHADOQ,SchemaName+'WIDTHS');
 PROP_LENGTH:=LookupItemFromForm2(Form.f_PROP_LENGTH.ItemIndex,Form.PROP_LENGTHADOQ,SchemaName+'LENGTHS');

 ACTIVE:=Form.f_ACTIVE.Checked;
 result:=True;
End;

Procedure TGrMaterials.UpdatePROP_STEELMARK_C;
Begin
 PROP_STEELMARK_C:=GetTextValueOfPointer(IntToStr(PROP_STEELMARK),SchemaName+'STEELMARKS','nrec','shortname',False);
 if PROP_STEELMARK_C=EmptyStr then PROP_STEELMARK_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_NORMDOC0_C;
Begin
 PROP_NORMDOC0_C:=GetTextValueOfPointer(IntToStr(PROP_NORMDOC0),SchemaName+'NORMDOC','nrec','name',False);
 if PROP_NORMDOC0_C=EmptyStr then PROP_NORMDOC0_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_NORMDOC1_C;
Begin
 PROP_NORMDOC1_C:=GetTextValueOfPointer(IntToStr(PROP_NORMDOC1),SchemaName+'NORMDOC','nrec','name',False);
 if PROP_NORMDOC1_C=EmptyStr then PROP_NORMDOC1_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_PROFTYPE_C;
Begin
 PROP_PROFTYPE_C:=GetTextValueOfPointer(IntToStr(PROP_PROFTYPE),SchemaName+'PROFTYPES','nrec','name',False);
 if PROP_PROFTYPE_C=EmptyStr then PROP_PROFTYPE_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_FIXTYPE_C;
Begin
 PROP_FIXTYPE_C:=GetTextValueOfPointer(IntToStr(PROP_FIXTYPE),SchemaName+'FIXTYPES','nrec','name',False);
 if PROP_FIXTYPE_C=EmptyStr then PROP_FIXTYPE_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_CARVTYPE_C;
Begin
 PROP_CARVTYPE_C:=GetTextValueOfPointer(IntToStr(PROP_CARVTYPE),SchemaName+'CARVTYPES','nrec','name',False);
 if PROP_CARVTYPE_C=EmptyStr then PROP_CARVTYPE_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_PROFILE_C;
Begin
 PROP_PROFILE_C:=GetTextValueOfPointer(IntToStr(PROP_PROFILE),SchemaName+'NORMDOC','nrec','name',False);
 if PROP_PROFILE_C=EmptyStr then PROP_PROFILE_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_THICK_C;
Begin
 PROP_THICK_C:=StrToFloatM(GetTextValueOfPointer(IntToStr(PROP_THICK),SchemaName+'THICKS','nrec','value',False));
// if PROP_THICK_C=EmptyStr then PROP_THICK_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_WIDTH_C;
Begin
 PROP_WIDTH_C:=StrToFloatM(GetTextValueOfPointer(IntToStr(PROP_WIDTH),SchemaName+'WIDTHS','nrec','value',False));
// if PROP_WIDTH_C=EmptyStr then PROP_WIDTH_C:=space;
End;

Procedure TGrMaterials.UpdatePROP_LENGTH_C;
Begin
 PROP_LENGTH_C:=StrToFloatM(GetTextValueOfPointer(IntToStr(PROP_LENGTH),SchemaName+'LENGTHS','nrec','value',False));
// if PROP_LENGTH_C=EmptyStr then PROP_LENGTH_C:=space;
End;

Procedure TGrMaterials.PropsToForm(Form:TComponent);
Var
 c,cadoq:TComponent;
Begin
 c:=Form.FindComponent('f_PROP_PROFNUM'); if Assigned(c) then if (c as TEdit).Visible then (c as TEdit).Text:=PROP_PROFNUM;

 c:=Form.FindComponent('f_PROP_STEELMARK');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_STEELMARKADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_STEELMARK,'shortname',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_NORMDOC0');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_NORMDOC0ADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_NORMDOC0,'name',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_NORMDOC1');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_NORMDOC1ADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_NORMDOC1,'name',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_LINEDENS'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_LINEDENS;
 c:=Form.FindComponent('f_PROP_PWIDTH1'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_PWIDTH1;
 c:=Form.FindComponent('f_PROP_PWIDTH2'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_PWIDTH2;
 c:=Form.FindComponent('f_PROP_SIZE1'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SIZE1;
 c:=Form.FindComponent('f_PROP_SIZE2'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SIZE2;
 c:=Form.FindComponent('f_PROP_WTHICK'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_WTHICK;
 c:=Form.FindComponent('f_PROP_SLENGTH'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SLENGTH;

 c:=Form.FindComponent('f_PROP_PROFTYPE');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_PROFTYPEADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_PROFTYPE,'name',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_FIXTYPE');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_FIXTYPEADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_FIXTYPE,'name',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_CARVTYPE');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_CARVTYPEADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_CARVTYPE,'name',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_DIAM'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_DIAM;
 c:=Form.FindComponent('f_PROP_SIZE'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_SIZE;
 c:=Form.FindComponent('f_PROP_UW'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_UW;
 c:=Form.FindComponent('f_PROP_STEP'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_STEP;

 c:=Form.FindComponent('f_PROP_PROFILE');
 if Assigned(c) then
  if (c as TComboBox).Visible then
   Begin
    cadoq:=Form.FindComponent('PROP_PROFILEADOQ');
    if Assigned(cadoq) then
     LookupItemToForm2(c as TComboBox,cadoq as TAdoQuery,PROP_PROFILE,'name',EmptyStr,EmptyStr,False);
   End;

 c:=Form.FindComponent('f_PROP_THICK'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_THICK_C;
 c:=Form.FindComponent('f_PROP_WIDTH'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_WIDTH_C;
 c:=Form.FindComponent('f_PROP_LENGTH'); if Assigned(c) then if (c as TJvCalcEdit).Visible then (c as TJvCalcEdit).Value:=PROP_LENGTH_C;
End;

Destructor TGrMaterials.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

