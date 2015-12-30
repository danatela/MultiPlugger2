unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB, ComObj,
  Vcl.ComCtrls, Vcl.ExtCtrls, GlobVars, ExcelXP;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    ADOQNonExpend: TADOQuery;
    ADOQGrSort: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
 i, j, n, m, pos : integer;
 excel : TExcelApplication;
 Sheet: _Worksheet;
 tot_kol, fin_kol : real;
 str: string;
 size : string;
begin
 n := 0; m:=6; pos:=0;
 tot_kol := 0; fin_kol:=0;
 str := ''; size := '';
 ADOQGrSort.Active := false;
 ADOQGrSort.SQL.Clear;
 ADOQGrSort.SQL.Text := 'SELECT COUNT (GRMATERIALS.NAME), GRMATERIALS.NAME FROM CMKNEW.GRMATERIALS ' +
                            ' GROUP BY GRMATERIALS.NAME ' +
                            ' ORDER BY GRMATERIALS.NAME';
 ADOQGrSort.Active := true;
 ADOQGrSort.First;

  excel := TExcelApplication.Create(Self);
  Excel.Connect;
  Sheet := Excel.WorkBooks.Add(EmptyParam, LOCALE_USER_DEFAULT).ActiveSheet as _Worksheet;
    Sheet.Cells.Item[4,4].Value2 := 'Ã≈“¿ÀÀŒœ–Œ ¿“, œŒ—“”œ»¬ÿ»… ¬ œ–Œ»«¬Œƒ—“¬Œ, ÕŒ Õ≈»«–¿—’ŒƒŒ¬¿ÕÕ€…';
    Sheet.Cells.Item[5,4].Value2 := '                          Ì‡ ‰‡ÚÛ ' + DateToStr(DateTimePicker1.Date);

    Sheet.Range['A6', 'G6'].Borders.Weight := 2;
    Sheet.Cells.Item[6,1].Value2 := 'π Ô/Ô';
    Sheet.Cells.Item[6,1].WrapText := true;
    Sheet.Cells.Item[6,1].ColumnWidth :=5;

    Sheet.Cells.Item[6,2].Value2 := 'Ã‡ÍËÓ‚Í‡';
    Sheet.Cells.Item[6,2].WrapText := true;
    Sheet.Cells.Item[6,2].ColumnWidth :=15;

    Sheet.Cells.Item[6,3].Value2 := 'ƒ‡Ú‡ Ô‡ÒÔÓÚ‡';
    Sheet.Cells.Item[6,3].WrapText := true;
    Sheet.Cells.Item[6,3].ColumnWidth :=15;

    Sheet.Cells.Item[6,4].Value2 := 'Õ‡ËÏÂÌÓ‚‡ÌËÂ';
    Sheet.Cells.Item[6,4].WrapText := true;
    Sheet.Cells.Item[6,4].ColumnWidth :=45;

    Sheet.Cells.Item[6,5].Value2 := '–‡ÁÏÂ˚';
    Sheet.Cells.Item[6,5].WrapText := true;
    Sheet.Cells.Item[6,5].ColumnWidth :=20;

    Sheet.Cells.Item[6,6].Value2 := 'Ã‡Í‡ ÒÚ‡ÎË';
    Sheet.Cells.Item[6,6].WrapText := true;
    Sheet.Cells.Item[6,6].ColumnWidth :=10;

    Sheet.Cells.Item[6,7].Value2 := 'Ã‡ÒÒ‡, Ú';
    Sheet.Cells.Item[6,7].WrapText := true;
    Sheet.Cells.Item[6,7].ColumnWidth :=10;
    Sheet.Range['A6', 'G6'].HorizontalAlignment := xlCenter;

 for i := 1 to ADOQGrSort.Recordcount do
   begin
   if ADOQGrSort['NAME']<>'' then
    begin
      ADOQNonExpend.Active := false;
      ADOQNonExpend.SQL.Clear;
      ADOQNonExpend.SQL.Text := ' select SPPASSPORTS.MARKIR, SPPASSPORTS.NAME, SPPASSPORTS.PROP_THICK_C, SPPASSPORTS.PROP_WIDTH_C, ' +
                              ' SPPASSPORTS.PROP_SLENGTH,  SPPASSPORTS.PROP_LENGTH_C, SPPASSPORTS.PROP_DIAM, ' +
                              ' SPPASSPORTS.PROP_PWIDTH1, SPPASSPORTS.PROP_PWIDTH2, SPPASSPORTS.PROP_WTHICK, ' +
                              ' SPPASSPORTS.PROP_SIZE, SPPASSPORTS.PROP_SIZE1, SPPASSPORTS.PROP_SIZE2, SPPASSPORTS.KOLT, ' +
                              ' SPPASSPORTS.DATEF, PASSPORTS.SPENT, SPARRIVALS.GRMATERIALS_S , SPARRIVALS.KOLT, GRMATERIALS.PROP_STEELMARK_C ' +
                              ' from cmknew.passports, CMKNEW.SPPASSPORTS, cmknew.arrivals, CMKNEW.SPARRIVALS, CMKNEW.GRMATERIALS ' +
                              ' where PASSPORTS.NREC=SPPASSPORTS.CPASSPORTS ' +
                              ' and PASSPORTS.SPENT=0 ' +
                              ' and ARRIVALS.NREC=SPARRIVALS.CARRIVALS ' +
                              ' and PASSPORTS.CSPARRIVALS = sparrivals.nrec ' +
                              ' and SPARRIVALS.CGRMATERIALS=grmaterials.nrec ' +
                              ' and SPPASSPORTS.DATEF <=''' + DateToStr(DateTimePicker1.Date) + ''' ' +
                              ' and SPPASSPORTS.NAME=''' + ADOQGrSort.FieldByName('NAME').AsString + ''' ' +
                              ' order by SPPASSPORTS.PROP_THICK_C ';
       ADOQNonExpend.Active := true;
       ADOQNonExpend.First;

      if ADOQNonExpend.RecordCount>0 then
        begin
        ADOQNonExpend.First;
         for j := 1 to ADOQNonExpend.RecordCount do
          begin
          Inc(n);
          size :='';
             Sheet.Range['A'+IntToStr(m+j), 'G'+IntToStr(m+j)].Borders.Weight:=2;
             Sheet.Cells.Item[m+j,1].Value2 := IntToStr(n);
             Sheet.Cells.Item[m+j,2].Value2 := ADOQNonExpend.FieldByName('markir').AsString;
             Sheet.Cells.Item[m+j,3].Value2 := ADOQNonExpend.FieldByName('datef').AsDateTime;
             Sheet.Cells.Item[m+j,4].Value2 := ADOQNonExpend.FieldByName('NAME').AsString;
             if ADOQNonExpend.FieldByName('PROP_THICK_C').AsString<>'0' then
              size:=ADOQNonExpend.FieldByName('PROP_THICK_C').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_WIDTH_C').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_WIDTH_C').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_length_C').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_length_C').AsString +'*';
             if ADOQNonExpend.FieldByName('prop_pwidth2').AsString <>'0' then
              size:=size+ADOQNonExpend.FieldByName('prop_pwidth2').AsString +'*';
             if ADOQNonExpend.FieldByName('PROP_WTHICK').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_WTHICK').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_diam').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_diam').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_slength').AsString <>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_slength').AsString +'*';
             if ADOQNonExpend.FieldByName('PROP_SIZE').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_SIZE').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_PWIDTH1').AsString<>'0' then
              size:=size + ADOQNonExpend.FieldByName('PROP_PWIDTH1').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_SIZE').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_SIZE').AsString+'*';
             if ADOQNonExpend.FieldByName('PROP_SIZE1').AsString<>'0' then
              size:=size+ADOQNonExpend.FieldByName('PROP_SIZE1').AsString + '*';
              size := size+'0';
             Sheet.Cells.Item[m+j,5].Value2 := size;
             Sheet.Cells.Item[m+j,6].Value2 := ADOQNonExpend.FieldByNAme('PROP_STEELMARK_C').AsString;
             Sheet.Cells.Item[m+j,7].NumberFormat:='0,000';
             Sheet.Cells.Item[m+j,7].Value2 := ADOQNonExpend['KOLT'];
             tot_kol := tot_kol + ADOQNonExpend['KOLT'];
             str:='';
           ADOQNonExpend.Next;
          end;
          m:=ADOQNonExpend.RecordCount + m;
          Inc(m);
          fin_kol:=fin_kol+tot_kol;
          Sheet.Cells.Item[m,1].Value2 := '»“Œ√Œ';
          Sheet.Cells.Item[m,1].Font.Bold := true;
          Sheet.Cells.Item[m,7].Font.Bold := true;
          Sheet.Cells.Item[m,7].Value2 := tot_kol;
          Sheet.Cells.Item[m,7].NumberFormat:='0,000';
          tot_kol := 0;
        end;
     ADOQGrSort.Next;
   end
      else
    ADOQGrSort.Next;
 end;
Inc(m);
          Sheet.Cells.Item[m,1].Font.Bold := true;
          Sheet.Cells.Item[m,7].Font.Bold := true;

Sheet.Cells.Item[m,1].Value2 := 'Œ¡Ÿ»… »“Œ√';
Sheet.Cells.Item[m,7].NumberFormat:='0,000';
Sheet.Cells.Item[m,7].Value2 := fin_kol;
Excel.Visible[LOCALE_USER_DEFAULT] := true;
Excel.Disconnect;
Excel.Free;
Self.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 Self.Close;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Form3 := nil;
end;

procedure TForm3.FormCreate(Sender: TObject);
var
  Year, Month, Day : word;
  d : TDateTime;
  j : integer;
begin
   DecodeDate(Now,Year,Month,Day);
   Self.DateTimePicker1.Date:=EncodeDate(Year,Month,1);
   j:=31;
   ADOQNonExpend.Connection := Host.ADOC;
   ADOQGrSort.Connection := Host.ADOC;
end;

end.
