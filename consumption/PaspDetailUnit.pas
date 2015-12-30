unit PaspDetailUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  ContractorUnit, frxClass, FastReportUnit, MemTableEh,  GrMaterialsUnit,
  CmkUserUnit, KD2Unit, KD3Unit, SelectListsUnit, DBGridEhGrouping, GridsEh,
  DBGridEh, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList, SpArrivalUnit,
  MagsoftMsgDlgUnit, SpPassportUnit, Vcl.Menus, JvBaseEdits, GabaritsUnit;


type
  TPaspDetailForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    detailsADOQ: TADOQuery;
    Panel2: TPanel;
    f_DATEIZG: TJvDateEdit;
    Label3: TLabel;
    sparrivalsDS: TDataSource;
    f_CDETAIL: TComboBox;
    f_cdetailLabel: TLabel;
    f_KOLSHTP: TLabeledEdit;
    Label4: TLabel;
    f_WEIGHT1: TJvCalcEdit;
    f_KOLSHTF: TLabeledEdit;
    f_WEIGHT1F: TJvCalcEdit;
    Label5: TLabel;
    f_WEIGHT: TJvCalcEdit;
    Label6: TLabel;
    f_ORDERNUM: TComboBox;
    Label1: TLabel;
    f_ORDERNUM2: TComboBox;
    Label2: TLabel;
    f_ORDN: TComboBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OpenDetailsADOQ;
    procedure f_ORDERNUMChange(Sender: TObject);
    procedure f_KOLSHTFChange(Sender: TObject);
    procedure OrdChange(Sender: TObject);
    procedure f_CDETAILChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
    f_CSPPASSPORTS:int64;
    f_new:boolean;
    f_FCPLAN: int64;
  end;

TPaspDetail = class
 NREC: int64;
 CSPPASSPORTS: int64;
 CDETAILS: int64;
 DATEIZG: TDateTime;
 ORDERNUM: string[10];
 ORDERNUM2: string[7];
 ORDN: string[5];
 DETAILS_S: string[255];
 KOLSHTP: integer;
 KOLSHTF: integer;
 WEIGHT1:double;
 WEIGHT1F:double;
 WEIGHT:double;
 Procedure Clear;
 Procedure AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
 Procedure FieldsToReport(Var rep:TfrxReport;Prefix:string='');
 Function Save(Dataset:TDataset;Prefix:string=''):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TPaspDetailForm;New:boolean):boolean;
 Function FromForm(Var Form:TPaspDetailForm):boolean;
 Function Edit(OForm:TComponent;New:boolean;FCPLAN:int64):boolean;
 Procedure UpdateDETAILS_S;
 constructor Create;
 destructor Destroy; override;
end;

var
  PaspDetailForm: TPaspDetailForm;

  Function CalcWEIGHT1(WEIGHT1:double;csppassports:int64;Var kd3:TKD3):double; // Пересчет веса в зависимости от габаритов детали

implementation

{$R *.dfm}

Procedure LookupItemToFormNew(Var cb:TComboBox;Var ADOQ:TAdoQuery;link:int64);
Var
 s:string;
 i:integer;
 kd3:TKD3;
Begin
 cb.Items.BeginUpdate;
 cb.Items.Clear;
 kd3:=TKD3.Create;
 ADOQ.First;
 while Not ADOQ.Eof do
  Begin
   if kd3.GetByNrec(ADOQ.FieldByName('nrec').AsLargeInt) then
    Begin
     s:=kd3.GetDetailDescription;
     s:=Trim(s);
     cb.Items.Append(s);
     if link=ADOQ['nrec'] then cb.ItemIndex:=cb.Items.Count-1;
    End;
   ADOQ.Next;
  End;
 if cb.ItemIndex=-1 then cb.Text:=EmptyStr;
 kd3.Free;
 cb.Items.EndUpdate;
End;


Procedure TPaspDetail.UpdateDETAILS_S;
Var
 det:TKD3;
