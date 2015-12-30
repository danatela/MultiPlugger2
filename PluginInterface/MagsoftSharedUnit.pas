unit MagsoftSharedUnit;

interface

Uses Variants, GlobVars, SysUtils, Windows, Forms, ComObj, Dialogs,
  CommonFunctions, StdCtrls, ExtCtrls, Mask, Buttons, JvBaseEdits, Controls,
  ADODB, IniFiles, Registry, Classes, MemTableEh, Vcl.Graphics, Vcl.ComCtrls,
  ActiveX, DB, ShellApi, MagsoftWaitDialog, DBGridEh, UPlugin;

Procedure ReadOnlyColorsUpdateForGrid(Var Grid: TDBGridEh;
  EditColor, ROColor: TColor; ForcedRO: boolean = False);
function IniReadBool(const FileName, Section, Line: string;
  Var Value: boolean): boolean;
function IniWriteBool(const FileName, Section, Line: string;
  Value: boolean): boolean;
Function Kopeek(s: currency): integer;
Function Empty(s: string): boolean;
Function Cifry(s: string): boolean;
Function StrToIntM(s: string): integer;
Function GoodInteger(s: string): boolean;
Function GetCod(s: string; Var bez: string): string;
Function Padl(s: string; n: integer; c: Char): string;
Function Padr(s: string; n: integer; c: Char): string;
Function NumOfChar(c: Char; s: string): integer;
Function GetLastCharNum(c: Char; s: string): integer;
Function GetLastWord(s: string): string;
Function BezLastWord(s: string): string;
Function GetOkonchanie(s: string; n: integer): string;
Function Quoted(s: string): string;
Function DeQuoted(s: string): string;
// Function ReplChars(s:string;c1,c2:Char):string;
procedure CompressBase(Base: string);
Function LostTime(Past, PastPr, FullPr: integer): integer;
Function SecToTime(sec: integer): string;
Function StrToDateM(s: string): TDateTime;
Function DaysInYear(year: word): integer;
Function FirstDayOfYear(year: word): TDateTime;
Function LastDayOfYear(year: word): TDateTime;
Procedure ToLog(s: string; rewrit: boolean = False);
Function BlockedFile(fn: string): boolean;
Function XmlChars(s: string): string;
Function AddSlashes(s: string): string;
Function AddSlashes2(s: string): string;
Function IsKeyDown(vk: word): boolean;
function GetCaretPos(edt: TEdit): integer; overload;
function GetCaretPos(edt: TLabeledEdit): integer; overload;
function GetCaretPos(edt: TMaskEdit): integer; overload;
function GetCaretPos(edt: TComboBox): integer; overload;
Function DivDOCSh(s: string; Var s1: string; Var s2: string;
  Var s3: string): boolean;
Function DivDOC(kodnom: string; Var kod: string; Var nom: string): boolean;
Function GetFirstKod(s: string): string;
Function Cutt(s: string; n: integer): string;
Function a2r(arabb: string): string;
Function GetLatestInsertId(adoc: TAdoConnection): integer;
Function FullRightsForDir(dir: string): boolean;
Procedure DivDolya(dolya: string; Var chislitel, znamenatel: currency);
Function MyDateToStr(d: TDateTime): string;
Function MyBoolToStr(bl: boolean): string;
Function GetTextValueOfPointer(Pointr, Table, NrecName, TextFldName: string;
  StrPointer: boolean = False): string;
Function GetTextValueOfPointerADOC(adoc: TAdoConnection;
  Pointr, Table, NrecName, TextFldName: string;
  StrPointer: boolean = False): string;
function RoundUp(X: Extended): int64;
Function RoundCurrency(c: currency): currency;
Function StrToCurrM(s: string): currency;
Function StrToFloatM(s: string): double;
function GoodCurrency(s: string): boolean;
Function InstalledWord: boolean;
Function InstalledExcel: boolean;
Procedure DivString(s: string; Var s1, s2: string; maxs1: integer);
function IniReadString(const FileName, Section, Line: string;
  Var Value: string): boolean;
function IniWriteString(const FileName, Section, Line, Value: string): boolean;
Function SetRegKey(Key: string; Value: string): boolean;
Function GetNextWord(s: string; Var i: integer; r: Char): string;
Function TrimCommas(s: string): string;
Procedure GetFS(s: string; Var fi: string; Var se: string);
Function TrueCod(c, pagc: byte): byte;
Function TrueCodS(s: string; pagc: byte): string;
Function GetStrValue(nodevalue: Variant): string;
Function KillChars(s: string; c: Char): string;
Function AutoUpdateKadnum(kadnum: string): string;
Function SocrFIO(s1, s2, s3: string): string;
Function MVDate(d: TDateTime; Postfix: string): string;
Function CommonDate(d: TDateTime; Postfix: string = ''): string;
function GetCurrentUserName(var CurrentUserName: string): boolean;
Function HidePassInConStr(s: string): string;
Function ActiveOwner(date1, date2: TDateTime): boolean;
Procedure DivCurrency(s: string; Var s1, s2: string);
Function FullMonthesCount(pravdate1, pravdate2, repdate1, repdate2: TDateTime;
  day15, lg: boolean): integer;
Function ActiveOwner2(date1, date2, pdate1, pdate2: TDateTime): boolean;
Function ActiveOwner3(date1, date2: TDateTime; NMonth, NYear: word): boolean;
procedure KoefToDrob(fl: currency; Var m, n: string);
Function UniMTEToExcel(Sender: TComponent; MTE: TMemTableEh;
  filenam: string): boolean;
function DelDir(dir: string): boolean;
Function MyMkDir(dir: string): boolean;
function OkonchEQ(s, o: string): boolean;
function CharN(s: string; n: integer): string;
Procedure LookupItemToForm(Var cb: TComboBox; Var ADOQ: TAdoQuery; link: int64;
  txt1: string = 'name'; txt2: string = ''; txt12: string = '';
  tree: boolean = False; EmptyText: string = ''; txt3: string = '');
Procedure LookupItemToFormNew(Var cb: TComboBox; Var ADOQ: TAdoQuery;
  link: int64; fields, delims: string);
Procedure LookupItemToForm2(cb: TComboBox; ADOQ: TAdoQuery; link: int64;
  txt1: string = 'name'; txt2: string = ''; txt12: string = '';
  tree: boolean = False; EmptyText: string = ''; txt3: string = '');
// Function LookupItemFromForm(Text:string;Var ADOQ:TAdoQuery;TableName:string;ReadOnly:boolean=False;tree:boolean=False):string;
Function LookupItemFromForm2(ItemIndex: integer; Var ADOQ: TAdoQuery;
  TableName: string; tree: boolean = False): int64;
Function GetPropDescr(PName: string): string;
Procedure FreqInc(Table: string; Nrec: int64);
Function ReplChars(s: string; c1, c2: string): string;
Function GetTableDescription(Table: string): string;
Function GetOperTypeDescription(oper: integer): string;
Function GetFirstWordInCommaText(s: string): string;
Function OraInsertRecordAnGetID(adoc: TAdoConnection;
  TableName, PKFieldName, SEQName: string; fields: string = '';
  Values: string = ''): LargeInt;
Function OraGetNextIntValueForField(adoc: TAdoConnection;
  TableName, FieldName, DateFieldName: string; date1, date2: TDateTime)
  : LargeInt;
Procedure GetPropListOfGRMATERIAL(CMATERIAL: int64; Var PropList: TStringList);
Procedure ColumnVis(Var Grid: TDBGridEh; ColumnName: string; vis: boolean);
Procedure GetPropListOfMATERIAL2(CMATERIAL: int64; Var PropList: TStringList);
Function CharEncoder(n: int64; Var alphavit: string): string;
Procedure KillPassportSpec(spNREC: int64);
Procedure ReplEmptyToSpace(Var DataSet: TDataSet; FieldName: string);
Function GetCurrentPlan(date: TDateTime): int64;
Function UniCheckLinks(LTable, LField: string; Nrec: int64): boolean;
Procedure ColumnReadOnlyIfNotInList(Var Grid: TDBGridEh;
  Var ExclColumnNameList: TStringList);
Procedure ControlDisabledIfNotInList(Form: TWinControl;
  Var ExclControlNameList: TStringList);

implementation

Function UniCheckLinks(LTable, LField: string; Nrec: int64): boolean;
Var
  ADOQ: TAdoQuery;
Begin
  ADOQ := TAdoQuery.Create(nil);
  ADOQ.Connection := Host.adoc;
  ADOQ.CursorLocation := clUseServer;
  ADOQ.SQL.Text := 'select count(*) as cnt from ' + SchemaName + LTable +
    ' where ' + LField + '=' + IntToStr(Nrec);
  ADOQ.Open;
  result := (ADOQ['cnt'] = 0);
  ADOQ.Close;
  ADOQ.Free;
