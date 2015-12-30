unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  ComObj, Vcl.ComCtrls, GlobVars, ExcelXP;

type
  TForm5 = class(TForm)
    ADOConnection: TADOConnection;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    ADOQMain: TADOQuery;
    ADOQPipe: TADOQuery;
    ADOQChannel: TADOQuery;
    ADOQRollFormedS: TADOQuery;
    ADOQSquare: TADOQuery;
    ADOQTBeam: TADOQuery;
    ADOQHBeam: TADOQuery;
    ADOQAngle: TADOQuery;
    ADOQCircle: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.BeforeOpen(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.Connection := Host.ADOC;
  Query.BeforeOpen := nil;
end;

procedure TForm5.Button1Click(Sender: TObject);
var
 i, j, str_num, count  : integer;
 excel : TExcelApplication;
 Sheet: _Worksheet;
 tot_kol_sht, tot_massa : real;
 str: string;
begin
tot_kol_sht:= 0; tot_massa := 0;
str_num := 7;  //ÍÓÎ-‚Ó ÒÚÓÍ ‚ Ú‡·ÎËˆÂ
count := 0;   //ÍÓÎ-‚Ó ÔÓÁËˆËÈ ‚ Ú‡·ÎËˆÂ
     excel:=TExcelApplication.Create(Self);
     Excel.Connect;
     Sheet := Excel.WorkBooks.Add(EmptyParam, LOCALE_USER_DEFAULT).ActiveSheet as _Worksheet;

     Sheet.Cells.Item[4,4].Value2 := 'ƒ≈ÀŒ¬¿ﬂ Œ¡–≈«‹ —Œ–“Œ¬Œ√Œ Ã≈“¿ÀÀŒœŒ ¿“¿';
     Sheet.Cells.Item[5,4].Value2 := '                          Ì‡ ‰‡ÚÛ ' + DateToStr(DateTimePicker1.Date);

   Sheet.Range['A6', 'A7'].MergeCells := true;

   Sheet.Range['A6', 'M7'].Borders.Weight := 2;
   Sheet.Cells.Item[6,1].Value2 := 'π Ô/Ô';
   Sheet.Cells.Item[6,1].WrapText := true;
   Sheet.Cells.Item[6,1].ColumnWidth :=5;
   Sheet.Range['A6', 'A6'].HorizontalAlignment := xlCenter;

   Sheet.Range['B6', 'C7'].MergeCells := true;
   Sheet.Cells.Item[6,2].Value2 := 'œÓÙËÎ¸';
   Sheet.Cells.Item[6,2].WrapText := true;
   Sheet.Cells.Item[6,2].ColumnWidth :=15;
   Sheet.Range['B6', 'C7'].HorizontalAlignment := xlCenter;

   Sheet.Range['D6', 'H6'].MergeCells := true;
   Sheet.Cells.Item[6,4].Value2 := 'œ‡‡ÏÂÚ˚';
   Sheet.Cells.Item[7,4].WrapText := true;
   Sheet.Cells.Item[7,4].Value2 := '–‡ÁÏÂ, ÏÏ'; //D  //Í‚‡‰‡Ú
   Sheet.Cells.Item[7,5].WrapText := true;
   Sheet.Cells.Item[7,5].Value2 := '“ÓÎ˘ËÌ‡, ÏÏ'; //E //ÚÛ·‡, „ÌÛÚ˚È ÔÓÙËÎ¸
   Sheet.Cells.Item[7,6].Value2 := 'ƒË‡ÏÂÚ, ÏÏ'; //F //ÚÛ·‡
   Sheet.Cells.Item[7,6].WrapText := true;
   Sheet.Cells.Item[7,7].Value2 := '–‡ÁÏÂ1, ÏÏ'; //G  //„ÌÛÚ˚È ÔÓÙËÎ¸
   Sheet.Cells.Item[7,7].WrapText := true;            //„ÌÛÚ˚È ÔÓÙËÎ¸
   Sheet.Cells.Item[7,8].Value2 := '–‡ÁÏÂ2, ÏÏ'; //H
   Sheet.Cells.Item[7,8].WrapText := true;
   Sheet.Range['D6', 'H7'].HorizontalAlignment := xlCenter;

   Sheet.Range['I6', 'I7'].MergeCells := true;
   Sheet.Cells.Item[6,9].Value2 := ' ÓÎ-‚Ó, ¯Ú ';
   Sheet.Cells.Item[6,9].WrapText := true;
   Sheet.Cells.Item[6,9].ColumnWidth :=10;
   Sheet.Range['I6', 'I7'].HorizontalAlignment := xlCenter;

   Sheet.Range['J6', 'J7'].MergeCells := true;
   Sheet.Cells.Item[6,10].Value2 := 'Ã‡Í‡ ÒÚ‡ÎË';
   Sheet.Cells.Item[6,10].WrapText := true;
   Sheet.Cells.Item[6,10].ColumnWidth :=10;
   Sheet.Range['J6', 'J7'].HorizontalAlignment := xlCenter;

   Sheet.Range['K6', 'K7'].MergeCells := true;
   Sheet.Cells.Item[6,11].Value2 := 'ƒ‡Ú‡ ƒŒ';
   Sheet.Cells.Item[6,11].WrapText := true;
   Sheet.Cells.Item[6,11].ColumnWidth :=10;
   Sheet.Range['K6', 'K7'].HorizontalAlignment := xlCenter;

   Sheet.Range['L6', 'L7'].MergeCells := true;
   Sheet.Cells.Item[6,12].Value2 := 'Ã‡ÒÒ‡ ƒŒ, Ú';
   Sheet.Cells.Item[6,12].WrapText := true;
   Sheet.Cells.Item[6,12].ColumnWidth :=10;
   Sheet.Range['L6', 'L7'].HorizontalAlignment := xlCenter;

   Sheet.Range['M6', 'M7'].MergeCells := true;
   Sheet.Cells.Item[6,13].Value2 := 'œËÏÂ˜‡ÌËÂ';
   Sheet.Cells.Item[6,13].WrapText := true;
   Sheet.Cells.Item[6,13].ColumnWidth :=20;
   Sheet.Range['M6', 'M7'].HorizontalAlignment := xlCenter;



  { ¿∆ƒ€… œ–Œ‘»À‹ –¿——Ã¿“–»¬¿≈Ã Œ“ƒ≈À‹ÕŒ, œŒ— ŒÀ‹ ” œ¿–¿Ã≈“–€ √–”œœ»–Œ¬ » ”  ¿∆ƒŒ√Œ œ–Œ‘»Àﬂ
   ( –ŒÃ≈ ƒ¬”“¿¬–Œ¬Œ… ¡¿À », “¿¬–Œ¬Œ… ¡¿À », ÿ¬≈ÀÀ≈–¿  –¿«Õ€≈}
   //1) “–”¡¿ (GRMATERIALS.NREC=7)
  ADOQPipe.Active := false;
  ADOQPipe.SQL.Clear;
  ADOQPipe.SQL.Text :=' select COUNT(SP_DO.NREC) as kol_sp_do, SUM(SP_DO.KOLT), MAX(SP_DO.DATEF) as date_sp_do, ' +
                      ' PARENT_GRMATERIALS.NAME as parent_name, ' +
                      ' SPPASSPORTS.PROP_WTHICK, ' +
                      ' SPPASSPORTS.PROP_DIAM, ' +
                      ' GRMATERIALS.NAME, ' +
                      ' GRMATERIALS.PROP_STEELMARK_C ' +
                      ' from cmknew.GRMATERIALS  parent_grmaterials, ' +
                      ' cmknew.GRMATERIALS, ' +
                      ' CMKNEW.SPPASSPORTS, ' +
                      ' CMKNEW.SPPASSPORTS SP_DO, ' +
                      ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
                      ' where ' +
                      ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS '  +
                      ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
                      ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
                      ' and PARENT_GRMATERIALS.NREC=7 ' +
//                      ' and passports.spent=0 ' +
                      ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
                      ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
       ' GROUP BY  PARENT_GRMATERIALS.NAME, ' +
       ' SPPASSPORTS.PROP_WTHICK, ' +
       ' SPPASSPORTS.PROP_DIAM, ' +
       ' GRMATERIALS.NAME, ' +
       ' GRMATERIALS.PROP_STEELMARK_C ';

  ADOQPipe.Active := true;
  for i:=1 to ADOQPipe.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQPipe.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,5].Value2 :=  ADOQPipe['PROP_WTHICK'];
    Sheet.Cells.Item[str_num,6].Value2 :=  ADOQPipe['PROP_DIAM'];
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQPipe.FieldByName('kol_sp_do').AsInteger) ;
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQPipe.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQPipe.FieldByName('date_sp_do').AsDateTime);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQPipe.FieldByName('kol_sp_do').AsInteger;
     ADOQPipe.Next;
   end;
   if ADOQPipe.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
      tot_kol_sht := 0;
      ADOQPipe.Active := false;
    end;

 //2) ÿ¬≈ÀÀ≈–
  ADOQChannel.Active := false;
  ADOQChannel.SQL.Clear;
  ADOQChannel.SQL.Text := ' SELECT ' +
            ' count(SP_DO.NREC) as kol_sp_do, SUM(SP_DO.KOLT) as weight, MAX(SP_DO.DATEF) as date_sp_do, ' +
            ' PARENT_GRMATERIALS.NAME as parent_name, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_PROFNUM ' +
          ' FROM ' +
            ' cmknew.GRMATERIALS  parent_grmaterials, ' +
            ' cmknew.GRMATERIALS, ' +
            ' CMKNEW.SPPASSPORTS, ' +
            ' CMKNEW.SPPASSPORTS SP_DO, ' +
            ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
         ' WHERE ' +
            ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
            ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
            ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT '+
            ' and PARENT_GRMATERIALS.NREC=11 ' +
            ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
            ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
         ' GROUP BY ' +
            ' PARENT_GRMATERIALS.NAME, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_PROFNUM ';

  ADOQChannel.Active := true;
  for i:=1 to ADOQChannel.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQChannel.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,3].Value2 :=  ADOQChannel.FieldByName('PROP_PROFNUM').AsString;
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQChannel.FieldByName('kol_sp_do').AsInteger) ;
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQChannel.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQChannel.FieldByName('date_sp_do').AsDateTime);
    Sheet.Cells.Item[str_num,12].Value2 :=  FloatToStr(ADOQChannel.FieldByName('weight').AsFloat);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQChannel.FieldByName('kol_sp_do').AsInteger;
     tot_massa := tot_massa + ADOQChannel['weight'];
     ADOQChannel.Next;
   end;
   if ADOQChannel.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
     Sheet.Cells.Item[str_num,12].Value2 := FloatToStr(tot_massa);
      tot_kol_sht := 0;
      tot_massa := 0;
      ADOQChannel.Active := false;
    end;

