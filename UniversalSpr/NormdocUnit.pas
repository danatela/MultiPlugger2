unit NormdocUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits;


type
  TNormdocForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_NAME: TLabeledEdit;
    f_ACTIVE: TCheckBox;
    f_PRIM: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TNormdoc = class
 NREC: int64;
 NAME: string[100];
 PRIM: string[255];
 ACTIVE: boolean;
 Procedure Clear;
 Function GetByNrec(vnrec:int64):boolean;
 Function GetByName(vname:string):boolean;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TNormDocForm;New:boolean):boolean;
 Function FromForm(Var Form:TNormDocForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetUnicalFieldValue:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  NormdocForm: TNormdocForm;

implementation

{$R *.dfm}

Function TNormdoc.GetUnicalFieldValue:string;
Begin
 result:=Name;
End;

Function TNormdoc.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'NORMDOC'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TNormdoc.GetByName(vname:string):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.Parameters.CreateParameter('name',ftString,pdInput,0,UpperCase(vname));
 adoq.SQL.Text:='select * from '+SchemaName+'NORMDOC'+' where NAME=:name';
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;


Constructor TNormdoc.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TNormdoc.Clear;
begin
 NREC:=0;
 NAME:=EmptyStr;
 PRIM:=EmptyStr;
 ACTIVE:=True;
end;

Function TNormdoc.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Dataset['NAME']:=NAME;
 Dataset['PRIM']:=PRIM;
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о ГОСТе! ('+e.Message+')');
      End;
 End;

End;

Function TNormdoc.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 NAME:=Dataset['NAME'];
 PRIM:=Dataset['PRIM'];
 ACTIVE:=(Dataset['ACTIVE']=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о ГОСТе! ('+e.Message+')');
   End;
 End;
End;

Function TNormdoc.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TNormDocForm;
begin
 Form:=TNormDocForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TNormdoc.ToForm(Var Form:TNormDocForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 if New then Form.Caption:='Новый ГОСТ'
        else Form.Caption:=NAME;
 Form.f_NAME.Text:=NAME;
 Form.f_PRIM.Text:=PRIM;
 Form.f_ACTIVE.Checked:=ACTIVE;
 result:=True;
End;

Function TNormdoc.FromForm(Var Form:TNormDocForm):boolean;
Begin
 nrec:=Form.f_nrec;
 NAME:=Form.f_NAME.Text;
 if NAME=EmptyStr then NAME:=space;
 PRIM:=Form.f_PRIM.Text;
 if PRIM=EmptyStr then PRIM:=space;
 ACTIVE:=Form.f_ACTIVE.Checked;
 result:=True;
End;

Destructor TNormdoc.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

