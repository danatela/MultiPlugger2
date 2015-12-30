unit SteelEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, GlobVars;

type
  TSteelMarksForm = class(TForm)
    ADOConnection: TADOConnection;
    SteelMarksTable: TADOTable;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    ListBox1: TListBox;
    AddButton: TButton;
    DelButon: TButton;
    ADODataSet: TADODataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure DelButonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ADOConnectionWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
  private
    { Private declarations }
  public
    constructor  CreateSteelMarksForm(aOwner: TComponent);
    { Public declarations }
  end;

var
  SteelMarksForm: TSteelMarksForm;
  flag : boolean;
  edit_1, edit_3, edit_4, memo_1 : string;
  checkbox_1 : boolean;

implementation

{$R *.dfm}

uses AddSteelMark;

procedure TSteelMarksForm.AddButtonClick(Sender: TObject);
begin
 SteelMarksForm.Visible := false;
 NewSteelMark.Visible := true;
end;

procedure TSteelMarksForm.ADOConnectionWillConnect(Connection: TADOConnection;
  var ConnectionString, UserID, Password: WideString;
  var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
var
  I: Integer;
begin
  for I := 0 to ADOConnection.DataSetCount - 1 do
    ADOConnection.DataSets[I].Connection := Host.ADOC;
  EventStatus := esCancel;
end;

constructor TSteelMarksForm.CreateSteelMarksForm(aOwner: TComponent);
begin
 inherited Create(aOwner);
 SteelMarksTable.TableName := 'CMKNEW.STEELMARKS';
end;

procedure TSteelMarksForm.DelButonClick(Sender: TObject);
var
 str : string;
 i : integer;
 buttonSelected : Integer;
begin
 i := 0;
 i := ListBox1.ItemIndex;
 str := ListBox1.Items.Strings[i];
 SteelMarksTable.First;
 while str<>SteelMarksTable.FieldByName('SHORTNAME').AsString do
   SteelMarksTable.Next;
 buttonSelected := MessageDlg('”далить марку стали '+ str ,mtCustom,
                              [mbYes,mbNo], 0);
 if buttonSelected = mrYes then
 begin
 SteelMarksTable.Delete;
 SteelMarksTable.Refresh;
 i:=0;
 ListBox1.Clear;
 Edit1.Clear;
 Edit3.Clear;
 Memo1.Clear;
 CheckBox1.Checked:=true;
 CheckBox1.Caption:='активен';
 SteelMarksTable.First;
 while not SteelMarksTable.EOF do
 begin
   ListBox1.Items.Add(SteelMarksTable['shortname']);
   SteelMarksTable.Next;
 end;
 str := ListBox1.Items.Strings[i];
 SteelMarksTable.First;
 while ((str<>SteelMarksTable.FieldByName('SHORTNAME').AsString) and (not SteelMarksTable.EOF)) do
   SteelMarksTable.Next;
  Edit1.Text := SteelMarksTable.FieldByName('NAME').AsString;
  Edit3.Text := FloatToStr(SteelMarksTable.FieldByName('UW').AsFloat);
  Memo1.Text := SteelMarksTable.FieldByName('PRIM').AsString;
 if SteelMarksTable.FieldByName('ACTIVE').AsInteger=1 then
 begin
  CheckBox1.Checked:= true;
  CheckBox1.Caption:='активен';
 end
 else
  begin
   CheckBox1.Checked:= false;
   CheckBox1.Caption:='в архиве';
  end;
 end;

end;


procedure TSteelMarksForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i : integer;
 buttonSelected : Integer;
begin
 if (edit_1<>Edit1.Text) or (edit_3<>Edit3.Text) or (edit_4<>Edit4.Text)or (memo_1<>Memo1.Text) or (checkbox_1<>checkbox1.Checked) then
  flag := true;
  if flag =true then
 begin
   buttonSelected := MessageDlg('ƒанные были изменены. «апомнить? ' ,mtCustom,
                       [mbYes,mbNo], 0);
  if buttonSelected = mrYes then
  begin
  i := ListBox1.ItemIndex;
  SteelMarksTable.Locate('SHORTNAME', ListBox1.Items.Strings[i],[]);
  SteelMarksTable.Edit;
  SteelMarksTable.FieldByName('NAME').AsString := Edit1.Text;
  SteelMarksTable.FieldByName('UW').AsFloat := StrToFloat(Edit3.Text);
  SteelMarksTable.FieldByName('PRIM').AsString := Memo1.Text;
  if CheckBox1.Checked=true then
   SteelMarksTable.FieldByName('ACTIVE').AsInteger := 1
  else
   SteelMarksTable.FieldByName('ACTIVE').AsInteger := 0;
  SteelMarksTable.Refresh;
  end;
  SteelMarksTable.Refresh;
  flag:=false;
 end;
 Action := caFree;
 SteelMarksForm := nil;
end;

procedure TSteelMarksForm.FormShow(Sender: TObject);
var
 i : integer;
 str : string;
begin
flag := false;
i :=0 ;
str := '';
SteelMarksTable.Open;
SteelMarksTable.First;
while not SteelMarksTable.EOF do
 begin
   ListBox1.Items.Add(SteelMarksTable['shortname']);
   SteelMarksTable.Next;
 end;
 ListBox1.ItemIndex :=0;
 str := ListBox1.Items.Strings[i];
 SteelMarksTable.First;
 while str<>SteelMarksTable.FieldByName('SHORTNAME').AsString do
   SteelMarksTable.Next;
  Edit1.Text := SteelMarksTable.FieldByName('NAME').AsString;
  Edit3.Text := FloatToStr(SteelMarksTable.FieldByName('UW').AsFloat);
  Memo1.Text := SteelMarksTable.FieldByName('PRIM').AsString;
 if SteelMarksTable.FieldByName('ACTIVE').AsInteger=1 then
 begin
  CheckBox1.Checked:= true;
  CheckBox1.Caption:='активен';
 end
 else
  begin
   CheckBox1.Checked:= false;
   CheckBox1.Caption:='в архиве';
  end;
edit_1 := Edit1.Text;
edit_3 := Edit3.Text;
edit_4 := Edit4.Text;
memo_1 := Memo1.Text;
checkbox_1 := checkbox1.Checked;
end;

procedure TSteelMarksForm.ListBox1Click(Sender: TObject);
var
 str : string;
 i : integer;
begin
 i:=0;
 i := ListBox1.ItemIndex;
 str := ListBox1.Items.Strings[i];
 SteelMarksTable.First;
 while str<>SteelMarksTable.FieldByName('SHORTNAME').AsString do
   SteelMarksTable.Next;
  Edit1.Text := SteelMarksTable.FieldByName('NAME').AsString;
  Edit3.Text := FloatToStr(SteelMarksTable.FieldByName('UW').AsFloat);
  Memo1.Text := SteelMarksTable.FieldByName('PRIM').AsString;
 if SteelMarksTable.FieldByName('ACTIVE').AsInteger=1 then
 begin
  CheckBox1.Checked:= true;
  CheckBox1.Caption:='активен';
 end
 else
  begin
   CheckBox1.Checked:= false;
   CheckBox1.Caption:='в архиве';
  end;
end;



end.
