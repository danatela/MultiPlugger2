unit KDUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, InclFileUnit,
  ContractorUnit, frxClass, FastReportUnit, MemTableEh,  GrMaterialsUnit,
  CmkUserUnit, KD2Unit, KD3Unit, SelectListsUnit, StrUtils;


type
  TKDForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_ORDERNUM: TLabeledEdit;
    f_CCONTRACTOR: TComboBox;
    Label1: TLabel;
    contractorsADOQ: TADOQuery;
    Label2: TLabel;
    f_ACTDATE: TJvDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    f_INPUTDATE: TLabel;
    f_LUPDDATE: TLabel;
    InclFileBtn: TBitBtn;
    CCONTRACTORComboUpdateBtn: TBitBtn;
    CCONTRACTORAppendBtn: TBitBtn;
    f_ORDERNUM2: TLabeledEdit;
    f_CONTROL: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InclFileBtnClick(Sender: TObject);
    procedure CCONTRACTORComboUpdateBtnClick(Sender: TObject);
    procedure CCONTRACTORAppendBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;
  TKD = class
    NREC: int64;
    ORDERNUM: string[10];
    ORDERNUM2: string[7];
    INPUTDATE: TDateTime;
    LUPDDATE: TDateTime;
    CCONTRACTOR: int64;
    CONTRACTOR_S: string;
    ACTDATE: TDateTime;
    CONTROL: string[33];
    Procedure Clear;
    Procedure AppendStructToMTE(Var MTE: TMemTableEh; Prefix: string = '');
    Procedure FieldsToReport(Var rep: TfrxReport; Prefix: string = '');
    Procedure BuildVedomostSpecMTE(Var MTE: TMemTableEh; Var LMTE: TMemTableEh);
    Procedure BuildMVedomostSpecMTE(Var MTE: TMemTableEh;
      Var LMTE: TMemTableEh);
    Procedure BuildMVedomostSpecMTE2(Var MTE: TMemTableEh;
      Var LMTE: TMemTableEh);
    Procedure Report(OForm: TComponent; fr3: string);
    Function Save(Dataset: TDataset; Prefix: string = ''): boolean;
    Function Read(Var Dataset: TADOQuery): boolean;
    Function ToForm(Var Form: TKDForm; New: boolean): boolean;
    Function FromForm(Var Form: TKDForm): boolean;
    Function Edit(OForm: TComponent; New: boolean = False): boolean;
    Procedure UpdateContractor_s;
    constructor Create;
    destructor Destroy; override;
  private
    procedure BuildMVedomostSpecMTE3(var MTE: TMemTableEh);
  end;

var
  KDForm: TKDForm;

Function CreateNewSostavn(OwnerForm:TComponent;fcmo:string;Var SostavnType,SostavnNREC,SostavnName:string):boolean;

implementation

{$R *.dfm}

Procedure TKD.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'ORDERNUM', ftString, 10);
 MTE.FieldDefs.Add(Prefix+'ORDERNUM2', ftString, 7);
 MTE.FieldDefs.Add(Prefix+'INPUTDATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'LUPDDATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'CCONTRACTOR', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CONTRACTOR_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'ACTDATE', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'CONTROL', ftString, 33);
End;


Procedure TKD.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
 adoq:TAdoQuery;
 CmkUser:TCmkUser;
