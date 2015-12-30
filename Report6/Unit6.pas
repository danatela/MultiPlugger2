unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.OleServer, ExcelXP, Data.DB, Data.Win.ADODB, Generics.Collections, GlobVars;

type
  TSetPeriodForm = class(TForm)
    StartDateTimePicker: TDateTimePicker;
    EndDateTimePicker: TDateTimePicker;
    PrintBitBtn: TBitBtn;
    CancelBitBtn: TBitBtn;
    StartLabel: TLabel;
    EndLabel: TLabel;
    App: TExcelApplication;
    ADOQuery: TADOQuery;
    procedure PrintBitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetPeriodForm: TSetPeriodForm;

implementation

{$R *.dfm}

procedure TSetPeriodForm.PrintBitBtnClick(Sender: TObject);
var
  Book: _Workbook;
  Sheet: _Worksheet;
  CycleRange, CopyRange: ExcelRange;
  EQs: TList<string>;
  I, Kol, ItogKol, ItogTKol: Integer;
  Weight, ItogWeight, ItogTWeight: Real;
begin
  App.Connect;
  Book := App.Workbooks.Add('\\SERVER1571\CMKNEW\Reports\Report6.xlt', LOCALE_USER_DEFAULT);
  Sheet := Book.Sheets['Îò÷¸ò'] as _Worksheet;
  CycleRange := Sheet.Range['HorCycle', EmptyParam];
  CopyRange := CycleRange;
  ADOQuery.Connection := Host.ADOC;
  ADOQuery.Parameters.ParamValues['DATE1;DATE2'] := VarArrayOf([StartDateTimePicker.DateTime, EndDateTimePicker.DateTime]);
  ADOQuery.Open;
  EQs := TList<string>.Create;
  while not ADOQuery.Eof do begin
    if not EQs.Contains(VarToStr(ADOQuery['T_REZKA_EQ_S'])) then
      EQs.Add(VarToStr(ADOQuery['T_REZKA_EQ_S']));
    ADOQuery.Next;
  end;
  ADOQuery.Filtered := True;
  ItogKol := 0; ItogTKol := 0;
  ItogWeight := 0; ItogTWeight := 0;
  for I := 0 to EQs.Count - 1 do begin
    CopyRange.Offset[EmptyParam, CopyRange.Columns.Count].Insert(xlShiftToRight, EmptyParam);
    CopyRange := CopyRange.Offset[EmptyParam, CopyRange.Columns.Count];
    CycleRange.Copy(CopyRange);
    CopyRange.Replace('${EQUIPMENT}', EQs[I], EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    ADOQuery.Filter := 'T_REZKA_EQ_S = ''' + EQs[I] + ''' and spent = 1 and priznak = 1';
    Kol := 0; Weight := 0; ADOQuery.First;
    while not ADOQuery.Eof do begin
      Inc(Kol, Integer(ADOQuery['KOL']));
      Weight := Weight + ADOQuery['DETKOLT'];
      ADOQuery.Next;
    end;
    Inc(ItogKol, Kol);
    ItogWeight := ItogWeight + Weight;
    CopyRange.Replace('${SingleKol}', Kol, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    CopyRange.Replace('${SingleMass}', FloatToStr(Weight), EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    ADOQuery.Filter := 'T_REZKA_EQ_S = ''' + EQs[I] + ''' and spent = 1 and priznak = 2';
    Kol := 0; Weight := 0; ADOQuery.First;
    while not ADOQuery.Eof do begin
      Inc(Kol, Integer(ADOQuery['KOL']));
      Weight := Weight + ADOQuery['DETKOLT'];
      ADOQuery.Next;
    end;
    Inc(ItogKol, Kol);
    ItogWeight := ItogWeight + Weight;
    CopyRange.Replace('${MultiKol}', Kol, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    CopyRange.Replace('${MultiMass}', FloatToStr(Weight), EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    ADOQuery.Filter := 'T_REZKA_EQ_S = ''' + EQs[I] + ''' and spent = 0';
    Kol := 0; Weight := 0; ADOQuery.First;
    while not ADOQuery.Eof do begin
      Inc(Kol, Integer(ADOQuery['KOL']));
      Weight := Weight + ADOQuery['DETKOLT'];
      ADOQuery.Next;
    end;
    Inc(ItogTKol, Kol);
    ItogTWeight := ItogTWeight + Weight;
    CopyRange.Replace('${TrimKol}', Kol, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
    CopyRange.Replace('${TrimMass}', FloatToStr(Weight), EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  end;
  ADOQuery.Close;
  EQs.Free;
  CopyRange := Sheet.Range['HorItog', EmptyParam];
  CopyRange.Replace('${ItogKol}', ItogKol, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  CopyRange.Replace('${ItogMass}', FloatToStr(ItogWeight), EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  CopyRange.Replace('${ItogTKol}', ItogTKol, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  CopyRange.Replace('${ItogTMass}', FloatToStr(ItogTWeight), EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
  CycleRange.Delete(xlShiftToLeft);
  App.Visible[LOCALE_USER_DEFAULT] := True;
  App.Disconnect;
end;

end.