Begin
 det:=TKD3.Create;
 if det.GetByNrec(cdetails) then DETAILS_S:=det.GetDetailDescription
                            else DETAILS_S:=space;
 det.Free;
End;

Procedure TPaspDetail.AppendStructToMTE(Var MTE:TMemTableEh;Prefix:string='');
Begin
 MTE.FieldDefs.Add(Prefix+'NREC', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CSPPASSPORTS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'CDETAILS', ftLargeInt);
 MTE.FieldDefs.Add(Prefix+'DATEIZG', ftDateTime);
 MTE.FieldDefs.Add(Prefix+'ORDERNUM', ftString, 10);
 MTE.FieldDefs.Add(Prefix+'ORDERNUM2', ftString, 7);
 MTE.FieldDefs.Add(Prefix+'ORDN', ftString, 5);
 MTE.FieldDefs.Add(Prefix+'DETAILS_S', ftString, 255);
 MTE.FieldDefs.Add(Prefix+'KOLSHTP', ftInteger);
 MTE.FieldDefs.Add(Prefix+'KOLSHTF', ftInteger);
 MTE.FieldDefs.Add(Prefix+'WEIGHT1', ftFloat);
 MTE.FieldDefs.Add(Prefix+'WEIGHT1F', ftFloat);
 MTE.FieldDefs.Add(Prefix+'WEIGHT', ftFloat);
End;


Procedure TPaspDetail.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
 CmkUser:TCmkUser;
Begin
 if Empty(Prefix) then Pr:='SPPASSPORTSD'
                  else Pr:=Prefix;

 rep.Variables[Pr+dot+'NREC']:=NREC;
 rep.Variables[Pr+dot+'CSPPASSPORTS']:=CSPPASSPORTS;
 rep.Variables[Pr+dot+'CDETAILS']:=CDETAILS;
 rep.Variables[Pr+dot+'DATEIZG']:=DATEIZG;

 rep.Variables[Pr+dot+'ORDERNUM']:=kav+AddSlashes(ORDERNUM)+kav;
 rep.Variables[Pr+dot+'ORDERNUM2']:=kav+AddSlashes(ORDERNUM2)+kav;
 rep.Variables[Pr+dot+'ORDN']:=kav+AddSlashes(ORDN)+kav;
 rep.Variables[Pr+dot+'DETAILS_S']:=kav+AddSlashes(DETAILS_S)+kav;
 rep.Variables[Pr+dot+'KOLSHTP']:=KOLSHTP;
 rep.Variables[Pr+dot+'KOLSHTF']:=KOLSHTF;
 rep.Variables[Pr+dot+'WEIGHT1']:=WEIGHT1;
 rep.Variables[Pr+dot+'WEIGHT1F']:=WEIGHT1F;
 rep.Variables[Pr+dot+'WEIGHT']:=WEIGHT;

 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;
End;

procedure TPaspDetailForm.OpenDetailsADOQ;
Var
 wh,whORDERNUM,whORDERNUM2,whORDN:string;
