unit UserUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ExtCtrls, GlobVars;

type
  TUserForm = class(TForm)
    AddButton: TButton;
    CancelButton: TButton;
    UserName: TLabeledEdit;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ADOConnection: TADOConnection;
    UsersQuery: TADOQuery;
    GalUsers: TADOTable;
    GroupQuery: TADOQuery;
    ComboBox2: TComboBox;
    Label2: TLabel;
    ADOConnectionCMK: TADOConnection;
    CMKGroups: TADOTable;
    CMKPersons: TADOTable;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1DropDown(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ComboBox2DropDown(Sender: TObject);
    procedure ADOConnectionCMKWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserForm: TUserForm;

implementation

{$R *.dfm}

procedure TUserForm.AddButtonClick(Sender: TObject);
var
 user_login_cmk : string;
 user_login_gal : string;
 user_name_gal : string;
 user_group_cmk : string;
 index : integer;
 t:TStringList;
begin
index := 1;
user_name_gal := '';
user_login_cmk := UserForm.UserName.Text;
user_login_gal := UserForm.ComboBox1.Text;
user_group_cmk := UserForm.ComboBox2.Text;
if user_login_cmk='' then begin ShowMessage('Введите логин пользователя!'); exit; end;
if user_group_cmk='' then begin ShowMessage('Выберите группу пользователя!'); exit; end;
if user_login_gal='' then begin ShowMessage('Выберите пользователя Галактики!'); exit; end
else
 begin
  UserForm.CMKPersons.Open;
  //Проверка на совпадение ролей в ЦМК и Галактике
  if UserForm.CMKPersons.Locate('ORAUSER',user_login_gal,[]) then
   begin
    ShowMessage('Пользователь с логином ' +UserForm.CMKPersons.FieldByName('ORAUSER').AsString + ' уже сопоставлен данному галактическому логину');
    exit;
   end;
   //Проверка на совпадение имен в ЦМК
  if UserForm.CMKPersons.Locate('ORAUSER',user_login_cmk,[]) then
   begin
    ShowMessage('Пользователь с логином ' +UserForm.CMKPersons.FieldByName('ORAUSER').AsString + ' уже существует');
    exit;
   end;
  UserForm.GalUsers.Active := true;
  if UserForm.GalUsers.Locate('XU$LOGINNAME', user_login_gal,[]) then
   if UserForm.GalUsers['XU$TYPE']=0 then //если пользовательв Галактике неактивен
   begin
    ShowMessage('Пользователь неактивен. Выберите другого пользователя.');
    exit;
   end
   else  //если пользователь Галактики активен
   begin
    user_name_gal:=UserForm.GalUsers.FieldByName('XU$FULLNAME').AsString;
    //разбираем ФИО
    t:=TStringList.create; //создаём класс
    t.text:=stringReplace(user_name_gal,' ',#13#10,[rfReplaceAll]);
   //showmessage(t[0]); фамилия
   //showmessage(t[1]); имя
   //showmessage(t[2]); отчество
   UserForm.CMKGroups.Active := true;
   UserForm.CMKGroups.Locate('name',user_group_cmk,[]);
   index := UserForm.CMKPersons.RecordCount;
   Inc(index);
   UserForm.CMKPersons.AppendRecord([index,
                                    UserForm.CMKGroups.FieldByName('active').AsInteger,
                                    user_login_cmk,
                                    t[0],
                                    t[1],
                                    t[2],
                                    UserForm.CMKGroups['nrec'],
                                    UserForm.GalUsers.FieldByName('ATL_NREC').AsString
                                    ]);
    t.Free;
    UserForm.CMKGroups.Close;
    UserForm.GalUsers.Close;
    UserForm.CMKPersons.Close;
   end; //конец вложенного else
  ShowMessage('Пользователь добавлен в базу');
 end;//конец основного else
 Close;
 end;

procedure TUserForm.ADOConnectionCMKWillConnect(Connection: TADOConnection;
  var ConnectionString, UserID, Password: WideString;
  var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
var
  I: Integer;
begin
  for I := 0 to ADOConnectionCMK.DataSetCount - 1 do
    ADOConnectionCMK.DataSets[I].Connection := Host.ADOC;
  EventStatus := esCancel;
end;

procedure TUserForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TUserForm.ComboBox1DropDown(Sender: TObject);
begin
  UsersQuery.Open;
  ComboBox1.Items.Clear;
  while not UsersQuery.Eof do begin
    ComboBox1.Items.AddObject(UsersQuery['Login'], UsersQuery.FieldByName('nRec'));
    UsersQuery.Next;
  end;
  ComboBox1.OnDropDown := nil;

end;

procedure TUserForm.ComboBox2DropDown(Sender: TObject);
begin
   GroupQuery.Open;
  Combobox2.Items.Clear;
  while not GroupQuery.Eof do begin
   ComboBox2.Items.Add(GroupQuery['name']);
   GroupQuery.Next;
  end;
  ComboBox2.OnDropDown:=nil;
end;

procedure TUserForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  UserForm := nil;
end;

end.
