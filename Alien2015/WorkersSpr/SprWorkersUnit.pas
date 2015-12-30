unit SprWorkersUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ADODB, SprPersonUnit, SharedUnit,
  LoginUnit, GlobVarsUnit, JclFileUtils, EncryptorUnit, Vcl.ExtCtrls, Vcl.Themes;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadVars(Sender:TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure LoadConstVars;
Var
 Shell,Envir:variant;
Begin
 OraConString:='Provider=MSDAORA.1';
 MainDir:=IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'..'+PathDelim;
 INIFile:=MainDir+'MultiPlug2.ini';
 PicturesDir:=EmptyStr;
 FlagClose:=MainDir+'flagClose.txt';
 ReportsDir:=MainDir+IncludeTrailingPathDelimiter('Reports');
 TempDir:=IncludeTrailingPathDelimiter(PathGetTempPath);
End;

procedure TMainForm.LoadVars(Sender:TObject);
Var
 s:string;
Begin
 If Not IniReadString(INIFile,INIMainSection,'PicturesDir',s) then s:=EmptyStr;
 if Not Empty(s) then PicturesDir:=IncludeTrailingPathDelimiter(s);

 If Not IniReadString(INIFile,INIMainSection,'FlagClose',s) then s:=EmptyStr;
 if Not Empty(s) then FlagClose:=s;

 Timer1.Enabled:=True;

 If ParamCount>0 then
  Begin
   if Not Empty(ParamStr(1)) then
    Begin
     orcl:=ParamStr(1);
     SetRegKey('orcl',orcl);
    End;
  End
   else
  Begin
 If Not ReadRegKey('orcl',orcl) then
  Begin
   orcl:='server1571';
   SetRegKey('orcl',orcl);
  End;
  End;

 LastUserLogin:=EmptyStr;
 If ReadRegKey('LastUserLogin',s) then LastUserLogin:=Trim(s);

 if Empty(LastUserLogin) then LastUserLogin:=GetCurrentOsUserName;

 OraConString:=OraConString+';Data Source='+orcl;
End;


procedure TMainForm.Timer1Timer(Sender: TObject);
begin
 if Not Empty(FlagClose) and FileExists(FlagClose) then
  Begin
   Timer1.Enabled:=False;
   Self.OnCloseQuery:=nil;
   Try
    Application.Terminate;
   Except
   End;
  End;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 SprPerson:TSprPerson;
 estr:TEncryptStr;
 sm:TStyleManager;
begin
 sm := TStyleManager.Create;
 if Not ReadRegKey('ActiveStyle',ActiveStyle) then ActiveStyle:=DefaultStyle;
 if Not sm.TrySetStyle(ActiveStyle, false) then
  Begin
   ActiveStyle:=DefaultStyle;
   sm.TrySetStyle(ActiveStyle, false);
  End;
 if Not Empty(sm.ActiveStyle.Name) then SetRegKey('ActiveStyle',sm.ActiveStyle.Name);
 sm.Free;


 LoggedIn:=False;
 Winapi.Windows.SetEnvironmentVariable(PChar('NLS_LANG'), PChar('RUSSIAN_CIS.CL8MSWIN1251'));
 Randomize;
 System.SysUtils.FormatSettings.DecimalSeparator:=dot;
 System.SysUtils.FormatSettings.CurrencyDecimals:=2;
 System.SysUtils.FormatSettings.ThousandSeparator:=space;
 System.SysUtils.FormatSettings.CurrencyString:=EmptyStr;
 System.SysUtils.FormatSettings.ShortDateFormat:='dd.MM.yyyy';
 System.SysUtils.FormatSettings.LongTimeFormat:='hh:mm:ss';
 Application.UpdateFormatSettings:=False;

 LoadConstVars;
 LoadVars(Sender);

 Timer1Timer(Sender);

 CurrentUser.Init;

 If ParamCount>=3 then
  Begin
   estr:=TEncryptStr.Create;
   LoggedIn:=CurrentUser.InitFromLP(ParamStr(2),estr.DecryptStr(ParamStr(3)));
   estr.Free;
  End
                  else LoggedIn:=CurrentUser.InitFromForm(Sender);
 If Not LoggedIn then Application.Terminate
                 else
                  Begin
                   SetRegKey('LastUserLogin',CurrentUser.login);
                   OraConString:=OraConString+';Password='+CurrentUser.psw+';User ID='+CurrentUser.login;
                  End;
 GlobADOC:=TAdoConnection.Create(Self);
 GlobADOC.LoginPrompt:=False;
 GlobADOC.ConnectionString:=OraConString;
 GlobADOC.CursorLocation:=clUseServer;
 Try
  GlobADOC.Open;
  LoggedIn:=True;
 Except
  ShowMessage('Ошибка подключения к базе данных!');
  Application.Terminate;
 End;

 SprPerson:=TSprPerson.Create;
 SprPerson.Edit(Self,(CurrentUser.cusergroup<>1) and (CurrentUser.cusergroup<>8));
 SprPerson.Free;


end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 CurrentUser.Kill;
 GlobADOC.Close;
 GlobADOC.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 Close();
end;

end.