//3) √Õ”“€… œ–Œ‘»À‹
  ADOQRollFormedS.Active := false;
  ADOQRollFormedS.SQL.Clear;
  ADOQRollFormedS.SQL.Text := ' SELECT ' +
           ' count(SP_DO.NREC) as sp_do_kol, ' +
           ' SUM(SP_DO.KOLT) as weight, ' +
           ' MAX(SP_DO.DATEF) as sp_do_date, ' +
           ' PARENT_GRMATERIALS.NAME as parent_name, ' +
           ' GRMATERIALS.NAME, ' +
           ' GRMATERIALS.PROP_STEELMARK_C, ' +
           ' GRMATERIALS.PROP_PROFTYPE_C, ' +
           ' GRMATERIALS.PROP_WTHICK, ' +
           ' GRMATERIALS.PROP_SIZE1, ' +
           ' GRMATERIALS.PROP_SIZE2 ' +
        ' FROM ' +
            ' cmknew.GRMATERIALS  parent_grmaterials, ' +
            ' cmknew.GRMATERIALS, ' +
            ' CMKNEW.SPPASSPORTS, ' +
            ' CMKNEW.SPPASSPORTS SP_DO, ' +
            ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
        ' WHERE ' +
            ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
            ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
            ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
            ' and PARENT_GRMATERIALS.NREC=6 ' +
            ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
            ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
         ' GROUP BY ' +
            ' PARENT_GRMATERIALS.NAME, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_PROFTYPE_C, ' +
            ' GRMATERIALS.PROP_WTHICK, ' +
            ' GRMATERIALS.PROP_SIZE1, ' +
            ' GRMATERIALS.PROP_SIZE2 ';
  ADOQRollFormedS.Active := true;
  for i:=1 to ADOQRollFormedS.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQRollFormedS.FieldByName('PROP_PROFTYPE_C').AsString;
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQRollFormedS.FieldByName('sp_do_kol').AsInteger);
    Sheet.Cells.Item[str_num,5].Value2 :=  FloatToStr(ADOQRollFormedS.FieldByName('PROP_WTHICK').AsFloat);
    Sheet.Cells.Item[str_num,7].Value2 :=  FloatToStr(ADOQRollFormedS.FieldByName('PROP_SIZE1').AsFloat);
    Sheet.Cells.Item[str_num,8].Value2 :=  FloatToStr(ADOQRollFormedS.FieldByName('PROP_SIZE2').AsFloat);
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQRollFormedS.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQRollFormedS.FieldByName('sp_do_date').AsDateTime);
    Sheet.Cells.Item[str_num,12].Value2 :=  FloatToStr(ADOQRollFormedS.FieldByName('weight').AsFloat);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQRollFormedS.FieldByName('sp_do_kol').AsInteger;
     tot_massa := tot_massa + ADOQRollFormedS['weight'];
     ADOQRollFormedS.Next;
   end;
   if ADOQRollFormedS.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
     Sheet.Cells.Item[str_num,12].Value2 := FloatToStr(tot_massa);
      tot_kol_sht := 0;
      tot_massa := 0;
      ADOQRollFormedS.Active := false;
    end;

 //4)  ¬¿ƒ–¿“
    ADOQSquare.Active := false;
    ADOQSquare.SQL.Clear;
    ADOQSquare.SQL.Text := ' SELECT ' +
           ' count(SP_DO.NREC) as sp_do_kol, ' +
           ' SUM(SP_DO.KOLT) as weight, ' +
           ' MAX(SP_DO.DATEF) as sp_do_date, ' +
           ' PARENT_GRMATERIALS.NAME as parent_name, ' +
           ' GRMATERIALS.NAME, ' +
           ' GRMATERIALS.PROP_STEELMARK_C, ' +
           ' GRMATERIALS.PROP_SIZE ' +
        ' FROM ' +
            ' cmknew.GRMATERIALS  parent_grmaterials, ' +
            ' cmknew.GRMATERIALS, ' +
            ' CMKNEW.SPPASSPORTS, ' +
            ' CMKNEW.SPPASSPORTS SP_DO, ' +
            ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
        ' WHERE ' +
            ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
            ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
            ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
            ' and PARENT_GRMATERIALS.NREC=5 ' +
            ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
            ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
         ' GROUP BY ' +
            ' PARENT_GRMATERIALS.NAME, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_SIZE ';
  ADOQSquare.Active := true;
  for i:=1 to ADOQSquare.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQSquare.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQSquare.FieldByName('sp_do_kol').AsInteger);
    Sheet.Cells.Item[str_num,4].Value2 :=  FloatToStr(ADOQSquare.FieldByName('PROP_SIZE').AsFloat);
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQSquare.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQSquare.FieldByName('sp_do_date').AsDateTime);
    Sheet.Cells.Item[str_num,12].Value2 :=  FloatToStr(ADOQSquare.FieldByName('weight').AsFloat);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQSquare.FieldByName('sp_do_kol').AsInteger;
     tot_massa := tot_massa + ADOQSquare['weight'];
     ADOQSquare.Next;
   end;
   if ADOQSquare.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
     Sheet.Cells.Item[str_num,12].Value2 := FloatToStr(tot_massa);
      tot_kol_sht := 0;
      tot_massa := 0;
      ADOQSquare.Active := false;
    end;

