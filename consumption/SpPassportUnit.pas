unit SpPassportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  ContractorUnit, frxClass, FastReportUnit, MemTableEh,  GrMaterialsUnit,
  CmkUserUnit, KD2Unit, KD3Unit, SelectListsUnit, DBGridEhGrouping, GridsEh,
  DBGridEh, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList, SpArrivalUnit,
  MagsoftMsgDlgUnit;


type
  TSpPassportForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    f_NUM: TLabeledEdit;
    f_ADATE: TJvDateEdit;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
    f_ncounter:integer;
    f_new:boolean;
  end;

TSpPassport = class
 NREC: int64;
 CPASSPORTS: int64;
 CSPPASSPORTS: int64;
 NAME: string[255];
 MARKIR: string[16];
 KOLT: double;
 PROP_PWIDTH1: double;
 PROP_PWIDTH2: double;
 PROP_SIZE1: double;
 PROP_SIZE2: double;
 PROP_WTHICK: double;
 PROP_SLENGTH: double;
 PROP_DIAM: double;
 PROP_SIZE: double;
 PROP_THICK_C: double;
 PROP_WIDTH_C: double;
 PROP_LENGTH_C: double;
 DATEF: TDateTime;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Procedure InitMainInfoFromParent;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Procedure FieldsToReport(Var rep:TfrxReport;Prefix:string='');
 Function Save(Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TSpPassportForm;New:boolean):boolean;
 Function FromForm(Var Form:TSpPassportForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SpPassportForm: TSpPassportForm;

implementation

{$R *.dfm}
Procedure TSpPassport.InitMainInfoFromParent;
Var
 SpPassport:TSpPassport;
 spar:TSpArrival;
 gr:TGrMaterials;
 CSPARRIVALS:int64;
Begin
 if CSPPASSPORTS=0 then
  Begin
   CSPARRIVALS:=StrToIntM(GetTextValueOfPointer(IntToStr(CPASSPORTS),SchemaName+'PASSPORTS','NREC','CSPARRIVALS',False));
   if CSPARRIVALS<>0 then
    Begin
       spar:=TSpArrival.Create;
       If spar.GetByNrec(CSPARRIVALS) then
        Begin
         gr:=TGrMaterials.Create;
         if gr.GetByNrec(spar.CGRMATERIALS) then
          Begin
           PROP_PWIDTH1:=gr.PROP_PWIDTH1;
           PROP_PWIDTH2:=gr.PROP_PWIDTH2;
           PROP_SIZE1:=gr.PROP_SIZE1;
           PROP_SIZE2:=gr.PROP_SIZE2;
           PROP_WTHICK:=gr.PROP_WTHICK;
           PROP_SLENGTH:=gr.PROP_SLENGTH;
           PROP_DIAM:=gr.PROP_DIAM;
           PROP_SIZE:=gr.PROP_SIZE;
           PROP_THICK_C:=gr.PROP_THICK_C;
           PROP_WIDTH_C:=gr.PROP_WIDTH_C;
           PROP_LENGTH_C:=gr.PROP_LENGTH_C;
           if PROP_PWIDTH1=0 then PROP_PWIDTH1:=spar.PROP_PWIDTH1;
           if PROP_PWIDTH2=0 then PROP_PWIDTH2:=spar.PROP_PWIDTH2;
           if PROP_SIZE1=0 then PROP_SIZE1:=spar.PROP_SIZE1;
           if PROP_SIZE2=0 then PROP_SIZE2:=spar.PROP_SIZE2;
           if PROP_WTHICK=0 then PROP_WTHICK:=spar.PROP_WTHICK;
           if PROP_SLENGTH=0 then PROP_SLENGTH:=spar.PROP_SLENGTH;
           if PROP_DIAM=0 then PROP_DIAM:=spar.PROP_DIAM;
           if PROP_SIZE=0 then PROP_SIZE:=spar.PROP_SIZE;
           if PROP_THICK_C=0 then PROP_THICK_C:=spar.PROP_THICK_C;
           if PROP_WIDTH_C=0 then PROP_WIDTH_C:=spar.PROP_WIDTH_C;
           if PROP_LENGTH_C=0 then PROP_LENGTH_C:=spar.PROP_LENGTH_C;
          End;
         gr.Free;
        End;
       spar.Free;
    End;
  End
   else
  Begin
   SpPassport:=TSpPassport.Create;
   if SpPassport.GetByNrec(CSPPASSPORTS) then
    Begin
     CPASSPORTS:=SpPassport.CPASSPORTS;
//   NAME:=SpPassport.NAME+'/';
//   MARKIR: string[16];
     KOLT:=SpPassport.KOLT;
     PROP_PWIDTH1:=SpPassport.PROP_PWIDTH1;
     PROP_PWIDTH2:=SpPassport.PROP_PWIDTH2;
     PROP_SIZE1:=SpPassport.PROP_SIZE1;
     PROP_SIZE2:=SpPassport.PROP_SIZE2;
     PROP_WTHICK:=SpPassport.PROP_WTHICK;
     PROP_SLENGTH:=SpPassport.PROP_SLENGTH;
     PROP_DIAM:=SpPassport.PROP_DIAM;
     PROP_SIZE:=SpPassport.PROP_SIZE;
     PROP_THICK_C:=SpPassport.PROP_THICK_C;
     PROP_WIDTH_C:=SpPassport.PROP_WIDTH_C;
     PROP_LENGTH_C:=SpPassport.PROP_LENGTH_C;
    End;
   SpPassport.Free;
  End;
End;

Function TSpPassport.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Procedure TSpPassport.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CPASSPORTS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CSPPASSPORTS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'NAME', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'MARKIR', ftString, 16);
 MTE.FieldDefs.Add(Prefix+'KOLT', ftFloat);
 MTE.FieldDefs.Add(Prefix+'DATEF', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'PROP_PWIDTH1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_PWIDTH2', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE2', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_WTHICK', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SLENGTH', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_DIAM', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_SIZE', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_THICK_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_WIDTH_C', ftFloat);
 MTE.FieldDefs.Add(Prefix+'PROP_LENGTH_C', ftFloat);