End;

Function GetCurrentPlan(date: TDateTime): int64;
Var
  y, m, d: word;
  ADOQ: TAdoQuery;
Begin
  result := 0;
  DecodeDate(date, y, m, d);
  ADOQ := TAdoQuery.Create(nil);
  ADOQ.Connection := Host.adoc;
  ADOQ.SQL.Text := 'select * from ' + SchemaName + 'PLANS' + ' where PYEAR=' +
    IntToStr(y) + andd + 'PMONTH=' + IntToStr(y);
  ADOQ.Open;
  If ADOQ.RecordCount = 1 then
  Begin
    result := ADOQ['nrec'];
  End;
  ADOQ.Close;

  if result = 0 then
  Begin
    ADOQ.SQL.Text := 'select * from ' + SchemaName + 'PLANS' + ' where PYEAR=' +
      IntToStr(y) + orr + 'PYEAR=' + IntToStr(y - 1) + orr + 'PYEAR=' +
      IntToStr(y + 1) + ' order by PYEAR DESC,PMONTH DESC';
    ADOQ.Open;
    If ADOQ.RecordCount > 0 then
    Begin
      result := ADOQ['nrec'];
    End;
    ADOQ.Close;
  End;
  ADOQ.Free;
End;

Procedure ReplEmptyToSpace(Var DataSet: TDataSet; FieldName: string);
begin
  Try
    if VarIsNull(DataSet[FieldName]) or (VarToStr(DataSet[FieldName]) = EmptyStr)
    then
      DataSet[FieldName] := space;
  Except
  End;
end;

Procedure KillPassportSpec(spNREC: int64);
Var
  ADOQ: TAdoQuery;
  l: TStringList;
  i: integer;
Begin
  if spNREC <> 0 then
  Begin
    l := TStringList.Create;
    ADOQ := TAdoQuery.Create(nil);
    ADOQ.Connection := Host.adoc;
    ADOQ.SQL.Text := 'select * from ' + SchemaName + 'SPPASSPORTS' +
      ' where CSPPASSPORTS=' + IntToStr(spNREC);
    ADOQ.Open;
    while Not ADOQ.Eof do
    Begin
      l.Append(VarToStr(ADOQ['nrec']));
      ADOQ.Next;
    End;
    ADOQ.Close;
    ADOQ.Free;
    for i := 0 to l.Count - 1 do
      KillPassportSpec(StrToIntM(l[i]));
    l.Free;
    Host.adoc.Execute('delete from ' + SchemaName + 'SPPASSPORTS' +
      ' where NREC=' + IntToStr(spNREC));
  End;
End;

Function CharEncoder(n: int64; Var alphavit: string): string;
Var
  l, ost: integer;
Begin
  result := EmptyStr;
  if n = 0 then
    Inc(n);
  l := Length(alphavit);
  // ShowMessage('n='+IntToStr(n)+', '+'alphavit='+alphavit+', '+'l='+IntToStr(l)+'ost='+IntToStr(ost));
  if l > 1 then
  Begin
    // ShowMessage('n='+IntToStr(n)+', '+'alphavit='+alphavit+', '+'l='+IntToStr(l)+'ost='+IntToStr(ost));
    repeat
      ost := n mod l;
      if ost = 0 then
        ost := l;

      // if Not FromZero then Dec(ost);
      result := alphavit[ost] + result;
      // result:=IntToStr(ost)+','+result;
      n := (n - 1) div l;
      // ShowMessage('n='+IntToStr(n)+', '+'result='+result+', '+'l='+IntToStr(l)+'ost='+IntToStr(ost));
    until (n = 0);
  End;
End;

Procedure GetPropListOfMATERIAL2(CMATERIAL: int64; Var PropList: TStringList);
Var
  i: integer;
  cparent: int64;
  PList: TStringList;
Begin
  // ShowMessage('CMATERIAL='+IntToStr(CMATERIAL));
  if CMATERIAL <> 0 then
  Begin
    PList := TStringList.Create;
    cparent := StrToIntM(GetTextValueOfPointer(IntToStr(CMATERIAL),
      SchemaName + 'GRMATERIALS', 'nrec', 'cparent', False));
    // ShowMessage('cparent='+IntToStr(cparent));
    PList.CommaText := UpperCase(GetTextValueOfPointer(IntToStr(cparent),
      SchemaName + 'MATERIALS', 'nrec', 'CHILDPROP', False));
    // ShowMessage('PList.CommaText='+PList.CommaText);
    for i := 0 to PList.Count - 1 do
      if PropList.IndexOf(PList[i]) = -1 then
        PropList.Append(PList[i]);
    PList.Free;
  End;
  // for i:=0 to PropList.Count-1 do PropList.Strings[i]:=UpperCase(
End;

Function OraInsertRecordAnGetID(adoc: TAdoConnection;
  TableName, PKFieldName, SEQName: string; fields: string = '';
  Values: string = ''): LargeInt;
Var
  ADOQ: TAdoQuery;
Begin
  ADOQ := TAdoQuery.Create(nil);
  ADOQ.Connection := adoc;
  ADOQ.Parameters.CreateParameter('nrec', ftLargeInt, pdOutput, 0, 0);
  if Not Empty(fields) then
    fields := comma + fields;
  if Not Empty(Values) then
    Values := comma + Values;
  ADOQ.SQL.Text := 'begin insert into ' + TableName + ' (' + PKFieldName +
    fields + ') VALUES (' + SEQName + '.nextval' + Values + ') returning ' +
    PKFieldName + ' into :nrec; commit; end;';
  Try
    ADOQ.ExecSQL;
    result := ADOQ.Parameters.ParamValues['nrec'];
  Except
    result := 0;
  End;
  ADOQ.Free;
End;

Function OraGetNextIntValueForField(adoc: TAdoConnection;
  TableName, FieldName, DateFieldName: string; date1, date2: TDateTime)
  : LargeInt;
Var
  ADOQ: TAdoQuery;
  wh: string;
Begin
  ADOQ := TAdoQuery.Create(nil);
  ADOQ.Connection := adoc;
  if Not Empty(DateFieldName) then
  Begin
    ADOQ.Parameters.CreateParameter('mind', ftDateTime, pdInput, 0,
      Trunc(date1));
    ADOQ.Parameters.CreateParameter('maxd', ftDateTime, pdInput, 0,
      Trunc(date2) + 0.99999);
    wh := ' where ' + DateFieldName + '>=:mind and ' + DateFieldName +
      '<=:maxd';
  End
  else
    wh := EmptyStr;
  ADOQ.SQL.Text := 'select Max(' + FieldName + ') as mnum from ' +
    TableName + wh;
  ADOQ.CursorLocation := clUseServer;
  ADOQ.Open;
  result := ADOQ['mnum'] + 1;
  ADOQ.Close;
  ADOQ.Free;
End;

Procedure GetPropListOfGRMATERIAL(CMATERIAL: int64; Var PropList: TStringList);
Var
  i: integer;
  cparent: int64;
Begin
  PropList.Clear;
  // ShowMessage('CMATERIAL='+IntToStr(CMATERIAL));
  if CMATERIAL <> 0 then
  Begin
    cparent := StrToIntM(GetTextValueOfPointer(IntToStr(CMATERIAL),
      SchemaName + 'GRMATERIALS', 'nrec', 'cparent', False));
    // ShowMessage('cparent='+IntToStr(cparent));
    PropList.CommaText := UpperCase(GetTextValueOfPointer(IntToStr(cparent),
      SchemaName + 'MATERIALS', 'nrec', 'CHILDPROP', False));
    // ShowMessage('PropList.Text='+PropList.CommaText);
  End;
  // for i:=0 to PropList.Count-1 do PropList.Strings[i]:=UpperCase(
End;

Procedure ColumnVis(Var Grid: TDBGridEh; ColumnName: string; vis: boolean);
var
  i: integer;
begin
  ColumnName := UpperCase(ColumnName);
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    if UpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].Visible := vis;
      Break;
    end;
  end;
end;

Procedure ColumnReadOnlyIfNotInList(Var Grid: TDBGridEh;
  Var ExclColumnNameList: TStringList);
var
  i: integer;
  ColumnName: string;
begin
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    ColumnName := UpperCase(Grid.Columns[i].FieldName);
    Grid.Columns[i].ReadOnly := (ExclColumnNameList.IndexOf(ColumnName) = -1);
  end;
end;

