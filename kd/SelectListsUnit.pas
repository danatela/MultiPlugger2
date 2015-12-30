unit SelectListsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, JvToolEdit, JvExMask, GlobVars, MagsoftSharedUnit,
  Classes, CheckLst, GridsEh, DBGridEh, DB, MemTableEh, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh;

type
  TSelectListsForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Grid: TDBGridEh;
    DataSource: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TSelectLists = class
 MTE:TMemTableEh;
 ordn:string;
 drawing:string;
 queue:string;
 name:string;
 Max:integer;
 Procedure Clear;
 Function ToForm(Var Form:TSelectListsForm):boolean;
 Function FromForm(Var Form:TSelectListsForm):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  SelectListsForm: TSelectListsForm;

implementation
{$R *.dfm}

Constructor TSelectLists.Create;
begin
 inherited Create;
 MTE:=TMemTableEh.Create(nil);
 mte.FieldDefs.Add('nrec', ftLargeInt);
 mte.FieldDefs.Add('ordn', ftString, 255);
 mte.FieldDefs.Add('drawing', ftString, 255);
 mte.FieldDefs.Add('queue', ftString, 255);
 mte.FieldDefs.Add('name', ftString, 255);
 mte.FieldDefs.Add('cnt', ftInteger);
 mte.CreateDataSet;
 mte.Open;
 Clear;
end;

Procedure TSelectLists.Clear;
begin
 MTE.Close;
 MTE.DestroyTable;
 MTE.CreateDataSet;
 MTE.Open;
 ordn:=EmptyStr;
 drawing:=EmptyStr;
 queue:=EmptyStr;
 name:=EmptyStr;
 Max:=0;
end;

Function TSelectLists.Edit(OForm:TComponent):boolean;
Var
 Form: TSelectListsForm;
begin
 Form:=TSelectListsForm.Create(OForm);

 if ToForm(Form) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TSelectLists.ToForm(Var Form:TSelectListsForm):boolean;
Var
 i,k:integer;
Begin
 MTE.DisableControls;
 MTE.First;
 while Not MTE.Eof do
 begin
  if MHistMTE.Locate('nrec',MTE['nrec'],[]) then
   Begin
    MTE.Edit;
    MTE['cnt']:=MHistMTE['cnt'];
    MTE.Post;
   End;
  MTE.Next;
 end;
 MTE.First;
 MTE.EnableControls;

 Form.DataSource.DataSet:=MTE;
 MTE.First;
 result:=True;
End;

Procedure StrAdd(Var list:TStringList;value:string);
Begin
 if Not Empty(value) then
  Begin
   value:=UpperCase(value);
   if list.IndexOf(value)=-1 then
    Begin
     list.Append(value);
    End;
  End;
End;

Function GetStrStr(Var list:TStringList;delim:string):string;
Var
 i:integer;
Begin
 result:=EmptyStr;
 for i:=0 to list.Count-1 do
  Begin
   if Not Empty(result) then result:=result+delim;
   result:=result+list[i];
  End;
End;

Function TSelectLists.FromForm(Var Form:TSelectListsForm):boolean;
Var
 ordernum2List:TStringList;
 drawingList:TStringList;
 queueList:TStringList;
 nameList:TStringList;
Begin
 If (Form.DataSource.State=dsEdit) or (Form.DataSource.State=dsInsert) then Try MTE.Post; Except MTE.Cancel; End;

 ordernum2List:=TStringList.Create;
 drawingList:=TStringList.Create;
 queueList:=TStringList.Create;
 nameList:=TStringList.Create;

 MTE.DisableControls;
 Max:=0;
 MTE.First;
 while Not MTE.Eof do
 begin
  if MHistMTE.Locate('nrec',MTE['nrec'],[]) then MHistMTE.Edit
                                                              else MHistMTE.Append;
  MHistMTE['nrec']:=MTE['nrec'];
  MHistMTE['cnt']:=MTE['cnt'];
  MHistMTE.Post;

  if MTE['cnt']>0 then
   Begin
    Max:=Max+Integer(MTE['cnt']);
    StrAdd(ordernum2List,VarToStr(MTE['ordn']));
    StrAdd(drawingList,VarToStr(MTE['drawing']));
    StrAdd(queueList,VarToStr(MTE['queue']));
    StrAdd(nameList,VarToStr(MTE['name']));
   End;
  MTE.Next;
 end;
 MTE.First;
 MTE.EnableControls;

 ordn:=GetStrStr(ordernum2List,', ');
 drawing:=GetStrStr(drawingList,';');
 queue:=GetStrStr(queueList,'/');
 name:=GetStrStr(nameList,', ');

 ordernum2List.Free;
 drawingList.Free;
 queueList.Free;
 nameList.Free;

 result:=True;
End;

Destructor TSelectLists.Destroy;
begin
 Clear;
 MTE.Free;
 inherited Destroy;
end;


procedure TSelectListsForm.FormShow(Sender: TObject);
begin
// Grid.SetFocus;
 BitBtn1.SetFocus;
end;

end.
