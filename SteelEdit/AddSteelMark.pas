unit AddSteelMark;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB;

type
  TNewSteelMark = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    AddSteel: TButton;
    procedure AddSteelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  //constructor  CreateNewSteelMark(aOwner: TComponent;Login, Password, DataSource: PChar);
  { Public declarations }
  end;

var
  NewSteelMark: TNewSteelMark;

implementation

{$R *.dfm}

uses SteelEditUnit;

{constructor TNewSteelMark.CreateNewSteelMark(aOwner: TComponent;
                                                 Login: PWideChar; Password: PWideChar; DataSource: PWideChar);
begin
 inherited Create(aOwner);
 ADOConnection.ConnectionString := 'Provider=MSDAORA.1;Data Source='+DataSource;
 ADOConnection.Open(Login, Password);
 SteelMarksForm.SteelMarksTable.TableName := 'CMKNEW.STEELMARKS';
end;
 }
procedure TNewSteelMark.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// SteelMarksForm.Visible := true;
 NewSteelMark.Visible := false;
end;

procedure TNewSteelMark.AddSteelClick(Sender: TObject);
var
 i : integer;
 str : string;
begin

 SteelMarksForm.SteelMarksTable.Open;
 SteelMarksForm.SteelMarksTable.Edit;
 if True then

 NewSteelMark.Visible := false;
end;

end.
