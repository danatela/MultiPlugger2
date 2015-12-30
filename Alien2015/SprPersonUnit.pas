unit SprPersonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, SelectorUnit, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, MemTableDataEh, MemTableEh, LoginUnit,
  Db, Vcl.ImgList, SprPersonItemUnit, MagsoftWaitDialog;

type
  TSprPersonForm = class(TForm)
    ActionManager1: TActionManager;
    PopupMenu: TPopupMenu;
    MTE: TMemTableEh;
    MTEnrec: TStringField;
    MTEcparent: TStringField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
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
    N4: TMenuItem;
    MTEtabnum: TStringField;
    GroupBox1: TGroupBox;
    f_fio: TLabeledEdit;
    f_tabnum: TLabeledEdit;
    f_filtered: TCheckBox;
    MTEact: TBooleanField;
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
    procedure f_filteredClick(Sender: TObject);
    procedure f_fioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    f_Nrec:int64;
    f_ReadOnly:boolean;
  end;

TSprPerson = class
 nrec: int64;
// groupflag: boolean;
 Procedure Clear;
 Function Edit(OwnerForm:TComponent;ReadOnly:boolean):boolean;
 Function ToForm(Var Form:TSprPersonForm;ReadOnly:boolean):boolean;
 Function FromForm(Var Form:TSprPersonForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SprPersonForm: TSprPersonForm;

implementation

{$R *.dfm}

Constructor TSprPerson.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSprPerson.Clear;
begin
 nrec:=0;
// groupflag:=False;
end;

Function TSprPerson.Edit(OwnerForm:TComponent;ReadOnly:boolean):boolean;
Var
 Form: TSprPersonForm;
begin
 result:=False;
 Form:=TSprPersonForm.Create(OwnerForm);
 if ReadOnly then Form.Caption:=Form.Caption+space+'[только просмотр]';
 Form.f_ReadOnly:=ReadOnly;
 if ToForm(Form,ReadOnly) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End;
  End;
 Form.Free;
end;

procedure TSprPersonForm.ReloadMTE(AutoEdit:boolean);
Var
 ADOQ,ADOQ2:TAdoQuery;
 UserFilter,cnrec:string;
 list:TStringList;
 master:int64;
 mw:TMagsoftWaitDialog;
Begin
   mw:=TMagsoftWaitDialog.Create(Self);
   mw.CreateWait('Загрузка справочника',0);
   cnrec:=EmptyStr;
   list:=TStringList.Create;
   MTE.DisableControls;
   MTE.Close;
   MTE.DestroyTable;
   MTE.CreateDataSet;
   MTE.Open;

   ADOQ:=TAdoQuery.Create(nil);
   ADOQ.Connection:=GlobADOC;

   ADOQ2:=TAdoQuery.Create(nil);
   ADOQ2.Connection:=GlobADOC;

   if true then
    Begin
     ADOQ.SQL.Text:='select * from '+SchemaName+dot+ShopsTable+
    ' where '+
    'active=1'+
    ' order by name';
    ADOQ.Open;

    {
    MTE.Append;
    MTE.FieldByName('nrec').AsString:='s'+zero;
    MTE.FieldByName('name').AsString:='[БЕЗ ЦЕХА]';
    MTE.FieldByName('cparent').AsString:=EmptyStr;
    MTE.FieldByName('act').AsBoolean:=True;
    MTE.Post;
    }
    while Not ADOQ.Eof do
     Begin
      MTE.Append;
      MTE.FieldByName('nrec').AsString:='s'+IntToStr(ADOQ.FieldByName('nrec').AsLargeInt);
      MTE.FieldByName('code').AsString:=ADOQ.FieldByName('code').AsString;
      MTE.FieldByName('name').AsString:=ADOQ.FieldByName('name').AsString;
      MTE.FieldByName('cparent').AsString:=EmptyStr;
      MTE.FieldByName('act').AsBoolean:=True;
      MTE.Post;
      ADOQ.Next;
     End;
     ADOQ.Close;

    End;

    if f_filtered.Checked then
     Begin
      UserFilter:=EmptyStr;
      if Not Empty(f_fio.Text) then UserFilter:='upper(fio) like upper('''+AddSlashes(f_fio.Text)+'%'')';
      if Not Empty(f_tabnum.Text) then
       Begin
        if Not Empty(UserFilter) then UserFilter:=UserFilter+andd;
        UserFilter:=UserFilter+'tabnum like ''%'+AddSlashes(f_tabnum.Text)+'%''';
       End;
      if Empty(UserFilter) then UserFilter:=Truu
                           else UserFilter:='('+UserFilter+')';
     End else UserFilter:=Truu;


    ADOQ.SQL.Text:='select * from '+SchemaName+dot+PersonTable+
    ' where '+
    UserFilter+
    ' order by fio';

   ADOQ.Open;
   while Not ADOQ.Eof do
    Begin
     master:=ADOQ.FieldByName('cparent').AsLargeInt;
     while master<>0 do
     Begin
     if list.IndexOf(IntToStr(master))=-1 then
      Begin
       // Добавляем мастера -->
       ADOQ2.SQL.Text:='select * from '+SchemaName+dot+PersonTable+
       ' where nrec='+IntToStr(master);
       ADOQ2.Open;
       if ADOQ2.RecordCount=1 then
        Begin
         MTE.Append;
         MTE.FieldByName('nrec').AsString:='p'+IntToStr(ADOQ2.FieldByName('nrec').AsLargeInt);
         MTE.FieldByName('code').AsString:=ADOQ2.FieldByName('tabnum').AsString;
         MTE.FieldByName('name').AsString:=ADOQ2.FieldByName('fio').AsString;
         MTE.FieldByName('tabnum').AsString:=ADOQ2.FieldByName('tabnum').AsString;
         MTE.FieldByName('act').AsBoolean:=(ADOQ2.FieldByName('active').AsInteger=1);
         Try
         MTE.FieldByName('cparent').AsString:='p'+IntToStr(ADOQ2.FieldByName('cparent').AsLargeInt);
         Except
         MTE.FieldByName('cparent').AsString:='';
         End;
         if (Empty(MTE.FieldByName('cparent').AsString) or (MTE.FieldByName('cparent').AsString='p0'))
          then
           MTE.FieldByName('cparent').AsString:='s'+IntToStr(ADOQ2.FieldByName('ccontractor').AsLargeInt);
         list.Append(IntToStr(ADOQ.FieldByName('cparent').AsLargeInt));
         master:=ADOQ2.FieldByName('cparent').AsLargeInt;
         Try
         MTE.Post;
         Except
         MTE.Cancel;
         End;
        End else master:=0;
       ADOQ2.Close;
       // <-- Добавляем мастера
      End else master:=0;
     End;


     if list.IndexOf(IntToStr(ADOQ.FieldByName('nrec').AsLargeInt))=-1 then
      Begin
     MTE.Append;
     MTE.FieldByName('nrec').AsString:='p'+IntToStr(ADOQ.FieldByName('nrec').AsLargeInt);
     MTE.FieldByName('code').AsString:=ADOQ.FieldByName('tabnum').AsString;
     MTE.FieldByName('name').AsString:=ADOQ.FieldByName('fio').AsString;
     MTE.FieldByName('tabnum').AsString:=ADOQ.FieldByName('tabnum').AsString;
     MTE.FieldByName('act').AsBoolean:=(ADOQ.FieldByName('active').AsInteger=1);
     if f_filtered.Checked and Empty(cnrec) then cnrec:=MTE.FieldByName('nrec').AsString;
     Try
     MTE.FieldByName('cparent').AsString:='p'+IntToStr(ADOQ.FieldByName('cparent').AsLargeInt);
     Except
     MTE.FieldByName('cparent').AsString:='';
     End;
     if (Empty(MTE.FieldByName('cparent').AsString) or (MTE.FieldByName('cparent').AsString='p0'))
      then
       MTE.FieldByName('cparent').AsString:='s'+IntToStr(ADOQ.FieldByName('ccontractor').AsLargeInt);

//     PersonMTE.FieldByName('code').AsString:=Trim(ADOQ.FieldByName('code').AsString);
//     PersonMTE.FieldByName('cexclassseg').AsString:=ADOQ.FieldByName('cexclassseg').AsString;
     list.Append(IntToStr(ADOQ.FieldByName('nrec').AsLargeInt));
     Try
     MTE.Post;
     Except
     MTE.Cancel;
     End;
      End;
     ADOQ.Next;
    End;
   ADOQ.Close;
   ADOQ.Free;

   ADOQ2.Free;

//   MTE.SortOrder:='cparent,name';

//   if Not f_filtered.Checked then
   Begin
   MTE.First;
   while Not MTE.Eof do
    Begin
     if Not MTE.TreeNodeHasChildren and (Pos('s',MTE.FieldByName('nrec').AsString)=1)
                                    then MTE.Delete
                                    else MTE.Next;
    End;
   End;


   MTE.First;
   MTE.EnableControls;

// ToLog('cpersoninit='+IntToStr(nrec));
 if f_filtered.Checked then MTE.TreeList.FullExpand;

 if f_Nrec<>0 then
  Begin
   MTE.TreeList.FullExpand;
   if MTE.Locate('nrec','p'+IntToStr(f_nrec),[]) then
    if AutoEdit then EditActionExecute(Self);
  End;

 if f_filtered.Checked and Not Empty(cnrec) then
  Try
   MTE.TreeList.Locate('nrec',cnrec,[]);
  Except
  End;

 list.Free;
 mw.KillWait;
 mw.Free;
 ActionsEnabling;
End;

Function TSprPerson.ToForm(Var Form:TSprPersonForm;ReadOnly:boolean):boolean;
Begin
 Form.f_Nrec:=Nrec;
 Form.ReloadMTE(True);
 Form.ActionsEnabling;
 result:=True;
End;

Function TSprPerson.FromForm(Var Form:TSprPersonForm):boolean;
Var
 snrec:string;
Begin
 result:=False;
 if Form.MTE.RecNo>0 then
  Begin
   snrec:=Form.MTE.FieldByName('nrec').AsString;
   if Not Empty(snrec) and (snrec[1]='p') then
    Begin
     Delete(snrec,1,1);
     nrec:=StrToIntM(snrec);
//     groupflag:=False;
     result:=True;
    End;
   {
   if Not result and Not Empty(snrec) and (snrec[1]='s') then
    Begin
     Delete(snrec,1,1);
     nrec:=StrToIntM(snrec);
     groupflag:=True;
     result:=True;
    End;
   }
  End;
End;

Destructor TSprPerson.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSprPersonForm.AddActionExecute(Sender: TObject);
Var
 SprPersonItem:TSprPersonItem;
begin
 if AddAction.Enabled then
  Begin
   SprPersonItem:=TSprPersonItem.Create;
   SprPersonItem.person_cshops:=CmkContractor;
   if SprPersonItem.Edit(Self,'Новый работник',f_ReadOnly) then
     Begin
      f_nrec:=OraInsertRecordAnGetID(GlobADOC,SchemaName+dot+PersonTable,'nrec',SchemaName+dot+'WORKERS_SEQ');
      if f_nrec<>0 then
       Begin
        SprPersonItem.nrec:=f_nrec;
        if SprPersonItem.Save then
         Begin
          ReloadMTE(False);
         End;
       End;
      {
      if Not f_ReadOnly and SprPersonItem.Save then
       Begin
        // Обновить MTE
       End;
      }
     End;
   SprPersonItem.Free;
  End;
end;

procedure TSprPersonForm.DelActionExecute(Sender: TObject);
Var
 nrec:string;
 nrec_:int64;
 LinksComment:string;
begin
 if DelAction.Enabled then
  Begin
   nrec:=MTE.FieldByName('nrec').AsString;
   if Not Empty(nrec) then Delete(nrec,1,1);
   nrec_:=StrToIntM(nrec);
   if nrec_<>0 then
    Begin
     if UniCheckAllLinksForTable(PersonTable,nrec_,LinksComment)
{       UniCheckLinks(PersonTable,'cparent',nrec_)
     and UniCheckLinks(KatmolTable,'cperson',nrec_)
     and UniCheckLinks(OpersTable,'cperson',nrec_)
     and UniCheckLinks(InventTable,'cperson',nrec_)}
     then
     Begin
     if MagsoftMessageDlg(
     'Вы действительно хотите удалить работника '+
     Quoted(MTE.FieldByName('name').AsString)+
     ' ?'
     ,mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes then
      Begin
       Try
        GlobADOC.Execute('delete from '+SchemaName+dot+PersonTable+' where nrec='+IntToStr(nrec_));
        MTE.Delete;
       Except on E:Exception do
        ShowMessage(E.Message);
       End;
      End;
     End else ShowMessage('В базе данных присутствуют записи, связанные с данной! ('+LinksComment+') Удаление невозможно!');
    End;
  End;
end;

procedure TSprPersonForm.DSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TSprPersonForm.EditActionExecute(Sender: TObject);
Var
 SprPersonItem:TSprPersonItem;
 nrec:string;
begin
 if EditAction.Enabled then
  Begin
   SprPersonItem:=TSprPersonItem.Create;
   nrec:=MTE.FieldByName('nrec').AsString;
   if Not Empty(nrec) then Delete(nrec,1,1);
   if SprPersonItem.GetByNrec(StrToIntM(nrec)) then
   Begin
    if SprPersonItem.Edit(Self,MTE.FieldByName('name').AsString,f_ReadOnly) then
     Begin
      if SprPersonItem.Save then
       Begin
        f_nrec:=SprPersonItem.nrec;
        ReloadMTE(False);
       End;
     End;
   End;
   SprPersonItem.Free;
  End;
end;

procedure TSprPersonForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
  {
  vk_return: Begin
              Key:=0;
              EditActionExecute(Sender);
             End;
  }
 end;
end;

procedure TSprPersonForm.FormShow(Sender: TObject);
begin
// ShowMessage('test1');
 Try
 Grid.SetFocus;
 Except
 End;
// ShowMessage('test2');
end;

procedure TSprPersonForm.f_filteredClick(Sender: TObject);
begin
 f_fio.Enabled:=Not f_filtered.Checked;
 f_tabnum.Enabled:=Not f_filtered.Checked;
 ReloadMTE(False);
 Try
  Grid.SetFocus;
 Except
 End;
end;

procedure TSprPersonForm.f_fioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:
   Begin
    Key:=0;
    if Not f_filtered.Checked then
     Begin
      f_filtered.Checked:=True;
     End;
   End;
 end;
end;

procedure TSprPersonForm.GridDblClick(Sender: TObject);
begin
 EditActionExecute(Sender);
 {
 if PersonMTE.TreeNodeHasChildren then PersonMTE.TreeNode.NodeExpanded:=Not PersonMTE.TreeNode.NodeExpanded
  else SelectActionExecute(Sender);
  }
end;

procedure TSprPersonForm.GridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
Var
 active,balances:boolean;
begin
 Try
  active:=(MTE.FieldByName('act').AsBoolean);
 Except
  active:=False;
 End;
 Grid.Canvas.Font.Color := clBlack;
 If Not active then Grid.Canvas.Font.Color := clGray;

 Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TSprPersonForm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              if f_filtered.Checked then f_filtered.Checked:=False
              else
               Begin
                Close();
                Self.ModalResult:=mrCancel;
               End;
             End;
  vk_return: Begin
              Key:=0;
              EditActionExecute(Sender);
             End;
 end;
end;

Procedure TSprPersonForm.ActionsEnabling;
Begin
 AddAction.Enabled:=Not f_ReadOnly and Not f_filtered.Checked;
 EditAction.Enabled:=Not f_ReadOnly and MTE.Active and (MTE.RecNo>0) and (Not Empty(MTE.FieldByName('nrec').AsString) and (MTE.FieldByName('nrec').AsString[1]='p'));
 DelAction.Enabled:=EditAction.Enabled;
End;


End.
