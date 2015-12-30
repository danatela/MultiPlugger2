unit CMKUserUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars;


type
  TCMKUserForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_ORAUSER: TLabeledEdit;
    f_CUSERGROUPS: TComboBox;
    Label1: TLabel;
    USERGROUPSADOQ: TADOQuery;
    f_LNAME: TLabeledEdit;
    f_FNAME: TLabeledEdit;
    f_MNAME: TLabeledEdit;
    CUSERGROUPSComboUpdateBtn: TBitBtn;
    f_ACTIVE: TCheckBox;
    f_passw: TLabeledEdit;
    f_PCHANGE: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CUSERGROUPSComboUpdateBtnClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TCmkUser = class
 NREC: int64;
 ORAUSER: string[20];
 LNAME: string[60];
 FNAME: string[60];
 MNAME: string[60];
 CUSERGROUPS: int64;
 USERGROUPS_S: string[200];
 PCHANGE: boolean;
 ACTIVE: boolean;
// GALNREC	CHAR(16)
 Procedure Clear;
 Function GetUserFIO(socr:boolean=True):string;
 Function GetByNrec(vnrec:int64):boolean;
 Function GetByLogin(Login: string):boolean;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TCmkUserForm;New:boolean):boolean;
 Function FromForm(Var Form:TCmkUserForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Procedure UpdateUSERGROUPS_S;
 Function GetUnicalFieldValue:string;
 Function SprEditRights:boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  CMKUserForm: TCMKUserForm;
  CurrentUser:TCmkUser;

implementation

{$R *.dfm}

uses
  UserPluginsUnit;

constructor TCmkUser.Create;
begin
  inherited Create;
  Clear;
end;

Function TCmkUser.SprEditRights:boolean;
Begin
 result:=(CUSERGROUPS=1) or (CUSERGROUPS=2) or (CUSERGROUPS=3);
End;

Function TCmkUser.GetUserFIO(socr:boolean=True):string;
Begin
 result:=LNAME+space;
 if Not Empty(FNAME) then
  Begin
   if socr then result:=result+FNAME[1]+dot
           else result:=result+FNAME+space;
  End;
 if Not Empty(MNAME) then
  Begin
   if socr then result:=result+MNAME[1]+dot
           else result:=result+MNAME;
  End;
 result:=Trim(result);
End;

Function TCmkUser.GetUnicalFieldValue:string;
Begin
 result:=ORAUSER;
End;

Function TCmkUser.GetByNrec(vnrec:int64):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from '+SchemaName+'PERSONS'+' where nrec='+IntToStr(vnrec);
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Function TCmkUser.GetByLogin(Login: string):boolean;
Var
 adoq:TAdoQuery;
Begin
 result:=False;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 //adoq.Parameters.CreateParameter('login',ftString,pdInput,0,UpperCase(vlogin));
 adoq.SQL.Text:='select * from '+SchemaName+'PERSONS'+' where Upper(orauser)=Upper(''' + Login + ''')';
 adoq.Open;
 if adoq.RecordCount=1 then result:=Read(adoq)
                       else Clear;
 adoq.Close;
 adoq.Free;
End;

Procedure TCmkUser.UpdateUSERGROUPS_S;
Begin
 USERGROUPS_S:=GetTextValueOfPointer(IntToStr(CUSERGROUPS),SchemaName+'USERGROUPS','nrec','name',False);
 if USERGROUPS_S=EmptyStr then USERGROUPS_S:=space;
End;

procedure TCMKUserForm.FormCreate(Sender: TObject);
Var
 orderby:string;
 wh:string;
begin
 orderby:=' order by name';
 USERGROUPSADOQ.Connection:=Host.ADOC;
 wh:='active=1';
 USERGROUPSADOQ.SQL.Text:='select * from '+SchemaName+'USERGROUPS'+' where '+wh+orderby;
 USERGROUPSADOQ.Open;
end;

procedure TCMKUserForm.FormDestroy(Sender: TObject);
begin
 USERGROUPSADOQ.Close;
end;

procedure TCMKUserForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_F10: begin
    UserPluginsForm := TUserPluginsForm.Create(Application);
    CMKUser := TCMKUser.Create;
    CMKUser.GetByLogin(f_ORAUSER.Text);
    UserPluginsForm.ShowModal;
    UserPluginsForm.Free;
    CMKUser.Free;
  end;
  end;
end;

procedure TCMKUserForm.CUSERGROUPSComboUpdateBtnClick(Sender: TObject);
Var
 tempValue:int64;
begin
 tempValue:=LookupItemFromForm2(f_CUSERGROUPS.ItemIndex,USERGROUPSADOQ,SchemaName+'USERGROUPS');
 USERGROUPSADOQ.Requery;
 LookupItemToForm(f_CUSERGROUPS,USERGROUPSADOQ,tempValue,'name',EmptyStr,EmptyStr,False);
end;

Procedure TCmkUser.Clear;
begin
 NREC:=0;
 ORAUSER:=EmptyStr;
 LNAME:=EmptyStr;
 FNAME:=EmptyStr;
 MNAME:=EmptyStr;
 CUSERGROUPS:=0;
 USERGROUPS_S:=EmptyStr;
 PCHANGE:=True;
 ACTIVE:=True;
end;

Function TCmkUser.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 UpdateUSERGROUPS_S;

 Dataset['ORAUSER']:=ORAUSER;
 Dataset['LNAME']:=LNAME;
 Dataset['FNAME']:=FNAME;
 Dataset['MNAME']:=MNAME;
 Dataset['CUSERGROUPS']:=CUSERGROUPS;
 Dataset['USERGROUPS_S']:=USERGROUPS_S;
 if PCHANGE then Dataset['PCHANGE']:=1
            else Dataset['PCHANGE']:=0;
 if ACTIVE then Dataset['ACTIVE']:=1
           else Dataset['ACTIVE']:=0;
 Try
     Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении информации о пользователе! ('+e.Message+')');
      End;
 End;

End;

Function TCmkUser.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
 Try
 nrec:=Dataset['NREC'];
 ORAUSER:=Dataset['ORAUSER'];
 LNAME:=Dataset['LNAME'];
 FNAME:=Dataset['FNAME'];
 MNAME:=Dataset['MNAME'];
 CUSERGROUPS:=Dataset['CUSERGROUPS'];
 USERGROUPS_S:=Dataset['USERGROUPS_S'];
 PCHANGE:=(Dataset['PCHANGE']=1);
 ACTIVE:=(Dataset['ACTIVE']=1);
 Except
  on E: Exception do
   Begin
    result:=False;
    ShowMessage('Ошибка при загрузке информации о пользователе! ('+e.Message+')');
   End;
 End;
End;

Function TCmkUser.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TCmkUserForm;
begin
 Form:=TCmkUserForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TCmkUser.ToForm(Var Form:TCmkUserForm;New:boolean):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;

 if New then Form.Caption:='Новый пользователь'
        else Form.Caption:=LNAME+space+FNAME+space+MNAME;

 Form.f_ORAUSER.Text:=ORAUSER;
 Form.f_LNAME.Text:=LNAME;
 Form.f_FNAME.Text:=FNAME;
 Form.f_MNAME.Text:=MNAME;
 LookupItemToForm(Form.f_CUSERGROUPS,Form.USERGROUPSADOQ,CUSERGROUPS,'name',EmptyStr,EmptyStr,False);
 Form.f_PCHANGE.Checked:=PCHANGE;
 Form.f_ACTIVE.Checked:=ACTIVE;
 result:=True;
End;

Function TCmkUser.FromForm(Var Form:TCmkUserForm):boolean;
Var
 adoq:TAdoQuery;
 fnd:boolean;
 passw:string;
Begin
 nrec:=Form.f_nrec;
 ORAUSER:=Form.f_ORAUSER.Text;
 LNAME:=Form.f_LNAME.Text;
 if LNAME='' then LNAME:=space;
 FNAME:=Form.f_FNAME.Text;
 if FNAME='' then FNAME:=space;
 MNAME:=Form.f_MNAME.Text;
 if MNAME='' then MNAME:=space;
 CUSERGROUPS:=LookupItemFromForm2(Form.f_CUSERGROUPS.ItemIndex,Form.USERGROUPSADOQ,SchemaName+'USERGROUPS');
 ACTIVE:=Form.f_ACTIVE.Checked;
 PCHANGE:=Form.f_PCHANGE.Checked;
 passw:=Trim(Form.f_passw.Text);


 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq.SQL.Text:='select * from dba_users';
 adoq.Open;
 fnd:=adoq.Locate('USERNAME',ORAUSER,[loCaseInsensitive]);
 if Not fnd then
  Begin
   Try
   if Empty(passw) then passw:='123';
   Host.ADOC.Execute('CREATE USER '+ORAUSER+' IDENTIFIED BY '+passw+' DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP PROFILE DEFAULT ACCOUNT UNLOCK');
   Host.ADOC.Execute('GRANT ADM_PARALLEL_EXECUTE_TASK TO '+ORAUSER);
   Host.ADOC.Execute('GRANT APEX_ADMINISTRATOR_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT AQ_ADMINISTRATOR_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT AQ_USER_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT AUTHENTICATEDUSER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT CONNECT TO '+ORAUSER);
   Host.ADOC.Execute('GRANT CSW_USR_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT CTXAPP TO '+ORAUSER);
   Host.ADOC.Execute('GRANT CWM_USER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT DATAPUMP_EXP_FULL_DATABASE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT DATAPUMP_IMP_FULL_DATABASE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT DBFS_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT DELETE_CATALOG_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT EJBCLIENT TO '+ORAUSER);
   Host.ADOC.Execute('GRANT EXECUTE_CATALOG_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT EXP_FULL_DATABASE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT GATHER_SYSTEM_STATISTICS TO '+ORAUSER);
   Host.ADOC.Execute('GRANT HS_ADMIN_EXECUTE_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT HS_ADMIN_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT HS_ADMIN_SELECT_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT IMP_FULL_DATABASE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JAVA_ADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JAVADEBUGPRIV TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JAVA_DEPLOY TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JAVAIDPRIV TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JAVASYSPRIV TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JAVAUSERPRIV TO '+ORAUSER);
   Host.ADOC.Execute('GRANT JMXSERVER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT LOGSTDBY_ADMINISTRATOR TO '+ORAUSER);
   Host.ADOC.Execute('GRANT MGMT_USER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OEM_ADVISOR TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OEM_MONITOR TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OLAP_DBA TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OLAPI_TRACE_USER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OLAP_USER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OLAP_XS_ADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT ORDADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OWB$CLIENT TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OWB_DESIGNCENTER_VIEW TO '+ORAUSER);
   Host.ADOC.Execute('GRANT OWB_USER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT RECOVERY_CATALOG_OWNER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT RESOURCE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT SCHEDULER_ADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT SELECT_CATALOG_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT SPATIAL_CSW_ADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT SPATIAL_WFS_ADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT WFS_USR_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT WM_ADMIN_ROLE TO '+ORAUSER);
   Host.ADOC.Execute('GRANT XDBADMIN TO '+ORAUSER);
   Host.ADOC.Execute('GRANT XDB_SET_INVOKER TO '+ORAUSER);
   Host.ADOC.Execute('GRANT XDB_WEBSERVICES TO '+ORAUSER);
   Host.ADOC.Execute('GRANT XDB_WEBSERVICES_OVER_HTTP TO '+ORAUSER);
   Host.ADOC.Execute('GRANT XDB_WEBSERVICES_WITH_PUBLIC TO '+ORAUSER);
   Host.ADOC.Execute('ALTER USER '+ORAUSER+' DEFAULT ROLE ALL');
   Host.ADOC.Execute('GRANT UNLIMITED TABLESPACE TO '+ORAUSER);
   Host.ADOC.Execute('ALTER USER '+ORAUSER+' QUOTA UNLIMITED ON USERS');
   Except on E:Exception do
    ShowMessage(E.Message);
   End;
   adoq.Requery;
   fnd:=adoq.Locate('USERNAME',ORAUSER,[loCaseInsensitive]);
  End;
 if fnd then
  Begin
   if Not Empty(passw) then
    Try
    Host.ADOC.Execute('ALTER USER '+ORAUSER+' IDENTIFIED BY '+passw);
    Except on E:Exception do
     ShowMessage('Пароль некорректен! ('+E.Message+')');
    End;
  End;
 adoq.Close;
 adoq.Free;
 result:=True;
End;

Destructor TCmkUser.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