Begin
 if Empty(Prefix) then Pr:='KD'
                  else Pr:=Prefix;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;

 rep.Variables[Pr+dot+'INCLFILE']:=DetectExistsFileName(IncludeTrailingPathDelimiter(Host.PicturesDir)+'kd',NREC);
 rep.Variables[Pr+dot+'NREC']:=NREC;
 rep.Variables[Pr+dot+'ORDERNUM']:=kav+AddSlashes(ORDERNUM)+kav;
 rep.Variables[Pr+dot+'ORDERNUM2']:=kav+AddSlashes(ORDERNUM2)+kav;
 rep.Variables[Pr+dot+'INPUTDATE']:=INPUTDATE;
 rep.Variables[Pr+dot+'LUPDDATE']:=LUPDDATE;
 rep.Variables[Pr+dot+'ACTDATE']:=ACTDATE;
 UpdateContractor_s;
 rep.Variables[Pr+dot+'CCONTRACTOR']:=CCONTRACTOR;
 rep.Variables[Pr+dot+'CONTRACTOR_S']:=kav+AddSlashes(CONTRACTOR_S)+kav;

 CmkUser:=TCmkUser.Create;
 s:=GetTextValueOfPointer(IntToStr(NREC),SchemaName+'KD','NREC','ORAUSER',True);
 If CmkUser.GetByLogin(s) then s:=CmkUser.GetUserFIO(True)
                          else s:=EmptyStr;
 rep.Variables[Pr+dot+'AUTHORFIO']:=kav+AddSlashes(s)+kav;
 CmkUser.Free;

 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;

 {
 s:=EmptyStr;
 adoq.SQL.Text:='select ORDERNUM2 from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC)+' group by ORDERNUM2';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   if Not Empty(adoq['ORDERNUM2']) then
    Begin
     if Not Empty(s) then s:=s+'/';
     s:=s+Trim(adoq['ORDERNUM2']);
    End;
   adoq.Next;
  End;
 adoq.Close;
 rep.Variables['MARKS'+dot+'ORDERNUM2']:=kav+AddSlashes(s)+kav;}
 rep.Variables['MARKS'+dot+'ORDERNUM2']:=kav+AddSlashes(ORDERNUM2)+kav;

 s:=EmptyStr;
 adoq.SQL.Text:='select DRAWING from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC)+' group by DRAWING';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   if Not Empty(adoq['DRAWING']) then
    Begin
     if Not Empty(s) then s:=s+';';
     s:=s+Trim(adoq['DRAWING']);
    End;
   adoq.Next;
  End;
 adoq.Close;
 rep.Variables['MARKS'+dot+'DRAWING']:=kav+AddSlashes(s)+kav;

 s:=EmptyStr;
 adoq.SQL.Text:='select QUEUE from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC)+' group by QUEUE';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   if Not Empty(adoq['QUEUE']) then
    Begin
     if Not Empty(s) then s:=s+'/';
     s:=s+Trim(adoq['QUEUE']);
    End;
   adoq.Next;
  End;
 adoq.Close;
 rep.Variables['MARKS'+dot+'QUEUE']:=kav+AddSlashes(s)+kav;

 s:=EmptyStr;
 adoq.SQL.Text:='select NAME from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC)+' group by NAME';
 adoq.Open;
 while Not adoq.Eof do
  Begin
   if Not Empty(adoq['NAME']) then
    Begin
     if Not Empty(s) then s:=s+comma+space;
     s:=s+Trim(adoq['NAME']);
    End;
   adoq.Next;
  End;
 adoq.Close;
 rep.Variables['MARKS'+dot+'NAME']:=kav+AddSlashes(s)+kav;

 // rep.Variables[Pr+const_dot+'lasttime']:=lasttime;

 // вычисляемые:
 adoq.Free;
End;

Procedure TKD.BuildVedomostSpecMTE(Var MTE:TMemTableEh;Var LMTE:TMemTableEh);
Var
 DETAILSadoq,adoq,MADOQ:TAdoQuery;
 GrMaterials:TGrMaterials;
 kd3:TKD3;
 mname:string;
Begin
 GrMaterials:=TGrMaterials.Create;
 kd3:=TKD3.Create;
 MTE:=TMemTableEh.Create(nil);
 MTE.FieldDefs.Add('SORT1', ftInteger); // Если Лист - 0, иначе - 1
 MTE.FieldDefs.Add('SORT2', ftString, 255); // Первое слово из поля PROFIL
 MTE.FieldDefs.Add('SORT3', ftFloat); // Размер 1
 MTE.FieldDefs.Add('SORT4', ftFloat); // Размер 2
 MTE.FieldDefs.Add('SORT5', ftFloat); // Размер 3
 MTE.FieldDefs.Add('CPARENT', ftLargeInt);
 MTE.FieldDefs.Add('PARENT_S', ftString, 255);
 MTE.FieldDefs.Add('PROFIL', ftString, 255);
 MTE.FieldDefs.Add('LENGTH', ftString, 20);
 MTE.FieldDefs.Add('MAT', ftString, 50);
 MTE.FieldDefs.Add('NUMCOUNT', ftInteger);
// MTE.FieldDefs.Add('WEIGHT1', ftFloat);
 MTE.FieldDefs.Add('WEIGHT', ftFloat);
 MTE.FieldDefs.Add('DETAILS_INCLFILE', ftString, 255);

 MTE.FieldDefs.Add('RAZMETKA', ftString, 255);
 MTE.FieldDefs.Add('REZKA', ftString, 255);
 MTE.FieldDefs.Add('GIBKA', ftString, 255);
 MTE.FieldDefs.Add('ZACHISTKA', ftString, 255);
 MTE.FieldDefs.Add('OTVERST', ftString, 255);
 MTE.FieldDefs.Add('STROZHKA', ftString, 255);

 AppendStructToMTE(MTE,'KD_');
 kd3.AppendStructToMTE(MTE,'DETAILS_');

 MTE.CreateDataSet;
 MTE.Open;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;

 madoq:=TAdoQuery.Create(nil);
 madoq.Connection:=Host.ADOC;

 DETAILSadoq:=TAdoQuery.Create(nil);
 DETAILSadoq.Connection:=Host.ADOC;
 DETAILSadoq.SQL.Text:='select * from '+SchemaName+'DETAILS'+' where CKD='+IntToStr(NREC)+' order by NREC';
 DETAILSadoq.Open;
 while Not DETAILSadoq.Eof do
  Begin
   if kd3.Read(DETAILSadoq) then
   Begin
   MTE.Append;

   Save(MTE,'KD_');
   MTE.Edit;

   kd3.Save(MTE,'DETAILS_');
   MTE.Edit;

   MTE['DETAILS_INCLFILE']:=DetectExistsFileName(IncludeTrailingPathDelimiter(Host.PicturesDir)+'details',kd3.NREC);
