unit EditSpGotUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Vcl.Buttons, GridsEh,
  DBAxisGridsEh, DBGridEh, Data.DB, Data.Win.ADODB, GlobVars;

type
  TEditSpGotForm = class(TForm)
    SPGOTDBGridEh: TDBGridEh;
    CancelBitBtn: TBitBtn;
    OKBitBtn: TBitBtn;
    SPGOTDataSource: TDataSource;
    SPGOTADOQuery: TADOQuery;
    SPGOTADOQueryNREC: TFloatField;
    SPGOTADOQueryCKD: TFloatField;
    SPGOTADOQueryCPLANS: TFloatField;
    SPGOTADOQueryCMARK: TFloatField;
    SPGOTADOQueryNUMP: TStringField;
    SPGOTADOQueryCPERSON: TFloatField;
    SPGOTADOQueryKOL: TFloatField;
    SPGOTADOQueryTRIMDATE: TDateTimeField;
    SPGOTADOQueryTRIMMED: TFloatField;
    SPGOTADOQueryPUT: TFloatField;
    SPGOTADOQueryCPASSPORT: TFloatField;
    SPGOTADOQueryTRIMDUTY: TFloatField;
    SPGOTADOQueryOPERTYPE: TFloatField;
    SPGOTADOQueryPERSON: TStringField;
    SPGOTADOQueryPASSPORT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SPGOTADOQueryAfterInsert(DataSet: TDataSet);
    procedure SPGOTDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SPGOTADOQueryBeforeOpen(DataSet: TDataSet);
  private
    FOperType: Integer;
    FCaption: string;
    procedure SetOperType(Value: Integer);
    procedure UpdateQueryFilter;
    procedure SetFieldsVisible;
    procedure AddPerson;
    { Private declarations }
  public
    property OperType: Integer read FOperType write SetOperType;
    { Public declarations }
  end;

var
  EditSpGotForm: TEditSpGotForm;

implementation

{$R *.dfm}

uses ImportPlanUnit, UPlugin;

procedure TEditSpGotForm.AddPerson;
var
  PersonsPlugin: TPlugin;
begin
  PersonsPlugin := Host.RunPlugin('TAddPersonPlugin');
  PersonsPlugin.SetProp('Caption', 'Список исполнителей');
  PersonsPlugin.SetProp('PersonType', 3);
  PersonsPlugin.Exec;
  ImportPlanForm.PersonsADOQuery.Requery;
  SPGOTADOQueryPERSON.RefreshLookupList;
  SPGOTADOQuery.Refresh;
end;

procedure TEditSpGotForm.FormCreate(Sender: TObject);
begin
  if ImportPlanForm.PlanLevel = 3 then begin
    SPGOTADOQuery.Parameters.ParamValues['PCMARK;PNUMP'] := ImportPlanForm.DMarksTotalQuery['CMARK;NUMP'];
    SPGOTADOQuery.Open;
    FCaption := Caption;
    OperType := 0;
  end;
end;

procedure TEditSpGotForm.SetOperType(Value: Integer);
begin
  FOperType := Value;
  UpdateQueryFilter;
  SetFieldsVisible;
end;

procedure TEditSpGotForm.UpdateQueryFilter;
var
  s: string;
begin
  SPGOTADOQuery.Filter := 'OPERTYPE=' + IntToStr(OperType);
  case OperType of
  0: s := 'Разметка';
  1: s := 'Резка';
  2: s := 'Зачистка';
  3: s := 'Строжка';
  4: s := 'Отверстия';
  5: s := 'Гибка';
  else
    s := 'Ошибка';
  end;
  Caption := s + ': ' + FCaption;
end;

procedure TEditSpGotForm.SetFieldsVisible;
begin
  SPGOTADOQueryKOL.Visible := OperType <> 1;
  SPGOTADOQueryTRIMMED.Visible := OperType = 1;
  SPGOTADOQueryPUT.Visible := OperType = 1;
  SPGOTADOQueryTRIMDUTY.Visible := OperType = 1;
  SPGOTADOQueryPASSPORT.Visible := OperType = 1;
end;

procedure TEditSpGotForm.SPGOTADOQueryAfterInsert(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  DataSet['OPERTYPE'] := FOperType;
  DataSet['TRIMDATE'] := Trunc(Now);
  DataSet['CMARK;NUMP'] := Query.Parameters.ParamValues['PCMARK;PNUMP'];
end;

procedure TEditSpGotForm.SPGOTADOQueryBeforeOpen(DataSet: TDataSet);
begin
  ImportPlanForm.BeforeOpen(DataSet);
end;

procedure TEditSpGotForm.SPGOTDBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Grid: TDbGridEh absolute Sender;
begin
  case Key of
  VK_DELETE: Grid.DataSource.DataSet.Delete;
  VK_F3: AddPerson;
  end;
end;

end.