//5) “¿¬–Œ¬¿ﬂ ¡¿À ¿
    ADOQTBeam.Active := false;
    ADOQTBeam.SQL.Clear;
    ADOQTBeam.SQL.Text := ' SELECT ' +
           ' count(SP_DO.NREC) as sp_do_kol, ' +
           ' SUM(SP_DO.KOLT) as weight, ' +
           ' MAX(SP_DO.DATEF) as sp_do_date, ' +
           ' PARENT_GRMATERIALS.NAME as parent_name, ' +
           ' GRMATERIALS.NAME, ' +
           ' GRMATERIALS.PROP_STEELMARK_C, ' +
           ' GRMATERIALS.PROP_PROFNUM ' +
        ' FROM ' +
            ' cmknew.GRMATERIALS  parent_grmaterials, ' +
            ' cmknew.GRMATERIALS, ' +
            ' CMKNEW.SPPASSPORTS, ' +
            ' CMKNEW.SPPASSPORTS SP_DO, ' +
            ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
        ' WHERE ' +
            ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
            ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
            ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
            ' and PARENT_GRMATERIALS.NREC=8 ' +
            ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
            ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
         ' GROUP BY ' +
            ' PARENT_GRMATERIALS.NAME, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_PROFNUM ';
  ADOQTBeam.Active := true;
  for i:=1 to ADOQTBeam.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQTBeam.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,3].Value2 :=  ADOQTBeam.FieldByName('PROP_PROFNUM').AsString;
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQTBeam.FieldByName('sp_do_kol').AsInteger);
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQTBeam.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQTBeam.FieldByName('sp_do_date').AsDateTime);
    Sheet.Cells.Item[str_num,12].Value2 :=  FloatToStr(ADOQTBeam.FieldByName('weight').AsFloat);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQTBeam.FieldByName('sp_do_kol').AsInteger;
     tot_massa := tot_massa + ADOQTBeam['weight'];
     ADOQTBeam.Next;
   end;
   if ADOQTBeam.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
     Sheet.Cells.Item[str_num,12].Value2 := FloatToStr(tot_massa);
      tot_kol_sht := 0;
      tot_massa := 0;
      ADOQTBeam.Active := false;
    end;

