unit SprSelectorUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Grids, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, DBGridEhGrouping,
  Vcl.ValEdit, Vcl.StdCtrls,
  Data.Win.ADODB, GlobVarsUnit, SharedUnit, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, ShellApi, Vcl.Menus,
  GridsEh, DBGridEh, SelectorUnit, MagsoftMsgDlgUnit, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Mask, JvExMask, JvToolEdit, EhLibADO, MemTableDataEh, MemTableEh, LoginUnit,
  Db;

type
  TSprSelectorForm = class(TForm)
    ActionManager1: TActionManager;
    PopupMenu: TPopupMenu;
    N3: TMenuItem;
    SelectAction: TAction;
    DS: TDataSource;
    Grid: TDBGridEh;
    ADOQ: TADOQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    Procedure ActionsEnabling;
    procedure SelectActionExecute(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    f_Nrec:int64;
    f_StrNrec:string;
    f_IsStrNrec:boolean;
    f_sql:boolean;
    f_SchemaName:string[40];
    f_TableName:string[20];
    f_NrecField:string[40];
    f_NameField:string[40];
  end;

TSprSelector = class
 nrec: int64;
 StrNrec:string;
 IsStrNrec:boolean;
 sql:boolean;
 Schema:string[40];
 TableName:string;
 NrecField:string[40];
 NameField:string[40];
 DopFilter:string;
 Procedure Clear;
 Function Edit(OwnerForm:TComponent;FormCaption:string=''):boolean;
 Function ToForm(Var Form:TSprSelectorForm):boolean;
 Function FromForm(Var Form:TSprSelectorForm):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SprSelectorForm: TSprSelectorForm;

implementation

{$R *.dfm}
Function GetSprDescription(TableName:string):string;
Begin
 result:='Справочник';
 if TableName=ShopsTable then result:='Справочник цехов/организаций';
 if TableName=MachinesTable then result:='Справочник станков';
 if TableName=ProfTable then result:='Справочник профессий';
 if TableName=SitesTable then result:='Справочник участков';
End;

Constructor TSprSelector.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSprSelector.Clear;
begin
 nrec:=0;
 StrNrec:=EmptyNREC;
 IsStrNrec:=False;
 sql:=False;
 Schema:=SchemaName;
 TableName:=EmptyStr;
 NrecField:='nrec';
 NameField:='name';
 DopFilter:=Truu;
end;

Function TSprSelector.Edit(OwnerForm:TComponent;FormCaption:string=''):boolean;
Var
 Form: TSprSelectorForm;
begin
 result:=False;
 if Not Empty(TableName) then
 Begin
 Form:=TSprSelectorForm.Create(OwnerForm);
 if Empty(FormCaption) then Form.Caption:=GetSprDescription(TableName)
                       else Form.Caption:=FormCaption;
 if ToForm(Form) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End;
  End;
 Form.Free;
 End;
end;

Function TSprSelector.ToForm(Var Form:TSprSelectorForm):boolean;
Var
 MolFilter:string;
 ShopFilter:string;
Begin
   Form.f_Nrec:=Nrec;
   Form.f_StrNrec:=StrNrec;
   Form.f_IsStrNrec:=IsStrNrec;
   Form.f_sql:=sql;
   Form.f_SchemaName:=Schema;
   Form.f_TableName:=TableName;
   Form.f_NrecField:=NrecField;
   Form.f_NameField:=NameField;

   ColumnSetOtherFieldName(Form.Grid,'name',NameField);

//   if TableName=ShopsTable then ShopFilter:=GetShopFilter(CurrentUser.cshopsr,CurrentUser.shop2shop,'nrec')
//                           else ShopFilter:=truu;
   ShopFilter:=truu;

   Form.ADOQ.Connection:=GlobADOC;
   if sql then
   Form.ADOQ.SQL.Text:=TableName
     else
   Form.ADOQ.SQL.Text:='select * from '+Form.f_SchemaName+dot+TableName+
    ' where '+
    ShopFilter+andd+
    DopFilter+
    ' order by '+NameField;

   Form.ADOQ.Open;

   if Not IsStrNrec and (Nrec<>0) then Form.ADOQ.Locate(NrecField,nrec,[]);
   if IsStrNrec and Not Empty(StrNrec) and (StrNrec<>EmptyNREC) then Form.ADOQ.Locate(NrecField,StrNrec,[locaseinsensitive]);

   Form.ActionsEnabling;


 result:=True;
End;

Function TSprSelector.FromForm(Var Form:TSprSelectorForm):boolean;
Var
 snrec:string;
Begin
 result:=False;
 if Form.ADOQ.RecNo>0 then
  Begin
   if IsStrNrec then StrNrec:=Form.ADOQ.FieldByName(Form.f_NrecField).AsString
                else nrec:=Form.ADOQ.FieldByName(Form.f_NrecField).AsLargeInt;
   result:=True;
  End;
 Form.ADOQ.Close;
End;

Destructor TSprSelector.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TSprSelectorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  vk_escape: Begin
              Key:=0;
              Close();
             End;
 end;
end;

procedure TSprSelectorForm.FormShow(Sender: TObject);
begin
 Grid.SetFocus;
end;

procedure TSprSelectorForm.GridDblClick(Sender: TObject);
begin
 SelectActionExecute(Sender);
end;

procedure TSprSelectorForm.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
  VK_RETURN:
   Begin
    Key:=0;
    GridDblClick(Sender);
   End;
 end;
end;

procedure TSprSelectorForm.SelectActionExecute(Sender: TObject);
begin
 Close();
 Self.ModalResult:=mrOK;
end;

Procedure TSprSelectorForm.ActionsEnabling;
Begin
 // ShowDocAction.Enabled:=OpersADOQ.Active and (OpersADOQ.RecNo>0) and (OpersADOQ.FieldByName('ctool').AsLargeInt<>0);
End;


End.