Procedure ControlDisabledIfNotInList(Form: TWinControl;
  Var ExclControlNameList: TStringList);
var
  i: integer;
  ControlName: string;
begin
  for i := 0 to Form.ControlCount - 1 do
  begin
    if (Form.Controls[i] is TBitBtn) or (Form.Controls[i] is TLabeledEdit) or
      (Form.Controls[i] is TEdit) or (Form.Controls[i] is TJvCalcEdit) or
      (Form.Controls[i] is TLabel) or (Form.Controls[i] is TComboBox) then
    Begin
      ControlName := UpperCase(Form.Controls[i].Name);
      Form.Controls[i].Enabled :=
        (ExclControlNameList.IndexOf(ControlName) <> -1);
    End;
    if (Form.Controls[i] is TGroupBox) or (Form.Controls[i] is TPageControl) or
      (Form.Controls[i] is TTabSheet) or (Form.Controls[i] is TPanel) then
      ControlDisabledIfNotInList(Form.Controls[i] as TWinControl,
        ExclControlNameList);
  end;
end;

Procedure ReadOnlyColorsUpdateForGrid(Var Grid: TDBGridEh;
  EditColor, ROColor: TColor; ForcedRO: boolean = False);
var
  i: integer;
Begin
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    If Grid.Columns[i].ReadOnly or ForcedRO then
    Begin
      Grid.Columns[i].Color := ROColor;
      Grid.Columns[i].Footer.Color := ROColor;
    End
    else
    Begin
      Grid.Columns[i].Color := EditColor;
      Grid.Columns[i].Footer.Color := EditColor;
    End;
  end;
End;

Function GetFirstWordInCommaText(s: string): string;
Var
  j: integer;
Begin
  result := s;
  if Pos(comma, s) > 0 then
  Begin
    j := 1;
    result := Trim(GetNextWord(s, j, comma));
  End;
End;

Function GetOperTypeDescription(oper: integer): string;
Begin
  result := IntToStr(oper);
  case oper of
    0:
      result := 'добавление';
    1:
      result := 'изменение';
    2:
      result := 'удаление';
    3:
      result := 'вход в программу';
    4:
      result := 'выход из программы';
    5:
      result := 'запуск плагина';
  end;
End;

Function GetTableDescription(Table: string): string;
Begin
  Table := UpperCase(Trim(Table));
  result := Table;
  if Table = 'JOURNAL' then
    result := 'Журнал действий пользователей';
  if Table = 'PERSONS' then
    result := 'Справочник сотрудников';
  if Table = 'USERGROUPS' then
    result := 'Группы пользователей';
  if Table = 'WIDTHS' then
    result := 'Справочник возможных значений свойства "ширина" для материала';
  if Table = 'THICKS' then
    result := 'Справочник возможных значений свойства "толщина" для материала';
  if Table = 'LENGTHS' then
    result := 'Справочник возможных значений свойства "длина" для материала';
  if Table = 'CONTRACTORS' then
    result := 'Справочник поставщиков/получателей';
  if Table = 'NORMDOC' then
    result := 'Нормативная документация (ГОСТы)';
  if Table = 'STEELMARKS' then
    result := 'Марки стали';
  if Table = 'PROFTYPES' then
    result := 'Справочник видов профиля';
  if Table = 'CARVTYPES' then
    result := 'Справочник видов резьбы';
  if Table = 'FIXTYPES' then
    result := 'Справочник видов крепежа';
  if Table = 'MATERIALS' then
    result := 'Каталог материалов';
  if Table = 'OPERATIONS' then
    result := 'Справочник операций';
  if Table = 'SITES' then
    result := 'Справочник отделений (участков)';
  if Table = 'EQUIPMENT' then
    result := 'Справочник оборудования';
  if Table = 'OPEREQUIP' then
    result := 'Связи оборудования с операциями';
  if Table = 'MKGROUPS' then
    result := 'Справочник групп М/К';
  if Table = 'ZACHTYPES' then
    result := 'Справочник способов зачистки';
  if Table = 'ARRIVALS' then
    result := 'Приходы материалов в цех';
  if Table = 'KD' then
    result := 'Конструкторская документация';
  if Table = 'MARKS' then
    result := 'Список марок';
  if Table = 'DMARKS' then
    result := 'Перечень порядковых номеров деталей для каждой марки';
  if Table = 'DETAILS' then
    result := 'Описания деталей, входящих в заказ';

  if Table = 'PLANS' then
    result := 'Планы';
  if Table = 'SPPLANS' then
    result := 'Спецификации планов';
  if Table = 'ARRIVALS' then
    result := 'Задания на погрузку';
  if Table = 'SPARRIVALS' then
    result := 'Спецификации заданий на погрузку';
  if Table = 'PASSPORTS' then
    result := 'Паспорта материалов';
  if Table = 'SPPASSPORTS' then
    result := 'Спецификации паспортов';
  if Table = 'SPPASSPORTSD' then
    result := 'Детали, изготовленные из материалов';

  if result <> Table then
    result := result + ' (' + Table + ')';
End;

Function ReplChars(s: string; c1, c2: string): string;
Var
  i: integer;
Begin
  result := EmptyStr;
  i := 1;
  while (i <= Length(s)) do
  Begin
    if Pos(c1, Copy(s, i, Length(s) - i + 1)) = 1 then
    Begin
      result := result + c2;
      Inc(i, Length(c1));
    End
    else
    Begin
      result := result + s[i];
      Inc(i);
    End;
  End;
End;

Procedure FreqInc(Table: string; Nrec: int64);
Begin
  if Nrec <> 0 then
    Try
      Host.adoc.Execute('update ' + Table + ' set freq=freq+1 where nrec=' +
        IntToStr(Nrec));
    Except
    End;
End;

Function GetPropDescr(PName: string): string;
Begin
  PName := UpperCase(PName);
  result := PName;
  If PName = 'PROP_PROFNUM' then
    result := 'Номер профиля';
  If PName = 'PROP_STEELMARK' then
    result := 'Марка стали';
  If PName = 'PROP_STEELMARK_C' then
    result := 'Марка стали';
  If PName = 'PROP_NORMDOC0' then
    result := 'Нормативный документ по сортаменту';
  If PName = 'PROP_NORMDOC0_C' then
    result := 'Нормативный документ по сортаменту';
  If PName = 'PROP_NORMDOC1' then
    result := 'Нормативный документ по материалу';
  If PName = 'PROP_NORMDOC1_C' then
    result := 'Нормативный документ по материалу';
  If PName = 'PROP_LINEDENS' then
    result := 'Линейная плотность (кг/м)';
  If PName = 'PROP_PWIDTH1' then
    result := 'Ширина полки1 (мм)';
  If PName = 'PROP_PWIDTH2' then
    result := 'Ширина полки2 (мм)';
  If PName = 'PROP_SIZE1' then
    result := 'Размер1 (мм)';
  If PName = 'PROP_SIZE2' then
    result := 'Размер2 (мм)';
  If PName = 'PROP_WTHICK' then
    result := 'Толщина стенки (мм)';
  If PName = 'PROP_SLENGTH' then
    result := 'Длина (мм)';
  If PName = 'PROP_PROFTYPE' then
    result := 'Вид профиля';
  If PName = 'PROP_PROFTYPE_C' then
    result := 'Вид профиля';

  If PName = 'PROP_FIXTYPE' then
    result := 'Вид крепежа';
  If PName = 'PROP_FIXTYPE_C' then
    result := 'Вид крепежа';
  If PName = 'PROP_CARVTYPE' then
    result := 'Вид резьбы';
  If PName = 'PROP_CARVTYPE_C' then
    result := 'Вид резьбы';

  If PName = 'PROP_DIAM' then
    result := 'Диаметр (мм)';
  If PName = 'PROP_SIZE' then
    result := 'Размер (мм)';
  If PName = 'PROP_UW' then
    result := 'Удельный вес (г/см3)';
  If PName = 'PROP_STEP' then
    result := 'Шаг резьбы';
  If PName = 'PROP_PROFILE' then
    result := 'Профиль';
  If PName = 'PROP_PROFILE_C' then
    result := 'Профиль';
  If PName = 'PROP_THICK	NUMBER' then
    result := 'Толщина';
  If PName = 'PROP_THICK_C' then
    result := 'Толщина';
  If PName = 'PROP_WIDTH	NUMBER' then
    result := 'Ширина';
  If PName = 'PROP_WIDTH_C' then
    result := 'Ширина';
  If PName = 'PROP_LENGTH' then
    result := 'Длина';
  If PName = 'PROP_LENGTH_C' then
    result := 'Длина';
End;

