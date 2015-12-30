unit Spr1LabeledEditUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits;


type
  TSpr1LabeledEditForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_NAME: TLabeledEdit;
    f_ACTIVE: TCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TSpr1LabeledEdit = class
 NAME: string;
 ACTIVE: boolean;
 Procedure Clear;
 Function GetUnicalFieldValue:string;
 Function Save(Var Dataset:TAdoQuery;FieldName:string):boolean;
 Function Read(Var Dataset:TAdoQuery;FieldName:string):boolean;
 Function ToForm(Var Form:TSpr1LabeledEditForm;New:boolean;Capt,Prompt:string;ShowActive:boolean=True):boolean;
 Function FromForm(Var Form:TSpr1LabeledEditForm):boolean;
 Function Edit(OForm:TComponent;New:boolean;Capt,Prompt:string;ShowActive:boolean=True):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  Spr1LabeledEditForm: TSpr1LabeledEditForm;

implementation

{$R *.dfm}
Function TSpr1LabeledEdit.GetUnicalFieldValue:string;
Begin
 result:=Name;
End;

Constructor TSpr1LabeledEdit.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSpr1LabeledEdit.Clear;
begin
 NAME:=EmptyStr;
 ACTIVE:=True;
end;

Function TSpr1LabeledEdit.Save(Var Dataset:TAdoQuery;FieldName:string):boolean;
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

Function TSpr1LabeledEdit.Read(Var Dataset:TAdoQuery;FieldName:string):boolean;
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

Function TSpr1LabeledEdit.Edit(OForm:TComponent;New:boolean;Capt,Prompt:string;ShowActive:boolean=True):boolean;
Var
 Form: TSpr1LabeledEditForm;
begin
 Result := False;
 Form:=TSpr1LabeledEditForm.Create(OForm);

 if ToForm(Form,New,Capt,Prompt,ShowActive) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSpr1LabeledEdit.ToForm(Var Form:TSpr1LabeledEditForm;New:boolean;Capt,Prompt:string;ShowActive:boolean=True):boolean;
Var
 i:integer;
Begin
 Form.Caption:=Capt;
 Form.f_NAME.EditLabel.Caption:=Prompt+':';
 Form.f_NAME.Text:=NAME;
 Form.f_ACTIVE.Checked:=ACTIVE;
 Form.f_ACTIVE.Visible:=ShowActive;
 result:=True;
End;

Function TSpr1LabeledEdit.FromForm(Var Form:TSpr1LabeledEditForm):boolean;
Begin
 NAME:=Form.f_NAME.Text;
 if NAME=EmptyStr then NAME:=space;
 ACTIVE:=Form.f_ACTIVE.Checked;
 result:=True;
End;

Destructor TSpr1LabeledEdit.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSpr1LabeledEditForm.FormShow(Sender: TObject);
begin
 f_NAME.SetFocus;
end;

end.