//   ShowMessage(MTE['DETAILS_INCLFILE']);

//   MTE['NUM']:=DETAILSadoq['NUM'];

   MTE['CPARENT']:=StrToIntM(GetTextValueOfPointer(IntToStr(kd3.CGRMATERIALS),SchemaName+'GRMATERIALS','nrec','cparent',False));
   mname:=GetTextValueOfPointer(IntToStr(MTE['CPARENT']),SchemaName+'GRMATERIALS','nrec','NAME',False);

   MTE['PROFIL']:=mname;
   MTE['PARENT_S']:=mname;

   kd3.UpdateGRMATERIALS_S;
   MTE['SORT1']:=1;
   case MTE['CPARENT'] of
{Прочие}   3: Begin
               MTE['PROFIL']:=kd3.GRMATERIALS_S;
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['SORT3']:=0;
               MTE['SORT4']:=0;
               MTE['SORT5']:=0;
              End;
{Лист}     4: Begin
               MTE['SORT1']:=0;
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:={MTE['PROFIL']+space+}FloatToStr(kd3.PROP_THICK_C)+'*'+FloatToStr(kd3.PROP_WIDTH_C)+'*'+FloatToStr(kd3.PROP_LENGTH_C);
               MTE['SORT3']:=kd3.PROP_THICK_C;
               MTE['SORT4']:=kd3.PROP_WIDTH_C;
               MTE['SORT5']:=kd3.PROP_LENGTH_C;
              End;
{Квадрат}  5: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+FloatToStr(kd3.PROP_SIZE)+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=kd3.PROP_SIZE;
               MTE['SORT4']:=kd3.PROP_SLENGTH;
               MTE['SORT5']:=0;
              End;
{Гнутый
 профиль}  6: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+FloatToStr(kd3.PROP_SIZE1)+'*'+FloatToStr(kd3.PROP_SIZE2)+'*'+FloatToStr(kd3.PROP_WTHICK)+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=kd3.PROP_SIZE1;
               MTE['SORT4']:=kd3.PROP_SIZE2;
               MTE['SORT5']:=kd3.PROP_WTHICK;
              End;
{труба}    7: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+'диам.'+FloatToStr(kd3.PROP_DIAM)+'*'+FloatToStr(kd3.PROP_WTHICK)+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=kd3.PROP_DIAM;
               MTE['SORT4']:=kd3.PROP_WTHICK;
               MTE['SORT5']:=kd3.PROP_SLENGTH;
              End;
{балка}  8,9: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+kd3.PROP_PROFNUM+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=StrToIntM(kd3.PROP_PROFNUM);
               MTE['SORT4']:=kd3.PROP_SLENGTH;
               MTE['SORT5']:=0;
              End;
{Уголок}  10: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+FloatToStr(kd3.PROP_PWIDTH1)+'*'+FloatToStr(kd3.PROP_PWIDTH2)+'*'+FloatToStr(kd3.PROP_WTHICK)+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=kd3.PROP_PWIDTH1;
               MTE['SORT4']:=kd3.PROP_PWIDTH2;
               MTE['SORT5']:=kd3.PROP_WTHICK;
              End;
{Швеллер} 11: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+kd3.PROP_PROFNUM+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=StrToIntM(kd3.PROP_PROFNUM);
               MTE['SORT4']:=kd3.PROP_SLENGTH;
               MTE['SORT5']:=0;
              End;
{Круг}   100: Begin
               MTE['SORT2']:=MTE['PROFIL'];
               MTE['PROFIL']:=MTE['PROFIL']+space+'диам.'+FloatToStr(kd3.PROP_DIAM)+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=kd3.PROP_DIAM;
               MTE['SORT4']:=kd3.PROP_SLENGTH;
               MTE['SORT5']:=0;
              End;
{Крепёж} 101: Begin
               MTE['SORT2']:=kd3.PROP_FIXTYPE_C;
               MTE['PROFIL']:=kd3.PROP_FIXTYPE_C+space+kd3.PROP_CARVTYPE_C+space+FloatToStr(kd3.PROP_DIAM)+'*'+FloatToStr(kd3.PROP_SLENGTH);
               MTE['SORT3']:=kd3.PROP_DIAM;
               MTE['SORT4']:=kd3.PROP_SLENGTH;
               MTE['SORT5']:=0;
              End;
   end;
