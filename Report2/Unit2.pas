unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ComCtrls, ComObj, GlobVars, ExcelXP;

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOQRep: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  PicturesDir: string;


implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  excel : TExcelApplication;
  Sheet: _Worksheet;
  i : integer;
  sum_dif, sum_rasch, sum_sert : real;
begin
 ADOQRep.Active := false;
 ADOQRep.SQL.Clear;
 sum_dif := 0;
 sum_rasch := 0;
 sum_sert := 0;
 ADOQRep.SQL.Text := ' select arrivals.adate, sparrivals.weights, sparrivals.kolt, arrivals.active ' +
                     ' from cmknew.arrivals, cmknew.sparrivals ' +
                     ' where arrivals.nrec=sparrivals.carrivals ' +
                     ' and arrivals.adate<=''' + DateToStr(DateTimePicker2.Date) + ''' ' +
                     ' and arrivals.adate>=''' + DateToStr(DateTimePicker1.Date) + ''' ';
 ADOQRep.Active := true;
  if ADOQRep.RecordCount >0 then
   begin
      excel:=TExcelApplication.Create(Self);
      Excel.Connect;
      Sheet := Excel.WorkBooks.Add(EmptyParam, LOCALE_USER_DEFAULT).ActiveSheet as _Worksheet;
      Sheet.Cells.Item[1,4].Value2 := '    РАЗНИЦА МАССЫ РАСЧЁТНОЙ И ПО СЕРТИФИКАТУ ';
      Sheet.Cells.Item[5,5].Value2 := 'С ' + DateToStr(DateTimePicker1.Date) + ' ПО ' + DateToStr(DateTimePicker2.Date);

      Sheet.Range['A6', 'C6'].Borders.Weight := 2;
      Sheet.Range['A7', 'C7'].Borders.Weight := 2;
      Sheet.Range['A8', 'C8'].Borders.Weight := 2;
      Sheet.Range['A6', 'B6'].MergeCells := true;
      Sheet.Cells.Item[6,1].Value2 := 'Масса поступившего металлопроката';
      Sheet.Range['A6', 'C7'].HorizontalAlignment := xlCenter;
      Sheet.Cells.Item[7,1].Value2 := 'Расчетная';
      Sheet.Cells.Item[7,1].HorizontalAlignment := xlCenter;
      Sheet.Cells.Item[7,2].Value2 := 'По сертификату';
      Sheet.Cells.Item[7,2].HorizontalAlignment := xlCenter;

      Sheet.Cells.Item[1,1].ColumnWidth := 20;
      Sheet.Cells.Item[1,2].ColumnWidth := 20;
      Sheet.Cells.Item[1,3].ColumnWidth := 20;
      Sheet.Range['C6', 'C7'].MergeCells := true;
      Sheet.Range['C6', 'C6'].HorizontalAlignment := xlCenter;
      Sheet.Cells.Item[6,3].Value2 := 'Разница, т';

      ADOQRep.First;
       for i := 1 to ADOQRep.RecordCount do
         begin
          if ADOQRep['kolt'] <> NULL then
           sum_rasch := sum_rasch + ADOQRep.FieldByName('kolt').AsFloat;
          if ADOQRep['weights'] <> NULL then
           sum_sert := sum_sert + ADOQRep.FieldByName('weights').AsFloat;
           ADOqRep.Next;
         end;
       sum_dif := sum_sert - sum_rasch;
      Sheet.Cells.Item[8,1].NumberFormat := '0,000';
      Sheet.Cells.Item[8,1].Value2 := sum_rasch;
      Sheet.Cells.Item[8,2].NumberFormat := '0,000';
      Sheet.Cells.Item[8,2].Value2 := sum_sert;
      Sheet.Cells.Item[8,3].NumberFormat := '0,000';
      Sheet.Cells.Item[8,3].Value2 := sum_dif;
      Excel.Visible[LOCALE_USER_DEFAULT] := true;
      Excel.Disconnect;
      Excel.Free;
   end
  else
   begin
    ShowMessage('База данных не содержит данных за указанный период.');
    Self.Close;
   end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 Self.Close;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form2 := nil;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
  d : TDateTime;
  j : integer;
begin
   DecodeDate(Now,Year,Month,Day);
   Self.DateTimePicker1.Date:=EncodeDate(Year,Month,1);
   j:=31;
    while not TryEncodeDate(Year,Month,j,d) do
      Dec(j);
   Self.DateTimePicker2.Date:=d;
   ADOQRep.Connection := Host.ADOC;
end;

end.