//6) ƒ¬”“¿¬–Œ¬¿ﬂ ¡¿À ¿
    ADOQHBeam.Active := false;
    ADOQHBeam.SQL.Clear;
    ADOQHBeam.SQL.Text := ' SELECT ' +
           ' count(SP_DO.NREC) as sp_do_kol, ' +
           ' SUM(SP_DO.KOLT) as weight, ' +
           ' MAX(SP_DO.DATEF) as sp_do_date, ' +
           ' PARENT_GRMATERIALS.NAME as parent_name, ' +
           ' GRMATERIALS.NAME, ' +
           ' GRMATERIALS.PROP_STEELMARK_C, ' +
           ' GRMATERIALS.PROP_PROFNUM ' +
        ' FROM ' +
            ' cmknew.GRMATERIALS  parent_grmaterials, ' +
            ' cmknew.GRMATERIALS, ' +
            ' CMKNEW.SPPASSPORTS, ' +
            ' CMKNEW.SPPASSPORTS SP_DO, ' +
            ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
        ' WHERE ' +
            ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
            ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
            ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
            ' and PARENT_GRMATERIALS.NREC=9 ' +
            ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
            ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
         ' GROUP BY ' +
            ' PARENT_GRMATERIALS.NAME, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_PROFNUM ';
  ADOQHBeam.Active := true;
  for i:=1 to ADOQHBeam.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQHBeam.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,3].Value2 :=  ADOQHBeam.FieldByName('PROP_PROFNUM').AsString;
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQHBeam.FieldByName('sp_do_kol').AsInteger);
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQHBeam.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQHBeam.FieldByName('sp_do_date').AsDateTime);
    Sheet.Cells.Item[str_num,12].Value2 :=  FloatToStr(ADOQHBeam.FieldByName('weight').AsFloat);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQHBeam.FieldByName('sp_do_kol').AsInteger;
     tot_massa := tot_massa + ADOQHBeam['weight'];
     ADOQHBeam.Next;
   end;
   if ADOQHBeam.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
     Sheet.Cells.Item[str_num,12].Value2 := FloatToStr(tot_massa);
      tot_kol_sht := 0;
      tot_massa := 0;
      ADOQHBeam.Active := false;
    end;