//   MTE['LENGTH']:='';
   MTE['NUMCOUNT']:=0;
   madoq.SQL.Text:='select nrec from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC);
   madoq.Open;
   adoq.SQL.Text:='select NUMCOUNT, NVL(FROZEN, 0) as FROZEN from '+SchemaName+'DMARKS'+' where CMARK=:pMark and NUMP=:pNUMP';
   while Not madoq.Eof do
    Begin
     if LMTE.Locate('nrec',madoq['nrec'],[]) and (LMTE['cnt']>0) then
      Begin
   adoq.Parameters.ParamValues['PMARK;PNUMP'] := VarArrayOf([madoq['nrec'], kd3.NUMP]);
   adoq.Open;
   if not VarIsNull(adoq['FROZEN']) then case adoq['FROZEN'] of
   0: MTE['NUMCOUNT']:=MTE['NUMCOUNT']+adoq['NUMCOUNT']*LMTE['cnt'];
   else
     MTE['NUMCOUNT'] := MTE['NUMCOUNT'] + adoq['NUMCOUNT'];
   end;
   adoq.Close;
      End;
     madoq.Next;
    End;
   madoq.Close;
//   MTE['WEIGHT1']:=MTE['DETAILS_WEIGHT1']*1000;
   MTE['WEIGHT']:=MTE['NUMCOUNT']*MTE['DETAILS_WEIGHT1'];
   kd3.UpdatePROP_STEELMARK_C;
   MTE['MAT']:=kd3.PROP_STEELMARK_C;
   if Empty(kd3.PROP_STEELMARK_C) then
    Begin
     If GrMaterials.GetByNrec(kd3.CGRMATERIALS) then
      Begin
       GrMaterials.UpdatePROP_STEELMARK_C;
       MTE['MAT']:=GrMaterials.PROP_STEELMARK_C;
      End;
    End;
   MTE['LENGTH']:=FloatToStr(kd3.PROP_LENGTH_C);
   if kd3.PROP_LENGTH_C=0 then MTE['LENGTH']:=FloatToStr(kd3.PROP_SLENGTH);
   if MTE['LENGTH']=zero then MTE['LENGTH']:=EmptyStr;

   MTE['RAZMETKA']:=kd3.GetTechnologyDescription('RAZMETKA',Integer(MTE['NUMCOUNT']));
   MTE['REZKA']:=kd3.GetTechnologyDescription('REZKA',Integer(MTE['NUMCOUNT']));
   MTE['GIBKA']:=kd3.GetTechnologyDescription('GIBKA',Integer(MTE['NUMCOUNT']));
   MTE['ZACHISTKA']:=kd3.GetTechnologyDescription('ZACHISTKA',Integer(MTE['NUMCOUNT']));
   MTE['OTVERST']:=kd3.GetTechnologyDescription('OTVERST',Integer(MTE['NUMCOUNT']));
   MTE['STROZHKA']:=kd3.GetTechnologyDescription('STROZHKA',Integer(MTE['NUMCOUNT']));

   adoq.SQL.Text := 'SELECT * FROM ' + SchemaName + 'OTVERST WHERE CDETAIL=:pDetail';
   adoq.Parameters.ParamValues['pDetail'] := MTE['DETAILS_NREC'];
   adoq.Open;
   while not adoq.Eof do begin
     if not VarIsNull(adoq['NV']) then
       MTE['OTVERST'] := MTE['OTVERST'] + ' н/в-' + VarToStr(adoq['NV']) + '/' + VarToStr(adoq['NV'] * MTE['NUMCOUNT']);
     if not VarIsNull(adoq['DIAM']) then
       MTE['OTVERST'] := MTE['OTVERST'] + ' диам.' + adoq['DIAM'];
     if not VarIsNull(adoq['CNT']) then
       MTE['OTVERST'] := VarToStr(MTE['OTVERST']) + ' кол-во ' + VarToStr(adoq['CNT']) + '/' + VarToStr(adoq['CNT'] * MTE['NUMCOUNT']);
     if not VarIsNull(adoq['PRIM']) then
       MTE['OTVERST'] := MTE['OTVERST'] + adoq['PRIM'];
     adoq.Next;
   end;
   adoq.Close;

   MTE.Post;
   if MTE['NUMCOUNT']=0 then MTE.Delete;
   End;
   {
   DMARKSadoq.SQL.Text:='select * from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC);
   DMARKSadoq.Open;
   while Not DMARKSadoq.Eof do
    Begin

     DMARKSadoq.Next;
    End;
   DMARKSadoq.Close;
   }



   DETAILSadoq.Next;
  End;
 DETAILSadoq.Close;
 DETAILSadoq.Free;

 madoq.Free;

 adoq.Free;
 KD3.Free;
 GrMaterials.Free;
 MTE.SortOrder:='SORT1,SORT2,SORT3,SORT4,SORT5,PARENT_S,PROFIL,DETAILS_NUMP';
End;