End;


Procedure TSpPassport.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
Begin
 if Empty(Prefix) then Pr:='SPPASSPORTS'
                  else Pr:=Prefix;
 rep.Variables[Pr+dot+'NREC']:=NREC;
 rep.Variables[Pr+dot+'CPASSPORTS']:=CPASSPORTS;
 rep.Variables[Pr+dot+'CSPPASSPORTS']:=CSPPASSPORTS;
 rep.Variables[Pr+dot+'NAME']:=kav+AddSlashes(NAME)+kav;
 rep.Variables[Pr+dot+'MARKIR']:=kav+AddSlashes(MARKIR)+kav;
 rep.Variables[Pr+dot+'DATEF']:=DATEF;
 rep.Variables[Pr+dot+'KOLT']:=KOLT;
 rep.Variables[Pr+dot+'PROP_PWIDTH1']:=PROP_PWIDTH1;
 rep.Variables[Pr+dot+'PROP_PWIDTH2']:=PROP_PWIDTH2;
 rep.Variables[Pr+dot+'PROP_SIZE1']:=PROP_SIZE1;
 rep.Variables[Pr+dot+'PROP_SIZE2']:=PROP_SIZE2;
 rep.Variables[Pr+dot+'PROP_WTHICK']:=PROP_WTHICK;
 rep.Variables[Pr+dot+'PROP_SLENGTH']:=PROP_SLENGTH;
 rep.Variables[Pr+dot+'PROP_DIAM']:=PROP_DIAM;
 rep.Variables[Pr+dot+'PROP_SIZE']:=PROP_SIZE;
 rep.Variables[Pr+dot+'PROP_THICK_C']:=PROP_THICK_C;
 rep.Variables[Pr+dot+'PROP_WIDTH_C']:=PROP_WIDTH_C;
 rep.Variables[Pr+dot+'PROP_LENGTH_C']:=PROP_LENGTH_C;
 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;
End;


procedure TSpPassportForm.FormShow(Sender: TObject);
begin
// if f_New then f_ANUM.SetFocus
//          else SpArrivalsGrid.SetFocus;
end;

Constructor TSpPassport.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSpPassport.Clear;
begin
 NREC:=0;
 CPASSPORTS:=0;
 CSPPASSPORTS:=0;
 NAME:=EmptyStr;
 MARKIR:=EmptyStr;
 KOLT:=0;
 PROP_PWIDTH1:=0;
 PROP_PWIDTH2:=0;
 PROP_SIZE1:=0;
 PROP_SIZE2:=0;
 PROP_WTHICK:=0;
 PROP_SLENGTH:=0;
 PROP_DIAM:=0;
 PROP_SIZE:=0;
 PROP_THICK_C:=0;
 PROP_WIDTH_C:=0;
 PROP_LENGTH_C:=0;
 DATEF:=Trunc(Now);
