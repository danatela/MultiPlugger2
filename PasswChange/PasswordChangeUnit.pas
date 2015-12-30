unit PasswordChangeUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits;


type
  TPasswordChangeForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_PASSWORD1: TLabeledEdit;
    f_PASSWORD2: TLabeledEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TPasswordChange = class
 PASSWORD1: string;
 PASSWORD2: string;
 Procedure Clear;
 Function ToForm(Var Form:TPasswordChangeForm):boolean;
 Function FromForm(Var Form:TPasswordChangeForm):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  PasswordChangeForm: TPasswordChangeForm;

implementation

{$R *.dfm}

Constructor TPasswordChange.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TPasswordChange.Clear;
begin
 PASSWORD1:=EmptyStr;
 PASSWORD2:=EmptyStr;
end;

Function TPasswordChange.Edit(OForm:TComponent):boolean;
Var
 Form: TPasswordChangeForm;
begin
 Form:=TPasswordChangeForm.Create(OForm);

 if ToForm(Form) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TPasswordChange.ToForm(Var Form:TPasswordChangeForm):boolean;
Var
 i:integer;
Begin
 Form.Caption:='Новый пароль';
 Form.f_PASSWORD1.Text:=PASSWORD1;
 Form.f_PASSWORD2.Text:=PASSWORD2;
 result:=True;
End;

Function TPasswordChange.FromForm(Var Form:TPasswordChangeForm):boolean;
Begin
 PASSWORD1:=Trim(Form.f_PASSWORD1.Text);
 PASSWORD2:=Trim(Form.f_PASSWORD2.Text);
 result:=True;
End;

Destructor TPasswordChange.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TPasswordChangeForm.FormShow(Sender: TObject);
begin
 f_PASSWORD1.SetFocus;
end;

end.