Procedure TKD.BuildMVedomostSpecMTE(Var MTE:TMemTableEh;Var LMTE:TMemTableEh);
Var
 MARKSadoq:TAdoQuery;
 kd2:TKD2;
  function ExtractNumber(const s: string): string;
  var
    I: Integer;
    LastCharWasDigit: Boolean;
    len: Integer;
  begin
    len := Length(s);
    Result := '';

    LastCharWasDigit := False;
    for i := 1 to len do begin
      if Pos(s[i], '0123456789') > 0 then begin
        Result := result + s[i];
        LastCharWasDigit := True;
      end else if LastCharWasDigit then begin
         System.Break;
      end;
    end;
    if Result = '' then
      Result := '0';
  end;
Begin
 kd2:=TKD2.Create;
 MTE:=TMemTableEh.Create(nil);
 MTE.FieldDefs.Add('MCOUNT', ftInteger);
 MTE.FieldDefs.Add('MARKS_INCLFILE', ftString, 255);

 MTE.FieldDefs.Add('SBORKA', ftString, 255);
 MTE.FieldDefs.Add('SVARKA', ftString, 255);
 MTE.FieldDefs.Add('ZACHIST', ftString, 255);
 MTE.FieldDefs.Add('GRPOKR', ftString, 255);
 MTE.FieldDefs.Add('DOVODKA', ftString, 255);

 AppendStructToMTE(MTE,'KD_');
 kd2.AppendStructToMTE(MTE,'MARKS_');

 MTE.FieldDefs.Add('MARKS_ORDN_INT', ftInteger);

 MTE.CreateDataSet;
 MTE.Open;

 MARKSadoq:=TAdoQuery.Create(nil);
 MARKSadoq.Connection:=Host.ADOC;
 MARKSadoq.SQL.Text:='select * from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC)+' order by ordn, mark';
 MARKSadoq.Open;
 while Not MARKSadoq.Eof do
  Begin
   if kd2.Read(MARKSadoq) then
   Begin
   MTE.Append;

   Save(MTE,'KD_');
   MTE.Edit;

   kd2.Save(MTE,'MARKS_');
   MTE.Edit;

   MTE['MARKS_INCLFILE']:=DetectExistsFileName(IncludeTrailingPathDelimiter(Host.PicturesDir)+'marks',kd2.NREC);

   MTE['MCOUNT']:=0;
   if LMTE.Locate('nrec',MARKSadoq['nrec'],[]) and (LMTE['cnt']>0) then
    MTE['MCOUNT']:=LMTE['cnt'];

   MTE['SBORKA']:=kd2.GetTechnologyDescription('SBORKA',MTE['MCOUNT']);
   MTE['SVARKA']:=kd2.GetTechnologyDescription('SVARKA',MTE['MCOUNT']);
   MTE['ZACHIST']:=kd2.GetTechnologyDescription('ZACHIST',MTE['MCOUNT']);
   MTE['GRPOKR']:=kd2.GetTechnologyDescription('GRPOKR',MTE['MCOUNT']);
   MTE['DOVODKA']:=kd2.GetTechnologyDescription('DOVODKA',MTE['MCOUNT']);

   MTE['MARKS_ORDN_INT'] := StrToIntDef(ExtractNumber(MTE['MARKS_ORDN']), 0);

   MTE.Post;
   if MTE['MCOUNT']=0 then MTE.Delete;
   End;



   MARKSadoq.Next;
  End;
 MARKSadoq.Close;
 MARKSadoq.Free;

 KD2.Free;
 MTE.SortOrder:='MARKS_ORDN_INT,MARKS_NAME';
End;

Procedure TKD.BuildMVedomostSpecMTE2(Var MTE:TMemTableEh;Var LMTE:TMemTableEh);
var
  SpWeldingADOQ: TADOQuery;
begin
  MTE := TMemTableEh.Create(nil);
  with MTE.FieldDefs do begin
    Add('NREC', ftLargeint);
    Add('CMARK', ftLargeint);
    Add('TLS', ftString, 10);
    Add('FOOTAGE', ftFloat);
    Add('WEIGHT', ftFloat);
    Add('NV', ftFloat);
    Add('NVZ', ftFloat);
  end;
  MTE.CreateDataSet;
  MTE.Open;

  SpWeldingADOQ := TADOQuery.Create(nil);
  SpWeldingADOQ.Connection := Host.ADOC;
  SpWeldingADOQ.SQL.Text := 'select * from ' + SchemaName + 'SPWELDING';
  SpWeldingADOQ.Open;
  while not SpWeldingADOQ.Eof do begin
    MTE.Append;
    MTE['NREC;CMARK;TLS;FOOTAGE;WEIGHT;NV;NVZ'] := SpWeldingADOQ['NREC;CMARK;TLS;FOOTAGE;WEIGHT;NV;NVZ'];
    MTE.Post;

    SpWeldingADOQ.Next;
  end;
  SpWeldingADOQ.Close;
  SpWeldingADOQ.Free;