//7) ”√ŒÀŒ 
    ADOQAngle.Active := false;
    ADOQAngle.SQL.Clear;
    ADOQAngle.SQL.Text := ' SELECT ' +
           ' count(SP_DO.NREC) as sp_do_kol, ' +
           ' SUM(SP_DO.KOLT) as weight, ' +
           ' MAX(SP_DO.DATEF) as sp_do_date, ' +
           ' PARENT_GRMATERIALS.NAME as parent_name, ' +
           ' GRMATERIALS.NAME, ' +
           ' GRMATERIALS.PROP_STEELMARK_C, ' +
           ' GRMATERIALS.PROP_WTHICK, ' +
           ' GRMATERIALS.PROP_PWIDTH1, ' +
           ' GRMATERIALS.PROP_PWIDTH2 ' +
        ' FROM ' +
            ' cmknew.GRMATERIALS  parent_grmaterials, ' +
            ' cmknew.GRMATERIALS, ' +
            ' CMKNEW.SPPASSPORTS, ' +
            ' CMKNEW.SPPASSPORTS SP_DO, ' +
            ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
        ' WHERE ' +
            ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
            ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
            ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
            ' and PARENT_GRMATERIALS.NREC=10 ' +
            ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
            ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
         ' GROUP BY ' +
            ' PARENT_GRMATERIALS.NAME, ' +
            ' GRMATERIALS.NAME, ' +
            ' GRMATERIALS.PROP_STEELMARK_C, ' +
            ' GRMATERIALS.PROP_WTHICK, ' +
            ' GRMATERIALS.PROP_PWIDTH1, ' +
            ' GRMATERIALS.PROP_PWIDTH2 ' ;
  ADOQAngle.Active := true;
  for i:=1 to ADOQAngle.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQAngle.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQAngle.FieldByName('sp_do_kol').AsInteger);
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQAngle.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQAngle.FieldByName('sp_do_date').AsDateTime);
    Sheet.Cells.Item[str_num,12].Value2 :=  FloatToStr(ADOQAngle.FieldByName('weight').AsFloat);
    Sheet.Cells.Item[str_num,5].Value2 :=  FloatToStr(ADOQAngle.FieldByName('PROP_WTHICK').AsFloat);
    Sheet.Cells.Item[str_num,7].Value2 :=  FloatToStr(ADOQAngle.FieldByName('PROP_PWIDTH1').AsFloat);
    Sheet.Cells.Item[str_num,8].Value2 :=  FloatToStr(ADOQAngle.FieldByName('PROP_PWIDTH2').AsFloat);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQAngle.FieldByName('sp_do_kol').AsInteger;
     tot_massa := tot_massa + ADOQAngle['weight'];
     ADOQAngle.Next;
   end;
   if ADOQAngle.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
     Sheet.Cells.Item[str_num,12].Value2 := FloatToStr(tot_massa);
      tot_kol_sht := 0;
      tot_massa := 0;
      ADOQAngle.Active := false;
    end;

