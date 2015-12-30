unit AddPersonUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB,
  Data.Win.ADODB, Vcl.ExtCtrls, Vcl.DBCtrls, UPlugin, GlobVars;

type
  TAddPersonForm = class(TForm)
    PersonsDBGridEh: TDBGridEh;
    PersonsDataSource: TDataSource;
    PersonsADOQuery: TADOQuery;
    PersonsADOQueryID: TFloatField;
    PersonsADOQueryTYPE: TFMTBCDField;
    PersonsADOQueryFIRSTNAME: TStringField;
    PersonsADOQueryLASTNAME: TStringField;
    PersonsADOQueryMIDDLENAME: TStringField;
    PersonsDBNavigator: TDBNavigator;
    procedure PersonsADOQueryBeforeOpen(DataSet: TDataSet);
    procedure PersonsADOQueryAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddPersonForm: TAddPersonForm;

implementation

{$R *.dfm}

uses
  UAddPersonPlugin;

procedure TAddPersonForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  AddPersonForm := nil;
end;

procedure TAddPersonForm.FormShow(Sender: TObject);
begin
  PersonsADOQuery.Parameters.ParamValues['pType'] := Plugin.GetProp('PersonType').AsInteger;
  Caption := Plugin.GetProp('Caption').AsString;
  PersonsADOQuery.Close;
  PersonsADOQuery.Open;
end;

procedure TAddPersonForm.PersonsADOQueryAfterInsert(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  DataSet['TYPE'] := Query.Parameters.ParamValues['pType'];
end;

procedure TAddPersonForm.PersonsADOQueryBeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

end.