end;

Function TSpPassport.Save(Dataset:TDataset;Prefix:string=''):boolean;
Begin
 result:=True;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 Dataset[Prefix+'CPASSPORTS']:=CPASSPORTS;
 Dataset[Prefix+'CSPPASSPORTS']:=CSPPASSPORTS;
 if NAME=EmptyStr then NAME:=space;
 Dataset[Prefix+'NAME']:=NAME;
 if MARKIR=EmptyStr then MARKIR:=space;
 Dataset[Prefix+'MARKIR']:=MARKIR;
 Dataset[Prefix+'DATEF']:=DATEF;
 Dataset[Prefix+'KOLT']:=KOLT;
 Dataset[Prefix+'PROP_PWIDTH1']:=PROP_PWIDTH1;
 Dataset[Prefix+'PROP_PWIDTH2']:=PROP_PWIDTH2;
 Dataset[Prefix+'PROP_SIZE1']:=PROP_SIZE1;
 Dataset[Prefix+'PROP_SIZE2']:=PROP_SIZE2;
 Dataset[Prefix+'PROP_WTHICK']:=PROP_WTHICK;
 Dataset[Prefix+'PROP_SLENGTH']:=PROP_SLENGTH;
 Dataset[Prefix+'PROP_DIAM']:=PROP_DIAM;
 Dataset[Prefix+'PROP_SIZE']:=PROP_SIZE;
 Dataset[Prefix+'PROP_THICK_C']:=PROP_THICK_C;
 Dataset[Prefix+'PROP_WIDTH_C']:=PROP_WIDTH_C;
 Dataset[Prefix+'PROP_LENGTH_C']:=PROP_LENGTH_C;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о позиции паспорта! ('+e.Message+')');
      End;
 End;
End;

Function TSpPassport.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 CPASSPORTS:=Dataset['CPASSPORTS'];
 CSPPASSPORTS:=Dataset['CSPPASSPORTS'];
 NAME:=Trim(Dataset['NAME']);
 MARKIR:=Trim(Dataset['MARKIR']);
 DATEF:=Dataset['DATEF'];
 KOLT:=Dataset['KOLT'];
 PROP_PWIDTH1:=Dataset['PROP_PWIDTH1'];
 PROP_PWIDTH2:=Dataset['PROP_PWIDTH2'];
 PROP_SIZE1:=Dataset['PROP_SIZE1'];
 PROP_SIZE2:=Dataset['PROP_SIZE2'];
 PROP_WTHICK:=Dataset['PROP_WTHICK'];
 PROP_SLENGTH:=Dataset['PROP_SLENGTH'];
 PROP_DIAM:=Dataset['PROP_DIAM'];
 PROP_SIZE:=Dataset['PROP_SIZE'];
 PROP_THICK_C:=Dataset['PROP_THICK_C'];
 PROP_WIDTH_C:=Dataset['PROP_WIDTH_C'];
 PROP_LENGTH_C:=Dataset['PROP_LENGTH_C'];
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о позиции паспорта! ('+e.Message+')');
   End;
 End;
End;

Function TSpPassport.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TSpPassportForm;
begin
 Form:=TSpPassportForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSpPassport.ToForm(Var Form:TSpPassportForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 Form.f_new:=New;
 {
 if New then Form.Caption:='Добавление нового задания'
        else Form.Caption:='Задание №'+IntToStr(NUM);


 Form.f_NUM.Text:=IntToStr(NUM);
 Form.f_ANUM.Text:=ANUM;
 Form.f_ADATE.Date:=ADATE;
 Form.f_active.Checked:=ACTIVE;

 Form.sparrivalsADOQ.SQL.Text:='select * from '+SchemaName+'sparrivals'+' where carrivals='+IntToStr(nrec)+' order by GRMATERIALS_S';
 Form.sparrivalsADOQ.Open;

 Form.UpdateGridColumnsVis;
 }
 result:=True;
End;

Function TSpPassport.FromForm(Var Form:TSpPassportForm):boolean;
Begin
 nrec:=Form.f_nrec;
 {
 NUM:=StrToIntM(Form.f_NUM.Text);
 ANUM:=Form.f_ANUM.Text;
 ADATE:=Form.f_ADATE.Date;
 ACTIVE:=Form.f_active.Checked;
 Form.sparrivalsADOQ.Close;
 }
 result:=True;
End;

Destructor TSpPassport.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

