unit LoginUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TLoginForm = class(TForm)
    LoginEdit: TLabeledEdit;
    PasswordEdit: TLabeledEdit;
    OkButton: TButton;
    CancelButton: TButton;
    SaveCredentialsCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure LoginEditKeyPress(Sender: TObject; var Key: Char);
    procedure PasswordEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginForm: TLoginForm;

implementation

{$R *.dfm}

procedure TLoginForm.FormCreate(Sender: TObject);
begin
  Top := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;
end;

procedure TLoginForm.FormShow(Sender: TObject);
begin
  if LoginEdit.Text <> '' then
    PasswordEdit.SetFocus;
end;

procedure TLoginForm.LoginEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: PasswordEdit.SetFocus;
  end;
end;

procedure TLoginForm.PasswordEditKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: ModalResult := mrOk;
  end;
end;

end.
