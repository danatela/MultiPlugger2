unit MachineSelectorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, SelectorUnit, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, MemTableDataEh, MemTableEh, LoginUnit,
  Db, MagsoftWaitDialog;

type
  TMachineSelectorForm = class(TForm)
    ActionManager1: TActionManager;
    PopupMenu: TPopupMenu;
    N3: TMenuItem;
    SelectAction: TAction;
    ToolsMTE: TMemTableEh;
    StringField1: TStringField;
    ToolsDS: TDataSource;
    ToolsGrid: TDBGridEh;
    ToolsMTEnrec: TStringField;
    ToolsMTEcparent: TStringField;
    Panel1: TPanel;
    f_tree: TCheckBox;
    ToolsMTEshopcode: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure ActionsEnabling;
    procedure SelectActionExecute(Sender: TObject);
    procedure ToolsGridDblClick(Sender: TObject);
    procedure ToolsGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure f_treeClick(Sender: TObject);
    procedure ToolsDSDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    f_Nrec:int64;
    f_cshop:int64;
  end;

TMachineSelector = class
 nrec: int64;
 cshop: int64;
 groupflag: boolean;
 Procedure Clear;
 Function Edit(OwnerForm:TComponent):boolean;
 Function ToForm(Var Form:TMachineSelectorForm):boolean;
 Function FromForm(Var Form:TMachineSelectorForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  MachineSelectorForm: TMachineSelectorForm;

implementation

{$R *.dfm}

Constructor TMachineSelector.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TMachineSelector.Clear;
begin
 nrec:=0;
 cshop:=0;
 groupflag:=False;
end;

Function TMachineSelector.Edit(OwnerForm:TComponent):boolean;
Var
 Form: TMachineSelectorForm;
begin
 result:=False;
 Form:=TMachineSelectorForm.Create(OwnerForm);
 if cshop<>0 then Form.Caption:=GetTextValueOfPointerADOC(GlobADOC,IntToStr(cshop),SchemaName+dot+ShopsTable,'nrec','name',False)+dot+space+Form.Caption;
 if ToForm(Form) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End;
  End;
 Form.Free;
end;

Function TMachineSelector.ToForm(Var Form:TMachineSelectorForm):boolean;
Var
 MolFilter:string;
Begin
   Form.f_Nrec:=Nrec;
   Form.f_cshop:=cshop;
   ColumnVis(Form.ToolsGrid,'shopcode',cshop=0);
   Form.f_tree.OnClick:=nil;
   if GroupFlag then Form.f_tree.Checked:=True;
   Form.f_tree.OnClick:=Form.f_treeClick;

   Form.f_treeClick(Form);

 if Nrec<>0 then
  Begin
   if Form.ToolsMTE.TreeList.Active then Form.ToolsMTE.TreeList.FullExpand;
   Form.ToolsMTE.Locate('nrec','p'+IntToStr(nrec),[]);
  End else Form.ToolsMTE.First;

 Form.ActionsEnabling;
 result:=True;
End;

Function TMachineSelector.FromForm(Var Form:TMachineSelectorForm):boolean;
Var
 snrec:string;
Begin
 result:=False;
 if Form.ToolsMTE.RecNo>0 then
  Begin
   snrec:=Form.ToolsMTE.FieldByName('nrec').AsString;

   if Not Empty(snrec) and (snrec[1]='p') then
    Begin
     Delete(snrec,1,1);
     nrec:=StrToIntM(snrec);
     groupflag:=False;
     result:=True;
    End;

   if Not result and Not Empty(snrec) and (snrec[1]='g') then
    Begin
     Delete(snrec,1,1);
     nrec:=StrToIntM(snrec);
     groupflag:=True;
     result:=True;
    End;
  End;
End;

Destructor TMachineSelector.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TMachineSelectorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
 end;
end;

procedure TMachineSelectorForm.FormShow(Sender: TObject);
begin
 ToolsGrid.SetFocus;
end;

procedure TMachineSelectorForm.f_treeClick(Sender: TObject);
Var
 ADOQ:TAdoQuery;
 mw:TMagsoftWaitDialog;
 nrec:string[100];
 grtools:TStringList;
 i:integer;
begin
   mw:=TMagsoftWaitDialog.Create(Self);
   ToolsMTE.DisableControls;
   if ToolsMTE.RecNo>0 then nrec:=ToolsMTE.FieldByName('nrec').AsString
                       else nrec:=EmptyStr;
   ToolsMTE.Close;
   ToolsMTE.DestroyTable;
   ToolsMTE.CreateDataSet;
   ToolsMTE.Open;

   ToolsMTE.TreeList.Active:=f_tree.Checked;

   ADOQ:=TAdoQuery.Create(nil);
   ADOQ.Connection:=GlobADOC;

   if f_tree.Checked then
    Begin
     ADOQ.SQL.Text:='select * from '+SchemaName+dot+EqGroupTable+
     ' where '+
     'active=1'+
     ' order by name';
     ADOQ.Open;
     while Not ADOQ.Eof do
      Begin
       ToolsMTE.Append;
       ToolsMTE.FieldByName('nrec').AsString:='g'+IntToStr(ADOQ.FieldByName('nrec').AsLargeInt);
       ToolsMTE.FieldByName('name').AsString:=ADOQ.FieldByName('name').AsString;
       ToolsMTE.FieldByName('cparent').AsString:='g'+IntToStr(ADOQ.FieldByName('cparent').AsLargeInt);
       ToolsMTE.Post;
       ADOQ.Next;
      End;
     ADOQ.Close;
    End;

   ADOQ.SQL.Text:='select '+
   MachinesTable+dot+'nrec as nrec'+comma+
   MachinesTable+dot+'name as name'+comma+
   MachinesTable+dot+'active as active'+comma+
   MachinesTable+dot+'ceqgroup as ceqgroup'+comma+
   MachinesTable+dot+'cshops as cshops'+comma+
   ShopsTable+dot+'code as shopcode'+
   ' from '+
   SchemaName+dot+MachinesTable+space+MachinesTable+comma+
   SchemaName+dot+ShopsTable+space+ShopsTable+
   ' where '+
   MachinesTable+dot+'active=1'+andd+
   MachinesTable+dot+'cshops='+ShopsTable+dot+'nrec'+andd+
   GetShopFilter(f_cshop,False,MachinesTable+dot+'cshops')+
   ' order by '+
   ShopsTable+dot+'code'+comma+
   MachinesTable+dot+'name'
   ;
   ADOQ.Open;
   if f_tree.Checked then mw.CreateWait('Формирование дерева инструмента',ADOQ.RecordCount);
   while Not ADOQ.Eof and (Not f_tree.Checked or (f_tree.Checked and Not mw.Canceled)) do
    Begin
     if f_tree.Checked then mw.Update(ADOQ.RecNo);
     ToolsMTE.Append;
     ToolsMTE.FieldByName('nrec').AsString:='p'+IntToStr(ADOQ.FieldByName('nrec').AsLargeInt);
     ToolsMTE.FieldByName('shopcode').AsString:=ADOQ.FieldByName('shopcode').AsString;
     ToolsMTE.FieldByName('name').AsString:=ADOQ.FieldByName('name').AsString;
     ToolsMTE.FieldByName('cparent').AsString:='g'+IntToStr(ADOQ.FieldByName('ceqgroup').AsLargeInt);
     ToolsMTE.Post;
     ADOQ.Next;
    End;
   if f_tree.Checked then mw.KillWait;

   ADOQ.Close;
   ADOQ.Free;

   ToolsMTE.TreeList.FullExpand;
   ToolsMTE.First;
   while Not ToolsMTE.Eof do
    Begin
     if Not ToolsMTE.TreeNodeHasChildren and (ToolsMTE.FieldByName('nrec').AsString[1]='g') then ToolsMTE.Delete
                                                                                            else ToolsMTE.Next;
    End;
   ToolsMTE.First;

   if Not Empty(nrec) and (nrec[1]='p') then
    Begin
     if ToolsMTE.TreeList.Active then ToolsMTE.TreeList.FullExpand;
     If Not ToolsMTE.Locate('nrec',nrec,[]) then ToolsMTE.First;
    End;

{   if Empty(nrec) then
    Begin
     ToolsMTE.TreeList.FullCollapse;
     ToolsMTE.First;
    End;}

   ToolsMTE.EnableControls;
   mw.Free;
end;

procedure TMachineSelectorForm.ToolsDSDataChange(Sender: TObject;
  Field: TField);
begin
 ActionsEnabling;
end;

procedure TMachineSelectorForm.ToolsGridDblClick(Sender: TObject);
begin
 if ToolsMTE.TreeNodeHasChildren then ToolsMTE.TreeNode.NodeExpanded:=Not ToolsMTE.TreeNode.NodeExpanded
  else SelectActionExecute(Sender);
end;

procedure TMachineSelectorForm.ToolsGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:
   Begin
    Key:=0;
    ToolsGridDblClick(Sender);
   End;
 end;
end;

procedure TMachineSelectorForm.SelectActionExecute(Sender: TObject);
begin
 if SelectAction.Enabled then
  Begin
   Close();
   Self.ModalResult:=mrOK;
  End;
end;

Procedure TMachineSelectorForm.ActionsEnabling;
Begin
 // ShowDocAction.Enabled:=OpersADOQ.Active and (OpersADOQ.RecNo>0) and (OpersADOQ.FieldByName('ctool').AsLargeInt<>0);
 SelectAction.Enabled:=ToolsMTE.Active and (ToolsMTE.RecNo>0) and (ToolsMTE.FieldByName('nrec').AsString[1]<>'g');

End;


End.
