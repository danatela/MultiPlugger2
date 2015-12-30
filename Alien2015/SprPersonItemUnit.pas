unit SprPersonItemUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, Vcl.ImgList, frxClass,
  MagsoftUniSelectorUnit, LoginUnit, PersonSelectorUnit, SprSelectorUnit,
  SprUniSimpleUnit, Vcl.Buttons;

type
  TSprPersonItemForm = class(TForm)
    Panel2: TPanel;
    ActionManager1: TActionManager;
    GroupBox1: TGroupBox;
    PersonInfoGroup: TGroupBox;
    f_fio: TLabeledEdit;
    f_tabnum: TLabeledEdit;
    OpersActionBar: TActionToolBar;
    ImageList1: TImageList;
    OkAction: TAction;
    f_shopButton: TButtonedEdit;
    Label3: TLabel;
    f_personButton: TButtonedEdit;
    Label1: TLabel;
    f_profButton: TButtonedEdit;
    Label2: TLabel;
    f_category: TLabeledEdit;
    f_active: TCheckBox;
    RecordInfoPanel: TPanel;
    f_RecordInfo: TLabel;
    SprProfBtn: TBitBtn;
    SprProfAction: TAction;
    f_machineButton: TButtonedEdit;
    Label8: TLabel;
    f_siteButton: TButtonedEdit;
    f_siteButtonLabel: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure ActionsEnabling;
    procedure ButtonSelectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure f_personButtonRightButtonClick(Sender: TObject);
    procedure f_shopButtonRightButtonClick(Sender: TObject);
    procedure f_profButtonRightButtonClick(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure SprProfActionExecute(Sender: TObject);
    procedure f_machineButtonRightButtonClick(Sender: TObject);
    procedure f_siteButtonRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_ReadOnly:boolean;
    f_nrec:int64;
    f_cparent:int64;
    f_cshops: int64;
    f_cprof: int64;
    f_cmachine: int64;
    f_csite: int64;
  end;

TSprPersonItem = class
 nrec: int64;
 person_fio: string[182];
 person_cshops: int64;
 person_shop: string[20];
 person_tabnum: string[8];
 person_cparent: int64;
 person_cprof: int64;
 person_cmachine: int64;
 person_csite: int64;
 person_prof: string[200];
 person_category: integer;
 person_active: boolean;
 person_insert_date: TDateTime;
 person_insert_user: string[20];
 Procedure Clear;
 Procedure FieldsToReport(Var rep:TfrxReport;Prefix:string='');
 Function GetByNrec(vnrec:int64):boolean;
 Function Read(PersonDataset:TDataset):boolean;
 Function Save(Var PersonDataset:TAdoQuery):boolean; overload;
 Function Save:boolean; overload;
 Function Edit(OwnerForm:TComponent;capt:string;ReadOnly:boolean):boolean;
 Function ToForm(Var Form:TSprPersonItemForm;ReadOnly:boolean):boolean;
 Function FromForm(Var Form:TSprPersonItemForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SprPersonItemForm: TSprPersonItemForm;

implementation

{$R *.dfm}

Constructor TSprPersonItem.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSprPersonItem.FieldsToReport(Var rep:TfrxReport;Prefix:string='');
Var
 pr,s:string;
 adoq_:TAdoQuery;
Begin
 if Empty(Prefix) then Pr:='Person'
                  else Pr:=Prefix;

 rep.Variables[Pr+dot+'NREC']:=nrec;
 rep.Variables[Pr+dot+'FIO']:=kav+AddSlashes(person_fio)+kav;
 rep.Variables[Pr+dot+'CCONTRACTOR']:=person_cshops;
 rep.Variables[Pr+dot+'shop']:=kav+AddSlashes(person_shop)+kav;
 rep.Variables[Pr+dot+'tabnum']:=kav+AddSlashes(person_tabnum)+kav;
 rep.Variables[Pr+dot+'CPARENT']:=person_cparent;
 rep.Variables[Pr+dot+'CPROF']:=person_cprof;
 rep.Variables[Pr+dot+'CEQUIPMENT']:=person_cmachine;
 rep.Variables[Pr+dot+'CSITE']:=person_csite;
 rep.Variables[Pr+dot+'prof']:=kav+AddSlashes(person_prof)+kav;
 rep.Variables[Pr+dot+'CATEGORY']:= Padl(IntToStr(person_category),2,zero);
 rep.Variables[Pr+dot+'active']:=person_active;
 rep.Variables[Pr+dot+'insert_date']:=person_insert_date;
 rep.Variables[Pr+dot+'insert_user']:=kav+AddSlashes(person_insert_user)+kav;

 rep.Variables['CU'+dot+'FIO']:=kav+AddSlashes(CurrentUser.GetUserFIO(True))+kav;
 rep.Variables['CU'+dot+'cusergroup']:=CurrentUser.cusergroup;
 // вычисляемые:
 rep.Variables[Pr+dot+'master']:=kav+AddSlashes(GetTextValueOfPointerADOC(GlobADOC,IntToStr(person_cparent),SchemaName+dot+PersonTable,'nrec','fio',False))+kav;
 rep.Variables[Pr+dot+'equipment']:=kav+AddSlashes(GetTextValueOfPointerADOC(GlobADOC,IntToStr(person_cmachine),SchemaName+dot+MachinesTable,'nrec','name',False))+kav;
 rep.Variables[Pr+dot+'site']:=kav+AddSlashes(GetTextValueOfPointerADOC(GlobADOC,IntToStr(person_csite),SchemaName+dot+SitesTable,'nrec','name',False))+kav;
End;


Procedure TSprPersonItem.Clear;
begin
 nrec:=0;
 person_fio:=EmptyStr;
 person_cshops:=0;
 person_shop:=EmptyStr;
 person_tabnum:=EmptyStr;
 person_cparent:=0;
 person_cprof:=0;
 person_cmachine:=0;
 person_csite:=0;
 person_category:=0;
 person_active:=True;
 person_insert_date:=0;
 person_insert_user:=EmptyStr;
end;

Function TSprPersonItem.GetByNrec(vnrec:int64):boolean;
Var
 ADOQ:TAdoQuery;
Begin
 result:=True;
 Clear;
 ADOQ:=TAdoQuery.Create(nil);
 ADOQ.Connection:=GlobADOC;
 ADOQ.SQL.Text:='select * from '+SchemaName+dot+PersonTable+' where nrec='+IntToStr(vnrec);
 Try
  ADOQ.Open;
 Except
  on E:Exception do
   Begin
    result:=False;
    ShowMessage(E.Message);
   End;
 End;
 if ADOQ.RecordCount=1 then result:=Read(ADOQ)
                       else result:=False;
 ADOQ.Close;
 ADOQ.Free;
End;

Function TSprPersonItem.Read(PersonDataset:TDataset):boolean;
Begin
 result:=True;
 Clear;
 Try
  nrec:=PersonDataset.FieldByName('nrec').AsLargeInt;
//  ToLog('nrec2='+IntToStr(nrec));
  person_fio:=PersonDataset.FieldByName('fio').AsString;
  person_cshops:=PersonDataset.FieldByName('ccontractor').AsLargeInt;
  person_tabnum:=PersonDataset.FieldByName('tabnum').AsString;
  person_cparent:=PersonDataset.FieldByName('cparent').AsLargeInt;
  person_cprof:=PersonDataset.FieldByName('cprof').AsLargeInt;
  person_cmachine:=PersonDataset.FieldByName('cequipment').AsLargeInt;
  person_csite:=PersonDataset.FieldByName('csite').AsLargeInt;
  person_prof:=GetTextValueOfPointerADOC(GlobADOC,IntToStr(person_cprof),SchemaName+dot+ProfTable,'nrec','name',False);
  person_category:=PersonDataset.FieldByName('category').AsInteger;
  person_active:=(PersonDataset.FieldByName('active').AsInteger=1);
  person_insert_date:=PersonDataset.FieldByName('insert_date').AsDateTime;
  person_insert_user:=PersonDataset.FieldByName('insert_user').AsString;
  person_shop:=GetTextValueOfPointerADOC(GlobADOC,IntToStr(person_cshops),SchemaName+dot+ShopsTable,'nrec','name',False);
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при чтении данных о работнике! ('+e.Message+')!');
      End;
 End;
End;

Function TSprPersonItem.Save(Var PersonDataset:TAdoQuery):boolean;
Var
 i:integer;
Begin
 result:=True;
 Try
  if nrec=0 then PersonDataset.Append
            else PersonDataset.Edit;

  if person_active then PersonDataset.FieldByName('active').AsInteger:=1
                   else PersonDataset.FieldByName('active').AsInteger:=0;
  PersonDataset.FieldByName('fio').AsString:=SpaceIfEmpty(person_fio);
  PersonDataset.FieldByName('ccontractor').AsLargeInt:=person_cshops;
  PersonDataset.FieldByName('tabnum').AsString:=SpaceIfEmpty(person_tabnum);
  PersonDataset.FieldByName('cparent').AsLargeInt:=person_cparent;
  PersonDataset.FieldByName('cprof').AsLargeInt:=person_cprof;
  PersonDataset.FieldByName('cequipment').AsLargeInt:=person_cmachine;
  PersonDataset.FieldByName('csite').AsLargeInt:=person_csite;
  PersonDataset.FieldByName('category').AsInteger:=person_category;
  PersonDataset.Post;

 Except
     on E: Exception do
      Begin
       result:=False;
       ToLog(E.Message,CurrentUser.login);
       ShowMessage('Ошибка при сохранении информации о работнике! ('+e.Message+')!');
       Try PersonDataset.Cancel; Except End;
      End;
 End;
End;

Function TSprPersonItem.Save:boolean;
Var
 Dataset:TAdoQuery;
Begin
 Dataset:=TAdoQuery.Create(nil);
 Dataset.Connection:=GlobADOC;
 Dataset.SQL.Text:='select * from '+SchemaName+dot+PersonTable+' where nrec='+IntToStr(nrec);
 Dataset.Open;
 result:=Save(Dataset);
 Dataset.Close;
 Dataset.Free;
End;


Function TSprPersonItem.Edit(OwnerForm:TComponent;capt:string;ReadOnly:boolean):boolean;
Var
 Form: TSprPersonItemForm;
begin
 Form:=TSprPersonItemForm.Create(OwnerForm);
 Form.Caption:='Личная карточка работника';
// Form.PersonInfoGroup.Caption:=Form.PersonInfoGroup.Caption+'работнике: ';
 Form.Caption:=Form.Caption+dotdot+space+capt;
 if ReadOnly then Form.Caption:=Form.Caption+space+'[только просмотр]';
 if ToForm(Form,ReadOnly) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSprPersonItem.ToForm(Var Form:TSprPersonItemForm;ReadOnly:boolean):boolean;
Begin
 Form.f_ReadOnly:=ReadOnly;
 Form.f_nrec:=nrec;

 Form.f_fio.Text:=person_fio;
 Form.f_tabnum.Text:=person_tabnum;

 Form.f_cparent:=person_cparent;
 Form.f_cshops:=person_cshops;
 Form.f_cprof:=person_cprof;
 Form.f_cmachine:=person_cmachine;
 Form.f_csite:=person_csite;

 Form.f_category.Text:=Padl(IntToStr(person_category),2,zero);

 Form.f_active.Checked:=person_active;

 Form.RecordInfoPanel.Visible:=(CurrentUser.cusergroup=1) or (CurrentUser.cusergroup=8);
 if Form.RecordInfoPanel.Visible then Form.f_RecordInfo.Caption:=GetRecordInfoText(nrec,person_insert_user,person_insert_date);

 UniUpdateButton(GlobADOC,Form.f_cparent,Form.f_personButton,PersonTable,'fio','не выбран');
 UniUpdateButton(GlobADOC,Form.f_cshops,Form.f_shopButton,ShopsTable,'name','не выбран');
 UniUpdateButton(GlobADOC,Form.f_cprof,Form.f_profButton,ProfTable,'name','не указана');
 UniUpdateButton(GlobADOC,Form.f_cmachine,Form.f_machineButton,MachinesTable,'model','не указан');
 UniUpdateButton(GlobADOC,Form.f_csite,Form.f_siteButton,SitesTable,'name','не указан');

 Form.ActionsEnabling;
 result:=True;
End;

Function TSprPersonItem.FromForm(Var Form:TSprPersonItemForm):boolean;
Begin
 nrec:=Form.f_nrec;

 person_fio:=Trim(Form.f_fio.Text);
 person_tabnum:=Trim(Form.f_tabnum.Text);

 person_cparent:=Form.f_cparent;
 person_cshops:=Form.f_cshops;
 person_cprof:=Form.f_cprof;
 person_cmachine:=Form.f_cmachine;
 person_csite:=Form.f_csite;

 person_category:=StrToIntM(Form.f_category.Text);

 person_active:=Form.f_active.Checked;

 result:=True;
End;

Destructor TSprPersonItem.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSprPersonItemForm.ButtonSelectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_delete,vk_back:
             Begin
              Key:=0;
              if (Sender As TButtonedEdit).Name='f_personButton' then
               Begin
                f_cparent:=0;
                UniUpdateButton(GlobADOC,f_cparent,f_personButton,PersonTable,'fio','не выбран');
               End;
              if (Sender As TButtonedEdit).Name='f_shopButton' then
               Begin
                f_cshops:=0;
                UniUpdateButton(GlobADOC,f_cshops,f_shopButton,ShopsTable,'name','не выбран');
               End;
              if (Sender As TButtonedEdit).Name='f_profButton' then
               Begin
                f_cprof:=0;
                UniUpdateButton(GlobADOC,f_cprof,f_profButton,ProfTable,'name','не указана');
               End;
              if (Sender As TButtonedEdit).Name='f_machineButton' then
               Begin
                f_cmachine:=0;
                UniUpdateButton(GlobADOC,f_cmachine,f_machineButton,MachinesTable,'model','не указан');
               End;
              if (Sender As TButtonedEdit).Name='f_siteButton' then
               Begin
                f_csite:=0;
                UniUpdateButton(GlobADOC,f_csite,f_siteButton,SitesTable,'name','не указан');
               End;
              ActionsEnabling;
             End;
 end;
end;

procedure TSprPersonItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
 end;
end;

procedure TSprPersonItemForm.FormResize(Sender: TObject);
Var
 s:string;
begin
 s:=f_shopButton.Text;
 f_shopButton.Text:=Abracadabra;
 f_shopButton.Text:=s;

 s:=f_personButton.Text;
 f_personButton.Text:=Abracadabra;
 f_personButton.Text:=s;

 s:=f_profButton.Text;
 f_profButton.Text:=Abracadabra;
 f_profButton.Text:=s;

 s:=f_machineButton.Text;
 f_machineButton.Text:=Abracadabra;
 f_machineButton.Text:=s;
end;

procedure TSprPersonItemForm.FormShow(Sender: TObject);
begin
 f_fio.SetFocus;
end;

procedure TSprPersonItemForm.f_machineButtonRightButtonClick(Sender: TObject);
Var
 SprSelector:TSprSelector;
begin
 SprSelector:=TSprSelector.Create;
 SprSelector.nrec:=f_cmachine;
 SprSelector.TableName:=MachinesTable;
 SprSelector.NameField:='model';
 If SprSelector.Edit(Self) then
  Begin
   f_cmachine:=SprSelector.nrec;
   UniUpdateButton(GlobADOC,f_cmachine,f_machineButton,MachinesTable,'model','не указан');
   ActionsEnabling;
  End;
 SprSelector.Free;
end;

procedure TSprPersonItemForm.f_siteButtonRightButtonClick(Sender: TObject);
Var
 SprSelector:TSprSelector;
begin
 SprSelector:=TSprSelector.Create;
 SprSelector.nrec:=f_csite;
 SprSelector.TableName:=SitesTable;
 SprSelector.NameField:='name';
 If SprSelector.Edit(Self) then
  Begin
   f_csite:=SprSelector.nrec;
   UniUpdateButton(GlobADOC,f_csite,f_siteButton,SitesTable,'name','не указан');
   ActionsEnabling;
  End;
 SprSelector.Free;
end;

procedure TSprPersonItemForm.f_personButtonRightButtonClick(Sender: TObject);
Var
 PersonSelector:TPersonSelector;
begin
 PersonSelector:=TPersonSelector.Create;
 PersonSelector.nrec:=f_cparent;
 If PersonSelector.Edit(Self,GetShopFilter(f_cshops,False,PersonTable+dot+'ccontractor')) then
  Begin
   f_cparent:=PersonSelector.nrec;
   UniUpdateButton(GlobADOC,f_cparent,f_personButton,PersonTable,'fio','не выбран');
   ActionsEnabling;
  End;
 PersonSelector.Free;
end;

procedure TSprPersonItemForm.f_profButtonRightButtonClick(Sender: TObject);
Var
 SprSelector:TSprSelector;
begin
 SprSelector:=TSprSelector.Create;
 SprSelector.nrec:=f_cprof;
 SprSelector.TableName:=ProfTable;
 SprSelector.DopFilter:='('+GetShopFilter(f_cshops,False,'ccontractor')+orr+'ccontractor=0)';
 If SprSelector.Edit(Self) then
  Begin
   f_cprof:=SprSelector.nrec;
   UniUpdateButton(GlobADOC,f_cprof,f_profButton,ProfTable,'name','не указана');
   ActionsEnabling;
  End;
 SprSelector.Free;
end;

procedure TSprPersonItemForm.f_shopButtonRightButtonClick(Sender: TObject);
Var
 SprSelector:TSprSelector;
begin
 SprSelector:=TSprSelector.Create;
 SprSelector.nrec:=f_cshops;
 SprSelector.TableName:=ShopsTable;
 If SprSelector.Edit(Self) then
  Begin
   f_cshops:=SprSelector.nrec;
   UniUpdateButton(GlobADOC,f_cshops,f_shopButton,ShopsTable,'name','не выбран');
   ActionsEnabling;
  End;
 SprSelector.Free;
end;

procedure TSprPersonItemForm.OkActionExecute(Sender: TObject);
begin
 Close();
 ModalResult:=mrOK;
end;

procedure TSprPersonItemForm.SprProfActionExecute(Sender: TObject);
Var
 SprUniSimple:TSprUniSimple;
begin
 if SprProfAction.Enabled then
  Begin
   SprUniSimple:=TSprUniSimple.Create;
   SprUniSimple.tablename:=ProfTable;
   SprUniSimple.NeedShopFilter:=True;
   if SprUniSimple.Edit(Self,f_ReadOnly) then
    if SprUniSimple.nrec<>0 then f_cprof:=SprUniSimple.nrec;
   UniUpdateButton(GlobADOC,f_cprof,f_profButton,ProfTable,'name','не указана');
   SprUniSimple.Free;
  End;
end;

Procedure TSprPersonItemForm.ActionsEnabling;
Begin
 OkAction.Enabled:=Not f_ReadOnly and (f_cshops<>0);
 f_siteButton.Enabled:=(f_cshops=1);
 f_siteButtonLabel.Enabled:=f_siteButton.Enabled;
End;


End.