Begin
 DetailsADOQ.DisableControls;
 if (f_FCPLAN<>0) then
  Begin
   {
   wh:='(ckd in (select nrec from '+SchemaName+'kd where '+
   'ordernum in (select ordernum from '+SchemaName+'spplans where cplans='+IntToStr(f_FCPLAN)+')))'+andd+
       '(ckd in (select ckd from '+SchemaName+'marks where '+
   'ordernum2 in (select ordernum2 from '+SchemaName+'spplans where cplans='+IntToStr(f_FCPLAN)+')))'
   ;
   }
   wh:='(ckd in (select nrec from '+SchemaName+'kd where '+
   'ordernum in (select ordernum from '+SchemaName+'spplans where cplans='+IntToStr(f_FCPLAN)+')'+andd+
   'ordernum2 in (select ordernum2 from '+SchemaName+'spplans where cplans='+IntToStr(f_FCPLAN)+')))'
   ;
  End else wh:=truu;

 if Not Empty(f_ORDERNUM.Text) then whORDERNUM:='CKD in (select NREC from '+SchemaName+'KD where ORDERNUM='''+AddSlashes(Trim(f_ORDERNUM.Text))+''''+')'
                           else whORDERNUM:=truu;
 {
 if Not Empty(f_ORDERNUM2.Text) then whORDERNUM2:='CKD in (select CKD from '+SchemaName+'MARKS where ORDERNUM2='''+AddSlashes(Trim(f_ORDERNUM2.Text))+''''+')'
                            else whORDERNUM2:=truu;
 }
 if Not Empty(f_ORDERNUM2.Text) then whORDERNUM2:='CKD in (select NREC from '+SchemaName+'KD where ORDERNUM2='''+AddSlashes(Trim(f_ORDERNUM2.Text))+''''+')'
                            else whORDERNUM2:=truu;


// if Not Empty(f_ORDN.Text) then whORDN:='(ckd in (select ckd from '+SchemaName+'marks where ordn='''+AddSlashes(Trim(f_ORDN.Text))+''''+'))'
//                           else whORDN:=truu;
 if Not Empty(f_ORDN.Text) then
  whORDN:='(nump in (select dmarks.nump from '+SchemaName+'marks marks,'+SchemaName+'dmarks dmarks where marks.ordn='''+AddSlashes(Trim(f_ORDN.Text))+''''+andd+
  'dmarks.cmark=marks.nrec'+andd+
  'dmarks.numcount>0'
  +'))'
                           else whORDN:=truu;
 DetailsADOQ.SQL.Text:='select * from '+SchemaName+'details where '+wh+andd+whORDERNUM+andd+whORDERNUM2+andd+whORDN+' order by NUMP';
// ToLog(DetailsADOQ.SQL.Text);
 DetailsADOQ.Open;
 DetailsADOQ.EnableControls;
End;

procedure TPaspDetailForm.OrdChange(Sender: TObject);
begin
 f_cdetail.Enabled:=Not Empty(f_ordernum.Text) and Not Empty(f_ordernum2.Text) and Not Empty(f_ordn.Text);
 f_cdetailLabel.Enabled:=f_cdetail.Enabled;
end;

procedure TPaspDetailForm.FormCreate(Sender: TObject);
begin
 detailsADOQ.Connection:=Host.ADOC;
end;

procedure TPaspDetailForm.FormDestroy(Sender: TObject);
begin
// contractorsADOQ.Close;
end;

procedure TPaspDetailForm.FormShow(Sender: TObject);
begin
 if Empty(f_ORDERNUM.Text) then f_ORDERNUM.SetFocus
                           else
                            Begin
                             if Empty(f_ORDERNUM2.Text) then f_ORDERNUM2.SetFocus
                              else
                               Begin
                                if Empty(f_ORDN.Text) then f_ORDN.SetFocus
                                 else
                                  Begin
                                   if Empty(f_CDETAIL.Text) then Try f_CDETAIL.SetFocus Except End
                                                            else f_KOLSHTF.SetFocus;

                                  End;
                               End;
                            End;
end;

Function CalcWEIGHT1(WEIGHT1:double;csppassports:int64;Var kd3:TKD3):double; // Пересчет веса в зависимости от габаритов детали
Var
 adoq:TAdoQuery;
 csparrivals,cgrmaterials,cparent:int64;
 v1,v2:double;
Begin
 result:=WEIGHT1;
// ToLog('1: weight1='+FloatToStr(weight1));
 if result>0 then
  Begin
    adoq:=TAdoQuery.Create(nil);
    adoq.Connection:=Host.ADOC;
//    ToLog('2: result>0 !');
    adoq.SQL.Text:='select * from '+SchemaName+'sppassports where nrec='+IntToStr(csppassports);
//    ToLog('3: adoq.SQL.Text='+adoq.SQL.Text);
    adoq.Open;
    if adoq.RecordCount=1 then
     Begin
//      ToLog('4: adoq.RecordCount=1 !');
      csparrivals:=StrToIntM(GetTextValueOfPointer(IntToStr(adoq.FieldByName('cpassports').AsLargeInt),SchemaName+'passports','nrec','csparrivals',False));
//      ToLog('5: csparrivals='+IntToStr(csparrivals));
      cgrmaterials:=StrToIntM(GetTextValueOfPointer(IntToStr(csparrivals),SchemaName+'sparrivals','nrec','cgrmaterials',False));
//      ToLog('6: cgrmaterials='+IntToStr(cgrmaterials));
//      ToLog('7: kd3.CGRMATERIALS='+IntToStr(kd3.CGRMATERIALS));
      if cgrmaterials<>kd3.CGRMATERIALS then
       Begin
//        ToLog('8: cgrmaterials<>kd3.CGRMATERIALS !');
        cparent:=StrToIntM(GetTextValueOfPointer(IntToStr(cgrmaterials),SchemaName+'grmaterials','nrec','cparent',False));
//        ToLog('9: cparent='+IntToStr(cparent));
        if cparent=4 then // лист
         Begin
//          ToLog('10: cparent=4 !');
          cparent:=StrToIntM(GetTextValueOfPointer(IntToStr(kd3.cgrmaterials),SchemaName+'grmaterials','nrec','cparent',False));
//          ToLog('11: cparent='+IntToStr(cparent));
          if cparent=4 then // лист
           Begin
//            ToLog('12: cparent=4 !');
            v1:=kd3.PROP_THICK_C{*kd3.PROP_WIDTH_C*kd3.PROP_LENGTH_C};
//            ToLog('13: v1='+FloatToStr(v1));
            v2:=adoq.FieldByName('PROP_THICK_C').AsFloat{*adoq.FieldByName('PROP_WIDTH_C').AsFloat*adoq.FieldByName('PROP_LENGTH_C').AsFloat};
//            ToLog('14: v2='+FloatToStr(v2));
            if (v1<>v2) and (v1<>0) then result:=v2/v1*result;
//            ToLog('15: result='+FloatToStr(result));
           End;
         End;
       End;
     End;
    adoq.Close;
    adoq.Free;
  End;
End;


procedure TPaspDetailForm.f_CDETAILChange(Sender: TObject);
Var
 g1,g2:TGabarits;
 cparent,csparrivals,cgrmaterials,cdetails,ckd:int64;
 kolshtp:integer;
 adoq:TAdoQuery;
 nump:string;
 kd3:TKD3;
 v1,v2:double;
begin
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 cdetails:=LookupItemFromForm2(f_cdetail.ItemIndex,DetailsADOQ,SchemaName+'DETAILS');
 kd3:=TKD3.Create;
 if kd3.GetByNrec(cdetails) then
 Begin
 f_kolshtp.Text:='0';
 if (f_fcplan<>0) and Not Empty(f_ordernum.Text) and Not Empty(f_ordernum2.Text) and Not Empty(f_ordn.Text) then
 Begin
  adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS='+IntToStr(f_fcplan)+andd+
  'ordernum='''+AddSlashes(Trim(f_ordernum.Text))+''''+andd+
  'ordernum2='''+AddSlashes(Trim(f_ordernum2.Text))+''''+andd+
  'ordn='''+AddSlashes(Trim(f_ordn.Text))+'''';
  adoq.Open;
  if adoq.RecordCount>0 then
   Begin
    kolshtp:=adoq.FieldByName('kolsht').AsInteger;
//    ShowMessage('кол-во в плане: '+IntToStr(kolshtp));
   End;
  adoq.Close;

  if kolshtp>0 then
   Begin
    ckd:=StrToIntM(GetTextValueOfPointer(IntToStr(cdetails),SchemaName+'details','nrec','ckd',False));
    nump:=GetTextValueOfPointer(IntToStr(cdetails),SchemaName+'details','nrec','nump',False);
    adoq.SQL.Text:='select dmarks.numcount as numcount from '+SchemaName+'marks marks,'+SchemaName+'dmarks dmarks where '+
    'marks.ordn='''+AddSlashes(Trim(f_ORDN.Text))+''''+andd+
    'dmarks.cmark=marks.nrec'+andd+
    'marks.ckd='+IntToStr(ckd)+andd+
    'dmarks.nump='''+nump+'''';
    adoq.Open;
    if adoq.RecordCount>0 then
     Begin
//      ShowMessage('кол-во в dmarks: '+IntToStr(adoq.FieldByName('numcount').AsInteger));
      kolshtp:=adoq.FieldByName('numcount').AsInteger*kolshtp;
//      ShowMessage('итого: '+IntToStr(kolshtp));
      f_kolshtp.Text:=IntToStr(kolshtp);
      f_kolshtf.Text:=f_kolshtp.Text;
     End;
    adoq.Close;
   End;


 {
 if Not Empty(f_ORDN.Text) then
  whORDN:='(nump in (select dmarks.nump from '+SchemaName+'marks marks,'+SchemaName+'dmarks dmarks where marks.ordn='''+AddSlashes(Trim(f_ORDN.Text))+''''+andd+
  'dmarks.cmark=marks.nrec'+andd+
  'dmarks.numcount>0'
  +'))'
 }
 End;


 f_WEIGHT1.Value:=StrToFloatM(GetTextValueOfPointer(IntToStr(cdetails),SchemaName+'details','nrec','weight1',False));
 f_WEIGHT1F.Value:=f_WEIGHT1.Value;

 {
 if f_WEIGHT1F.Value>0 then // Пересчет веса в зависимости от габаритов детали
  Begin
    adoq.SQL.Text:='select * from '+SchemaName+'sppassports where nrec='+IntToStr(f_csppassports);
    adoq.Open;
    if adoq.RecordCount=1 then
     Begin
      csparrivals:=StrToIntM(GetTextValueOfPointer(IntToStr(adoq.FieldByName('cpassports').AsLargeInt),SchemaName+'passports','nrec','csparrivals',False));
      cgrmaterials:=StrToIntM(GetTextValueOfPointer(IntToStr(csparrivals),SchemaName+'sparrivals','nrec','cgrmaterials',False));
      if cgrmaterials<>kd3.CGRMATERIALS then
       Begin
        cparent:=StrToIntM(GetTextValueOfPointer(IntToStr(cgrmaterials),SchemaName+'grmaterials','nrec','cparent',False));
        if cparent=4 then // лист
         Begin
          cparent:=StrToIntM(GetTextValueOfPointer(IntToStr(kd3.cgrmaterials),SchemaName+'grmaterials','nrec','cparent',False));
          if cparent=4 then // лист
           Begin
            v1:=kd3.PROP_THICK_C*kd3.PROP_WIDTH_C*kd3.PROP_LENGTH_C;
            v2:=adoq.FieldByName('PROP_THICK_C').AsFloat*adoq.FieldByName('PROP_WIDTH_C').AsFloat*adoq.FieldByName('PROP_LENGTH_C').AsFloat;
            if (v1<>v2) and (v1<>0) then f_WEIGHT1F.Value:=v2/v1*f_WEIGHT1F.Value;
           End;
         End;
       End;
     End;
    adoq.Close;
  End;
 }

 f_WEIGHT1F.Value:=CalcWEIGHT1(f_WEIGHT1F.Value,f_csppassports,kd3); // Пересчет веса в зависимости от габаритов детали

 End;
 adoq.Free;
 kd3.Free;
 f_KOLSHTFChange(Sender);
end;

procedure TPaspDetailForm.f_KOLSHTFChange(Sender: TObject);
begin
 f_WEIGHT.Value:=StrToIntM(f_KOLSHTF.Text)*f_WEIGHT1F.Value;
end;

procedure TPaspDetailForm.f_ORDERNUMChange(Sender: TObject);
Var
 cdetails:int64;
begin
 cdetails:=LookupItemFromForm2(f_cdetail.ItemIndex,DetailsADOQ,SchemaName+'DETAILS');
 OpenDetailsADOQ;
// LookupItemToFormNew(f_cdetail,DetailsADOQ,cdetails,'NUMP,GRMATERIALS_S','" - "'+comma);
 LookupItemToFormNew(f_cdetail,DetailsADOQ,cdetails);
end;

Constructor TPaspDetail.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TPaspDetail.Clear;
begin
 NREC:=0;
 CSPPASSPORTS:=0;
 CDETAILS:=0;
 DATEIZG:=Trunc(Now);
 ORDERNUM:=EmptyStr;
 ORDERNUM2:=EmptyStr;
 ORDN:=EmptyStr;
 DETAILS_S:=EmptyStr;
 KOLSHTP:=0;
 KOLSHTF:=0;
 WEIGHT1:=0;
 WEIGHT1F:=0;
 WEIGHT:=0;
end;

Function TPaspDetail.Save(Dataset:TDataset;Prefix:string=''):boolean;
Begin
 result:=True;
 if Not Empty(Prefix) then Dataset[Prefix+'NREC']:=nrec;
 Dataset[Prefix+'CSPPASSPORTS']:=CSPPASSPORTS;
 Dataset[Prefix+'CDETAILS']:=CDETAILS;
 Dataset[Prefix+'DATEIZG']:=DATEIZG;
 if ORDERNUM=EmptyStr then ORDERNUM:=space;
 Dataset[Prefix+'ORDERNUM']:=ORDERNUM;
 if ORDERNUM2=EmptyStr then ORDERNUM2:=space;
 Dataset[Prefix+'ORDERNUM2']:=ORDERNUM2;
 if ORDN=EmptyStr then ORDN:=space;
 Dataset[Prefix+'ORDN']:=ORDN;
 UpdateDETAILS_S;
 if DETAILS_S=EmptyStr then DETAILS_S:=space;
 Dataset[Prefix+'DETAILS_S']:=DETAILS_S;
 Dataset[Prefix+'KOLSHTP']:=KOLSHTP;
 Dataset[Prefix+'KOLSHTF']:=KOLSHTF;
 Dataset[Prefix+'WEIGHT1']:=WEIGHT1;
 Dataset[Prefix+'WEIGHT1F']:=WEIGHT1F;
 WEIGHT:=WEIGHT1F*KOLSHTF;
 Dataset[Prefix+'WEIGHT']:=WEIGHT;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о детали! ('+e.Message+')');
      End;
 End;
End;

Function TPaspDetail.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 CSPPASSPORTS:=Dataset['CSPPASSPORTS'];
 CDETAILS:=Dataset['CDETAILS'];
 DATEIZG:=Dataset.FieldByName('DATEIZG').AsDateTime;
 ORDERNUM:=Dataset['ORDERNUM'];
 ORDERNUM2:=Dataset['ORDERNUM2'];
 ORDN:=Dataset['ORDN'];
 DETAILS_S:=Dataset['DETAILS_S'];
 KOLSHTP:=Dataset['KOLSHTP'];
 KOLSHTF:=Dataset['KOLSHTF'];
 WEIGHT1:=Dataset['WEIGHT1'];
 WEIGHT1F:=Dataset['WEIGHT1F'];
 WEIGHT:=WEIGHT1F*KOLSHTF;
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о детали! ('+e.Message+')');
   End;
 End;
End;

Function TPaspDetail.Edit(OForm:TComponent;New:boolean;FCPLAN:int64):boolean;
Var
 Form: TPaspDetailForm;
begin
 Form:=TPaspDetailForm.Create(OForm);
 Form.f_FCPLAN:=FCPLAN;
 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TPaspDetail.ToForm(Var Form:TPaspDetailForm;New:boolean):boolean;
Var
 i:integer;
 adoq:TAdoQuery;
Begin
 Form.f_nrec:=nrec;
 Form.f_CSPPASSPORTS:=CSPPASSPORTS;
 Form.f_new:=New;

 if New then Form.Caption:='Добавление в паспорт новой детали'
        else Form.Caption:='Деталь '+DETAILS_S;

 Form.f_DATEIZG.Date:=DATEIZG;
 Form.f_ORDERNUM.Text:=ORDERNUM;
 Form.f_ORDERNUM2.Text:=ORDERNUM2;
 Form.f_ORDN.Text:=ORDN;
 Form.f_KOLSHTP.Text:=IntToStr(KOLSHTP);
 Form.f_KOLSHTF.Text:=IntToStr(KOLSHTF);
 Form.f_WEIGHT1.Value:=WEIGHT1;
 Form.f_WEIGHT1F.Value:=WEIGHT1F;
 Form.f_WEIGHT.Value:=WEIGHT;

 if Form.f_fcplan<>0 then
  Begin
   adoq:=TAdoQuery.Create(nil);
   adoq.Connection:=Host.ADOC;
   adoq.SQL.Text:='select * from '+SchemaName+'SPPLANS'+' where CPLANS='+IntToStr(Form.f_fcplan);
   adoq.Open;
   Form.f_ORDERNUM.Items.BeginUpdate; Form.f_ORDERNUM2.Items.BeginUpdate; Form.f_ORDN.Items.BeginUpdate;
   Form.f_ORDERNUM.Items.Clear; Form.f_ORDERNUM2.Items.Clear; Form.f_ORDN.Items.Clear;
   while Not adoq.Eof do
    Begin
     if Form.f_ORDERNUM.Items.IndexOf(adoq.FieldByName('ordernum').AsString)=-1 then Form.f_ORDERNUM.Items.Append(adoq.FieldByName('ordernum').AsString);
     if Form.f_ORDERNUM2.Items.IndexOf(adoq.FieldByName('ordernum2').AsString)=-1 then Form.f_ORDERNUM2.Items.Append(adoq.FieldByName('ordernum2').AsString);
     if Form.f_ORDN.Items.IndexOf(adoq.FieldByName('ordn').AsString)=-1 then Form.f_ORDN.Items.Append(adoq.FieldByName('ordn').AsString);
     adoq.Next;
    End;
   Form.f_ORDERNUM.Items.EndUpdate; Form.f_ORDERNUM2.Items.EndUpdate; Form.f_ORDN.Items.EndUpdate;
   adoq.Close;
   adoq.Free;
  End;

 Form.OrdChange(Form);

 Form.OpenDetailsADOQ;

// LookupItemToFormNew(Form.f_cdetail,Form.DetailsADOQ,cdetails,'NUMP,GRMATERIALS_S,','" - "'+comma);
 LookupItemToFormNew(Form.f_cdetail,Form.DetailsADOQ,cdetails);

 result:=True;
End;

Function TPaspDetail.FromForm(Var Form:TPaspDetailForm):boolean;
Begin
 nrec:=Form.f_nrec;
 CSPPASSPORTS:=Form.f_CSPPASSPORTS;
{
 ncounter:=Form.f_ncounter;
 NUM:=StrToIntM(Form.f_NUM.Text);
 ANUM:=Form.f_ANUM.Text;
 ADATE:=Form.f_ADATE.Date;
 ACTIVE:=Form.f_active.Checked;
}

 DATEIZG:=Form.f_DATEIZG.Date;
 ORDERNUM:=Trim(Form.f_ORDERNUM.Text);
 ORDERNUM2:=Trim(Form.f_ORDERNUM2.Text);
 ORDN:=Trim(Form.f_ORDN.Text);
 KOLSHTP:=StrToIntM(Form.f_KOLSHTP.Text);
 KOLSHTF:=StrToIntM(Form.f_KOLSHTF.Text);
 WEIGHT1:=Form.f_WEIGHT1.Value;
 WEIGHT1F:=Form.f_WEIGHT1F.Value;
 WEIGHT:=KOLSHTF*WEIGHT1F;

 cdetails:=LookupItemFromForm2(Form.f_cdetail.ItemIndex,Form.DetailsADOQ,SchemaName+'DETAILS');

 Form.detailsADOQ.Close;
 result:=True;
End;

Destructor TPaspDetail.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

