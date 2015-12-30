unit SprUniSimpleItemUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, Vcl.ImgList,
  MagsoftUniSelectorUnit, PersonSelectorUnit, SprSelectorUnit, LoginUnit,
  Vcl.Buttons;

type
  TSprUniSimpleItemForm = class(TForm)
    Panel2: TPanel;
    ActionManager1: TActionManager;
    GroupBox1: TGroupBox;
    PersonInfoGroup: TGroupBox;
    OpersActionBar: TActionToolBar;
    ImageList1: TImageList;
    OkAction: TAction;
    f_shopButton: TButtonedEdit;
    f_shopButtonLabel: TLabel;
    f_active: TCheckBox;
    RecordInfoPanel: TPanel;
    f_RecordInfo: TLabel;
    f_Name: TLabeledEdit;
    f_code: TLabeledEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure ActionsEnabling;
    procedure ButtonSelectorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure f_shopButtonRightButtonClick(Sender: TObject);
    procedure OkActionExecute(Sender: TObject);
    procedure f_NameChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_ReadOnly:boolean;
    f_nrec:int64;
    f_cshops: int64;
    f_tablename:string;
    f_NameField:string;
    f_CodeField:string;
    f_NeedShopFilter:boolean;
  end;

TSprUniSimpleItem = class
 nrec: int64;
 TableName:string;
 NameField:string;
 CodeField:string;
 NeedShopFilter:boolean;
 cshops: int64;
 name:string;
 code:string;
 active:boolean;
 insert_date: TDateTime;
 insert_user: string[20];
 Procedure Clear;
 Function GetByNrec(vnrec:int64;TName,NField,CField:string;NeedShopFilt:boolean):boolean;
 Function Read(Dataset:TDataset;NField,CField:string;NeedShopFilt:boolean):boolean;
 Function Save(Var Dataset:TAdoQuery):boolean; overload;
 Function Save:boolean; overload;
 Function Edit(OwnerForm:TComponent;capt:string;ReadOnly:boolean):boolean;
 Function ToForm(Var Form:TSprUniSimpleItemForm;ReadOnly:boolean):boolean;
 Function FromForm(Var Form:TSprUniSimpleItemForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SprUniSimpleItemForm: TSprUniSimpleItemForm;

implementation

{$R *.dfm}

Constructor TSprUniSimpleItem.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSprUniSimpleItem.Clear;
begin
 nrec:=0;
 name:=EmptyStr;
 code:=EmptyStr;
 tablename:=EmptyStr;
 NameField:='name';
 CodeField:=EmptyStr;
 NeedShopFilter:=False;
 cshops:=0;
 active:=True;
 insert_date:=0;
 insert_user:=EmptyStr;
end;

Function TSprUniSimpleItem.GetByNrec(vnrec:int64;TName,NField,CField:string;NeedShopFilt:boolean):boolean;
Var
 ADOQ:TAdoQuery;
Begin
 result:=True;
 Clear;
 ADOQ:=TAdoQuery.Create(nil);
 ADOQ.Connection:=GlobADOC;
 ADOQ.SQL.Text:='select * from '+SchemaName+dot+TName+' where nrec='+IntToStr(vnrec);
 Try
  ADOQ.Open;
 Except
  on E:Exception do
   Begin
    result:=False;
    ShowMessage(E.Message);
   End;
 End;
 if ADOQ.RecordCount=1 then result:=Read(ADOQ,NField,CField,NeedShopFilt)
                       else result:=False;
 ADOQ.Close;
 ADOQ.Free;
 TableName:=TName;
End;

Function TSprUniSimpleItem.Read(Dataset:TDataset;NField,CField:string;NeedShopFilt:boolean):boolean;
Begin
 result:=True;
 Clear;
 Try
  nrec:=Dataset.FieldByName('nrec').AsLargeInt;
  name:=Dataset.FieldByName(NField).AsString;
  if NeedShopFilt then
   Try cshops:=Dataset.FieldByName('ccontractor').AsLargeInt; Except cshops:=0; End;
  if Not Empty(CField) then
   Try code:=Dataset.FieldByName(CField).AsString; Except code:=EmptyStr; End;
  active:=(Dataset.FieldByName('active').AsInteger=1);
  insert_date:=Dataset.FieldByName('insert_date').AsDateTime;
  insert_user:=Dataset.FieldByName('insert_user').AsString;
  NameField:=NField;
  CodeField:=CField;
  NeedShopFilter:=NeedShopFilt;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при чтении записи справочника! ('+e.Message+')!');
      End;
 End;
End;

Function TSprUniSimpleItem.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Try
  if nrec=0 then Dataset.Append
            else Dataset.Edit;
  if active then Dataset.FieldByName('active').AsInteger:=1
            else Dataset.FieldByName('active').AsInteger:=0;
  Dataset.FieldByName(NameField).AsString:=SpaceIfEmpty(name);
  if Not Empty(CodeField) then Dataset.FieldByName(CodeField).AsString:=SpaceIfEmpty(code);
  if NeedShopFilter then Dataset.FieldByName('ccontractor').AsLargeInt:=cshops;
  Dataset.Post;
 Except
     on E: Exception do
      Begin
       result:=False;
       ShowMessage('Ошибка при сохранении записи справочника! ('+e.Message+')!');
       Try Dataset.Cancel; Except End;
      End;
 End;
End;

Function TSprUniSimpleItem.Save:boolean;
Var
 Dataset:TAdoQuery;
Begin
 Dataset:=TAdoQuery.Create(nil);
 Dataset.Connection:=GlobADOC;
 Dataset.SQL.Text:='select * from '+SchemaName+dot+TableName+' where nrec='+IntToStr(nrec);
 Dataset.Open;
 result:=Save(Dataset);
 Dataset.Close;
 Dataset.Free;
End;


Function TSprUniSimpleItem.Edit(OwnerForm:TComponent;capt:string;ReadOnly:boolean):boolean;
Var
 Form: TSprUniSimpleItemForm;
begin
 Form:=TSprUniSimpleItemForm.Create(OwnerForm);
 Form.Caption:=capt;
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

Function TSprUniSimpleItem.ToForm(Var Form:TSprUniSimpleItemForm;ReadOnly:boolean):boolean;
Begin
 Form.f_ReadOnly:=ReadOnly;
 Form.f_nrec:=nrec;
 Form.f_name.Text:=name;
 Form.f_tablename:=tablename;
 Form.f_NameField:=NameField;
 Form.f_CodeField:=CodeField;
 Form.f_Code.Text:=code;
 Form.f_NeedShopFilter:=NeedShopFilter;
 Form.f_cshops:=cshops;
 Form.f_active.Checked:=active;

 Form.RecordInfoPanel.Visible:=(CurrentUser.cusergroup=1) or (CurrentUser.cusergroup=8);
 if Form.RecordInfoPanel.Visible then Form.f_RecordInfo.Caption:=GetRecordInfoText(nrec,insert_user,insert_date);

 Form.f_shopButton.Visible:=NeedShopFilter;
 Form.f_shopButtonLabel.Visible:=Form.f_shopButton.Visible;

 Form.f_Code.Visible:=Not Empty(CodeField);

 if NeedShopFilter then UniUpdateButton(GlobADOC,Form.f_cshops,Form.f_shopButton,ShopsTable,'name','все цеха');

 Form.ActionsEnabling;
 result:=True;
End;

Function TSprUniSimpleItem.FromForm(Var Form:TSprUniSimpleItemForm):boolean;
Begin
 nrec:=Form.f_nrec;
 name:=Trim(Form.f_name.Text);
 if Not Empty(CodeField) then code:=Trim(Form.f_code.Text);
 if NeedShopFilter then cshops:=Form.f_cshops;
 active:=Form.f_active.Checked;
 result:=True;
End;

Destructor TSprUniSimpleItem.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSprUniSimpleItemForm.ButtonSelectorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_delete,vk_back:
             Begin
              Key:=0;
              if (Sender As TButtonedEdit).Name='f_shopButton' then
               Begin
                f_cshops:=0;
                UniUpdateButton(GlobADOC,f_cshops,f_shopButton,ShopsTable,'name','все цеха');
               End;
              ActionsEnabling;
             End;
 end;
end;

procedure TSprUniSimpleItemForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
 end;
end;

procedure TSprUniSimpleItemForm.FormResize(Sender: TObject);
Var
 s:string;
begin
 s:=f_name.Text;
 f_name.Text:=Abracadabra;
 f_name.Text:=s;
end;

procedure TSprUniSimpleItemForm.FormShow(Sender: TObject);
begin
 f_name.SetFocus;
end;

procedure TSprUniSimpleItemForm.f_NameChange(Sender: TObject);
begin
 ActionsEnabling;
end;

procedure TSprUniSimpleItemForm.f_shopButtonRightButtonClick(Sender: TObject);
Var
 SprSelector:TSprSelector;
begin
 SprSelector:=TSprSelector.Create;
 SprSelector.nrec:=f_cshops;
 SprSelector.TableName:=ShopsTable;
 If SprSelector.Edit(Self) then
  Begin
   f_cshops:=SprSelector.nrec;
   UniUpdateButton(GlobADOC,f_cshops,f_shopButton,ShopsTable,'name','все цеха');
   ActionsEnabling;
  End;
 SprSelector.Free;
end;

procedure TSprUniSimpleItemForm.OkActionExecute(Sender: TObject);
begin
 Close();
 ModalResult:=mrOK;
end;

Procedure TSprUniSimpleItemForm.ActionsEnabling;
Begin
 OkAction.Enabled:=Not f_ReadOnly and Not Empty(f_name.Text);
End;


End.
