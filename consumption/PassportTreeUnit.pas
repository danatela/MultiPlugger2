unit PassportTreeUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.Win.ADODB, Generics.Collections, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  StrUtils, Vcl.Menus, DBGridEhGrouping, Vcl.Buttons, GridsEh, DBGridEh,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, GlobVars, EhLibADO,
  {ArrivalUnit,} CmkUserUnit, Vcl.ImgList, InclFileUnit,
  MagsoftSharedUnit, MagsoftMsgDlgUnit, consumptionFilterUnit, MemTableEh,
  FastReportUnit, frxClass, MemTableDataEh, Db, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, DBAxisGridsEh;

type
  TPassportTreeForm = class(TForm)
    Source: TDataSource;
    MTE: TMemTableEh;
    Grid: TDBGridEh;
    MTEkolt: TFloatField;
    MTEname: TStringField;
    MTEdatef: TDateField;
    MTEdo: TBooleanField;
    MTEnrec: TStringField;
    MTEcsppassports: TStringField;
    MTEmarkir: TStringField;
    procedure GridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_cpassports:int64;
  end;

TPassportTree = class
 cpassports:int64;
 Procedure Clear;
 Function ToForm(Var Form:TPassportTreeForm):boolean;
 Function FromForm(Var Form:TPassportTreeForm):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  PassportTreeForm: TPassportTreeForm;
implementation

{$R *.dfm}

Constructor TPassportTree.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TPassportTree.Clear;
begin
 cpassports:=0;
end;

Destructor TPassportTree.Destroy;
begin
 Clear;
 inherited Destroy;
end;

Function TPassportTree.Edit(OForm:TComponent):boolean;
Var
 Form: TPassportTreeForm;
begin
 Form:=TPassportTreeForm.Create(OForm);

 if ToForm(Form) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TPassportTree.ToForm(Var Form:TPassportTreeForm):boolean;
Var
 i:integer;
 adoq,adoq2:TAdoQuery;
Begin
 Form.f_cpassports:=cpassports;
 Form.Caption:='Операции по паспорту '+GetTextValueOfPointer(IntToStr(cpassports),SchemaName+'PASSPORTS','NREC','NUM',False);
 Form.mte.Open;
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=Host.ADOC;
 adoq2:=TAdoQuery.Create(nil);
 adoq2.Connection:=Host.ADOC;
 Form.MTE.DisableControls;

 adoq.SQL.Text:='select * from '+SchemaName+'SPPASSPORTS'+' where cpassports='+IntToStr(cpassports);
 adoq.Open;
 while Not adoq.Eof do
  Begin
   Form.MTE.Append;
   Form.MTE['nrec']:='do'+adoq.FieldByName('nrec').AsString;
   Form.MTE['csppassports']:='do'+adoq.FieldByName('csppassports').AsString;
   Form.MTE['datef']:=adoq['datef'];
   Form.MTE['kolt']:=adoq['kolt'];
   Form.MTE['name']:=adoq['name'];
   Form.MTE['markir']:=adoq['markir'];
   Form.MTE['do']:=True;
   Form.MTE.Post;


 adoq2.SQL.Text:='select * from '+SchemaName+'SPPASSPORTSD'+' where csppassports='+IntToStr(adoq.FieldByName('nrec').AsLargeInt);
 adoq2.Open;
 while Not adoq2.Eof do
  Begin
   Form.MTE.Append;
   Form.MTE['nrec']:='det'+adoq2.FieldByName('nrec').AsString;
   Form.MTE['csppassports']:='do'+adoq.FieldByName('nrec').AsString;
   Form.MTE['datef']:=adoq2.FieldByName('dateizg').Value;
   Form.MTE['kolt']:=adoq2.FieldByName('weight').Value;
   Form.MTE['name']:='з-з МРК №'+adoq2.FieldByName('ordernum').AsString+', з-з ЦМК №'+adoq2.FieldByName('ordernum2').AsString+', №/п'+adoq2.FieldByName('ordn').AsString+', деталь:'+adoq2.FieldByName('details_s').Value+', '+adoq2.FieldByName('kolshtf').AsString+'шт.';
   Form.MTE['markir']:=GetTextValueOfPointer(IntToStr(adoq2.FieldByName('cdetails').AsLargeInt),SchemaName+'DETAILS','NREC','NUMP',False);
   Form.MTE['do']:=False;
   Form.MTE.Post;
   adoq2.Next;
  End;
 adoq2.Close;

   adoq.Next;
  End;
 adoq.Close;
 Form.MTE.TreeList.Active := False;
 Form.MTE.SortOrder := 'do,datef,markir';
 Form.MTE.TreeList.Active := True;
 Form.mte.First;

 Form.MTE.EnableControls;
 adoq2.Free;
 adoq.Free;


 result:=True;
End;

Function TPassportTree.FromForm(Var Form:TPassportTreeForm):boolean;
Begin
 cpassports:=Form.f_cpassports;
 Form.mte.Close;
 result:=True;
End;

procedure TPassportTreeForm.FormShow(Sender: TObject);
begin
 Grid.SetFocus;
end;

procedure TPassportTreeForm.GridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
 ddo:boolean;
begin
 Try ddo:=mte.FieldByName('do').AsBoolean; Except ddo:=False; End;
 if ddo then Grid.Canvas.Font.Style := [fsBold]
        else Grid.Canvas.Font.Style := [];
 Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
