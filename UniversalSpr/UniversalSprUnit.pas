unit UniversalSprUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits, InclFileUnit,
  Spr1LabeledEditUnit, EquipmentUnit, ContractorUnit, DBGridEhGrouping,
  Vcl.DBCtrls, GridsEh, DBGridEh, Vcl.PlatformDefaultStyleActnCtrls,
  ActnCtrls,  SteelMarkUnit, MagsoftMsgDlgUnit, Vcl.ImgList, EhLibADO, Vcl.Menus,
  Spr1JvCalcEditUnit, NormdocUnit, MaterialUnit, GrMaterialsUnit, CMKUserUnit,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh;


type
  TUniversalSprForm = class(TForm)
    ADOQ: TADOQuery;
    DS: TDataSource;
    Panel2: TPanel;
    Grid: TDBGridEh;
    Panel3: TPanel;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    ActionManager1: TActionManager;
    AppendRecordAction: TAction;
    EditRecordAction: TAction;
    DeleteRecordAction: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AppendRecordActionExecute(Sender: TObject);
    procedure EditRecordActionExecute(Sender: TObject);
    procedure DeleteRecordActionExecute(Sender: TObject);
    procedure ActionsEnabling;
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure ADOQBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    f_EditRights:boolean;
    f_SprFilterString,f_SprTableName,f_UnicalField: string;
    f_BeforePostField1: string;
    f_BeforePostValue1: int64;
    f_BeforePostField2: string;
    f_BeforePostValue2: int64;
  end;

  TSpr = class
    SprTableName: string;
    SprVisibleFieldNames: string;
    SprVisibleFieldTitles: string;
    SprVisibleFieldWidths: string;
    SprFilterString: string;
    SprOrderByString: string;
    SprDescription: string;
    UnicalField: string;
    BeforePostField1: string;
    BeforePostValue1: int64;
    BeforePostField2: string;
    BeforePostValue2: int64;
    EditRights: boolean;
    Procedure Clear;
    Function ToForm(Var Form:TUniversalSprForm):boolean;
    Function FromForm(Var Form:TUniversalSprForm):boolean;
    Function Edit(OForm:TComponent):boolean;
    constructor Create;
    destructor Destroy; override;
  end;

var
  UniversalSprForm: TUniversalSprForm;

implementation

{$R *.dfm}

procedure TUniversalSprForm.ADOQBeforePost(DataSet: TDataSet);
begin
 if Not Empty(f_BeforePostField1) then DataSet[f_BeforePostField1]:=f_BeforePostValue1;
 if Not Empty(f_BeforePostField2) then DataSet[f_BeforePostField2]:=f_BeforePostValue2;
end;

procedure TUniversalSprForm.AppendRecordActionExecute(Sender: TObject);
Var
 SprRecord:TObject;
 UnicalFieldValue:string;
 UnicalFieldValues:variant;
 sok:boolean;
