unit Spr1JvCalcEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits;


type
  TSpr1JvCalcEditForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_NAME: TJvCalcEdit;
    f_NAMELabel: TLabel;
    f_ACTIVE: TCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TSpr1JvCalcEdit = class
 NAME: double;
 ACTIVE: boolean;
 Procedure Clear;
 Function GetUnicalFieldValue:double;
 Function Save(Var Dataset:TAdoQuery;FieldName:string):boolean;
 Function Read(Var Dataset:TAdoQuery;FieldName:string):boolean;
 Function ToForm(Var Form:TSpr1JvCalcEditForm;New:boolean;Capt,Prompt:string):boolean;
 Function FromForm(Var Form:TSpr1JvCalcEditForm):boolean;
 Function Edit(OForm:TComponent;New:boolean;Capt,Prompt:string):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  Spr1JvCalcEditForm: TSpr1JvCalcEditForm;

implementation

{$R *.dfm}
Function TSpr1JvCalcEdit.GetUnicalFieldValue:double;
Begin
 result:=Name;
End;

Constructor TSpr1JvCalcEdit.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSpr1JvCalcEdit.Clear;
begin
 NAME:=0;
 ACTIVE:=True;
end;

Function TSpr1JvCalcEdit.Save(Var Dataset:TAdoQuery;FieldName:string):boolean;
Begin
 result:=True;
 Dataset[FieldName]:=NAME;
 Try
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Except
 End;

 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении позиции справочника! ('+e.Message+')');
      End;
 End;

End;

Function TSpr1JvCalcEdit.Read(Var Dataset:TAdoQuery;FieldName:string):boolean;
Begin
 result:=True;
 Clear;
 Try
 ACTIVE:=(Dataset['ACTIVE']=1);
 Except
 End;

 Try
 NAME:=Dataset[FieldName];
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке позиции справочника! ('+e.Message+')');
   End;
 End;
End;

Function TSpr1JvCalcEdit.Edit(OForm:TComponent;New:boolean;Capt,Prompt:string):boolean;
Var
 Form: TSpr1JvCalcEditForm;
begin
 Result := False;
 Form:=TSpr1JvCalcEditForm.Create(OForm);

 if ToForm(Form,New,Capt,Prompt) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSpr1JvCalcEdit.ToForm(Var Form:TSpr1JvCalcEditForm;New:boolean;Capt,Prompt:string):boolean;
Var
 i:integer;
Begin
 Form.Caption:=Capt;
 Form.f_NAMELabel.Caption:=Prompt+':';
 Form.f_NAME.Value:=NAME;
 Form.f_ACTIVE.Checked:=ACTIVE;
 result:=True;
End;

Function TSpr1JvCalcEdit.FromForm(Var Form:TSpr1JvCalcEditForm):boolean;
Begin
 NAME:=Form.f_NAME.Value;
 ACTIVE:=Form.f_ACTIVE.Checked;
 result:=True;
End;

Destructor TSpr1JvCalcEdit.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSpr1JvCalcEditForm.FormShow(Sender: TObject);
begin
 f_NAME.SetFocus;
end;

end.

