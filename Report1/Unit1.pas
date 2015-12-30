unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh, ComObj,
  DBGridEhToolCtrls, DynVarsEh, Data.DB, GridsEh, DBAxisGridsEh, DBGridEh,
  Data.Win.ADODB, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.OleServer, ExcelXP, GlobVars;

type
  TForm1 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    ADOQActs: TADOQuery;
    Excel: TExcelApplication;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  i : integer;
  sum_kol, sum_price, tot_weight, sum_weight : real;
  Range: ExcelRange;
  Sheet: _Worksheet;
begin
ADoqActs.Active := false;
ADoqActs.SQL.Clear;
sum_kol := 0;
sum_price := 0;
tot_weight := 0;
sum_weight := 0;
 AdoqActs.SQL.Text := 'select ACTS.ACTDATE, ACTS.ACTNO, KD.ORDERNUM, KD.ORDERNUM2, ACTS.SIGNED, '+
                ' MARKS.ORDN, SPACTS.QUANTITY, MARKS.WEIGHT1, SPACTS.WEIGHT, SPACTS.PRICE, SPACTS.SUM ' +
        ' from  cmknew.marks, cmknew.spacts, cmknew.acts  ' +
        ' left join cmknew.kd on kd.nrec=acts.kd_nrec ' +
        ' where acts.id=spacts.acts_id ' +
        ' and marks.ckd=kd.nrec ' +
        ' and acts.signed=1 ' +
        ' and acts.signdate >=''' + DateToStr(DateTimePicker1.Date) + ''' '+
        ' and acts.signdate<=''' + DateToStr(DateTimePicker2.Date) + ''' ' +
        ' and spacts.marks_nrec=marks.nrec ' +
        ' order by acts.signdate, acts.actno ' ;
 ADoQacts.Active:=true;
 AdoqActs.First;
  if AdoqActs.RecordCount = 0 then
   begin
    ShowMessage('База данных не содержит актов за указанный период.');
    Close;
   end
  else
   begin
    Excel.Connect;
    Excel.WorkBooks.Add('', LOCALE_USER_DEFAULT);
    Range := (Excel.ActiveWorkbook.Worksheets.Item[1] as _Worksheet).Range['A1', EmptyParam];
    Range.Cells.Item[4,4] := 'ОТЧЕТ О СДАЧЕ ГОТОВОЙ ПРОДУКЦИИ ';
    Range.Cells.Item[5,5] := 'С ' + DateToStr(DateTimePicker1.Date) + ' ПО ' + DateToStr(DateTimePicker2.Date)+'*';

    Range.Range['A6', 'I6'].Borders.Weight := 2;
    Range.Cells.Item[6,1] := '№ п/п';
    Range.Cells.Item[6,1].WrapText := true;
    Range.Cells.Item[6,1].ColumnWidth :=5;
    Sheet := Excel.ActiveWorkBook.WorkSheets[1] as _Worksheet;

    Range.Cells.Item[6,2].Value2 := 'Заказ МРК';
    Range.Cells.Item[6,2].WrapText := true;
    Range.Cells.Item[6,2].ColumnWidth :=15;

    Range.Cells.Item[6,3].Value2 := 'Заказ ЦМК';
    Range.Cells.Item[6,3].WrapText := true;
    Range.Cells.Item[6,3].ColumnWidth :=15;

    Range.Cells.Item[6,4].Value2 := 'Поряд. №';
    Range.Cells.Item[6,4].WrapText := true;
    Range.Cells.Item[6,4].ColumnWidth :=7;

    Range.Cells.Item[6,5].Value2 := 'Кол-во';
    Range.Cells.Item[6,5].WrapText := true;
    Range.Cells.Item[6,5].ColumnWidth :=10;

    Range.Cells.Item[6,6].Value2 := 'Вес, кг. 1 шт.';
    Range.Cells.Item[6,6].WrapText := true;
    Range.Cells.Item[6,6].ColumnWidth :=10;

    Range.Cells.Item[6,7].Value2 := 'Вес, всего';
    Range.Cells.Item[6,7].WrapText := true;
    Range.Cells.Item[6,7].ColumnWidth :=10;

    Range.Cells.Item[6,8].Value2 := 'Цена, руб';
    Range.Cells.Item[6,8].WrapText := true;
    Range.Cells.Item[6,8].ColumnWidth :=10;

    Range.Cells.Item[6,9].Value2 := 'Стоимость, руб';
    Range.Cells.Item[6,9].WrapText := true;
    Range.Cells.Item[6,9].ColumnWidth :=15;
    Sheet.Range['A6', 'I6'].HorizontalAlignment := xlCenter;


     for i := 1 to AdoqActs.RecordCount do
      begin
        Range.Cells.Item[i+6,1].Resize(1, 9).Borders.Weight:=2;
        Range.Cells.Item[i+6,1].Value2 := IntToStr(i);
        Range.Cells.Item[i+6,2].Value2 := AdoqActs.FieldByName('ordernum').AsString;
        Range.Cells.Item[i+6,3].Value2 := AdoqActs.FieldByName('ordernum2').AsString;
        Range.Cells.Item[i+6,4].Value2 := AdoqActs.FieldByName('ordn').AsString;
        Range.Cells.Item[i+6,5].Value2 := AdoqActs['quantity'];
         if AdoqActs['weight1']<>NULL then
          begin
           Range.Cells.Item[i+6,6].Value2 := AdoqActs['weight1']*1000;
            if AdoqActs['quantity']<>NULL then
             tot_weight := AdoqActs['weight1']*AdoqActs.FieldByName('quantity').Value
            else       tot_weight := 0;
          end;
        Range.Cells.Item[i+6,7].Value2 := tot_weight*1000;
        if AdoqActs['price']<>NULL then
         Range.Cells.Item[i+6,8].Value2 := AdoqActs['price']
        else
         Range.Cells.Item[i+6,8].Value2:=0;
        if AdoqActs['sum']<>NULL then
         Range.Cells.Item[i+6,9].Value2 := AdoqActs['sum']
        else
         Range.Cells.Item[i+6,9].Value2 := 0;
        if AdoqActs.FieldByName('signed').AsInteger=1 then
         begin
          if AdoqActs['quantity']<>NULL then
           sum_kol := sum_kol + AdoqActs['quantity'];
           if AdoqActs['sum']<>NULL then
            sum_price := sum_price + AdoqActs['sum'];
          sum_weight := sum_weight + tot_weight;
         end;
        AdoqActs.Next;
     end;
      Range.Cells.Item[i+6,1].Value2 := 'ИТОГО';
      Range.Cells.Item[i+6,1].Resize(1, 9).Borders.Weight:=2;
      Range.Cells.Item[i+6,1].Resize(1, 9).Font.Bold := True;
      Range.Cells.Item[i+6,5].Value2 := sum_kol;
      Range.Cells.Item[i+6,9].Value2 := sum_price;
      Range.Cells.Item[i+6,7].Value2 := sum_weight;
      Range.Cells.Item[i+8,1].Value2 := '* по дате подписания акта';
      Excel.Visible[LOCALE_USER_DEFAULT] := True;
      Excel.Disconnect;
      Close;
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form1 := nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
  d : TDateTime;
  j : integer;
begin
   DecodeDate(Now,Year,Month,Day);
   DateTimePicker1.Date:=EncodeDate(Year,Month,1);
   j:=31;
    while not TryEncodeDate(Year,Month,j,d) do
      Dec(j);
   DateTimePicker2.Date:=d;
  ADOQActs.Connection := Host.ADOC;
end;

end.
