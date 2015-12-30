unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  ComObj, Vcl.ComCtrls, GlobVars, ExcelXP;

type
  TForm4 = class(TForm)
    ADOConnection1: TADOConnection;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    ADOQMain: TADOQuery;
    ADOQSteelMark: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;


implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
 i, j : integer;
 excel : TExcelApplication;
 Sheet: _Worksheet;
 tot_kol : real;
 str: string;
begin
tot_kol:=0;
 ADOQMain.Active := false;
 ADOQMain.SQL.Clear;
 ADOQMain.SQL.Text := 'select sppassports.name as do_name, SPPASSPORTS.PROP_THICK_C, SPPASSPORTS.PROP_WIDTH_C, SPPASSPORTS.PROP_LENGTH_C, ' +
      ' PASSPORTS.NUM, SP_DO.DATEF, SP_DO.NAME as list_name, SP_DO.MARKIR as list_numb, SPPassports.KOLT, sparrivals.nrec as arr_nrec ' +
      ' from  CMKNEW.SPPASSPORTS, CMKNEW.SPPASSPORTS SP_DO, CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
      ' where ' +
      ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
      ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
      ' and sppassports.name like ''' + '%Лист%'+ ''' ' +
      ' and SPPASSPORTS.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
      ' order by SPPASSPORTS.PROP_THICK_C ';
 ADOQMain.Active := true;
  if ADOQMain.RecordCount>0 then
   begin
      excel:=TExcelApplication.Create(Self);
      Excel.Connect;
      Sheet := Excel.WorkBooks.Add(EmptyParam, LOCALE_USER_DEFAULT).ActiveSheet as _Worksheet;
      Self.ADOQMain.First;

    Sheet.Cells.Item[4,4].Value2 := 'ДЕЛОВАЯ ОБРЕЗЬ ЛИСТОВОГО МЕТАЛЛОРПОКАТА';
    Sheet.Cells.Item[5,4].Value2 := '                          на дату ' + DateToStr(DateTimePicker1.Date);

    Sheet.Range['A6', 'I6'].Borders.Weight := 2;
    Sheet.Cells.Item[6,1].Value2 := '№ п/п';
    Sheet.Cells.Item[6,1].WrapText := true;
    Sheet.Cells.Item[6,1].ColumnWidth :=5;
    Sheet.Range['A6', 'A6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,2].Value2 := '№ листа';
    Sheet.Cells.Item[6,2].WrapText := true;
    Sheet.Cells.Item[6,2].ColumnWidth :=10;
    Sheet.Range['B6', 'B6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,3].Value2 := 'Толщина, мм';
    Sheet.Cells.Item[6,3].WrapText := true;
    Sheet.Cells.Item[6,3].ColumnWidth :=10;
    Sheet.Range['C6', 'C6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,4].Value2 := 'Ширина, мм';
    Sheet.Cells.Item[6,4].WrapText := true;
    Sheet.Cells.Item[6,4].ColumnWidth :=10;
    Sheet.Range['D6', 'D6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,5].Value2 := 'Длина, мм';
    Sheet.Cells.Item[6,5].WrapText := true;
    Sheet.Cells.Item[6,5].ColumnWidth :=10;
    Sheet.Range['E6', 'E6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,6].Value2 := 'Марка стали';
    Sheet.Cells.Item[6,6].WrapText := true;
    Sheet.Cells.Item[6,6].ColumnWidth :=10;
    Sheet.Range['F6', 'F6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,7].Value2 := 'Дата';
    Sheet.Cells.Item[6,7].WrapText := true;
    Sheet.Cells.Item[6,7].ColumnWidth :=10;
    Sheet.Range['G6', 'G6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,8].Value2 := 'Масса ДО, т';
    Sheet.Cells.Item[6,8].WrapText := true;
    Sheet.Cells.Item[6,8].ColumnWidth :=10;
    Sheet.Range['H6', 'H6'].HorizontalAlignment := xlCenter;

    Sheet.Cells.Item[6,9].Value2 := 'Примечание';
    Sheet.Cells.Item[6,9].WrapText := true;
    Sheet.Cells.Item[6,9].ColumnWidth :=25;
    Sheet.Range['I6', 'I6'].HorizontalAlignment := xlCenter;

      for i := 1 to Self.ADOQMain.RecordCount do
        begin
             Sheet.Range['A'+IntToStr(i+6)+':I'+IntToStr(6+i), EmptyParam].Borders.Weight:=2;
             Sheet.Cells.Item[i+6,1].Value2 := IntToStr(i);
             Sheet.Cells.Item[i+6,2].Value2 := ADOQMain.FieldByName('list_numb').AsString;
             Sheet.Cells.Item[i+6,3].Value2 := ADOQMain['PROP_THICK_C'];
             Sheet.Cells.Item[i+6,4].Value2 := ADOQMain['PROP_WIDTH_C'];
             Sheet.Cells.Item[i+6,5].Value2 := ADOQMain['PROP_LENGTH_C'];
              ADOQSteelMark.Active := false;
              ADOQSteelMark.SQL.Clear;
              ADOQSteelMark.SQL.Text := 'select grmaterials.PROP_STEELMARK_C from cmknew.sparrivals, cmknew.grmaterials ' +
                                        ' where sparrivals.nrec = ''' + ADOQMain.FieldByName('arr_nrec').AsString + ''' ' +
                                        ' and SPARRIVALS.CGRMATERIALS=grmaterials.nrec ';
              ADOQSteelMark.Active := true;
              if ADOQSteelMark.RecordCount=1 then
                 Sheet.Cells.Item[i+6,6].Value2 := ADOQSteelMark.FieldByName('PROP_STEELMARK_C').AsString;

             Sheet.Cells.Item[i+6,7].Value2 := ADOQMain.FieldByName('DATEF').AsDateTime;

             Sheet.Cells.Item[i+6,8].NumberFormat:='0,000';
             Sheet.Cells.Item[i+6,8].Value2 := ADOQMain['kolt'];
             tot_kol := tot_kol + ADOQMain['kolt'];
          Self.ADOQMain.Next;
        end;
   Sheet.Cells.Item[ADOQMain.RecordCount+7,1].Value2 := 'ИТОГО';
   Sheet.Cells.Item[i+7,8].NumberFormat:='0,000';
   Sheet.Cells.Item[ADOQMain.RecordCount+7,8].Value2 := tot_kol;
   Sheet.Range['A'+IntToStr(ADOQMain.RecordCount+7)+':I'+IntToStr(7+ADOQMain.RecordCount), EmptyParam].Borders.Weight:=2;
   Sheet.Range['A'+IntToStr(ADOQMain.RecordCount+7)+':I'+IntToStr(7+ADOQMain.RecordCount), EmptyParam].Font.Bold:=true;



   Excel.Visible[LOCALE_USER_DEFAULT] := true;
   Excel.Disconnect;
   Excel.Free;
   end
  else
   ShowMessage('ДО листового металлопроката на данную дату отсутствует');
   Close;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
 Self.Close;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form4 := nil;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
  d : TDateTime;
  j : integer;
begin
   DecodeDate(Now,Year,Month,Day);
   Self.DateTimePicker1.Date:=EncodeDate(Year,Month,1);
   j:=31;
   ADOQMain.Connection := Host.ADOC;
   ADOQSteelMark.Connection := Host.ADOC;
end;

end.
