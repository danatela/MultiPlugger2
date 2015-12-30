unit SelectorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CheckLst, ADODB, GlobVarsUnit, Menus,
  SharedUnit, DBGridEhGrouping, Data.DB, GridsEh, DBGridEh;

type
  TSelectorForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Grid: TDBGridEh;
    DS: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectorForm: TSelectorForm;

Function GetCheckedItemsList(Owner:TComponent;Dataset:TDataset;capt:string;Var list:TStringList):boolean;

implementation

{$R *.dfm}

Function GetCheckedItemsList(Owner:TComponent;Dataset:TDataset;capt:string;Var list:TStringList):boolean;
Var
 i:integer;
Begin
 result:=False;
 SelectorForm:=TSelectorForm.Create(Owner);
 SelectorForm.DS.DataSet:=Dataset;
 SelectorForm.Caption:=capt;
 SelectorForm.DS.DataSet.DisableControls;
// ShowMessage('list='+List.CommaText);
 for i := 0 to List.Count-1 do
  Begin
   if SelectorForm.DS.DataSet.Locate('nrec',List[i],[]) then
    SelectorForm.Grid.SelectedRows.CurrentRowSelected:=True;
  End;
 SelectorForm.DS.DataSet.First;
 SelectorForm.DS.DataSet.EnableControls;

 if SelectorForm.ShowModal=mrOK then
  Begin
   SelectorForm.DS.DataSet.DisableControls;
   result:=True;
   List.Clear;
   If SelectorForm.Grid.SelectedRows.Count>0 then
    Begin
     For i:=0 to SelectorForm.Grid.SelectedRows.Count-1 do
      Begin
       SelectorForm.DS.DataSet.GotoBookmark(Pointer(SelectorForm.Grid.SelectedRows.Items[i]));
       List.Append(IntToStr(SelectorForm.DS.DataSet.FieldByName('nrec').AsInteger));
      End;
    End;
   SelectorForm.DS.DataSet.EnableControls;
  End;

 SelectorForm.Free;
End;

procedure TSelectorForm.FormCreate(Sender: TObject);
begin
 DBGridEhInplaceSearchTimeOut := 15000; // 15 sec
end;

procedure TSelectorForm.FormShow(Sender: TObject);
begin
 Grid.SetFocus;
end;

end.