end;

Procedure TKD.Report(OForm:TComponent;fr3:string);
Var
 MTE, MTE2, MTE3, MTE4:TMemTableEh;
 SelectLists:TSelectLists;
 adoq:TAdoQuery;
Begin
 FRForm.Report.Clear;
 FRForm.Report.LoadFromFile(fr3);
 FieldsToReport(FRForm.Report);
// ShowMessage('qqq1');


 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'MARKS'+' where CKD='+IntToStr(NREC);
 adoq.Open;

 SelectLists:=TSelectLists.Create;
 while Not adoq.Eof do
  Begin
   SelectLists.MTE.Append;
   SelectLists.MTE['nrec;ordn;QUEUE;DRAWING;NAME']:=adoq['nrec;ordn;QUEUE;DRAWING;NAME'];
   SelectLists.MTE['cnt']:=1;
   SelectLists.MTE.Post;
   adoq.Next;
  End;

 adoq.Close;
 adoq.Free;

 if SelectLists.Edit(OForm) then
  Begin
   FRForm.Report.Variables['MARKS'+dot+'NAME']:=kav+AddSlashes(SelectLists.name)+kav;
   FRForm.Report.Variables['MARKS'+dot+'ORDN']:=kav+AddSlashes(SelectLists.ORDN)+kav;
//   FRForm.Report.Variables['MARKS'+dot+'ORDERNUM2']:=kav+AddSlashes(SelectLists.ORDERNUM2)+kav;
   FRForm.Report.Variables['MARKS'+dot+'QUEUE']:=kav+AddSlashes(SelectLists.QUEUE)+kav;
   FRForm.Report.Variables['MARKS'+dot+'DRAWING']:=kav+AddSlashes(SelectLists.DRAWING)+kav;

   BuildVedomostSpecMTE(MTE,SelectLists.MTE);
   BuildMVedomostSpecMTE(MTE2,SelectLists.MTE);
   BuildMVedomostSpecMTE2(MTE3,SelectLists.MTE);
   BuildMVedomostSpecMTE3(MTE4);

// ShowMessage('qqq');
   FRForm.DBDataset.DataSet:=MTE;
   FRForm.DBDataset2.DataSet:=MTE2;
   FRForm.DBDataset3.DataSet := MTE3;
   FRForm.DBDataset4.DataSet := MTE4;
   MTE3.MasterSource := TDataSource.Create(nil);
   MTE3.MasterSource.DataSet := MTE2;
   MTE3.MasterFields := 'MARKS_NREC';
   MTE3.DetailFields := 'CMARK';
   MTE4.MasterSource := TDataSource.Create(nil);
   MTE4.MasterSource.DataSet := MTE;
   MTE4.MasterFields := 'DETAILS_NREC';
   MTE4.DetailFields := 'CDETAIL';
   try
     FRForm.Report.PrepareReport();
     FRForm.Report.ShowPreparedReport;
   except

   end;
   MTE.Close;
   MTE.Free;
   MTE2.Close;
   MTE2.Free;
   MTE3.Close;
   MTE3.Free;
   MTE4.Close;
   MTE4.Free;
  End;
 SelectLists.Free;
End;

Procedure TKD.UpdateContractor_s;
Begin
 CONTRACTOR_S:=GetTextValueOfPointer(IntToStr(CCONTRACTOR),SchemaName+'CONTRACTORS','nrec','abbr',False);
 if CONTRACTOR_S=EmptyStr then CONTRACTOR_S:=space;
End;

