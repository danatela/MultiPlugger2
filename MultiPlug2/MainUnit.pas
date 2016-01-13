unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Menus, DbLogDlg, Generics.Collections,
  IniFiles, Types, StrUtils, UPlugin, UClassManager, UPluginLauncher, ULaunchManager, Vcl.Grids, JvComponentBase,
  JvThreadTimer, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc, CMKUserUnit, GlobVars,
  Datasnap.DBClient, RTTI, MemTableDataEh, MemTableEh;

type
 TClientDataSetHelper = class helper for TClientDataSet
    function FieldsEquals(FieldName: string; DataSet: TDataSet): Boolean;
    procedure LazyInitDataSet(DataSetFile: string = '');
  end;

  TMainForm = class(TForm, IPluginHost)
    MainMenu: TMainMenu;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Repeat1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    PasteSpecial1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    GoTo1: TMenuItem;
    Links1: TMenuItem;
    Object1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Window1: TMenuItem;
    Tile1: TMenuItem;
    Cascade1: TMenuItem;
    ArrangeAll1: TMenuItem;
    Hide1: TMenuItem;
    Show1: TMenuItem;
    N6: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    About1: TMenuItem;
    DataBase: TMenuItem;
    Connect: TMenuItem;
    CloseConnection: TMenuItem;
    Exit2: TMenuItem;
    N8: TMenuItem;
    ADOMainConnection: TADOConnection;
    N1: TMenuItem;
    ScanPlugins: TMenuItem;
    DetachPlugins: TMenuItem;
    N2: TMenuItem;
    Next1: TMenuItem;
    JrnQuery: TADOQuery;
    DocumentsMenuItem: TMenuItem;
    MaterialsMenuItem: TMenuItem;
    GrMaterialsMenuItem: TMenuItem;
    PlansMenuItem: TMenuItem;
    CatalogsMenuItem: TMenuItem;
    ManagingMenuItem: TMenuItem;
    ReportsMenuItem: TMenuItem;
    CloseTimer: TJvThreadTimer;
    PluginsCDS: TClientDataSet;
    PluginsCDSClassName: TStringField;
    PluginsCDSName: TStringField;
    PluginsCDSGroup: TStringField;
    PluginsCDSAutoLoad: TBooleanField;
    PluginsCDSHidden: TBooleanField;
    GroupsPluginsCDS: TClientDataSet;
    GroupsPluginsCDSID: TAutoIncField;
    PluginsCDSID: TAutoIncField;
    GroupsPluginsCDSPlugin_ID: TIntegerField;
    GroupsPluginsCDSCUSERGROUPS: TFloatField;
    GroupsPluginsCDSName: TStringField;
    GroupsPluginsCDSGroup: TStringField;
    GroupsPluginsCDSAutoLoad: TBooleanField;
    GroupsPluginsCDSHidden: TBooleanField;
    N7: TMenuItem;
    ConsoleMenuItem: TMenuItem;
    PluginsCDSPos: TIntegerField;
    GroupsPluginsCDSPos: TIntegerField;
    PluginsCDSGranted: TBooleanField;
    GroupsPluginsCDSGranted: TBooleanField;
    UserGroupsADOQuery: TADOQuery;
    UserGroupsADOQueryNREC: TFloatField;
    UserGroupsADOQueryNAME: TStringField;
    UserGroupsADOQueryACTIVE: TFMTBCDField;
    GroupsPluginsCDSUSERGROUPS_NAME: TStringField;
    PluginsDataSource: TDataSource;
    GroupsPluginsCDSEditRights: TBooleanField;
    ScanLaunchers: TMenuItem;
    HotChangeTimer: TJvThreadTimer;
    procedure FormCreate(Sender: TObject);
    procedure Exit2Click(Sender: TObject);
    procedure ScanPluginsClick(Sender: TObject);
    procedure CloseConnectionClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure Tile1Click(Sender: TObject);
    procedure Cascade1Click(Sender: TObject);
    procedure ArrangeAll1Click(Sender: TObject);
    procedure Hide1Click(Sender: TObject);
    procedure DetachPluginsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CloseTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CreateLaunchers;
    procedure UnRegisterPlugin(PluginClass: TClass); overload;
    function RunPlugin(PluginName: string): TPlugin; overload;
    function PicturesDir: string;
    function ADOC: TADOConnection;
    procedure ADOMainConnectionAfterConnect(Sender: TObject);
    procedure ADOMainConnectionBeforeDisconnect(Sender: TObject);
    procedure ADOMainConnectionAfterDisconnect(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ADOMainConnectionBeforeConnect(Sender: TObject);
    procedure GroupsPluginsCDSAfterInsert(DataSet: TDataSet);
    function GetPrivacyParams(Key: string): TValue;
    function GetGroups(Groups: string): TList<Int64>;
    procedure ScanLaunchersClick(Sender: TObject);
    procedure HotChangeTimerTimer(Sender: TObject);
  private
    Handles: TList<HModule>;
    MenuDict: TDictionary<string, TMenuItem>;
    FPicturesDir: string;
    Forms: TList<string>;
    DataSets: TList<TCustomADODataSet>;
    FCaption: string;
    FFlagClose: string;
    procedure UnRegisterPlugin(I: Integer); overload;
    procedure UnRegisterPluginByFileName(FileName: string); overload;
    function GetFlagClose: string;
    property FlagClose: string read GetFlagClose write FFlagClose;
    procedure RescanPluginsDir;
    procedure RefreshLaunchersList;
    function RunPlugin(Index: Integer): TPluginLauncher; overload;
    procedure PlugClick(Sender: TObject);
    procedure LoadSettings;
    procedure ReConnect(Sender: TObject);
    procedure ClearPlugins;
    procedure RunFlagCloser;
    procedure PutLauncherToMenu(Launcher: TPluginLauncher);
    procedure InitMenuDict;
    procedure InitFormsList;
    procedure SaveIniFile;
    procedure GetLocalIniFile(var IniFile: TIniFile);
    procedure GetGlobalIniFile(var GlobalIni: TIniFile);
    procedure ActivateDataSets;
    procedure RegisterLaunchers;
    procedure ClearDict;
    procedure CheckVisibleGroups;
    procedure RescanLaunchersDir;
    procedure ClearLaunchers;
    { Private declarations }
  public
    { Public declarations }
  end;
  TIniFileHelper = class helper for TIniFile
    function ReadEncryptedString(Sect, Key, Def: string; Encrypt: Boolean = True): string;
    procedure WriteEncryptedString(Sect, Key, Value: string);
    procedure DeDup(Sect, Key, Value: string);
    function CompareAndRead(IniFile: TIniFile; Sect, Key, Default: string): string;
  end;
  function AppPath: string;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses LoginUnit, OleAuto, SplashUnit, DanatelaSharedUnit, MagsoftSharedUnit,
     EncryptorUnit, ShellApi;

resourcestring
  PluginsXML = 'Plugins.xml';
  GrPluginsXML = 'GroupsPlugins.xml';

{Helpers}

function TIniFileHelper.ReadEncryptedString(Sect, Key, Def: string; Encrypt: Boolean = True): string;
var
  Decrypt: Boolean;
  Encryptor: TEncryptStr;
begin
  Decrypt := Self.ReadBool(Sect, 'Is' + Key + 'Encrypted', False);
  Result := Self.ReadString(Sect, Key, Def);
  if Decrypt and Self.ValueExists(Sect, Key) then begin
    Encryptor := TEncryptStr.Create;
    Result := Encryptor.DecryptStr(Result);
    Encryptor.Free;
  end;
  if Encrypt and not Decrypt then
    Self.WriteEncryptedString(Sect, Key, Result);
end;

procedure TIniFileHelper.WriteEncryptedString(Sect, Key, Value: string);
var
  Encryptor: TEncryptStr;
begin
  if Value = '' then
    Exit;
  Encryptor := TEncryptStr.Create;
  Self.WriteString(Sect, Key, Encryptor.EncryptStr(Value));
  Self.WriteBool(Sect, 'Is' + Key + 'Encrypted', True);
  Encryptor.Free;
end;

procedure TIniFileHelper.DeDup(Sect, Key, Value: string);
begin
  try
    if UpperCase(Value) = UpperCase(Self.ReadString(Sect, Key, '')) then
      Self.DeleteKey(Sect, Key);
  except

  end;
end;

function TIniFileHelper.CompareAndRead(IniFile: TIniFile; Sect, Key, Default: string): string;
begin
  Result := Default;
  if UpperCase(Self.FileName) <> UpperCase(IniFile.FileName) then
  begin
    Result := Self.ReadString(Sect, Key, Result);
    IniFile.DeDup(Sect, Key, Result);
    // fix for symbolic and hard links
    if not Self.ValueExists(Sect, Key) and (Result <> '') then
      Self.WriteString(Sect, Key, Result);
  end;
  Result := IniFile.ReadString(Sect, Key, Result);
end;

function AppPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

{MainForm}

function TMainForm.GetFlagClose: string;
begin
  if FFlagClose = '' then
    FFlagClose := AppPath + 'flagClose.txt';
  Result := FFlagClose;
end;

procedure TMainForm.RegisterLaunchers;
var
  I: Integer;
begin
  ActivateDataSets;
  for I := 0 to LaunchManager.Count - 1 do
    PutLauncherToMenu(LaunchManager[I]);
  if CurrentUser.CUSERGROUPS = 1 then begin
    PluginsCDS.SaveToFile('', dfXMLUTF8);
    GroupsPluginsCDS.SaveToFile('', dfXMLUTF8);
  end;
end;

procedure TMainForm.ClearDict;
var
  Pair: Generics.Collections.TPair<string, TMenuItem>;
begin
  for Pair in MenuDict do
    Pair.Value.Clear;
end;

procedure TMainForm.CheckVisibleGroups;
var
  Pair: Generics.Collections.TPair<string, TMenuItem>;
begin
  for Pair in MenuDict do
    Pair.Value.Visible := Pair.Value.Count > 0;
end;

function GetFiles(Mask: string): TStrings;
var
  Rec : TSearchRec;
begin
  Result := TStringList.Create;
  if FindFirst(Mask, faAnyFile, Rec) = 0 then
  begin
    repeat
      // Exclude directories from the list of files.
      if ((Rec.Attr and faDirectory) <> faDirectory) then
        Result.Add(Rec.Name);
    until FindNext(Rec) <> 0;
    FindClose(Rec);
  end;
end;

procedure TMainForm.RescanLaunchersDir;
var
  Files: TStrings;
  I: Integer;
begin
  ClearLaunchers;
  Files := GetFiles(AppPath + 'Launchers\*.launcher');
  if Files.Count > 0 then begin
    SplashForm := TSplashForm.Create(Self);
    with SplashForm do begin
      LoadingLabel.Caption := 'Загружаются лаунчеры...';
      ProgressBar.Max := Files.Count;
      Show;
      for I := 0 to Files.Count - 1 do begin
        try
          TPluginLauncher.Create(AppPath + 'Launchers\' + Files[I]);
          LoadingLabel.Caption := 'Загружен лаунчер: ' + Files[I];
        except
          on E: Exception do LoadingLabel.Caption := E.Message;
        end;
        ProgressBar.Position := ProgressBar.Position + 1;
        Update;
        Application.ProcessMessages;
      end;
       //Загружаем последующий
      Close;
      Free;
    end;
    SplashForm := nil;
  end;
  Files.Free;
end;

procedure TMainForm.ClearLaunchers;
var
  I: Integer;
begin
  for I := LaunchManager.Count - 1 downto 0 do
    LaunchManager[I].Free;
  LaunchManager.Clear;
end;

function TMainForm.GetGroups(Groups: string): TList<Int64>;
var
  GRNREC: Int64;
  s: string;
begin
  Result := TList<Int64>.Create;
  for s in SplitString(Groups, ',') do
    if TryStrToInt64(s, GRNREC) then
      if not VarIsNull(UserGroupsADOQuery.Lookup('NREC', GRNREC, 'NREC')) then
        Result.Add(GRNREC);
end;

procedure TMainForm.Cascade1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.CloseConnectionClick(Sender: TObject);
begin
  ADOMainConnection.Close;
end;

procedure TMainForm.CloseTimerTimer(Sender: TObject);
begin
  if FileExists(FlagClose) then begin
    RunFlagCloser;
    Application.Terminate;
  end;
end;

procedure TMainForm.ConnectClick(Sender: TObject);
begin
  if ADOMainConnection.Connected then
    ADOMainConnection.Close;
  while not ADOMainConnection.Connected do
    case LoginForm.ShowModal of
      mrOk: try
        ReConnect(Sender);
        RefreshLaunchersList;
      except
        on Ex: EOleException do MessageDlg(Ex.Message, mtError, [mbRetry], 0);
        on Ex: Exception do MessageDlg(Ex.Message, mtError, [mbRetry], 0);
      end;
      mrCancel: Exit;
    end;
end;

procedure TMainForm.DetachPluginsClick(Sender: TObject);
begin
  ClearPlugins;
  RefreshLaunchersList;
end;

procedure TMainForm.Exit2Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ADOMainConnectionAfterConnect(Sender: TObject);
var
  DataSet: TCustomADODataSet;
  DBParams: TDictionary<string, string>;
begin
  try
    CurrentUser:=TCmkUser.Create;
    DBParams := BuildDbParams(ADOMainConnection.ConnectionString);
    CurrentUser.GetByLogin(DBParams['User ID']);
    DBParams.Free;
    Caption := FCaption + ' {Пользователь: ' + Trim(CurrentUser.LNAME + space +
    CurrentUser.FNAME + space + CurrentUser.MNAME) + ', Группа: ' +
    CurrentUser.USERGROUPS_S + '}';
  except
    on E:Exception do Begin
      ShowMessage(E.Message);
    End;
  end;

  if Assigned(DataSets) then begin
    for DataSet in DataSets do try
      DataSet.Open;
    except

    end;
    DataSets.Free;
    DataSets := nil;
  end;
end;

procedure TMainForm.ADOMainConnectionAfterDisconnect(Sender: TObject);
begin
  CurrentUser.Free;
end;

procedure TMainForm.ADOMainConnectionBeforeConnect(Sender: TObject);
begin
  ADOMainConnection.LoginPrompt := False;
end;

procedure TMainForm.ADOMainConnectionBeforeDisconnect(Sender: TObject);
var
  Conn: TADOConnection absolute Sender;
  I: Integer;
begin
  DataSets := TList<TCustomADODataSet>.Create;
  for I := 0 to Conn.DataSetCount - 1 do
    if Conn.DataSets[I].Active then
      DataSets.Add(Conn.DataSets[I]);
end;

procedure TMainForm.ArrangeAll1Click(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.LoadSettings;
var
  GlobalIni: TIniFile;
  IniFile: TIniFile;
  DBParams: TDictionary<string, string>;
  Password: string;
begin
  try
    GetLocalIniFile(IniFile);
    GetGlobalIniFile(GlobalIni);
    DBParams := BuildDbParams(ADOMainConnection.ConnectionString);
    DBParams['Data Source'] := GlobalIni.CompareAndRead(IniFile, 'Main', 'DataBase', DBParams['Data Source']);
    DBParams['User ID'] := GlobalIni.CompareAndRead(IniFile, 'Main', 'Login', DBParams['User ID']);
    FlagClose := GlobalIni.CompareAndRead(IniFile, 'Main', 'FlagClose', FlagClose);
    FPicturesDir := GlobalIni.CompareAndRead(IniFile, 'Main', 'PicturesDir', AppPath + 'Pictures');
    Password := IniFile.ReadEncryptedString('Main', 'Password', '');
    ADOMainConnection.ConnectionString := BuildConnectionString(DBParams);
    LoginForm.LoginEdit.Text := DBParams['User ID'];
    if Password <> '' then
    try
      ADOMainConnection.Open(LoginForm.LoginEdit.Text, Password);
      ZeroMemory(Pointer(Password), Length(Password) * SizeOf(Char));
    except

    end;
  finally
    GlobalIni.Free;
    IniFile.Free;
    DbParams.Free;
  end;
end;

procedure TMainForm.ReConnect(Sender: TObject);
begin
  {$IFNDEF DEBUG}
  CloseTimerTimer(CloseTimer);
  CloseTimer.Enabled := True;
  {$ENDIF}
  ADOMainConnection.Close;
  ADOMainConnection.Open(LoginForm.LoginEdit.Text, LoginForm.PasswordEdit.Text);
  if not CurrentUser.ACTIVE then
    raise Exception.Create('Пользователь неактивен, вход в систему запрещается');
  with JrnQuery, Parameters do begin
    ParamValues['pOperType;pUserName;pChanges'] := VarArrayOf([3, UpperCase(LoginForm.LoginEdit.Text), 'Вход в систему']);
    ExecSQL;
  end;
  if LoginForm.SaveCredentialsCheckBox.Checked then
    SaveIniFile;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ADOMainConnection.Connected then with JrnQuery, Parameters do begin
    ParamValues['pOperType;pUserName;pChanges'] := VarArrayOf([4, UpperCase(LoginForm.LoginEdit.Text), 'Выход из системы']);
    ExecSQL;
  end;
  ADOMainConnection.BeforeDisconnect := nil;
  ADOMainConnection.AfterConnect := nil;
  ClearPlugins;
  Handles.Free;
  Forms.Free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FCaption := Caption;
  Host := Self;
  LoginForm := TLoginForm.Create(Self);
  LoadSettings;
  {$IFNDEF DEBUG}
  CloseTimer.Enabled := True;
  {$ENDIF}
  while not ADOMainConnection.Connected do
    case LoginForm.ShowModal of
      mrOk: try
        ReConnect(Sender);
      except
        on Ex: EOleException do MessageDlg(Ex.Message, mtError, [mbRetry], 0);
        on Ex: Exception do MessageDlg(Ex.Message, mtError, [mbRetry], 0);
      end;
      mrCancel: begin
        onClose := nil;
        Application.Terminate;
        Exit;
      end;
    end;
  InitMenuDict;
  InitFormsList;
  Handles := TList<HModule>.Create;
  SetEnvironmentVariable(PChar('PATH'),
  PChar(GetEnvironmentVariable('PATH') + ';' + AppPath + 'Plugins\'));
  ActivateDataSets;
  RescanPluginsDir;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ExitProcess(0);
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to LaunchManager.Count - 1 do
    if LaunchManager[I].AutoLoad and LaunchManager[I].Granted then
      LaunchManager[I].Exec;
end;

procedure TMainForm.Hide1Click(Sender: TObject);
begin
  ActiveMDIChild.Hide;
end;

procedure TMainForm.HotChangeTimerTimer(Sender: TObject);
var
  Files: TStrings;
begin
  // rm this after completion
  Files := GetFiles(AppPath + 'HotPlug\*.bpl');
  if Files.Count > 0 then begin

  end;
  Files.Free;
end;

procedure TMainForm.RefreshLaunchersList;
begin
  ClearDict;
  RegisterLaunchers;
  CheckVisibleGroups;
end;

procedure TMainForm.RescanPluginsDir;
var
  Files: TStrings;
  I: Integer;
begin
  ClearPlugins;
  Files := GetFiles(AppPath + 'Plugins\*.bpl');
  if Files.Count > 0 then begin
    SplashForm := TSplashForm.Create(Self);
    with SplashForm do begin
      LoadingLabel.Caption := 'Загружаются плагины...';
      ProgressBar.Max := Files.Count;
      Show;
      for I := 0 to Files.Count - 1 do begin
        try
          Handles.Add(LoadPackage(AppPath + 'Plugins\' + Files[I]));
          LoadingLabel.Caption := 'Загружен плагин: ' + Files[I];
        except
          on E: Exception do LoadingLabel.Caption := E.Message;
        end;
        ProgressBar.Position := ProgressBar.Position + 1;
        Update;
        Application.ProcessMessages;
      end;
       //Загружаем последующий
      Close;
      Free;
    end;
    SplashForm := nil;
  end;
  Files.Free;
  ScanLaunchersClick(nil);
end;

procedure TMainForm.ScanLaunchersClick(Sender: TObject);
begin
  CreateLaunchers; // создаём лаунчеры
  RescanLaunchersDir; // читаем список лаунчеров
  RefreshLaunchersList; // добавляем лаунчеры в меню
end;

procedure TMainForm.ScanPluginsClick(Sender: TObject);
begin
  RescanPluginsDir;
end;

procedure TMainForm.Tile1Click(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.PutLauncherToMenu(Launcher: TPluginLauncher);
var
  Item, GrItem: TMenuItem;
  I: Integer;
begin
  if Launcher.Granted and not Launcher.Hidden and (Launcher.Name <> '') then begin
    Item := TMenuItem.Create(MainMenu);  //Создаём новый пункт меню
    Item.Caption := Launcher.Name;
    Item.Tag := LaunchManager.IndexOf(Launcher);
    if not MenuDict.ContainsKey(Launcher.Group) then
    begin
      GrItem := TMenuItem.Create(MainMenu);
      GrItem.Caption := Launcher.Group;
      MainMenu.Items.Add(GrItem);
      MenuDict.Add(Launcher.Group, GrItem);
    end;
    Item.onClick := PlugClick;
    //Даём ссылку на обработчик
    for I := MenuDict[Launcher.Group].Count + 1 to Launcher.Pos - 1 do
    begin
      GrItem := TMenuItem.Create(MainMenu);
      GrItem.Caption := '-';
      MenuDict[Launcher.Group].Add(GrItem);
    end;
    if MenuDict[Launcher.Group].Count + 1 = Launcher.Pos then
      MenuDict[Launcher.Group].Add(Item)
    else
    //Добавляем пункт меню
    begin
      MenuDict[Launcher.Group].Delete(Launcher.Pos - 1);
      MenuDict[Launcher.Group].Insert(Launcher.Pos - 1, Item);
    end;
  end;
end;

procedure TMainForm.InitMenuDict;
begin
  MenuDict := TDictionary<string, TMenuItem>.Create;
  MenuDict.Add('Документы', DocumentsMenuItem);
  MenuDict.Add('Материалы', MaterialsMenuItem);
  MenuDict.Add('Группы материалов', GrMaterialsMenuItem);
  MenuDict.Add('Планы', PlansMenuItem);
  MenuDict.Add('Справочники', CatalogsMenuItem);
  MenuDict.Add('Отчёты', ReportsMenuItem);
  MenuDict.Add('Администрирование', ManagingMenuItem);
end;

procedure TMainForm.InitFormsList;
begin
  Forms := TList<string>.Create;
  Forms.Add('MainForm');
  Forms.Add('LoginForm');
  Forms.Add('SplashForm');
end;

procedure TMainForm.SaveIniFile;
var
  IniFile: TIniFile;
begin
  GetLocalIniFile(IniFile);
  try
    IniFile.WriteString('Main', 'Login', LoginForm.LoginEdit.Text);
    IniFile.WriteEncryptedString('Main', 'Password', LoginForm.PasswordEdit.Text);
  finally
    IniFile.Free;
  end;
end;

procedure TMainForm.GetLocalIniFile(var IniFile: TIniFile);
begin
  IniFile := TIniFile.Create(ChangeFilePath(ChangeFileExt(Application.ExeName, '.INI'), GetCurrentDir));
end;

procedure TMainForm.GroupsPluginsCDSAfterInsert(DataSet: TDataSet);
begin
  // надеемся, что в PluginsCDS и UserGroupsADOQuery выбраны нужные записи...
  // пожалуйста, не вмешивайтесь в работу этих датасетов без серьёзного повода
  DataSet['PLUGIN_ID;NAME;GROUP;POS;AUTOLOAD;HIDDEN;GRANTED'] := PluginsCDS['ID;NAME;GROUP;POS;AUTOLOAD;HIDDEN;GRANTED'];
  DataSet['CUSERGROUPS'] := UserGroupsADOQuery['NREC'];
end;

procedure TMainForm.GetGlobalIniFile(var GlobalIni: TIniFile);
begin
  GlobalIni := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
end;

procedure TMainForm.ActivateDataSets;
begin
  PluginsCDS.LazyInitDataSet;
  GroupsPluginsCDS.LazyInitDataSet;
  UserGroupsADOQuery.Open;
end;

procedure TMainForm.CreateLaunchers;
var
  I: Integer;
  procedure LogToFile(FileName, Str: string);
  var
    F: TextFile;
  begin
    if not FileExists(FileName) then
      FileClose(FileCreate(FileName));
    AssignFile(F, FileName);
    Append(F);
    Writeln(F, Str);
    Flush(F);
    CloseFile(F);
  end;
begin
  for I := 0 to ClassManager.Count - 1 do begin
    LogToFile('log.txt', 'Регистрация плагина ' + ClassManager[I].ClassName);
    TPluginLauncher.CreateLauncher(TPluginClass(ClassManager[I]));
  end;
end;

procedure TMainForm.UnRegisterPlugin(I: Integer);
begin
  UnRegisterModuleClasses(Handles[I]);
  UnloadPackage(Handles[I]);
end;

procedure TMainForm.UnRegisterPluginByFileName(FileName: string);
begin

end;

procedure TMainForm.UnRegisterPlugin(PluginClass: TClass);
begin
  UnRegisterPlugin(ClassManager.IndexOf(PluginClass));
end;

procedure TMainForm.ClearPlugins;
var
  I: Integer;
begin
  if Screen <> nil then
    for I := Screen.FormCount - 1 downto 0 do
      if not Forms.Contains(Screen.Forms[I].Name) then begin
        Screen.Forms[I].Close;
        Screen.Forms[I].Free;
      end;
  ClearLaunchers;
  for I := ClassManager.Count - 1 downto 0 do try
    UnRegisterPlugin(I);
  except

  end;
  Handles.Clear;
end;

procedure TMainForm.RunFlagCloser;
var
  Exe: string;
begin
  Exe := AppPath + 'FlagCloser.exe';
  UniqueString(Exe);
  ShellExecute(Application.Handle, nil, PChar(Exe), nil, nil, 0);
end;

procedure TMainForm.PlugClick(Sender: TObject);
var
  MenuItem: TMenuItem absolute Sender;
  Launcher: TPluginLauncher;
  procedure LaunchPlug;
  begin
    with JrnQuery, Parameters do begin
      ParamValues['pOperType;pUserName;pChanges'] := VarArrayOf([5, UpperCase(LoginForm.LoginEdit.Text), 'Запуск плагина "' + Launcher.Name + '"']);
      ExecSQL;
    end;
    Launcher.Exec;
  end;
begin
  if Sender = nil then
    Exit;
  Launcher := RunPlugin(MenuItem.Tag);
  if Launcher <> nil then
    LaunchPlug;
end;

function TMainForm.RunPlugin(Index: Integer): TPluginLauncher;
  procedure LogToFile(FileName, Str: string);
  var
    F: TextFile;
  begin
    if not FileExists(FileName) then
      FileClose(FileCreate(FileName));
    AssignFile(F, FileName);
    Append(F);
    Writeln(F, Str);
    Flush(F);
    CloseFile(F);
  end;
begin
  Result := nil;
  // предотвращаем запуск запрещённых плагинов
  if not LaunchManager[Index].Granted then
    Exit;
  Result := LaunchManager[Index];
  LogToFile('log.txt', 'Запуск плагина ' + LaunchManager[Index].Name);
end;

function TMainForm.RunPlugin(PluginName: string): TPlugin;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to LaunchManager.Count - 1 do
    if UpperCase(LaunchManager[I].GetClassName) = UpperCase(PluginName) then begin
      Result := RunPlugin(I).Plugin;
      System.Break;
    end;
end;

function TMainForm.PicturesDir: string;
begin
  Result := FPicturesDir;
end;

function TMainForm.ADOC: TADOConnection;
begin
  Result := ADOMainConnection;
end;

function TMainForm.GetPrivacyParams(Key: string): TValue;
var
  Ini: TIniFile;
  Encryptor: TEncryptStr;
  DBParams: TDictionary<string, string>;
begin
  if Key = 'slKjh3w923O34l1=\sdfpo483##*%DF$' then begin
    DBParams := BuildDbParams(ADOMainConnection.ConnectionString);
    Encryptor := TEncryptStr.Create;
    GetLocalIniFile(Ini);
    Result := LoginForm.PasswordEdit.Text;
    if Result.AsString = '' then
      Result := Ini.ReadEncryptedString('Main', 'Password', '');
    Result := DBParams['Data Source'] + ' ' + DBParams['User ID'] + ' ' + Encryptor.EncryptStr(Result.AsString);
    DBParams.Free;
    Ini.Free;
    Encryptor.Free;
  end;
end;

{ TClientDataSetHelper }

function TClientDataSetHelper.FieldsEquals(FieldName: string;
  DataSet: TDataSet): Boolean;
var
  I: Integer;
  Fields: TList;
begin
  Result := True;
  if Pos(';', FieldName) <> 0 then
  begin
    Fields := TList.Create;
    try
      GetFieldList(Fields, FieldName);
      for I := 0 to Fields.Count - 1 do begin
        Result := Result and (TField(Fields[I]).Value = DataSet[TField(Fields[I]).FieldName]);
        if not Result then Break;
      end;
    finally
      Fields.Free;
    end;
  end else
    Result := FieldByName(FieldName).Value = DataSet[FieldName];
end;


procedure TClientDataSetHelper.LazyInitDataSet(DataSetFile: string = '');
begin
  if Self.Active then
    Exit;
  Self.FileName := ChangeFilePath(Self.FileName, AppPath);
  if DataSetFile = '' then
    DataSetFile := Self.FileName;
  try
    if FileExists(DataSetFile) then
      Self.LoadFromFile(DataSetFile)
    else
      raise Exception.Create('Create DataSet');
  except
    Self.CreateDataSet;
  end;
  if Self.LogChanges then begin
    Self.MergeChangeLog;
    Self.LogChanges := False;
  end;
end;



end.
