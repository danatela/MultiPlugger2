unit EditActUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.ExtCtrls, DBGridEh, DBLookupEh, Vcl.Mask, DBCtrlsEh, Data.DB,
  Datasnap.Provider, Datasnap.DBClient, ADODB, GlobVars;

type
  TEditActForm = class(TForm)
    OKBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    MasterComboBox: TDBLookupComboBoxEh;
    ControllerComboBox: TDBLookupComboBoxEh;
    ControllerLabel: TLabel;
    MasterLabel: TLabel;
    ForLabel: TLabel;
    ZakazStaticText: TStaticText;
    PipesLabel: TLabel;
    PressureLabel: TLabel;
    AddressLabel: TLabel;
    DrawingLabel: TLabel;
    NameLabel: TLabel;
    QueueLabel: TLabel;
    NumLabel: TLabel;
    Weight1Label: TLabel;
    QuantityLabel: TLabel;
    WeightLabel: TLabel;
    PriceLabel: TLabel;
    SumLabel: TLabel;
    PipesDBEditEh: TDBEditEh;
    ForComboboxEh: TDBLookupComboboxEh;
    PressureDBEditEh: TDBEditEh;
    AddressComboboxEh: TDBLookupComboboxEh;
    DrawingComboboxEh: TDBLookupComboboxEh;
    NameComboboxEh: TDBLookupComboboxEh;
    QueueComboboxEh: TDBLookupComboboxEh;
    NumComboboxEh: TDBLookupComboboxEh;
    Weight1ComboboxEh: TDBLookupComboboxEh;
    WeightDBEditEh: TDBEditEh;
    PriceDBEditEh: TDBEditEh;
    SumDBEditEh: TDBEditEh;
    SignedDBCheckBoxEh: TDBCheckBoxEh;
    ActNoDBEditEh: TDBEditEh;
    ActNoLabel: TLabel;
    CostStaticText: TStaticText;
    QuantityDBEditEh: TDBEditEh;
    BrushingDBCheckBoxEh: TDBCheckBoxEh;
    FixPriceDBEditEh: TDBEditEh;
    Label1: TLabel;
    DBNavigator: TDBNavigator;
    ZakNoLabel: TLabel;
    ZakazComboboxEh: TDBLookupComboboxEh;
    AddMasterSpeedButton: TSpeedButton;
    AddControllerSpeedButton: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure AddPersonClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddPerson(PersonType: Integer);
  public
    { Public declarations }
  end;

var
  EditActForm: TEditActForm;

implementation

{$R *.dfm}

uses ApproveActUnit, UPlugin;

procedure TEditActForm.AddPerson(PersonType: Integer);
var
  PersonsPlugin: TPlugin;
begin
  PersonsPlugin := Host.RunPlugin('TAddPersonPlugin');
  case PersonType of
  1: PersonsPlugin.SetProp('Caption', 'Список мастеров ЦМК');
  2: PersonsPlugin.SetProp('Caption', 'Список контролеров УТК');
  else
    raise Exception.Create('Неверный вызов AddPerson!');
  end;
  PersonsPlugin.SetProp('PersonType', PersonType);
  PersonsPlugin.Exec;
  ApproveActForm.MasterADOQuery.Requery;
  ApproveActForm.ControllerADOQuery.Requery;
  MasterComboBox.Refresh;
  ControllerComboBox.Refresh;
end;

procedure TEditActForm.AddPersonClick(Sender: TObject);
var
  Button: TSpeedButton absolute Sender;
begin
  case Button.Tag of
  1, 2: AddPerson(Button.Tag);
  else
    raise Exception.Create('Неверная привязка функции AddPersonClick!');
  end;
end;

procedure TEditActForm.FormCreate(Sender: TObject);
begin
  SignedDBCheckBoxEh.Enabled := VarIsNull(ApproveActForm.ActsADOQuery['SIGNDATE']);
end;

end.