Procedure LookupItemToForm(Var cb: TComboBox; Var ADOQ: TAdoQuery; link: int64;
  txt1: string = 'name'; txt2: string = ''; txt12: string = '';
  tree: boolean = False; EmptyText: string = ''; txt3: string = '');
Var
  s, ssp: string;
Begin
  cb.Items.BeginUpdate;
  cb.Items.Clear;
  ADOQ.First;
  while Not ADOQ.Eof do
  Begin
    s := VarToStr(ADOQ[txt1]);
    If (txt12 <> '') and Not Empty(txt2) and Not Empty(VarToStr(ADOQ[txt2]))
    then
    Begin
      if txt12 = space then
        ssp := EmptyStr
      else
        ssp := space;
      s := s + ssp + txt12 + ssp + VarToStr(ADOQ[txt2]);
    End;
    s := Trim(s);
    if Not Empty(txt3) then
    Begin
      s := s + space + '(' + VarToStr(ADOQ[txt3]) + ')';
    End;

    if tree then
    Begin
      If ADOQ['cparent'] <> 0 then
        s := '  ' + s
      else
        s := UpperCase(s);
    End;
    cb.Items.Append(s);
    if link = ADOQ['nrec'] then
      cb.ItemIndex := cb.Items.Count - 1;
    ADOQ.Next;
  End;
  {
    if Not Empty(EmptyText) then
    Begin
    cb.Items.Append(EmptyText);
    if link=0 then cb.ItemIndex:=cb.Items.Count-1;
    End;
  }
  if cb.ItemIndex = -1 then
    cb.Text := EmptyStr;

  cb.Items.EndUpdate;
End;

Procedure LookupItemToFormNew(Var cb: TComboBox; Var ADOQ: TAdoQuery;
  link: int64; fields, delims: string);
Var
  s: string;
  i: integer;
  FieldsList: TStringList;
  DelimList: TStringList;
Begin
  FieldsList := TStringList.Create;
  FieldsList.CommaText := fields;
  DelimList := TStringList.Create;
  DelimList.CommaText := delims;
  cb.Items.BeginUpdate;
  cb.Items.Clear;
  ADOQ.First;
  while Not ADOQ.Eof do
  Begin
    s := EmptyStr;
    for i := 0 to FieldsList.Count - 1 do
    Begin
      s := s + VarToStr(ADOQ[FieldsList[i]]);
      // ShowMessage(kav+DelimList[i]+kav);
      // if Pos(' ',DelimList[i])>0 then ShowMessage('есть пробелы');
      s := s + DelimList[i];
    End;
    s := Trim(s);
    cb.Items.Append(s);
    if link = ADOQ['nrec'] then
      cb.ItemIndex := cb.Items.Count - 1;
    ADOQ.Next;
  End;
  if cb.ItemIndex = -1 then
    cb.Text := EmptyStr;
  cb.Items.EndUpdate;
  DelimList.Free;
  FieldsList.Free;
End;

Procedure LookupItemToForm2(cb: TComboBox; ADOQ: TAdoQuery; link: int64;
  txt1: string = 'name'; txt2: string = ''; txt12: string = '';
  tree: boolean = False; EmptyText: string = ''; txt3: string = '');
Var
  s, ssp: string;
Begin
  cb.Items.BeginUpdate;
  cb.Items.Clear;
  ADOQ.First;
  while Not ADOQ.Eof do
  Begin
    s := VarToStr(ADOQ[txt1]);
    If (txt12 <> '') and Not Empty(txt2) and Not Empty(VarToStr(ADOQ[txt2]))
    then
    Begin
      if txt12 = space then
        ssp := EmptyStr
      else
        ssp := space;
      s := s + ssp + txt12 + ssp + VarToStr(ADOQ[txt2]);
    End;
    s := Trim(s);
    if Not Empty(txt3) then
    Begin
      s := s + space + '(' + VarToStr(ADOQ[txt3]) + ')';
    End;

    if tree then
    Begin
      If ADOQ['cparent'] <> 0 then
        s := '  ' + s
      else
        s := UpperCase(s);
    End;
    cb.Items.Append(s);
    if link = ADOQ['nrec'] then
      cb.ItemIndex := cb.Items.Count - 1;
    ADOQ.Next;
  End;
  {
    if Not Empty(EmptyText) then
    Begin
    cb.Items.Append(EmptyText);
    if link=0 then cb.ItemIndex:=cb.Items.Count-1;
    End;
  }
  if cb.ItemIndex = -1 then
    cb.Text := EmptyStr;

  cb.Items.EndUpdate;
End;

