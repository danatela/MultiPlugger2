unit LoginUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, GlobVarsUnit, SharedUnit, ADODB,
  DB;

type
  TUserRecord = object
   nrec:int64;
   login:string;
   psw:string;
   fio:string[182];
   cusergroup:int64;
   galnrec:string[16];
   Constructor Init;
   Function InitFromForm(Sender:TObject):boolean;
   Function InitFromLP(ALogin,APassword:string):boolean;
   Function GetUserDescription:string;
   Function GetUserFIO(socr:boolean=True):string;
   Destructor Kill;
  End;

  TLoginForm = class(TForm)
    GroupBox1: TGroupBox;
    login: TLabeledEdit;
    psw: TLabeledEdit;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CurrentUser:TUserRecord;
{  LoginForm: TLoginForm;}

implementation

{$R *.dfm}
//  TUserRecord - begin
Constructor TUserRecord.Init;
Begin
 nrec:=0;
 login:=EmptyStr;
 psw:=EmptyStr;
 fio:=EmptyStr;
 cusergroup:=0;
 galnrec:=EmptyStr;
End;

Function TUserRecord.GetUserFIO(socr:boolean=True):string;
Begin
 result:=fio;
End;

Function TUserRecord.GetUserDescription:string;
Var
 s:string;
Begin
 result:=Trim(fio);
 s:=Trim(GetTextValueOfPointerADOC(GlobADOC,IntToStr(cusergroup),SchemaName+dot+UserGroupTable,'nrec','name',False));
 if Not Empty(s) then
  Begin
   if Not Empty(result) then result:=result+comma+space;
   result:=result+'группа пользователей '+Quoted(s);
  End;
End;

Function TUserRecord.InitFromForm(Sender:TObject):boolean;
Var
 LoginForm: TLoginForm;
 ADOC:TADOConnection;
 GoodLogin:boolean;
 ADOQ:TAdoQuery;
 error:string;
Begin
 ADOQ:=TAdoQuery.Create(nil);
 GoodLogin:=False;
 LoginForm:=TLoginForm.Create(Sender as TComponent);
 LoginForm.login.Text:=LastUserLogin;
 result:=True;
 While Not GoodLogin and result do
 Begin
 result:=(LoginForm.ShowModal=mrOK);
 If result then
  Begin
     ADOC:=TADOConnection.Create(Sender as TComponent);
     ADOC.LoginPrompt:=False;
     ADOC.ConnectionString:=OraConString+';Password='+Trim(LoginForm.psw.Text)+';User ID='+Trim(LoginForm.login.Text);
     Try
     ADOC.Open;
     GoodLogin:=True;
     error:=EmptyStr;
     login:=Trim(LoginForm.login.Text);
     psw:=Trim(LoginForm.psw.Text);
     ADOQ.Connection:=ADOC;
     ADOQ.SQL.Text:='select * from '+SchemaName+dot+UsersTable+' where orauser='''+AddSlashes(AnsiUpperCase(login))+''''+andd+'active=1';
//     ToLog(ADOQ.SQL.Text,login);
     Try
     ADOQ.Open;
//     ShowMessage(IntToStr(ADOQ.RecordCount));
     if ADOQ.RecordCount=1 then
      Begin
       nrec:=ADOQ.FieldByName('nrec').AsLargeInt;
       fio:=Trim(Trim(ADOQ.FieldByName('lname').AsString)+space+Trim(ADOQ.FieldByName('fname').AsString)+space+Trim(ADOQ.FieldByName('mname').AsString));
       cusergroup:=ADOQ.FieldByName('cusergroups').AsLargeInt;
       galnrec:=Trim(ADOQ.FieldByName('galnrec').AsString);
      End else GoodLogin:=False;
     ADOQ.Close;
     Except
     GoodLogin:=False;
     End;
     Except on E:Exception do
      Begin
     GoodLogin:=False;
     error:=E.Message;
      End;

     End;
     If Not GoodLogin then
      Begin
       ShowMessage('Ошибка входа в программу! '+error);
      End;
     ADOC.Close;
     ADOC.Free;
  End;
 End;
 LoginForm.Free;
 ADOQ.Free;
End;

Function TUserRecord.InitFromLP(ALogin,APassword:string):boolean;
Var
 ADOC:TADOConnection;
 GoodLogin:boolean;
 ADOQ:TAdoQuery;
 error:string;
Begin
 ADOQ:=TAdoQuery.Create(nil);
 GoodLogin:=False;
 result:=True;

 ADOC:=TADOConnection.Create(nil);
 ADOC.LoginPrompt:=False;
 ADOC.ConnectionString:=OraConString+';Password='+Trim(APassword)+';User ID='+Trim(ALogin);
// ToLog('ADOC.ConnectionString='+ADOC.ConnectionString,'test');
 Try
  ADOC.Open;
  GoodLogin:=True;
  error:=EmptyStr;
  login:=Trim(ALogin);
  psw:=Trim(APassword);
  ADOQ.Connection:=ADOC;
  ADOQ.SQL.Text:='select * from '+SchemaName+dot+UsersTable+' where orauser='''+AddSlashes(AnsiUpperCase(login))+''''+andd+'active=1';
  Try
   ADOQ.Open;
   if ADOQ.RecordCount=1 then
    Begin
     nrec:=ADOQ.FieldByName('nrec').AsLargeInt;
     fio:=Trim(Trim(ADOQ.FieldByName('lname').AsString)+space+Trim(ADOQ.FieldByName('fname').AsString)+space+Trim(ADOQ.FieldByName('mname').AsString));
     cusergroup:=ADOQ.FieldByName('cusergroups').AsLargeInt;
     galnrec:=Trim(ADOQ.FieldByName('galnrec').AsString);
    End else GoodLogin:=False;
   ADOQ.Close;
  Except
   GoodLogin:=False;
  End;
 Except on E:Exception do
  Begin
   GoodLogin:=False;
   error:=E.Message;
  End;

 End;
 If Not GoodLogin then
  Begin
   ShowMessage('Ошибка входа в программу! '+error);
  End;
 ADOC.Close;
 ADOC.Free;
 ADOQ.Free;
End;


Destructor TUserRecord.Kill;
Begin
End;
//  TUserRecord - end

procedure TLoginForm.FormShow(Sender: TObject);
begin
 If Not Empty(Login.Text) then psw.SetFocus;
 If Not Empty(psw.Text) then BitBtn1.SetFocus;
end;

end.