Function CreateNewSostavn(OwnerForm:TComponent;fcmo:string;Var SostavnType,SostavnNREC,SostavnName:string):boolean;
Begin
 result:=False;
 {
 KDForm:=TKDForm.Create(OwnerForm);
 KDForm.f_name.Text:=SostavnName;
 LookupItemToForm(KDForm.f_csostavnt,KDForm.sostavntADOQ,SostavnType,'name',EmptyStr,EmptyStr,False);
 KDForm.f_yearv.Text:=syear;
 KDForm.f_orgowner_nrec:=EmptyFNREC;
 KDForm.UpdateOrgOwnerBtn;
 If KDForm.ShowModal=mrOK then
   Begin
    result:=True;
    SostavnName:=Trim(KDForm.f_name.Text);
    SostavnType:=LookupItemFromForm(KDForm.f_csostavnt.Text,KDForm.sostavntADOQ,SostavnTypesTable,False,False);
    // Добавление нового объекта в таблицу -->
    SostavnNREC:=GetNextNrecForTable(Host.ADOC,SostavnTable,OfficeVar);
    Host.ADOC.Execute('insert into '+SostavnTable+' (fnrec,fcmo,name,fcsostavnt,sostavnt_s,objcount,fcowner,yearv,comment) values ('''+SostavnNREC+
    ''','''+fcmo+''','+
    ''''+AddSlashes(SostavnName)+''','''+
    SostavnType+''','''+AddSlashes(Trim(KDForm.f_csostavnt.Text))+''','+
    IntToStr(StrToIntM(KDForm.f_objcount.Text))+
    ','''+KDForm.f_orgowner_nrec+''','+
    IntToStr(StrToIntM(KDForm.f_yearv.Text))+','+
    ''''+AddSlashes(Trim(KDForm.f_comment.Text))+''''
    +')');
    // <-- Добавление нового объекта в таблицу
   End;
 KDForm.Free;
 }
End;


procedure TKDForm.CCONTRACTORAppendBtnClick(Sender: TObject);
Var
 Contractor:TContractor;
begin
 Contractor:=TContractor.Create;
 if Contractor.Edit(Self,True) then
  Begin
  if Not CONTRACTORSADOQ.Locate('NAME',Contractor.NAME,[loCaseInsensitive]) then
   Begin
    CONTRACTORSADOQ.Append;
    if Not Contractor.Save(CONTRACTORSADOQ) then CONTRACTORSADOQ.Cancel;
    CONTRACTORSADOQ.Requery;
    if CONTRACTORSADOQ.Locate('NAME',Contractor.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_CCONTRACTOR,CONTRACTORSADOQ,CONTRACTORSADOQ['nrec'],'abbr',EmptyStr,EmptyStr,False);
   End else ShowMessage('Контрагент с именем "'+Contractor.NAME+'" уже присутствует в справочнике!');
  End;
 Contractor.Free;
end;

procedure TKDForm.CCONTRACTORComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CCONTRACTOR.ItemIndex,CONTRACTORSADOQ,SchemaName+'CONTRACTORS');
 CONTRACTORSADOQ.Requery;
 LookupItemToForm(f_CCONTRACTOR,CONTRACTORSADOQ,tempValue,'abbr',EmptyStr,EmptyStr,False);
end;

procedure TKDForm.FormCreate(Sender: TObject);
Var
 orderby:string;
begin
 CCONTRACTORAppendBtn.Enabled:=CurrentUser.SprEditRights;
 orderby:=' order by abbr';
 contractorsADOQ.Connection:=Host.ADOC;
 contractorsADOQ.SQL.Text:='select * from '+SchemaName+'CONTRACTORS'+' where active=1'+orderby;
 contractorsADOQ.Open;
end;

procedure TKDForm.FormDestroy(Sender: TObject);
begin
 contractorsADOQ.Close;
end;

procedure TKDForm.InclFileBtnClick(Sender: TObject);
Var
 InclFile:TInclFile;
begin
 InclFile:=TInclFile.Create;
 InclFile.dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+'kd';
 InclFile.nrec:=f_nrec;
 InclFile.Descr:='з-з МРК '+f_ORDERNUM.Text+' з-з ЦМК '+f_ORDERNUM2.Text;
 InclFile.Edit(Self);
 InclFile.Free;
end;

Constructor TKD.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TKD.Clear;
begin
 NREC:=0;
 ORDERNUM:=EmptyStr;
 ORDERNUM2:=EmptyStr;
 INPUTDATE:=Now;
 LUPDDATE:=Now;
 CCONTRACTOR:=0;
 CONTRACTOR_S:=EmptyStr;
 ACTDATE:=0;
 CONTROL := EmptyStr;
end;

Function TKD.Save(Dataset:TDataset;Prefix:string=''):boolean;
Begin
 result:=True;
 UpdateContractor_s;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 Dataset[Prefix+'ORDERNUM']:=ORDERNUM;
 Dataset[Prefix+'ORDERNUM2']:=ORDERNUM2;
 Dataset[Prefix+'INPUTDATE']:=INPUTDATE;
 Dataset[Prefix+'LUPDDATE']:=LUPDDATE;
 Dataset[Prefix+'CCONTRACTOR']:=CCONTRACTOR;
 Dataset[Prefix+'CONTRACTOR_S']:=CONTRACTOR_S;
 Dataset[Prefix+'ACTDATE']:=ACTDATE;
 DataSet[Prefix + 'CONTROL'] := CONTROL;
 if ACTDATE=0 then Dataset[Prefix+'ACTDATE'] := Null;

 Try
     Dataset.Post;
     if Empty(Prefix) then
     Begin
     FreqInc(SchemaName+'CONTRACTORS',CCONTRACTOR);
     End;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о заказе! ('+e.Message+')');
      End;
 End;

End;

Function TKD.Read(Var Dataset:TAdoQuery):boolean;
Begin
  result:=True;
  Clear;
  Try
    try nrec:=Dataset['NREC']; except end;
    try ORDERNUM:=Dataset['ORDERNUM']; except end;
    try ORDERNUM2:=Dataset['ORDERNUM2']; except end;
    try INPUTDATE:=Dataset['INPUTDATE']; except end;
    try LUPDDATE:=Dataset['LUPDDATE']; except end;
    try CCONTRACTOR:=Dataset['CCONTRACTOR']; except end;
    try CONTRACTOR_S := Dataset['CONTRACTOR_S']; except end;
    try ACTDATE := Dataset['ACTDATE']; except end;
    if not VarIsNull(Dataset['CONTROL']) then
      CONTROL := Dataset['CONTROL'];
  Except
    on E: Exception do
    Begin
      Result := False;
      ShowMessage('Ошибка при загрузке информации о заказе! (' +
        E.Message + ')');
    End;
  End;
End;

Function TKD.Edit(OForm: TComponent; New: boolean = False): boolean;
Var
  Form: TKDForm;
begin
  Form := TKDForm.Create(OForm);

  if ToForm(Form, New) then
  Begin
    if Form.ShowModal = mrOK then
    Begin
      Result := FromForm(Form);
    End
    else
      Result := False;
  End;
  Form.Free;
end;

Function TKD.ToForm(Var Form: TKDForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;

 Form.BitBtn1.Enabled:=(CurrentUser.CUSERGROUPS<>2) and (CurrentUser.CUSERGROUPS<>4);

 if New then Form.Caption:='Добавление нового заказа'
        else Form.Caption:='з-з '+ORDERNUM+'/'+ORDERNUM2;

 Form.InclFileBtn.Enabled:=Not New and Not Empty(Host.PicturesDir);

 Form.f_ORDERNUM.Text:=ORDERNUM;
 Form.f_ORDERNUM2.Text:=ORDERNUM2;
 LookupItemToForm(Form.f_CCONTRACTOR,Form.contractorsADOQ,CCONTRACTOR,'abbr',EmptyStr,EmptyStr,False);
 Form.f_ACTDATE.Date:=ACTDATE;
 Form.f_INPUTDATE.Caption:=DateToStr(INPUTDATE);
 Form.f_LUPDDATE.Caption:=DateToStr(LUPDDATE);
 Form.f_CONTROL.Text := CONTROL;

 {
 Form.f_yearv.Text:=IntToStr(yearv);
 Form.f_objcount.Text:=IntToStr(objcount);
 Form.f_orgowner_nrec:=cowner;
 Form.UpdateOrgOwnerBtn;
 Form.f_comment.Text:=comment;
 }
 result:=True;
End;

Function TKD.FromForm(Var Form:TKDForm):boolean;
Begin
 nrec:=Form.f_nrec;

 ORDERNUM:=Trim(Form.f_ORDERNUM.Text);
 if ORDERNUM=EmptyStr then ORDERNUM:=space;

 ORDERNUM2:=Trim(Form.f_ORDERNUM2.Text);
 if ORDERNUM2=EmptyStr then ORDERNUM2:=space;

 CONTROL := Trim(Form.f_CONTROL.Text);
 if CONTROL=EmptyStr then CONTROL := space;

 CCONTRACTOR:=LookupItemFromForm2(Form.f_CCONTRACTOR.ItemIndex,Form.contractorsADOQ,SchemaName+'CONTRACTORS');
 ACTDATE:=Form.f_ACTDATE.Date;

 {
 csostavnt:=LookupItemFromForm(Form.f_CCONTRACTOR.Text,Form.sostavntADOQ,SostavnTypesTable,False,False);
 yearv:=StrToIntM(Form.f_yearv.Text);
 objcount:=StrToIntM(Form.f_objcount.Text);
 cowner:=Form.f_orgowner_nrec;
 comment:=Trim(Form.f_comment.Text);
 }
 result:=True;
End;

Destructor TKD.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TKD.BuildMVedomostSpecMTE3(var MTE: TMemTableEh);
var
  SpHolesADOQ: TADOQuery;
begin
  MTE := TMemTableEh.Create(nil);
  with MTE.FieldDefs do
  begin
    Add('NREC', ftLargeint);
    Add('CDETAIL', ftLargeint);
    Add('DIAM', ftString, 100);
    Add('CNT', ftInteger);
    Add('NV', ftFloat);
    Add('PRIM', ftString, 255);
  end;
  MTE.CreateDataSet;
  MTE.Open;
  SpHolesADOQ := TADOQuery.Create(nil);
  SpHolesADOQ.Connection := Host.ADOC;
  SpHolesADOQ.SQL.Text := 'select * from ' + SchemaName + 'OTVERST';
  SpHolesADOQ.Open;
  while not SpHolesADOQ.Eof do
  begin
    MTE.Append;
    MTE['NREC;CDETAIL;DIAM;CNT;NV;PRIM'] := SpHolesADOQ['NREC;CDETAIL;DIAM;CNT;NV;PRIM'];
    MTE.Post;
    SpHolesADOQ.Next;
  end;
  SpHolesADOQ.Close;
  SpHolesADOQ.Free;
end;

end.
