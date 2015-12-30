unit PersonSelectorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, SelectorUnit, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, MemTableDataEh, MemTableEh,
  Db, LoginUnit;

type
  TPersonSelectorForm = class(TForm)
    ActionManager1: TActionManager;
    PopupMenu: TPopupMenu;
    N3: TMenuItem;
    SelectAction: TAction;
    PersonMTE: TMemTableEh;
    PersonMTEnrec: TStringField;
    PersonMTEcparent: TStringField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    PersonDS: TDataSource;
    PersonGrid: TDBGridEh;
    GroupBox1: TGroupBox;
    f_fio: TLabeledEdit;
    f_tabnum: TLabeledEdit;
    f_filtered: TCheckBox;
    PersonMTEtabnum: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure ActionsEnabling;
    procedure SelectActionExecute(Sender: TObject);
    procedure PersonGridDblClick(Sender: TObject);
    procedure PersonGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ReloadMTE;
    procedure f_filteredClick(Sender: TObject);
    procedure f_fioKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    f_Nrec:int64;
    f_ShopFilter:string;
  end;

TPersonSelector = class
 nrec: int64;
// groupflag: boolean;
 Procedure Clear;
 Function Edit(OwnerForm:TComponent;ShopFilter:string='1=1'):boolean;
 Function ToForm(Var Form:TPersonSelectorForm;ShopFilter:string):boolean;
 Function FromForm(Var Form:TPersonSelectorForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  PersonSelectorForm: TPersonSelectorForm;

implementation

{$R *.dfm}

Constructor TPersonSelector.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TPersonSelector.Clear;
begin
 nrec:=0;
// groupflag:=False;
end;

Function TPersonSelector.Edit(OwnerForm:TComponent;ShopFilter:string='1=1'):boolean;
Var
 Form: TPersonSelectorForm;
begin
 result:=False;
 Form:=TPersonSelectorForm.Create(OwnerForm);
 Form.Caption:='Перечень работников';
 if ToForm(Form,ShopFilter) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End;
  End;
 Form.Free;
end;

Function TPersonSelector.ToForm(Var Form:TPersonSelectorForm;ShopFilter:string):boolean;
Var
 MolFilter:string;
 ADOQ:TAdoQuery;
 nrec_:int64;
Begin
   Form.f_Nrec:=Nrec;
   Form.f_ShopFilter:=ShopFilter;

   Form.ReloadMTE;

 nrec_:=Nrec;

 if Nrec_<>0 then
  Begin
   Form.PersonMTE.TreeList.FullExpand;
   Form.PersonMTE.Locate('nrec','p'+IntToStr(nrec_),[]);
  End;


 Form.ActionsEnabling;


 result:=True;
End;

Function TPersonSelector.FromForm(Var Form:TPersonSelectorForm):boolean;
Var
 snrec:string;
Begin
 result:=False;
 if Form.PersonMTE.RecNo>0 then
  Begin
   snrec:=Form.PersonMTE.FieldByName('nrec').AsString;
   if Not Empty(snrec) and (snrec[1]='p') then
    Begin
     Delete(snrec,1,1);
     nrec:=StrToIntM(snrec);
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

Destructor TPersonSelector.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TPersonSelectorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
 end;
end;

procedure TPersonSelectorForm.FormShow(Sender: TObject);
begin
// ShowMessage('test1');
 PersonGrid.SetFocus;
// ShowMessage('test2');
end;

procedure TPersonSelectorForm.f_filteredClick(Sender: TObject);
begin
 f_fio.Enabled:=Not f_filtered.Checked;
 f_tabnum.Enabled:=Not f_filtered.Checked;
 ReloadMTE;
end;

procedure TPersonSelectorForm.f_fioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:
   Begin
    Key:=0;
    if Not f_filtered.Checked then
     Begin
      f_filtered.Checked:=True;
      Try
       PersonGrid.SetFocus;
      Except
      End;
     End;

   End;
 end;
end;

procedure TPersonSelectorForm.PersonGridDblClick(Sender: TObject);
begin
 if PersonMTE.TreeNodeHasChildren then PersonMTE.TreeNode.NodeExpanded:=Not PersonMTE.TreeNode.NodeExpanded
  else SelectActionExecute(Sender);
end;

procedure TPersonSelectorForm.PersonGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:
   Begin
    Key:=0;
    PersonGridDblClick(Sender);
   End;
 end;
end;

procedure TPersonSelectorForm.SelectActionExecute(Sender: TObject);
begin
 Close();
 Self.ModalResult:=mrOK;
end;

procedure TPersonSelectorForm.ReloadMTE;
Var
 ADOQ,ADOQ2:TAdoQuery;
 UserFilter,cnrec:string;
 list:TStringList;
 master:int64;
begin
 cnrec:=EmptyStr;
 list:=TStringList.Create;
 PersonMTE.DisableControls;
 PersonMTE.Close;
 PersonMTE.DestroyTable;
 PersonMTE.CreateDataSet;
 PersonMTE.Open;

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

    PersonMTE.Append;
    PersonMTE.FieldByName('nrec').AsString:='s'+zero;
    PersonMTE.FieldByName('name').AsString:='[БЕЗ ЦЕХА]';
    PersonMTE.FieldByName('cparent').AsString:=EmptyStr;
    PersonMTE.Post;
    while Not ADOQ.Eof do
     Begin
      PersonMTE.Append;
      PersonMTE.FieldByName('nrec').AsString:='s'+IntToStr(ADOQ.FieldByName('nrec').AsLargeInt);
      PersonMTE.FieldByName('code').AsString:=ADOQ.FieldByName('code').AsString;
      PersonMTE.FieldByName('name').AsString:=ADOQ.FieldByName('name').AsString;
      PersonMTE.FieldByName('cparent').AsString:=EmptyStr;
      PersonMTE.Post;
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
    f_ShopFilter+andd+
    UserFilter+
    ' order by fio';
   ADOQ.Open;
   while Not ADOQ.Eof do
    Begin

     if true then
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
         PersonMTE.Append;
         PersonMTE.FieldByName('nrec').AsString:='p'+IntToStr(ADOQ2.FieldByName('nrec').AsLargeInt);
         PersonMTE.FieldByName('code').AsString:=ADOQ2.FieldByName('tabnum').AsString;
         PersonMTE.FieldByName('name').AsString:=ADOQ2.FieldByName('fio').AsString;
         PersonMTE.FieldByName('tabnum').AsString:=ADOQ2.FieldByName('tabnum').AsString;
         Try
         PersonMTE.FieldByName('cparent').AsString:='p'+IntToStr(ADOQ2.FieldByName('cparent').AsLargeInt);
         Except
         PersonMTE.FieldByName('cparent').AsString:='';
         End;
         if (Empty(PersonMTE.FieldByName('cparent').AsString) or (PersonMTE.FieldByName('cparent').AsString='p0'))
          then
           PersonMTE.FieldByName('cparent').AsString:='s'+IntToStr(ADOQ2.FieldByName('cshops').AsLargeInt);
         list.Append(IntToStr(ADOQ.FieldByName('cparent').AsLargeInt));
         master:=ADOQ2.FieldByName('cparent').AsLargeInt;
         Try
         PersonMTE.Post;
         Except
         PersonMTE.Cancel;
         End;
        End else master:=0;
       ADOQ2.Close;
       // <-- Добавляем мастера
      End else master:=0;
     End;
     End;


     if list.IndexOf(IntToStr(ADOQ.FieldByName('nrec').AsLargeInt))=-1 then
      Begin
     PersonMTE.Append;
     PersonMTE.FieldByName('nrec').AsString:='p'+IntToStr(ADOQ.FieldByName('nrec').AsLargeInt);
     PersonMTE.FieldByName('code').AsString:=ADOQ.FieldByName('tabnum').AsString;
     PersonMTE.FieldByName('name').AsString:=ADOQ.FieldByName('fio').AsString;
     PersonMTE.FieldByName('tabnum').AsString:=ADOQ.FieldByName('tabnum').AsString;
     if f_filtered.Checked and Empty(cnrec) then cnrec:=PersonMTE.FieldByName('nrec').AsString;
     Try
     if true then
      PersonMTE.FieldByName('cparent').AsString:='p'+IntToStr(ADOQ.FieldByName('cparent').AsLargeInt)
      else
       PersonMTE.FieldByName('cparent').AsString:='';
     Except
     PersonMTE.FieldByName('cparent').AsString:='';
     End;
     if (Empty(PersonMTE.FieldByName('cparent').AsString) or (PersonMTE.FieldByName('cparent').AsString='p0'))
      then
       PersonMTE.FieldByName('cparent').AsString:='s'+IntToStr(ADOQ.FieldByName('ccontractor').AsLargeInt);

     list.Append(IntToStr(ADOQ.FieldByName('nrec').AsLargeInt));
     Try
     PersonMTE.Post;

     Except
     PersonMTE.Cancel;
     End;
      End;
     ADOQ.Next;
    End;
   ADOQ.Close;
   ADOQ.Free;
   ADOQ2.Free;
//   ToolsMTE.SortOrder:='name';
   if true then
   Begin
   PersonMTE.First;
   while Not PersonMTE.Eof do
    Begin
     if Not PersonMTE.TreeNodeHasChildren
     and (PersonMTE.FieldByName('nrec').AsString[1]='s')
      then PersonMTE.Delete
                                          else PersonMTE.Next;
    End;
   End;


   PersonMTE.First;
   PersonMTE.EnableControls;

 if f_filtered.Checked then PersonMTE.TreeList.FullExpand;
 if f_filtered.Checked and Not Empty(cnrec) then
  Try
   PersonMTE.TreeList.Locate('nrec',cnrec,[]);
  Except
  End;


// ToLog('cpersoninit='+IntToStr(nrec));
 list.Free;
 ActionsEnabling;
end;


Procedure TPersonSelectorForm.ActionsEnabling;
Begin
 // ShowDocAction.Enabled:=OpersADOQ.Active and (OpersADOQ.RecNo>0) and (OpersADOQ.FieldByName('ctool').AsLargeInt<>0);
End;


End.