begin
 if AppendRecordAction.Enabled then
 Begin
 if f_SprTableName='STEELMARKS' then SprRecord:=TSteelMark.Create;
 if f_SprTableName='WIDTHS' then SprRecord:=TSpr1JvCalcEdit.Create;
 if f_SprTableName='THICKS' then SprRecord:=TSpr1JvCalcEdit.Create;
 if f_SprTableName='LENGTHS' then SprRecord:=TSpr1JvCalcEdit.Create;
 if f_SprTableName='CONTRACTORS' then SprRecord:=TContractor.Create;
 if f_SprTableName='NORMDOC' then SprRecord:=TNormdoc.Create;
 if (f_SprTableName='CARVTYPES') or (f_SprTableName='FIXTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES') then SprRecord:=TSpr1LabeledEdit.Create;
 if f_SprTableName='EQUIPMENT' then SprRecord:=TEquipment.Create;
 if f_SprTableName='MATERIALS' then SprRecord:=TMaterial.Create;
 if f_SprTableName='GRMATERIALS' then SprRecord:=TGrMaterials.Create;
 if f_SprTableName='PERSONS' then SprRecord:=TCMKUser.Create;

 if f_SprTableName='MATERIALS' then (SprRecord as TMaterial).CPARENT:=f_BeforePostValue1;
 if f_SprTableName='MATERIALS' then (SprRecord as TMaterial).CGRMATERIALS:=f_BeforePostValue2;

 if f_SprTableName='GRMATERIALS' then (SprRecord as TGrMaterials).CPARENT:=f_BeforePostValue1;

 if
   ((f_SprTableName='STEELMARKS') and (SprRecord as TSteelMark).Edit(Self,True))
   or ((f_SprTableName='WIDTHS') and (SprRecord as TSpr1JvCalcEdit).Edit(Self,True,'Ширина','Значение'))
   or ((f_SprTableName='THICKS') and (SprRecord as TSpr1JvCalcEdit).Edit(Self,True,'Толщина','Значение'))
   or ((f_SprTableName='LENGTHS') and (SprRecord as TSpr1JvCalcEdit).Edit(Self,True,'Длина','Значение'))
   or ((f_SprTableName='CONTRACTORS') and (SprRecord as TContractor).Edit(Self,True))
   or ((f_SprTableName='NORMDOC') and (SprRecord as TNormdoc).Edit(Self,True))
   or ((f_SprTableName='PROFTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,True,'Вид профиля','Наименование'))
   or ((f_SprTableName='FIXTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,True,'Вид крепежа','Наименование'))
   or ((f_SprTableName='CARVTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,True,'Вид резьбы','Наименование'))
   or ((f_SprTableName='SITES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,True,'Отделение','Наименование'))
   or ((f_SprTableName='MKGROUPS') and (SprRecord as TSpr1LabeledEdit).Edit(Self,True,'Группа М/К','Наименование'))
   or ((f_SprTableName='ZACHTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,True,'Способ зачистки','Наименование'))
   or ((f_SprTableName='EQUIPMENT') and (SprRecord as TEquipment).Edit(Self,True))
   or ((f_SprTableName='MATERIALS') and (SprRecord as TMaterial).Edit(Self,True))
   or ((f_SprTableName='GRMATERIALS') and (SprRecord as TGrMaterials).Edit(Self,True))
   or ((f_SprTableName='PERSONS') and (SprRecord as TCMKUser).Edit(Self,True))
  then
  Begin
   ADOQ.DisableControls;
   if f_SprTableName='STEELMARKS' then UnicalFieldValue:=(SprRecord as TSteelMark).GetUnicalFieldValue;
   if f_SprTableName='WIDTHS' then UnicalFieldValue:=FloatToStr((SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue);
   if f_SprTableName='THICKS' then UnicalFieldValue:=FloatToStr((SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue);
   if f_SprTableName='LENGTHS' then UnicalFieldValue:=FloatToStr((SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue);
   if f_SprTableName='CONTRACTORS' then UnicalFieldValue:=(SprRecord as TContractor).GetUnicalFieldValue;
   if f_SprTableName='NORMDOC' then UnicalFieldValue:=(SprRecord as TNormdoc).GetUnicalFieldValue;
   if (f_SprTableName='FIXTYPES') or (f_SprTableName='CARVTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES') then UnicalFieldValue:=(SprRecord as TSpr1LabeledEdit).GetUnicalFieldValue;
   if f_SprTableName='EQUIPMENT' then UnicalFieldValue:=(SprRecord as TEquipment).GetUnicalFieldValue;
   if f_SprTableName='EQUIPMENT' then UnicalFieldValues:=(SprRecord as TEquipment).GetUnicalFieldValues;
   if f_SprTableName='MATERIALS' then UnicalFieldValue:=(SprRecord as TMaterial).GetUnicalFieldValue;
   if f_SprTableName='GRMATERIALS' then UnicalFieldValue:=(SprRecord as TGrMaterials).GetUnicalFieldValue;
   if f_SprTableName='PERSONS' then UnicalFieldValue:=(SprRecord as TCMKUser).GetUnicalFieldValue;

   if ((Pos(comma,f_UnicalField)=0) and Not ADOQ.Locate(f_UnicalField,UnicalFieldValue,[loCaseInsensitive])) or
      ((Pos(comma,f_UnicalField)>0) and Not ADOQ.Locate(ReplChars(f_UnicalField,comma,dotcomma),UnicalFieldValues,[loCaseInsensitive]))
    then
   Begin
    ADOQ.Append;
    sok:=
        ((f_SprTableName='STEELMARKS') and (SprRecord as TSteelMark).Save(ADOQ))
     or ((f_SprTableName='WIDTHS') and (SprRecord as TSpr1JvCalcEdit).Save(ADOQ,'VALUE'))
     or ((f_SprTableName='THICKS') and (SprRecord as TSpr1JvCalcEdit).Save(ADOQ,'VALUE'))
     or ((f_SprTableName='LENGTHS') and (SprRecord as TSpr1JvCalcEdit).Save(ADOQ,'VALUE'))
     or ((f_SprTableName='CONTRACTORS') and (SprRecord as TContractor).Save(ADOQ))
     or ((f_SprTableName='NORMDOC') and (SprRecord as TNormdoc).Save(ADOQ))
     or (((f_SprTableName='FIXTYPES') or (f_SprTableName='CARVTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES')) and (SprRecord as TSpr1LabeledEdit).Save(ADOQ,'NAME'))
     or ((f_SprTableName='EQUIPMENT') and (SprRecord as TEquipment).Save(ADOQ))
     or ((f_SprTableName='MATERIALS') and (SprRecord as TMaterial).Save(Self,ADOQ))
     or ((f_SprTableName='GRMATERIALS') and (SprRecord as TGrMaterials).Save(Self,ADOQ))
     or ((f_SprTableName='PERSONS') and (SprRecord as TCMKUser).Save(ADOQ))
     ;
    if Not sok then ADOQ.Cancel;
    ADOQ.Requery;
//    ShowMessage('f_UnicalField='+f_UnicalField);
//    ShowMessage('UnicalFieldValue='+UnicalFieldValue);
//    ADOQ.Locate(f_UnicalField,UnicalFieldValue,[loCaseInsensitive]);
    if (Pos(comma,f_UnicalField)=0) then ADOQ.Locate(f_UnicalField,UnicalFieldValue,[loCaseInsensitive]);
    if (Pos(comma,f_UnicalField)>0) then ADOQ.Locate(ReplChars(f_UnicalField,comma,dotcomma),UnicalFieldValues,[loCaseInsensitive]);
   End else ShowMessage('Запись "'+UnicalFieldValue+'" уже присутствует в справочнике!');
   ADOQ.EnableControls;
  End;
 SprRecord.Free;
 End;
end;

procedure TUniversalSprForm.DeleteRecordActionExecute(Sender: TObject);
Var
 NotUsed:boolean;
 OldRecNo:int64;
 ADOQ2:TAdoQuery;
 UsedComment,RecName: string;
Procedure CheckLinks(LTable,LField:string);
Begin
 if NotUsed then
 Begin
 ADOQ2.SQL.Text:='select * from '+SchemaName+LTable+' where '+LField+'='+VarToStr(adoq['nrec']);
 ADOQ2.Open;
 if ADOQ2.RecordCount>0 then
 Begin NotUsed:=False; UsedComment:=LTable+'.NREC='+VarToStr(adoq2['nrec']); End;
 ADOQ2.Close;
 End;
End;
begin
 if DeleteRecordAction.Enabled then
 Begin
   UsedComment:=EmptyStr;
   NotUsed:=True;
   ADOQ2:=TAdoQuery.Create(nil);
   ADOQ2.Connection:=Host.ADOC;
   if f_SprTableName='STEELMARKS' then Begin CheckLinks('MATERIALS','PROP_STEELMARK'); CheckLinks('GRMATERIALS','PROP_STEELMARK'); CheckLinks('DETAILS','PROP_STEELMARK'); End;
   if f_SprTableName='WIDTHS' then Begin CheckLinks('MATERIALS','PROP_WIDTH'); CheckLinks('GRMATERIALS','PROP_WIDTH'); End;
   if f_SprTableName='THICKS' then Begin CheckLinks('MATERIALS','PROP_THICK'); CheckLinks('GRMATERIALS','PROP_THICK'); End;
   if f_SprTableName='LENGTHS' then Begin CheckLinks('MATERIALS','PROP_LENGTH'); CheckLinks('GRMATERIALS','PROP_LENGTH'); End;
   if f_SprTableName='CONTRACTORS' then Begin CheckLinks('KD','CCONTRACTOR'); CheckLinks('MARKS','CRECIPIENT'); CheckLinks('SPPLANS','CCONTRACTOR'); CheckLinks('SPPLANS','CRECIPIENT'); End;
   if f_SprTableName='MATERIALS' then Begin {CheckLinks('DETAILS','CMATERIAL');} {CheckLinks('ARRIVALS','CMATERIAL');} End;
   if f_SprTableName='GRMATERIALS' then Begin CheckLinks('DETAILS','CGRMATERIALS'); CheckLinks('SPARRIVALS','CGRMATERIALS'); End;
   if f_SprTableName='NORMDOC' then
    Begin
     CheckLinks('STEELMARKS','CNORMDOC');
     CheckLinks('MATERIALS','PROP_NORMDOC0'); CheckLinks('MATERIALS','PROP_NORMDOC1'); CheckLinks('MATERIALS','PROP_PROFILE');
     CheckLinks('GRMATERIALS','PROP_NORMDOC0'); CheckLinks('GRMATERIALS','PROP_NORMDOC1'); CheckLinks('GRMATERIALS','PROP_PROFILE');
     CheckLinks('DETAILS','PROP_NORMDOC0'); CheckLinks('DETAILS','PROP_NORMDOC1'); CheckLinks('DETAILS','PROP_PROFILE');
    End;
   if f_SprTableName='PROFTYPES' then Begin CheckLinks('MATERIALS','PROP_PROFTYPE'); CheckLinks('GRMATERIALS','PROP_PROFTYPE'); CheckLinks('DETAILS','PROP_PROFTYPE'); End;
   if f_SprTableName='FIXTYPES' then Begin CheckLinks('MATERIALS','PROP_FIXTYPE'); CheckLinks('GRMATERIALS','PROP_FIXTYPE'); CheckLinks('DETAILS','PROP_FIXTYPE'); End;
   if f_SprTableName='CARVTYPES' then Begin CheckLinks('MATERIALS','PROP_CARVTYPE'); CheckLinks('GRMATERIALS','PROP_CARVTYPE'); CheckLinks('DETAILS','PROP_CARVTYPE'); End;
   if f_SprTableName='SITES' then Begin CheckLinks('EQUIPMENT','CSITE'); End;
   if f_SprTableName='MKGROUPS' then Begin CheckLinks('MARKS','CMKGROUP'); End;
   if f_SprTableName='ZACHTYPES' then Begin CheckLinks('DETAILS','T_ZACHIST_CTYPE'); End;
   if f_SprTableName='EQUIPMENT' then
    Begin
     CheckLinks('MARKS','T_SVARKA_CEQ');
     CheckLinks('MARKS','T_ZACHIST_CEQ');
     CheckLinks('MARKS','T_DOVODKA_CEQ');
     CheckLinks('DETAILS','T_RAZMET_CEQ');
     CheckLinks('DETAILS','T_REZKA_CEQ');
     CheckLinks('DETAILS','T_OTVERST_CEQ');
     CheckLinks('DETAILS','T_STROZH_CEQ');
     CheckLinks('DETAILS','T_GIBKA_CEQ');
    End;
   ADOQ2.Free;
   If NotUsed then
    Begin
     RecName:=GetFirstWordInCommaText(f_UnicalField);
     If (MagsoftMessageDlg('Вы действительно хотите удалить '+Quoted(VarToStr(ADOQ[RecName]))+'?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
      Begin
       if f_SprTableName='EQUIPMENT' then Host.ADOC.Execute('delete from '+SchemaName+'OPEREQUIP'+' where CEQUIPMENT='+VarToStr(ADOQ['NREC']));
       if f_SprTableName='GRMATERIALS' then Host.ADOC.Execute('update '+SchemaName+'MATERIALS'+' set CGRMATERIALS=0 where CGRMATERIALS='+VarToStr(ADOQ['NREC']));
       if f_SprTableName='PERSONS' then
        if  (UpperCase(VarToStr(ADOQ['ORAUSER']))<>'ALIEN')
        and (UpperCase(VarToStr(ADOQ['ORAUSER']))<>'BOZIN')
        and (UpperCase(VarToStr(ADOQ['ORAUSER']))<>'CMKNEW')
        and (UpperCase(VarToStr(ADOQ['ORAUSER']))<>'DANATELA')
        and (UpperCase(VarToStr(ADOQ['ORAUSER']))<>'SYS')
        and (UpperCase(VarToStr(ADOQ['ORAUSER']))<>'SYSTEM')
        then Host.ADOC.Execute('DROP USER '+VarToStr(ADOQ['ORAUSER'])+' CASCADE');
       OldRecNo:=ADOQ.RecNo;
       ADOQ.Delete;
       Try
       ADOQ.RecNo:=OldRecNo;
       Except
       End;
      End;
    End else ShowMessage('В БД присутствуют ссылки на данную запись (например: '+UsedComment+')! Удаление невозможно!');
 End;
end;

procedure TUniversalSprForm.DSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TUniversalSprForm.EditRecordActionExecute(Sender: TObject);
Var
 SprRecord:TObject;
 UnicalFieldValue,wh:string;
 sok:boolean;
 cnt:int64;
 ADOQ2:TAdoQuery;
 UnicalFieldValues:variant;
begin
 if EditRecordAction.Enabled then
 Begin
 if f_SprTableName='STEELMARKS' then SprRecord:=TSteelMark.Create;
 if f_SprTableName='WIDTHS' then SprRecord:=TSpr1JvCalcEdit.Create;
 if f_SprTableName='THICKS' then SprRecord:=TSpr1JvCalcEdit.Create;
 if f_SprTableName='LENGTHS' then SprRecord:=TSpr1JvCalcEdit.Create;
 if f_SprTableName='CONTRACTORS' then SprRecord:=TContractor.Create;
 if f_SprTableName='NORMDOC' then SprRecord:=TNormdoc.Create;
 if (f_SprTableName='FIXTYPES') or (f_SprTableName='CARVTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES') then SprRecord:=TSpr1LabeledEdit.Create;
 if f_SprTableName='EQUIPMENT' then SprRecord:=TEquipment.Create;
 if f_SprTableName='MATERIALS' then SprRecord:=TMaterial.Create;
 if f_SprTableName='GRMATERIALS' then SprRecord:=TGrMaterials.Create;
 if f_SprTableName='PERSONS' then SprRecord:=TCMKUser.Create;

 if
     ((f_SprTableName='STEELMARKS') and (SprRecord as TSteelMark).Read(ADOQ))
  or ((f_SprTableName='WIDTHS') and (SprRecord as TSpr1JvCalcEdit).Read(ADOQ,f_UnicalField))
  or ((f_SprTableName='THICKS') and (SprRecord as TSpr1JvCalcEdit).Read(ADOQ,f_UnicalField))
  or ((f_SprTableName='LENGTHS') and (SprRecord as TSpr1JvCalcEdit).Read(ADOQ,f_UnicalField))
  or ((f_SprTableName='CONTRACTORS') and (SprRecord as TContractor).Read(ADOQ))
  or ((f_SprTableName='NORMDOC') and (SprRecord as TNormdoc).Read(ADOQ))
  or (((f_SprTableName='FIXTYPES') or (f_SprTableName='CARVTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES')) and (SprRecord as TSpr1LabeledEdit).Read(ADOQ,f_UnicalField))
  or ((f_SprTableName='EQUIPMENT') and (SprRecord as TEquipment).Read(ADOQ))
  or ((f_SprTableName='MATERIALS') and (SprRecord as TMaterial).Read(ADOQ))
  or ((f_SprTableName='GRMATERIALS') and (SprRecord as TGrMaterials).Read(ADOQ))
  or ((f_SprTableName='PERSONS') and (SprRecord as TCMKUser).Read(ADOQ))
 then
 Begin
 if
      ((f_SprTableName='STEELMARKS') and (SprRecord as TSteelMark).Edit(Self,False))
   or ((f_SprTableName='WIDTHS') and (SprRecord as TSpr1JvCalcEdit).Edit(Self,False,'Ширина','Значение'))
   or ((f_SprTableName='THICKS') and (SprRecord as TSpr1JvCalcEdit).Edit(Self,False,'Толщина','Значение'))
   or ((f_SprTableName='LENGTHS') and (SprRecord as TSpr1JvCalcEdit).Edit(Self,False,'Длина','Значение'))
   or ((f_SprTableName='CONTRACTORS') and (SprRecord as TContractor).Edit(Self,False))
   or ((f_SprTableName='NORMDOC') and (SprRecord as TNormdoc).Edit(Self,False))
   or ((f_SprTableName='FIXTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,False,'Вид крепежа','Наименование'))
   or ((f_SprTableName='CARVTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,False,'Вид резьбы','Наименование'))
   or ((f_SprTableName='PROFTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,False,'Вид профиля','Наименование'))
   or ((f_SprTableName='SITES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,False,'Отделение','Наименование'))
   or ((f_SprTableName='MKGROUPS') and (SprRecord as TSpr1LabeledEdit).Edit(Self,False,'Группа М/К','Наименование'))
   or ((f_SprTableName='ZACHTYPES') and (SprRecord as TSpr1LabeledEdit).Edit(Self,False,'Способ зачистки','Наименование'))
   or ((f_SprTableName='EQUIPMENT') and (SprRecord as TEquipment).Edit(Self,False))
   or ((f_SprTableName='MATERIALS') and (SprRecord as TMaterial).Edit(Self,False))
   or ((f_SprTableName='GRMATERIALS') and (SprRecord as TGrMaterials).Edit(Self,False))
   or ((f_SprTableName='PERSONS') and (SprRecord as TCMKUser).Edit(Self,False))
  then
  Begin
   if f_EditRights then
   Begin
   ADOQ.DisableControls;
   if f_SprTableName='STEELMARKS' then UnicalFieldValue:=(SprRecord as TSteelMark).GetUnicalFieldValue;
   if f_SprTableName='WIDTHS' then UnicalFieldValue:=FloatToStr((SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue);
   if f_SprTableName='THICKS' then UnicalFieldValue:=FloatToStr((SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue);
   if f_SprTableName='LENGTHS' then UnicalFieldValue:=FloatToStr((SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue);
   if f_SprTableName='CONTRACTORS' then UnicalFieldValue:=(SprRecord as TContractor).GetUnicalFieldValue;
   if f_SprTableName='NORMDOC' then UnicalFieldValue:=(SprRecord as TNormdoc).GetUnicalFieldValue;
   if (f_SprTableName='FIXTYPES') or (f_SprTableName='CARVTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES') then UnicalFieldValue:=(SprRecord as TSpr1LabeledEdit).GetUnicalFieldValue;
   if f_SprTableName='EQUIPMENT' then UnicalFieldValue:=(SprRecord as TEquipment).GetUnicalFieldValue;
   if f_SprTableName='EQUIPMENT' then UnicalFieldValues:=(SprRecord as TEquipment).GetUnicalFieldValues;
   if f_SprTableName='MATERIALS' then UnicalFieldValue:=(SprRecord as TMaterial).GetUnicalFieldValue;
   if f_SprTableName='GRMATERIALS' then UnicalFieldValue:=(SprRecord as TGrMaterials).GetUnicalFieldValue;
   if f_SprTableName='PERSONS' then UnicalFieldValue:=(SprRecord as TCMKUser).GetUnicalFieldValue;

   ADOQ2:=TAdoQuery.Create(nil);
   ADOQ2.Connection:=Host.ADOC;
   if Empty(f_SprFilterString) then wh:=Truu
                               else wh:=f_SprFilterString;
   if (f_SprTableName='WIDTHS') or (f_SprTableName='THICKS') or (f_SprTableName='LENGTHS') then
   adoq2.Parameters.CreateParameter('uni',ftFloat,pdInput,0,(SprRecord as TSpr1JvCalcEdit).GetUnicalFieldValue)
   else
   if (f_SprTableName='EQUIPMENT') then
    Begin
     adoq2.Parameters.CreateParameter('uni1',ftString,pdInput,0,(SprRecord as TEquipment).GetUnicalFieldValue1);
     adoq2.Parameters.CreateParameter('uni2',ftString,pdInput,0,(SprRecord as TEquipment).GetUnicalFieldValue2);
     adoq2.Parameters.CreateParameter('uni3',ftInteger,pdInput,0,(SprRecord as TEquipment).GetUnicalFieldValue3);
    End
     else adoq2.Parameters.CreateParameter('uni',ftString,pdInput,0,UnicalFieldValue);

   if (f_SprTableName='EQUIPMENT') then
   ADOQ2.SQL.Text:='select '+f_UnicalField+' from '+SchemaName+f_SprTableName+' where '+wh+' and '+'NAME like :uni1'+' and '+'CEHNUM like :uni2'+' and '+'INVNUM like :uni3'+' and nrec<>'+VarToStr(adoq['nrec'])
    else
   ADOQ2.SQL.Text:='select '+f_UnicalField+' from '+SchemaName+f_SprTableName+' where '+wh+' and '+f_UnicalField+' like :uni'+' and nrec<>'+VarToStr(adoq['nrec']);
   ADOQ2.Open;
//   ShowMessage(ADOQ2.SQL.Text);
   cnt:=ADOQ2.RecordCount;
//   ShowMessage(IntToStr(cnt));
   ADOQ2.Close;
   ADOQ2.Free;

   if cnt=0 then
   Begin
    ADOQ.Edit;
    sok:=
       ((f_SprTableName='STEELMARKS') and (SprRecord as TSteelMark).Save(ADOQ))
    or ((f_SprTableName='WIDTHS') and (SprRecord as TSpr1JvCalcEdit).Save(ADOQ,f_UnicalField))
    or ((f_SprTableName='THICKS') and (SprRecord as TSpr1JvCalcEdit).Save(ADOQ,f_UnicalField))
    or ((f_SprTableName='LENGTHS') and (SprRecord as TSpr1JvCalcEdit).Save(ADOQ,f_UnicalField))
    or ((f_SprTableName='CONTRACTORS') and (SprRecord as TContractor).Save(ADOQ))
    or ((f_SprTableName='NORMDOC') and (SprRecord as TNormdoc).Save(ADOQ))
    or (((f_SprTableName='FIXTYPES') or (f_SprTableName='CARVTYPES') or (f_SprTableName='PROFTYPES') or (f_SprTableName='SITES') or (f_SprTableName='MKGROUPS') or (f_SprTableName='ZACHTYPES')) and (SprRecord as TSpr1LabeledEdit).Save(ADOQ,'NAME'))
    or ((f_SprTableName='EQUIPMENT') and (SprRecord as TEquipment).Save(ADOQ))
    or ((f_SprTableName='MATERIALS') and (SprRecord as TMaterial).Save(Self,ADOQ))
    or ((f_SprTableName='GRMATERIALS') and (SprRecord as TGrMaterials).Save(Self,ADOQ))
    or ((f_SprTableName='PERSONS') and (SprRecord as TCMKUser).Save(ADOQ))
    ;
    if Not sok then ADOQ.Cancel;
   End else ShowMessage('Запись "'+UnicalFieldValue+'" уже присутствует в справочнике!');
   ADOQ.EnableControls;
   End else ShowMessage('У вас нет прав на редактирование этого справочника!');
  End;
 End;
 SprRecord.Free;
 End;
end;

procedure TUniversalSprForm.FormCreate(Sender: TObject);
begin
 ADOQ.Connection:=Host.ADOC;
end;

procedure TUniversalSprForm.FormDestroy(Sender: TObject);
begin
 ADOQ.Close;
end;

procedure TUniversalSprForm.FormShow(Sender: TObject);
begin
 Grid.SetFocus;
end;

Constructor TSpr.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSpr.Clear;
begin
  SprTableName:=EmptyStr;
  SprVisibleFieldNames:=EmptyStr;
  SprVisibleFieldTitles:=EmptyStr;
  SprVisibleFieldWidths:=EmptyStr;
  SprFilterString:=EmptyStr;
  SprOrderByString:=EmptyStr;
  SprDescription:=EmptyStr;
  UnicalField:='NAME';
  BeforePostField1:=EmptyStr;
  BeforePostValue1:=0;
  BeforePostField2:=EmptyStr;
  BeforePostValue2:=0;
  EditRights:=True;
end;

Function TSpr.Edit(OForm:TComponent):boolean;
Var
 Form: TUniversalSprForm;
begin
 Form:=TUniversalSprForm.Create(OForm);
 if ToForm(Form) then
  Begin
   Form.ShowModal;
   result:=FromForm(Form);
  End;
 Form.Free;
end;

Function TSpr.ToForm(Var Form:TUniversalSprForm):boolean;
Var
 i:integer;
 orderby:string;
 wh:string;
 column:TColumnEh;
 ColumnsList,ColumnsTitlesList,ColumnsWidthsList:TStringList;
Begin
 result:=False;
 Form.f_EditRights:=EditRights;
 Form.f_SprTableName:=UpperCase(SprTableName);
 Form.f_UnicalField:=UnicalField;
 Form.f_SprFilterString:=SprFilterString;
 Form.f_BeforePostField1:=BeforePostField1;
 Form.f_BeforePostValue1:=BeforePostValue1;
 Form.f_BeforePostField2:=BeforePostField2;
 Form.f_BeforePostValue2:=BeforePostValue2;
 if Not Empty(SprTableName) then
  Begin
   if Not Empty(SprDescription) then Form.Caption:=SprDescription;
   if Empty(SprFilterString) then wh:=Truu
                             else wh:=SprFilterString;
   if Empty(SprOrderByString) then orderby:=EmptyStr
                              else orderby:=' order by '+SprOrderByString;
   Form.ADOQ.SQL.Text:='select * from '+SchemaName+SprTableName+' where '+wh+orderby;
   Form.ADOQ.Open;

   if Not Empty(SprVisibleFieldNames) then
    Begin
      ColumnsList:=TStringList.Create;
      ColumnsList.CommaText:=SprVisibleFieldNames;
      ColumnsTitlesList:=TStringList.Create;
      ColumnsTitlesList.CommaText:=SprVisibleFieldTitles;
      ColumnsWidthsList:=TStringList.Create;
      ColumnsWidthsList.CommaText:=SprVisibleFieldWidths;

      for i:=0 to ColumnsList.Count-1 do
       Begin
        column:=Form.grid.columns.Add;
        column.AutoDropDown:=True;
        column.ToolTips:=True;
        column.DropDownSizing:=True;
        column.FieldName:=ColumnsList[i];
        column.Visible:=True;
        if UpperCase(ColumnsList[i])='ACTIVE' then column.Checkboxes:=True;

//        ShowMessage(ColumnsTitlesList[i]);
        if i<ColumnsTitlesList.Count then
         column.Title.Caption:=DeQuoted(ColumnsTitlesList[i]);
        column.Title.TitleButton:=True;
        column.Title.ToolTips:=True;
        column.ToolTips:=True;
        if i<ColumnsWidthsList.Count then
         Begin
          if ColumnsWidthsList[i]=zero then
           Begin
            column.AutoFitColWidth:=True;
           End
            else
           Begin
            column.AutoFitColWidth:=False;
            column.Width:=StrToIntM(ColumnsWidthsList[i]);
           End;
         End;
       End;
      ColumnsWidthsList.Free;
      ColumnsTitlesList.Free;
      ColumnsList.Free;

    End;


   Form.ActionsEnabling;
   result:=True;
  End
End;

Function TSpr.FromForm(Var Form:TUniversalSprForm):boolean;
Begin
 EditRights:=Form.f_EditRights;
 result:=True;
End;

Destructor TSpr.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TUniversalSprForm.ActionsEnabling;
Begin
 AppendRecordAction.Enabled:=f_EditRights and ADOQ.Active;
 EditRecordAction.Enabled:=ADOQ.Active and (ADOQ.RecNo>0);
 DeleteRecordAction.Enabled:=f_EditRights and ADOQ.Active and (ADOQ.RecNo>0);
End;

end.

