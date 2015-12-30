unit SprUniSimpleUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, SelectorUnit, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, MemTableDataEh, MemTableEh,
  Db, Vcl.ImgList, SprUniSimpleItemUnit, LoginUnit;

type
  TSprUniSimpleForm = class(TForm)
    ActionManager1: TActionManager;
    PopupMenu: TPopupMenu;
    DS: TDataSource;
    Grid: TDBGridEh;
    AddAction: TAction;
    EditAction: TAction;
    DelAction: TAction;
    ActionToolBar1: TActionToolBar;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SprADOQ: TADOQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure ActionsEnabling;
    procedure GridDblClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AddActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure DelActionExecute(Sender: TObject);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure ReloadMTE(AutoEdit:boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    f_tablename:string;
    f_NameField:string;
    f_CodeField:string;
    f_NeedShopFilter:boolean;
    f_Nrec:int64;
    f_ReadOnly:boolean;
  end;

TSprUniSimple = class
 tablename:string;
 NameField:string;
 CodeField:string;
 NeedShopFilter:boolean;
 nrec: int64;
 Procedure Clear;
 Function Edit(OwnerForm:TComponent;ReadOnly:boolean):boolean;
 Function ToForm(Var Form:TSprUniSimpleForm;ReadOnly:boolean):boolean;
 Function FromForm(Var Form:TSprUniSimpleForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SprUniSimpleForm: TSprUniSimpleForm;

implementation

{$R *.dfm}

Constructor TSprUniSimple.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSprUniSimple.Clear;
begin
 tablename:=EmptyStr;
 NameField:='name';
 CodeField:=EmptyStr;
 NeedShopFilter:=False;
 nrec:=0;
// groupflag:=False;
end;

Function TSprUniSimple.Edit(OwnerForm:TComponent;ReadOnly:boolean):boolean;
Var
 Form: TSprUniSimpleForm;
begin
 result:=False;
 Form:=TSprUniSimpleForm.Create(OwnerForm);
 Form.Caption:=GetTableDescription(tablename,True);
 if ReadOnly then Form.Caption:=Form.Caption+space+'[только просмотр]';
 Form.f_ReadOnly:=ReadOnly;
 if ToForm(Form,ReadOnly) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End;
  End;
 Form.SprADOQ.Close;
 Form.Free;
end;

procedure TSprUniSimpleForm.ReloadMTE(AutoEdit:boolean);
Var
 ActiveFilter,ShopFilter:string;
Begin
   SprADOQ.DisableControls;
   SprADOQ.Close;

   if (CurrentUser.cusergroup=1) or (CurrentUser.cusergroup=8) then ActiveFilter:=Truu
                                                               else ActiveFilter:='active=1';
//   if f_NeedShopFilter then ShopFilter:=GetShopFilter(CurrentUser.cshopsr,False,'cshops')
//                       else ShopFilter:=Truu;
   ShopFilter:=Truu;

   SprADOQ.SQL.Text:='select * from '+SchemaName+dot+f_tablename+
    ' where '+
    ActiveFilter+andd+
    ShopFilter+
    ' order by '+f_NameField;


   SprADOQ.Open;
   SprADOQ.EnableControls;

 if f_Nrec<>0 then
  Begin
   if SprADOQ.Locate('nrec',f_nrec,[]) then
    if AutoEdit then EditActionExecute(Self);
  End;
End;


Function TSprUniSimple.ToForm(Var Form:TSprUniSimpleForm;ReadOnly:boolean):boolean;
Begin
 Form.f_tablename:=tablename;
 Form.f_NameField:=NameField;
 Form.f_CodeField:=CodeField;
 Form.f_NeedShopFilter:=NeedShopFilter;
 Form.f_Nrec:=Nrec;
 Form.SprADOQ.Connection:=GlobADOC;
 Form.ReloadMTE(True);
 DBGridEhInplaceSearchTimeOut:=10000;
 Form.ActionsEnabling;
 result:=True;
End;

Function TSprUniSimple.FromForm(Var Form:TSprUniSimpleForm):boolean;
Var
 snrec:string;
Begin
 result:=False;
 if Form.SprADOQ.RecNo>0 then
  Begin
   nrec:=Form.SprADOQ.FieldByName('nrec').AsLargeInt;
   result:=True;
  End;
End;

Destructor TSprUniSimple.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSprUniSimpleForm.AddActionExecute(Sender: TObject);
Var
 SprItem:TSprUniSimpleItem;
begin
 if AddAction.Enabled then
  Begin
   SprItem:=TSprUniSimpleItem.Create;
   SprItem.TableName:=f_TableName;
   SprItem.NameField:=f_NameField;
   SprItem.CodeField:=f_CodeField;
   SprItem.NeedShopFilter:=f_NeedShopFilter;
//   SprItem.katmol_cshops:=CurrentUser.cshops;
   if SprItem.Edit(Self,'Ќова€ позици€ справочника',f_ReadOnly) then
     Begin
      if Not Empty(SprItem.name) then
       Begin
        f_nrec:=OraInsertRecordAnGetID(GlobADOC,SchemaName+dot+f_TableName,'nrec',SchemaName+dot+AnsiUpperCase(f_TableName)+'_SEQ');
        if f_nrec<>0 then
         Begin
          SprItem.nrec:=f_nrec;
          if SprItem.Save then
           Begin
            ReloadMTE(False);
           End;
         End;
       End else ShowMessage('«апись справочника не должна быть пустой! ƒобавление невозможно!');
     End;
   SprItem.Free;
  End;
end;

procedure TSprUniSimpleForm.DelActionExecute(Sender: TObject);
Var
 LinksComment:string;
begin
 if DelAction.Enabled then
  Begin
   if SprADOQ.FieldByName('nrec').AsLargeInt<>0 then
    Begin
     if UniCheckAllLinksForTable(f_TableName,SprADOQ.FieldByName('nrec').AsLargeInt,LinksComment)
     then
     Begin
     if MagsoftMessageDlg(
     '¬ы действительно хотите удалить позицию справочника '+
     Quoted(SprADOQ.FieldByName(f_NameField).AsString)+
     ' ?'
     ,mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes then
      Begin
       Try
//        GlobADOC.Execute('delete from '+SchemaName+dot+f_TableName+' where nrec='+IntToStr(SprADOQ.FieldByName('nrec').AsLargeInt));
        SprADOQ.Delete;
       Except on E:Exception do
        ShowMessage(E.Message);
       End;
      End;
     End else ShowMessage('¬ базе данных присутствуют записи, св€занные с данной! ('+LinksComment+') ”даление невозможно!');
    End;
  End;
end;

procedure TSprUniSimpleForm.DSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TSprUniSimpleForm.EditActionExecute(Sender: TObject);
Var
 SprItem:TSprUniSimpleItem;
 nrec:string;
begin
 if EditAction.Enabled then
  Begin
   SprItem:=TSprUniSimpleItem.Create;
   if SprItem.GetByNrec(SprADOQ.FieldByName('nrec').AsLargeInt,f_TableName,f_NameField,f_CodeField,f_NeedShopFilter) then
   Begin
//    SprItem.TableName:=f_TableName;
//    SprItem.NameField:=f_NameField;
//    SprItem.NeedShopFilter:=f_NeedShopFilter;
    if SprItem.Edit(Self,SprADOQ.FieldByName(f_NameField).AsString,f_ReadOnly) then
     Begin
      if SprItem.Save then
       Begin
        f_nrec:=SprItem.nrec;
        ReloadMTE(False);
       End;
     End;
   End;
   SprItem.Free;
  End;
end;

procedure TSprUniSimpleForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
 end;
end;

procedure TSprUniSimpleForm.FormShow(Sender: TObject);
begin
// ShowMessage('test1');
 Try
 Grid.SetFocus;
 Except
 End;
// ShowMessage('test2');
end;

procedure TSprUniSimpleForm.GridDblClick(Sender: TObject);
begin
 EditActionExecute(Sender);
 {
 if PersonMTE.TreeNodeHasChildren then PersonMTE.TreeNode.NodeExpanded:=Not PersonMTE.TreeNode.NodeExpanded
  else SelectActionExecute(Sender);
  }
end;

procedure TSprUniSimpleForm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:
   Begin
    Key:=0;
    Close();
    Self.ModalResult:=mrCancel;
   End;
 end;
end;

Procedure TSprUniSimpleForm.ActionsEnabling;
Begin
 AddAction.Enabled:=Not f_ReadOnly;
 EditAction.Enabled:=(Not f_ReadOnly) and SprADOQ.Active and (SprADOQ.RecNo>0) and (SprADOQ.FieldByName('nrec').AsLargeInt<>0);
 DelAction.Enabled:=EditAction.Enabled;
End;


End.