{
  Function LookupItemFromForm(Text:string;Var ADOQ:TAdoQuery;TableName:string;ReadOnly:boolean=False;tree:boolean=False):string;
  Var
  text2:string;
  Begin
  result:=0;
  text2:=text;
  if tree and (Length(text2)>=2) and (text2[1]=space) and (text2[2]=space) then Delete(text2,1,2);
  if Not Empty(Text) then
  Begin
  If ADOQ.Locate('name',Text,[loCaseInsensitive]) or (tree and ADOQ.Locate('name',Text2,[loCaseInsensitive])) then result:=ADOQ['nrec']
  else
  Begin
  if Not ReadOnly then
  Begin
  ADOQ.Close;
  result:=InsertNewRecordToTable(Host.ADOC,TableName,OfficeVar);
  ADOQ.SQL.Text:=
  'update '+TableName+' set name='''+AddSlashes(Trim(Text))+''' where fnrec='''+result+'''';
  Try
  ADOQ.ExecSQL;
  Except
  result:=EmptyFNREC;
  End;
  End;
  End;

  if readonly and Not EmptyFNRC(result) and tree then
  Begin
  if EmptyFNRC(ADOQ['fcparent').AsString) then
  Try
  ADOQ.Next;
  if Not EmptyFNRC(ADOQ['fcparent').AsString) and
  (ADOQ['fcparent').AsString=result)
  then result:=ADOQ['fnrec').AsString
  else result:=EmptyFNREC;
  Except
  result:=EmptyFNREC;
  End;

  End;

  if SortByFreq and Not EmptyFNRC(result) then
  Try
  Host.ADOC.Execute('update '+TableName+' set freq=freq+1 where fnrec='''+result+'''');
  Except
  End;
  End;
  End;
}

Function LookupItemFromForm2(ItemIndex: integer; Var ADOQ: TAdoQuery;
  TableName: string; tree: boolean = False): int64;
Begin
  // ShowMessage('LookupItemFromForm2 Begin');
  result := 0;
  if ItemIndex >= 0 then
  Begin
    Try
      if (ItemIndex + 1) <= ADOQ.RecordCount then
      Begin
        ADOQ.RecNo := ItemIndex + 1;
        result := ADOQ['nrec'];
      End;
    Except

    End;
    // ShowMessage('1');

    if (result <> 0) and tree then
    Begin
      if ADOQ['cparent'] = 0 then
        Try
          ADOQ.Next;
          if (ADOQ['cparent'] <> 0) and (ADOQ['cparent'] = result) then
            result := ADOQ['nrec']
          else
            result := 0;
        Except
          result := 0;
        End;
    End;
    // ShowMessage('2');

    if result <> 0 then
      Try
        // ShowMessage('Exec Update');
        Host.adoc.Execute('update ' + TableName + ' set freq=freq+1 where nrec='
          + IntToStr(result));
        // ShowMessage('Trololo');
      Except
      End;
  End;
End;

function CharN(s: string; n: integer): string;
Begin
  if n <= Length(s) then
    result := s[n]
  else
    result := space;
End;

function OkonchEQ(s, o: string): boolean;
Var
  i: integer;
Begin
  s := UpperCase(s);
  o := UpperCase(o);
  result := Length(s) >= Length(o);
  i := Length(o);
  while (i > 0) and result do
  begin
    result := (o[i] = s[Length(s) - (Length(o) - i)]);
    if result then
      Dec(i);
  end;
End;

Function MyMkDir(dir: string): boolean;
Var
  i: integer;
  s, ss: string;
Begin
  result := True;
  If Not Empty(dir) then
  Begin
    s := dir;
    If s[Length(s)] <> '\' then
      s := s + '\';
    ss := EmptyStr;
    For i := 1 to Length(s) do
    Begin
      ss := ss + s[i];
      If s[i] = '\' then
      Begin
        Try
          CreateDir(Copy(ss, 1, Length(ss) - 1));
        Except
          result := False;
        End;
      End;
    End;
  End;
End;

Function UniMTEToExcel(Sender: TComponent; MTE: TMemTableEh;
  filenam: string): boolean;
Var
  Excel, WorkBook: Variant;
  mw: TMagsoftWaitDialog;
  i, j, n, i0: integer;
  ss, shtuk, curvin: string;
  grsht, grtn, grnch: double;
begin
  result := True;
  mw := TMagsoftWaitDialog.Create(Sender);
  mw.CreateWait('Выгрузка данных в ' + filenam, MTE.RecordCount);
  CoInitialize(nil);
  i := 1;
  Try
    Excel := CreateOLEObject('Excel.Application');
    WorkBook := Excel.WorkBooks.Add;
    For j := 0 to MTE.FieldList.Count - 1 do
    Begin
      WorkBook.WorkSheets[1].Cells[i, j + 1].Value := MTE.FieldList[j].FullName;
      WorkBook.WorkSheets[1].Cells[i, j + 1].Font.Bold := True;
    End;
    Inc(i);
    MTE.First;
    While Not MTE.Eof do
    Begin
      For j := 0 to MTE.FieldList.Count - 1 do
      Begin
        If MTE.FieldList[j].DataType = ftString then
          ss := ''''
        else
          ss := EmptyStr;
        WorkBook.WorkSheets[1].Cells[i, j + 1].Value :=
          ss + VarToStr(MTE[MTE.FieldList[j].FullName]);
        If MTE.FieldList[j].DataType = ftString then
        Begin
          WorkBook.WorkSheets[1].Cells[i, j + 1].NumberFormat := '@';
        End;
      End;
      mw.Update(MTE.RecNo);
      MTE.Next;
      Inc(i);
    End;
    WorkBook.WorkSheets[1].Cells.Columns.AutoFit;
    If FileExists(filenam) then
      DeleteFile(PChar(filenam));
    WorkBook.SaveAs(filenam);
    WorkBook.Close(False);
    VarClear(WorkBook);
    VarClear(Excel);
  Except
    on E: Exception do
    Begin
      mw.KillWait;
      result := False;
      Application.MessageBox(PChar(E.Message),
        'Ошибка при экспорте данных в Excel', MB_OK + MB_ICONERROR);
    End;
  End;
  CoUnInitialize;
  mw.KillWait;
  mw.Free;
end;

// Преобразование из десятичной дроби в обычную
// fl - десятичная дробь. Результат - строка
// вида 'm/n', где m - числитель, а n - знаменатель.
procedure KoefToDrob(fl: currency; Var m, n: string);
var
  i, f: Extended;
  k, mm, nn, l, nod: integer;
  s: string;
begin
  i := Int(fl); // целая часть
  f := Frac(fl); // дробная часть
  s := FloatToStr(f); // отсекаем '0,'
  Delete(s, 1, 2);
  f := StrToFloat(s);
  mm := StrToInt(FloatToStr(i * Length(FloatToStr(f)) * 10 + f)); // числитель
  nn := Length(FloatToStr(f)) * 10; // знаменатель
  if nn > mm then
    k := mm
  else
    k := nn; // находим НОД и упрощаем дробь
  for l := 1 to k do
    if (nn mod l = 0) and (mm mod l = 0) then
      nod := l;
  mm := mm div nod;
  nn := nn div nod;
  m := IntToStr(mm);
  n := IntToStr(nn);
end;

Function ActiveOwner(date1, date2: TDateTime): boolean;
Begin
  result := ((date2 = 0) or (date2 >= Now)) and ((date1 = 0) or (date1 <= Now));
End;

Function ActiveOwner2(date1, date2, pdate1, pdate2: TDateTime): boolean;
Begin
  // result:=((date2=0) or ((date2>=pdate1) and (date2>=pdate2))) and ((date1=0) or ((date1<=pdate1) and (date1<=pdate2)));
  result := ((date2 = 0) or ((date2 >= pdate1) or (date2 >= pdate2))) and
    ((date1 = 0) or ((date1 <= pdate1) or (date1 <= pdate2)));
End;

Function ActiveOwner3(date1, date2: TDateTime; NMonth, NYear: word): boolean;
Var
  yy1, mm1, dd1: word;
  yy2, mm2, dd2: word;
Begin
  if date2 = 0 then
    date2 := StrToDate(MaxDate);
  DecodeDate(date1, yy1, mm1, dd1);
  DecodeDate(date2, yy2, mm2, dd2);
  result := ((yy1 < NYear) or ((yy1 = NYear) and (mm1 <= NMonth))) and
    ((yy2 > NYear) or ((yy2 = NYear) and (mm2 >= NMonth)));
End;

Function HidePassInConStr(s: string): string;
Var
  p, i: integer;
Begin
  result := s;
  p := Pos('PASSWORD=', UpperCase(s));
  if p > 0 then
  Begin
    i := p + 1;
    while (i <= Length(s)) and (s[i] <> dotcomma) do
      Inc(i);
    Delete(s, p, i - p);
    Insert('...', s, p);
  End;
  result := s;
End;

function GetCurrentUserName(var CurrentUserName: string): boolean;
var
  BufferSize: DWORD;
  pUser: PChar;
begin
  BufferSize := 0;
  GetUserName(nil, BufferSize);
  pUser := StrAlloc(BufferSize);
  try
    result := GetUserName(pUser, BufferSize);
    CurrentUserName := StrPas(pUser);
  finally
    StrDispose(pUser);
  end;
end;

Function MVDate(d: TDateTime; Postfix: string): string;
Var
  year, Month, Day: word;
Begin
  result := EmptyStr;
  if d <> 0 then
  Begin
    DecodeDate(d, year, Month, Day);
    result := IntToStr(Day) + space + MonthArray[Month] + space + IntToStr(year)
      + space + Postfix;
  End;
End;

Function CommonDate(d: TDateTime; Postfix: string = ''): string;
Begin
  result := EmptyStr;
  if d <> 0 then
  Begin
    result := Trim(DateToStr(d) + space + Postfix);
  End;
End;

Function SocrFIO(s1, s2, s3: string): string;
Var
  s: string;
Begin
  s := EmptyStr;
  If Trim(s3) <> EmptyStr then
    s := Trim(s3)[1] + '.';
  If Trim(s2) <> EmptyStr then
    s := Trim(s2)[1] + '.' + s
  else
    s := EmptyStr;
  result := Trim(s1 + ' ' + s);
End;

Function KillChars(s: string; c: Char): string;
Var
  i: integer;
  ss: string;
Begin
  ss := EmptyStr;
  For i := 1 to Length(s) do
    If s[i] <> c then
      ss := ss + s[i];
  result := ss;
End;

Function AutoUpdateKadnum(kadnum: string): string;
Var
  i, j: integer;
  s: array [1 .. 4] of string;
Begin
  result := kadnum;
  if NumOfChar(dotdot, kadnum) = 3 then
  Begin
    i := 1;
    s[1] := GetNextWord(kadnum, i, dotdot);
    s[2] := GetNextWord(kadnum, i, dotdot);
    s[3] := GetNextWord(kadnum, i, dotdot);
    s[4] := GetNextWord(kadnum, i, dotdot);

    for j := 1 to 4 do
    Begin
      s[j] := KillChars(s[j], space);
      while (Length(s[j]) > 0) and (s[j][1] = zero) do
        Delete(s[j], 1, 1);
      if Empty(s[j]) then
        s[j] := zero;
    End;

    result := s[1] + dotdot + s[2] + dotdot + s[3] + dotdot + s[4];
  End;

End;

Function GetStrValue(nodevalue: Variant): string;
Begin
  Try
    result := nodevalue;
  Except
    result := EmptyStr;
  End;
End;

Function TrueCod(c, pagc: byte): byte;
Var
  cc: byte;
Begin
  cc := c;
  Case pagc of
    0:
      Begin { DOS }
      End;
    1:
      Begin { WIN }
        If (c > 127) and (c < 176) then
          cc := c + 64;
        If (c > 223) and (c < 240) then
          cc := c + 16;
        If c = 240 then
          cc := 168;
        If c = 241 then
          cc := 184;
        If c = 254 then
          cc := 32;

        If (c > 175) and (c < 224) then
          cc := 32;

        If c = 196 then
          cc := 45;
        If c = 179 then
          cc := 124;
        If c = 180 then
          cc := 124;
        If c = 195 then
          cc := 124;
      End;
    255:
      Begin { PARAMWIN }
        If (c > 223) and (c < 240) then
          cc := c - 64;
        If (c > 239) then
          cc := c - 16;
        If (c > 191) and (c < 224) then
          cc := c - 64;
        If c = 168 then
          cc := 240;
        If c = 184 then
          cc := 241;
      End;
  End;
  TrueCod := cc;
End;

Function TrueCodS(s: string; pagc: byte): string;
Var
  i: integer;
Begin
  result := '';
  For i := 1 to Length(s) do
    result := result + chr(TrueCod(ord(s[i]), pagc));
End;

Procedure GetFS(s: string; Var fi: string; Var se: string);
Var
  i: integer;
Begin
  fi := EmptyStr;
  se := EmptyStr;
  i := 1;
  While (i <= Length(s)) and (s[i] <> dotdot) do
  Begin
    fi := fi + s[i];
    Inc(i);
  End;
  Inc(i);
  While (i <= Length(s)) do
  Begin
    se := se + s[i];
    Inc(i);
  End;
  fi := Trim(fi);
  se := Trim(se);
End;

Function GetNextWord(s: string; Var i: integer; r: Char): string;
Var
  ss: string;
Begin
  ss := '';
  While (i <= Length(s)) and (s[i] <> r) do
  Begin
    ss := ss + s[i];
    Inc(i);
  End;
  Inc(i);
  result := ss;
End;

Function SetRegKey(Key: string; Value: string): boolean;
var
  reg: TRegistry;
begin
  result := False;
  reg := TRegistry.Create;
  { reg.RootKey := HKEY_CURRENT_USER; }
  if (reg.OpenKey(BaseKey, True)) then
  begin
    reg.WriteString(Key, Value);
    result := True;
    reg.CloseKey;
  end;
  reg.Destroy;
end;

function IniReadString(const FileName, Section, Line: string;
  Var Value: string): boolean;
var
  Ini: TIniFile;
begin
  result := True;
  Ini := TIniFile.Create(FileName);
  try
    Value := Ini.ReadString(Section, Line, EmptyStr);
    Ini.Free;
  except
    result := False;
    Value := EmptyStr;
  end;
end;

function IniWriteString(const FileName, Section, Line, Value: string): boolean;
var
  Ini: TIniFile;
begin
  result := True;
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteString(Section, Line, Value);
    Ini.Free;
  except
    result := False;
  end;
end;

function IniReadBool(const FileName, Section, Line: string;
  Var Value: boolean): boolean;
var
  Ini: TIniFile;
begin
  result := True;
  Ini := TIniFile.Create(FileName);
  try
    Value := Ini.ReadBool(Section, Line, False);
    Ini.Free;
  except
    result := False;
    Value := False;
  end;
end;

function IniWriteBool(const FileName, Section, Line: string;
  Value: boolean): boolean;
var
  Ini: TIniFile;
begin
  result := True;
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteBool(Section, Line, Value);
    Ini.Free;
  except
    result := False;
  end;
end;

Procedure DivString(s: string; Var s1, s2: string; maxs1: integer);
Var
  i: integer;
  fnd: boolean;
Begin
  if Length(s) <= maxs1 then
  Begin
    s1 := s;
    s2 := EmptyStr;
  End
  else
  Begin
    i := maxs1;
    If ((i + 1) <= Length(s)) and (s[i + 1] = space) then
      Inc(i);
    fnd := False;
    while (i >= 1) and Not fnd do
    Begin
      fnd := ((s[i] = space) or (s[i] = comma) or (s[i] = dotcomma));
      if Not fnd then
        Dec(i);
    End;
    if fnd then
    Begin
      s1 := Copy(s, 1, i);
      s2 := Copy(s, i + 1, Length(s) - i);
    End
    else
    Begin
      s1 := EmptyStr;
      s2 := s;
    End;
  End;
  s1 := Trim(s1);
  s2 := Trim(s2);
End;

Function TrimCommas(s: string): string;
Begin
  result := Trim(s);
  while (Length(result) > 0) and (result[1] = comma) do
  Begin
    Delete(result, 1, 1);
    result := Trim(result);
  End;
  while (Length(result) > 0) and (result[Length(result)] = comma) do
  Begin
    Delete(result, Length(result), 1);
    result := Trim(result);
  End;
  while Pos(comma + comma, result) > 0 do
  Begin
    result := Trim(ReplChars(result, comma + comma, comma));
  End;
End;

Function InstalledWord: boolean;
var
  MsWord: Variant;
  loaded: boolean;
Begin
  result := True;
  loaded := True;
  try
    MsWord := GetActiveOleObject('Word.Application');
  except
    loaded := False;
    try
      MsWord := CreateOLEObject('Word.Application');
    except
      result := False;
    end;
  end;

  If result then
  Begin
    If Not loaded then
      MsWord.quit;
    MsWord := UnAssigned;
  End;

End;

Function InstalledExcel: boolean;
var
  Excel: Variant;
  loaded: boolean;
Begin
  result := True;
  try
    Excel := GetActiveOleObject('Excel.Application');
  except
    try
      Excel := CreateOLEObject('Excel.Application');
    except
      result := False;
    end;
  end;

  If result then
  Begin
    VarClear(Excel);
  End;

End;

function GoodCurrency(s: string): boolean;
Var
  i, l: integer;
  ss: string;
  ok: boolean;
begin
  ok := True;
  l := Length(s);
  If (l < 4) or (l > 14) then
    ok := False;
  If ok then
  Begin
    ok := ok and (s[l - 2] = FormatSettings.DecimalSeparator);
  End;
  If ok then
  Begin
    ss := s;
    Delete(ss, l - 2, 1);
    If ss[1] = '-' then
    Begin
      Delete(ss, 1, 1);
      { ok:=False; } // если раскомментировать - запретятся отрицательные
    End;
    For i := 1 to Length(ss) do
      If not CharInSet(ss[i], cif) then
        ok := False;
  End;
  result := ok;
end;

Function StrToCurrM(s: string): currency;
Begin
  if Not TryStrToCurr(s, result) then
    result := 0;
End;

Function StrToFloatM(s: string): double;
Begin
  result := 0;
  If Not TryStrToFloat(s, result) then
  Begin
    s := ReplChars(s, dot, FormatSettings.DecimalSeparator);
    If Not TryStrToFloat(s, result) then
    Begin
      s := ReplChars(s, comma, FormatSettings.DecimalSeparator);
      If Not TryStrToFloat(s, result) then
        result := 0;
    End;
  End;
End;

Function RoundCurrency(c: currency): currency;
Begin
  result := RoundUp(c * 100) / 100;
End;

Procedure DivCurrency(s: string; Var s1, s2: string);
Var
  i: integer;
Begin
  i := 1;
  s1 := GetNextWord(s, i, dot);
  s2 := GetNextWord(s, i, dotcomma);
  if Empty(s2) then
    s2 := zero;

End;

Function FullMonthesCount(pravdate1, pravdate2, repdate1, repdate2: TDateTime;
  day15, lg: boolean): integer;
Var
  y1, m1, d1, y2, m2, d2: word;
Begin
  if (pravdate1 = 0) and (pravdate2 = 0) and lg then
    result := 0
  else
  Begin
    if pravdate1 < repdate1 then
      pravdate1 := repdate1;
    if (pravdate2 > repdate2) or (pravdate2 = 0) then
      pravdate2 := repdate2;
    DecodeDate(pravdate1, y1, m1, d1);
    DecodeDate(pravdate2, y2, m2, d2);
    result := 0;
    if (d1 <= 15) or Not day15 then
      Inc(result);
    Inc(m1);
    if m1 = 13 then
    begin
      m1 := 1;
      Inc(y1);
    end;
    while (y1 < y2) or ((y1 = y2) and (m1 < m2)) do
    begin
      Inc(result);
      Inc(m1);
      if m1 = 13 then
      begin
        m1 := 1;
        Inc(y1);
      end;
    end;
    if (y1 = y2) and (m1 = m2) then
      if (d2 > 15) or Not day15 then
        Inc(result);
  End;
End;

Procedure DivDolya(dolya: string; Var chislitel, znamenatel: currency);
Var
  i: integer;
  d: string;
  s1, s2: string;
Begin
  znamenatel := 1;
  d := ReplChars(Trim(dolya), '\', '/');
  i := 1;
  s1 := Trim(GetNextWord(d, i, '/'));
  s2 := Trim(GetNextWord(d, i, dotcomma));
  if Not TryStrToCurr(s1, chislitel) then
    chislitel := 0;
  if Not Empty(s2) then
    if Not TryStrToCurr(s2, znamenatel) then
      znamenatel := 0;
End;

Function MyDateToStr(d: TDateTime): string;
Var
  dd: TDateTime;
Begin
  dd := Trunc(d);
  if dd = 0 then
    result := EmptyStr
  else
    result := DateToStr(dd);
End;

Function MyBoolToStr(bl: boolean): string;
Begin
  if bl then
    result := 'ДА'
  else
    result := 'НЕТ';
End;

Function GetTextValueOfPointer(Pointr, Table, NrecName, TextFldName: string;
  StrPointer: boolean = False): string;
Var
  ADOQ: TAdoQuery;
  cc: string;
Begin
  result := EmptyStr;
  if Pointr <> zero then
  Begin
    ADOQ := TAdoQuery.Create(Host.adoc);
    ADOQ.Connection := Host.adoc;
    if StrPointer then
      cc := ''''
    else
      cc := EmptyStr;
    ADOQ.SQL.Text := 'select ' + TextFldName + ' from ' + Table + ' where ' +
      NrecName + '=' + cc + Pointr + cc;
    ADOQ.Open;
    if ADOQ.RecordCount > 0 then
      result := VarToStr(ADOQ[TextFldName]);
    ADOQ.Close;
    ADOQ.Free;
  End;
End;

Function GetTextValueOfPointerADOC(adoc: TAdoConnection;
  Pointr, Table, NrecName, TextFldName: string;
  StrPointer: boolean = False): string;
Var
  ADOQ: TAdoQuery;
  cc: string;
Begin
  result := EmptyStr;
  if Pointr <> zero then
  Begin
    ADOQ := TAdoQuery.Create(adoc);
    ADOQ.Connection := adoc;
    if StrPointer then
      cc := ''''
    else
      cc := EmptyStr;
    if StrPointer then
      Pointr := AddSlashes(Pointr);
    ADOQ.SQL.Text := 'select ' + TextFldName + ' from ' + Table + ' where ' +
      NrecName + '=' + cc + Pointr + cc;
    ADOQ.Open;
    if ADOQ.RecordCount > 0 then
      result := VarToStr(ADOQ[TextFldName]);
    ADOQ.Close;
    ADOQ.Free;
  End;
End;

Function GetLatestInsertId(adoc: TAdoConnection): integer;
Var
  ADOQ: TAdoQuery;
Begin
  Try
    ADOQ := TAdoQuery.Create(adoc);
    ADOQ.Connection := adoc;
    ADOQ.SQL.Text := 'select @@identity AS ID';
    ADOQ.Open;
    result := ADOQ['ID'];
    ADOQ.Close;
    ADOQ.Free;
  Except
    result := 0;
  End;
End;

Function a2r(arabb: string): string;
Const
  A: array [1 .. 13] of word = (1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500,
    900, 1000);
  s: array [1 .. 13] of string[2] = ('I', 'IV', 'V', 'IX', 'X', 'XL', 'L', 'XC',
    'C', 'CD', 'D', 'CM', 'M');
Var
  arab, i: word;
  rim: string;
Begin
  i := 14;
  rim := el;
  arab := StrToIntM(arabb);
  While i > 1 Do
  Begin
    Dec(i);
    While arab >= A[i] Do
    Begin
      rim := rim + s[i];
      arab := arab - A[i];
    End
  End;
  result := rim;
End;

Function Cutt(s: string; n: integer): string;
Begin
  If Length(s) > n then
    result := Copy(s, 1, n)
  else
    result := s;
End;

Function GetFirstKod(s: string): string;
Var
  i: integer;
  ss: string;
Begin
  i := Pos(' - ', s);
  If i > 0 then
  Begin
    ss := Trim(Copy(s, 1, i - 1));
  End
  else
  Begin
    ss := s;
  End;
  result := Trim(ss);
  { If Cifry(ss) then result:=ss
    else result:=el; }
End;

Function DivDOCSh(s: string; Var s1: string; Var s2: string;
  Var s3: string): boolean;
Var
  i, j: integer;
Begin
  i := Length(s);
  s1 := el;
  s2 := el;
  s3 := el;
  While (i > 0) and (s[i] <> ' ') and (s[i] <> '-') do
  Begin
    s3 := s[i] + s3;
    Dec(i);
  End;
  While (i > 0) and ((s[i] = ' ') or (s[i] = '-')) do
    Dec(i);
  While (i > 0) and (s[i] <> ' ') and (s[i] <> '-') do
  Begin
    s2 := s[i] + s2;
    Dec(i);
  End;
  j := i;
  While (i > 0) and ((s[i] = ' ') or (s[i] = '-')) do
    Dec(i);
  While (i > 0) { and (s[i]<>' ') and (s[i]<>'-') } do
  Begin
    s1 := s[i] + s1;
    Dec(i);
  End;
  result := (j > 1) and (Pos('-', s) = j);
End;

Function DivDOC(kodnom: string; Var kod: string; Var nom: string): boolean;
Var
  i: integer;
Begin
  i := Pos(comma, kodnom);
  If i > 0 then
  Begin
    kod := Copy(kodnom, 1, i - 1);
    nom := Copy(kodnom, i + 1, Length(kodnom));
    result := True;
  End
  else
  Begin
    kod := '';
    nom := kodnom;
    result := False;
  End;
End;

Function IsKeyDown(vk: word): boolean;
Begin
  result := (GetKeyState(vk) and $8000) = $8000
End;

function GetCaretPos(edt: TMaskEdit): integer; overload;
Var
  LastSelStart: integer;
  LastSelLength: integer;
  LastPos: integer;
begin
  LastSelStart := 0;
  LastSelLength := 0;
  LastPos := 0;
  if (edt.SelStart <> LastSelStart) then
    result := edt.SelStart + 1
  else if (edt.SelLength <> LastSelLength) then
    result := LastSelStart + edt.SelLength + 1
  else
    result := LastPos + 1;

  LastSelStart := edt.SelStart;
  LastSelLength := edt.SelLength;
  LastPos := result - 1;
end;

function GetCaretPos(edt: TEdit): integer; overload;
Var
  LastSelStart: integer;
  LastSelLength: integer;
  LastPos: integer;
begin
  LastSelStart := 0;
  LastSelLength := 0;
  LastPos := 0;
  if (edt.SelStart <> LastSelStart) then
    result := edt.SelStart + 1
  else if (edt.SelLength <> LastSelLength) then
    result := LastSelStart + edt.SelLength + 1
  else
    result := LastPos + 1;

  LastSelStart := edt.SelStart;
  LastSelLength := edt.SelLength;
  LastPos := result - 1;
end;

function GetCaretPos(edt: TLabeledEdit): integer; overload;
Var
  LastSelStart: integer;
  LastSelLength: integer;
  LastPos: integer;
begin
  LastSelStart := 0;
  LastSelLength := 0;
  LastPos := 0;
  if (edt.SelStart <> LastSelStart) then
    result := edt.SelStart + 1
  else if (edt.SelLength <> LastSelLength) then
    result := LastSelStart + edt.SelLength + 1
  else
    result := LastPos + 1;

  LastSelStart := edt.SelStart;
  LastSelLength := edt.SelLength;
  LastPos := result - 1;
end;

function GetCaretPos(edt: TComboBox): integer; overload;
Var
  LastSelStart: integer;
  LastSelLength: integer;
  LastPos: integer;
begin
  LastSelStart := 0;
  LastSelLength := 0;
  LastPos := 0;
  if (edt.SelStart <> LastSelStart) then
    result := edt.SelStart + 1
  else if (edt.SelLength <> LastSelLength) then
    result := LastSelStart + edt.SelLength + 1
  else
    result := LastPos + 1;

  LastSelStart := edt.SelStart;
  LastSelLength := edt.SelLength;
  LastPos := result - 1;
end;

Function XmlChars(s: string): string;
Var
  i: integer;
  ss: string;
  fl: boolean;
Begin
  ss := '';
  For i := 1 to Length(s) do
  Begin
    fl := True;
    If s[i] = '&' then
    Begin
      ss := ss + '&amp;';
      fl := False;
    End;
    If s[i] = '"' then
    Begin
      ss := ss + '&quot;';
      fl := False;
    End;
    If s[i] = '''' then
    Begin
      ss := ss + '&#039;';
      fl := False;
    End;
    If s[i] = '<' then
    Begin
      ss := ss + '&lt;';
      fl := False;
    End;
    If s[i] = '>' then
    Begin
      ss := ss + '&gt;';
      fl := False;
    End;
    If s[i] = '<' then
    Begin
      ss := ss + '&lt;';
      fl := False;
    End;
    If s[i] = '>' then
    Begin
      ss := ss + '&gt;';
      fl := False;
    End;
    If fl then
      ss := ss + s[i];
  End;
  result := Trim(ss);
End;

Function AddSlashes(s: string): string;
Var
  i: integer;
  ss: string;
Begin
  ss := EmptyStr;
  For i := 1 to Length(s) do
  Begin
    if (s[i] = '''') or (s[i] = '`') then
      ss := ss + ''''''
    else if s[i] = '"' then
      ss := ss + ''''''
    else
      ss := ss + s[i];
  End;
  result := ss;
End;

Function AddSlashes2(s: string): string;
Var
  i: integer;
  ss: string;
Begin
  ss := EmptyStr;
  For i := 1 to Length(s) do
  Begin
    if (s[i] = '''') or (s[i] = '`') then
      ss := ss + ''''''
    else if s[i] = '"' then
      ss := ss + '_'
    else
      ss := ss + s[i];
  End;
  result := ss;
End;

Procedure ToLog(s: string; rewrit: boolean = False);
Var
  f: TextFile;
  fn: string;
  n: TDateTime;
  opened: boolean;
Begin
  fn := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
    'debug.txt';
  AssignFile(f, fn);
  If Not FileExists(fn) or rewrit then
  Begin
    Try
      ReWrite(f);
      CloseFile(f);
    Except
    End;
  End;

  If FileExists(fn) then
  Begin
    Try
      Append(f);
      opened := True;
    Except
      opened := False;
    End;
  End
  else
    opened := False;

  If opened then
  Begin
    n := Now;
    Try
      WriteLn(f, DateTimeToStr(n) + dotdot + space + s);
    Finally
      CloseFile(f);
    End;
  End;

End;

Function FirstDayOfYear(year: word): TDateTime;
Begin
  result := StrToDate('01.01.' + IntToStr(year));
End;

Function LastDayOfYear(year: word): TDateTime;
Begin
  result := StrToDate('31.12.' + IntToStr(year));
End;

Function DaysInYear(year: word): integer;
Begin
  If IsLeapYear(year) then
    result := 366
  else
    result := 365;
  // ShowMessage('В '+IntToStr(year)+' году '+IntToStr(result)+' дней');
End;

Function StrToDateM(s: string): TDateTime;
Begin
  If Not TryStrToDate(s, result) then
    result := MinDateTime;
End;

function RoundUp(X: Extended): int64;
begin
  result := Trunc(X) + Trunc(Frac(X) * 2);
end;

Function LostTime(Past, PastPr, FullPr: integer): integer;
Begin
  If PastPr > 0 then
    result := RoundUp(Past * FullPr / PastPr - Past)
  else
    result := 3600;
End;

Function SecToTime(sec: integer): string;
Var
  h, m, s: integer;
Begin
  h := sec div 3600;
  m := (sec - h * 3600) div 60;
  s := sec - h * 3600 - m * 60;
  SecToTime := Padl(IntToStr(h), 2, '0') + ':' + Padl(IntToStr(m), 2, '0') + ':'
    + Padl(IntToStr(s), 2, '0');
End;

Function BlockedFile(fn: string): boolean;
Var
  f: File;
Begin
  result := False;
  If FileExists(fn) then
  Begin
    AssignFile(f, fn);
    Try
      // FileMode:=fmShareExclusive;
      FileMode := fmOpenWrite;
      ReSet(f);
      CloseFile(f);
    Except
      result := True;
    End;
  End;
  FileMode := 2;
End;

Function FullRightsForDir(dir: string): boolean;
Var
  f: File;
  fn: string;
Begin
  result := True;
  fn := dir + '_checkrights.tmp';
  AssignFile(f, fn);
  Try
    ReWrite(f);
    CloseFile(f);
    If FileExists(fn) then
      DeleteFile(PChar(fn));
  Except
    result := False;
  End;
End;

procedure CompressBase(Base: string);
Const
  datsour = 'Data Source=';
Var
  o: OleVariant;
  TempFile: array [0 .. MAX_PATH - 1] of Char;
Begin
  If Not BlockedFile(Base) then
  Begin
    o := CreateOLEObject('JRO.JetEngine');
    GetTempFileName(PChar(TempDir), el, 0, TempFile);
    If FileExists(TempFile) then
      DeleteFile(TempFile);
    Try
      o.CompactDatabase(datsour + Base, datsour + TempFile);
      MoveFileEx(TempFile, PChar(Base), MOVEFILE_REPLACE_EXISTING);
    Except
      on EOleException do
        ShowMessage('Ошибка при попытке сжать базу ' + Quoted(Base));
    End;
  End;
end;

{
  Function ReplChars(s:string;c1,c2:Char):string;
  Var
  i:integer;
  ss:string;
  Begin
  ss:=el;
  For i:=1 to Length(s) do
  If s[i]=c1 then ss:=ss+c2
  else ss:=ss+s[i];
  result:=ss;
  End;
}

Function Quoted(s: string): string;
Begin
  result := quote + ReplChars(Trim(s), quote, '''') + quote;
End;

Function DeQuoted(s: string): string;
Begin
  result := s;
  If Not Empty(s) then
    If (s[1] = quote) and (s[Length(s)] = quote) then
      result := Trim(Copy(s, 2, Length(s) - 2));
End;

Function GetOkonchanie(s: string; n: integer): string;
Var
  l: integer;
Begin
  l := Length(s);
  If n <= l then
    result := Copy(s, l - n + 1, n)
  else
    result := s;
End;

Function NumOfChar(c: Char; s: string): integer;
Var
  i, n: integer;
Begin
  n := 0;
  For i := 1 to Length(s) do
    If s[i] = c then
      Inc(n);
  result := n;
End;

Function GetLastCharNum(c: Char; s: string): integer;
Var
  i: integer;
  fnd: boolean;
Begin
  i := Length(s);
  fnd := False;
  While (i > 0) and Not fnd do
  Begin
    If s[i] = c then
      fnd := True;
    If Not fnd then
      Dec(i);
  End;
  result := i;
End;

Function GetLastWord(s: string): string;
Var
  n: integer;
Begin
  result := el;
  If NumOfChar(' ', s) > 0 then
  Begin
    n := GetLastCharNum(' ', s);
    result := Trim(Copy(s, n + 1, Length(s) - n));
  End;
End;

Function BezLastWord(s: string): string;
Var
  n: integer;
Begin
  result := s;
  If NumOfChar(' ', s) > 0 then
  Begin
    n := GetLastCharNum(' ', s);
    result := Trim(Copy(s, 1, n - 1));
  End;
End;

Function Empty(s: string): boolean;
Begin
  If Length(Trim(s)) = 0 then
    result := True
  else
    result := False;
End;

Function Cifry(s: string): boolean;
Var
  i: integer;
begin
  result := True;
  For i := 1 to Length(s) do
    If not CharInSet(s[i], cif) then
      result := False;
end;

Function StrToIntM(s: string): integer;
Begin
  If GoodInteger(s) then
    result := StrToInt(s)
  else
    result := 0;
End;

Function GoodInteger(s: string): boolean;
Var
  i, l: integer;
  ss: string;
  ok: boolean;
begin
  ok := True;
  l := Length(s);
  If (l = 0) or (l > 10) then
    ok := False;
  If ok then
  Begin
    ss := s;
    If ss[1] = '-' then
    Begin
      Delete(ss, 1, 1);
      ok := False;
    End;
    For i := 1 to Length(ss) do
      If not CharInSet(ss[i], cif) then
        ok := False;
  End;
  result := ok;
end;

Function GetCod(s: string; Var bez: string): string;
Var
  ss: string;
  i: integer;
Begin
  ss := '';
  bez := s;
  i := Length(s);
  If i > 0 then
    If s[i] = ')' then
    Begin
      bez := '';
      Dec(i);
      While (i > 0) and (s[i] <> '(') do
      Begin
        ss := s[i] + ss;
        Dec(i);
      End;
      { If Not Cifry(ss) then ss:=''; }
      Dec(i);
      Dec(i);
      While (i > 0) do
      Begin
        bez := s[i] + bez;
        Dec(i);
      End;
    End;
  GetCod := ss;
End;

Function Kopeek(s: currency): integer;
Begin
  result := RoundUp(Frac(s) * 100);
End;

Function Padl(s: string; n: integer; c: Char): string;
Var
  ss: string;
  i, l: integer;
Begin
  l := Length(s);
  If l >= n then
    ss := Copy(s, 1, n)
  else
  Begin
    ss := s;
    For i := 1 to n - l do
      ss := c + ss;
  End;
  Padl := ss;
End;

Function Padr(s: string; n: integer; c: Char): string;
Var
  ss: string;
  i, l: integer;
Begin
  l := Length(s);
  If l >= n then
    ss := Copy(s, 1, n)
  else
  Begin
    ss := s;
    For i := 1 to n - l do
      ss := ss + c;
  End;
  Padr := ss;
End;

function DelDir(dir: string): boolean;
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
    pFrom := PChar(dir + #0);
  end;
  result := (0 = ShFileOperation(fos));
end;

end.
