unit SteelMarkUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits,
  Spr1LabeledEditUnit;


type
  TSteelMarkForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_CNORMDOC: TComboBox;
    f_CNORMDOCLabel: TLabel;
    NORMDOCADOQ: TADOQuery;
    CNORMDOCComboUpdateBtn: TBitBtn;
    f_ACTIVE: TCheckBox;
    f_SHORTNAME: TLabeledEdit;
    f_UW: TJvCalcEdit;
    f_PROP_UWLabel: TLabel;
    f_PRIM: TLabeledEdit;
    CNORMDOCAppendBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CNORMDOCComboUpdateBtnClick(Sender: TObject);
    procedure CNORMDOCAppendBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TSteelMark = class
 NREC: int64;
 SHORTNAME: string[50];
 UW: double;
 CNORMDOC: int64;
 NORMDOC_S: string[255];
 PRIM: string[255];
 ACTIVE: boolean;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Function GetByName(vname:string):boolean;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TSteelMarkForm;New:boolean):boolean;
 Function FromForm(Var Form:TSteelMarkForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Procedure UpdateNORMDOC_S;
 Function GetUnicalFieldValue:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  SteelMarkForm: TSteelMarkForm;

implementation

{$R *.dfm}

Function TSteelMark.GetUnicalFieldValue:string;
Begin
 result:=ShortName;
End;

Function TSteelMark.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'STEELMARKS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TSteelMark.GetByName(vname:string):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.Parameters.CreateParameter('name',ftString,pdInput,0,UpperCase(vname));
 adoq.SQL.Text:='select * from '+SchemaName+'STEELMARKS'+' where SHORTNAME=:name';
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Procedure TSteelMark.UpdateNORMDOC_S;
Begin
 NORMDOC_S:=GetTextValueOfPointer(IntToStr(CNORMDOC),SchemaName+'NORMDOC','nrec','name',False);
 if NORMDOC_S=EmptyStr then NORMDOC_S:=space;
End;

procedure TSteelMarkForm.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
 orderby:=' order by name';
 NORMDOCADOQ.Connection:=Host.ADOC;
 wh:='active=1 and normtype=1';
 NORMDOCADOQ.SQL.Text:='select * from '+SchemaName+'NORMDOC'+' where '+wh+orderby;
 NORMDOCADOQ.Open;
end;

procedure TSteelMarkForm.FormDestroy(Sender: TObject);
begin
 NORMDOCADOQ.Close;
end;

procedure TSteelMarkForm.CNORMDOCAppendBtnClick(Sender: TObject);
Var
 Spr1LabeledEdit:TSpr1LabeledEdit;
begin
 Spr1LabeledEdit:=TSpr1LabeledEdit.Create;
 if Spr1LabeledEdit.Edit(Self,True,'Нормативный документ по материалу','Наименование') then
  Begin
  if Not NORMDOCADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
   Begin
    NORMDOCADOQ.Append;
    NORMDOCADOQ['freq']:=0;
    NORMDOCADOQ['normtype']:=1;
    NORMDOCADOQ['active']:=1;
    if Not Spr1LabeledEdit.Save(NORMDOCADOQ,'NAME') then NORMDOCADOQ.Cancel;
    NORMDOCADOQ.Requery;
    if NORMDOCADOQ.Locate('NAME',Spr1LabeledEdit.NAME,[loCaseInsensitive]) then
     LookupItemToForm(f_CNORMDOC,NORMDOCADOQ,NORMDOCADOQ['nrec'],'name',EmptyStr,EmptyStr,False);
   End;
  End;
 Spr1LabeledEdit.Free;
end;

procedure TSteelMarkForm.CNORMDOCComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CNORMDOC.ItemIndex,NORMDOCADOQ,SchemaName+'NORMDOC');
 NORMDOCADOQ.Requery;
 LookupItemToForm(f_CNORMDOC,NORMDOCADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

Constructor TSteelMark.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSteelMark.Clear;
begin
 NREC:=0;
 SHORTNAME:=EmptyStr;
 UW:=0;
 CNORMDOC:=0;
 NORMDOC_S:=EmptyStr;
 PRIM:=EmptyStr;
 ACTIVE:=True;
end;

Function TSteelMark.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 UpdateNORMDOC_S;
 Dataset['SHORTNAME']:=SHORTNAME;
 Dataset['UW']:=UW;
 Dataset['CNORMDOC']:=CNORMDOC;
// Dataset['NORMDOC_S']:=NORMDOC_S;
 Dataset['PRIM']:=PRIM;
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о марке стали! ('+e.Message+')');
      End;
 End;

End;

Function TSteelMark.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 SHORTNAME:=Dataset['SHORTNAME'];
 UW:=Dataset['UW'];
 CNORMDOC:=Dataset['CNORMDOC'];
// NORMDOC_S:=Dataset['NORMDOC_S'];
 PRIM:=Dataset['PRIM'];
 ACTIVE:=(Dataset['ACTIVE']=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о марке стали! ('+e.Message+')');
   End;
 End;
End;

Function TSteelMark.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TSteelMarkForm;
begin
 Result := False;
 Form:=TSteelMarkForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSteelMark.ToForm(Var Form:TSteelMarkForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 if New then Form.Caption:='Новая марка'
        else Form.Caption:=SHORTNAME;
 Form.f_SHORTNAME.Text:=SHORTNAME;
 Form.f_UW.Value:=UW;
 LookupItemToForm(Form.f_CNORMDOC,Form.NORMDOCADOQ,CNORMDOC,'name',EmptyStr,EmptyStr,False);
 Form.f_PRIM.Text:=PRIM;
 Form.f_ACTIVE.Checked:=ACTIVE;
 result:=True;
End;

Function TSteelMark.FromForm(Var Form:TSteelMarkForm):boolean;
Begin
 nrec:=Form.f_nrec;
 SHORTNAME:=Form.f_SHORTNAME.Text;
 if SHORTNAME=EmptyStr then SHORTNAME:=space;
 UW:=Form.f_UW.Value;
 CNORMDOC:=LookupItemFromForm2(Form.f_CNORMDOC.ItemIndex,Form.NORMDOCADOQ,SchemaName+'NORMDOC');
 PRIM:=Form.f_PRIM.Text;
 if PRIM=EmptyStr then PRIM:=space;
 ACTIVE:=Form.f_ACTIVE.Checked;
 result:=True;
End;

Destructor TSteelMark.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