//8)  –”√
  ADOQCircle.Active := false;
  ADOQCircle.SQL.Clear;
  ADOQCircle.SQL.Text :=' select COUNT(SP_DO.NREC) as kol_sp_do, SUM(SP_DO.KOLT), MAX(SP_DO.DATEF) as date_sp_do, ' +
                      ' PARENT_GRMATERIALS.NAME as parent_name, ' +
                      ' GRMATERIALS.PROP_DIAM, ' +
                      ' GRMATERIALS.NAME, ' +
                      ' GRMATERIALS.PROP_STEELMARK_C ' +
                      ' from cmknew.GRMATERIALS  parent_grmaterials, ' +
                      ' cmknew.GRMATERIALS, ' +
                      ' CMKNEW.SPPASSPORTS, ' +
                      ' CMKNEW.SPPASSPORTS SP_DO, ' +
                      ' CMKNEW.passports left join  cmknew.sparrivals on PASSPORTS.CSPARRIVALS=SPARRIVALS.nrec ' +
                      ' where ' +
                      ' PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS '  +
                      ' and SPPASSPORTS.CSPPASSPORTS=sp_do.nrec ' +
                      ' and PARENT_GRMATERIALS.NREC=GRMATERIALS.CPARENT ' +
                      ' and PARENT_GRMATERIALS.NREC=100 ' +
//                      ' and passports.spent=0 ' +
                      ' and SPARRIVALS.CGRMATERIALS = GRMATERIALS.NREC ' +
                      ' AND SP_DO.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
       ' GROUP BY  PARENT_GRMATERIALS.NAME, ' +
       ' GRMATERIALS.PROP_DIAM, ' +
       ' GRMATERIALS.NAME, ' +
       ' GRMATERIALS.PROP_STEELMARK_C ';

  ADOQCircle.Active := true;
  for i:=1 to ADOQCircle.RecordCount do
   begin
     Inc(str_num);
     Inc(count);
    Sheet.Cells.Item[str_num,1].Value2 := IntToStr(count);
    Sheet.Cells.Item[str_num,2].Value2 :=  ADOQCircle.FieldByName('parent_name').AsString;
    Sheet.Cells.Item[str_num,6].Value2 :=  ADOQCircle['PROP_DIAM'];
    Sheet.Cells.Item[str_num,9].Value2 :=  IntToStr(ADOQCircle.FieldByName('kol_sp_do').AsInteger) ;
    Sheet.Cells.Item[str_num,10].Value2 :=  ADOQCircle.FieldByName('PROP_STEELMARK_C').AsString;
    Sheet.Cells.Item[str_num,11].Value2 :=  DateTimeToStr(ADOQCircle.FieldByName('date_sp_do').AsDateTime);
    Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     tot_kol_sht:=tot_kol_sht + ADOQCircle.FieldByName('kol_sp_do').AsInteger;
     ADOQCircle.Next;
   end;
   if ADOQCircle.RecordCount>0 then
    begin
      Inc(str_num);
     Sheet.Cells.Item[str_num,2].Value2 :=  '»“Œ√Œ:';
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Font.Bold :=  true;
     Sheet.Range['B'+IntToStr(str_num)+':H'+IntToStr(str_num), EmptyParam].MergeCells :=  true;
     Sheet.Range['A'+IntToStr(str_num)+':M'+IntToStr(str_num), EmptyParam].Borders.Weight:=2;
     Sheet.Cells.Item[str_num,9].Value2 := FloatToStr(tot_kol_sht);
      tot_kol_sht := 0;
      ADOQCircle.Active := false;
    end;

    Excel.Visible[LOCALE_USER_DEFAULT] := true;
    Excel.Disconnect;
    Excel.Free;

  Self.Close;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
 Form5.Close;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form5 := nil;
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
  d : TDateTime;
  j : integer;
begin
   DecodeDate(Now,Year,Month,Day);
   Form5.DateTimePicker1.Date:=EncodeDate(Year,Month,1);
   j:=31;
end;

end.
