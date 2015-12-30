unit SharedUnit;

interface
Uses DB, SysUtils, GlobVarsUnit, Registry, StdCtrls, Windows, Dialogs,
MagsoftWaitDialog,Classes,Graphics, DBGridEh, IniFiles, ADODB, ComObj, ActiveX,
Forms, MemTableEh, Vcl.ExtCtrls;

Var
 OldTempFileNameNum:integer;
function AddSpaces(s:string;n:integer;spc:char=' '):string;
Function UniMTEToExcel(Sender:TComponent;MTE:TDataSet;filenam:string):boolean;
Function BezExt(s:string):string;
Procedure ChmsToInteger(s:string;Var hours,mins,secs:integer);
Procedure HMHMPeriod(s:string;Var h1,m1,h2,m2:integer);
Function CurrToStr100M(X: Extended): string;
Function Empty(s:string):boolean;
Function Cifry(s:string):boolean;
Function StrToIntM(s:string):integer;
Function StrToCurrM(s:string):currency;
Function GoodInteger(s:string):boolean;
Function GetCod(s:string;Var bez:string):string;
Function Padl(s:string;n:integer;c:char):string;
Function Padl2(s:string;n:integer;c:char):string;
Function Padr(s:string;n:integer;c:char):string;
Function NumOfChar(c:char;s:string):integer;
Function GetLastCharNum(c:char;s:string):integer;
Function GetLastWord(s:string):string;
Function BezLastWord(s:string):string;
Function GetOkonchanie(s:string;n:integer):string;
Function SecToTime(sec:integer):string;
Function LostTime(Past,PastPr,FullPr:integer):integer;
function RoundUp(X: Extended): int64;
Function MyMkDir(dir:string):boolean;
Function Quoted(s:string):string;
Function DeQuoted(s:string):string;
Function ReplChars(s:string;c1,c2:char):string; overload;
Function ReplChars(s:string;c1,c2:string):string; overload;
Function SqlString(s:string):string;
Function GetNextWord(s:AnsiString;Var i:integer;r:string):string;
Function DetectDateDelimiter(s:string):string;
Function DayOfWeekM(date:TDateTime):integer;
Function WeekFromDate(date:TDateTime):string;
Function SecToCHMS(sec:integer):string;
Procedure SecToCHMS2(sec:integer;Var ch,m,s:integer);
Function ChmsToSec(s:string;Var sec:integer):boolean;
Function ChmsToSec2(ch,m,s:integer):integer;
Function GetGoodDate(date:string;dateformat:integer):string;
Function CorrectDateTime(s:string;df:integer):string;
Function ReadRegKey(Key:string;Var Value:string):boolean;
Function SetRegKey(Key:string;Value:string):boolean; overload;
Function SetRegKey(RootKey:HKEY;Root,Key,Value:string):boolean; overload;
Function GetKodFromName(s:string):string;
function RusLatStr(s:string): boolean;
Function GetTrueDelim(s:string):char;
Function MyGetTempFileName(path,prefix,ext:string):string;
function IsKeyDown(vk: Word):Boolean;
Function To_OraDate(dt:integer):TDateTime;
Function To_AtlDate(dt:TDateTime):integer;
Function StrToFloatM(s:string):Extended;
Function CurrToStrM(s:Currency):string;
Function FirstCharUpper(s:string):string;
Function GetNumOfLinesInTXTFile(Sender:TComponent;FileName:string):integer;
Function SokrFIO(s:string):string;
Function RoundCurrency(c:currency):Currency;
Procedure ToLog(s:string;username:string;rewrit:boolean=False);
Function GetINNKPPS(inn,kpp:string):string;
Procedure InitLog;
Function GetStyle(bold,italic:boolean):TFontStyles;
Function GetIntVers(s:string):integer;
Function GetStrVers(v:integer):string;
procedure SaveDBGridEhParams(DBGridEh: TDBGridEh; const FileName, Section: string);
procedure RestoreDBGridEhParams(DBGridEh: TDBGridEh; const FileName, Section: string);
Function AddSlashes(s:string):string;
Function GetTextValueOfPointerADOC(Var ADOC:TAdoConnection;Pointr,Table,NrecName,TextFldName:string;StrPointer:boolean=False):string;
Function FloatToStrPro(v:double):string;
Function IntToStrPro(v:integer):string;
Function OraInsertRecordAnGetID(Var ADOC:TAdoConnection;TableName,PKFieldName,SEQName:string;Fields:string='';Values:string=''):LargeInt;
Function UniCheckLinks(LTable,LField:string;nrec:int64;dopusl:string=''):boolean;
Function GetShopFilter(CUcshops:int64;CUshop2shop:boolean;field:string='ccontractor'):string;
Function SpaceIfEmpty(s:string):string;
Function GetLastNumString(cshops,lastnum:int64):string;
Procedure GetLastNumFromString(s:string;Var lastnum:int64);
Function GetMasterPFilter(mnrec:int64;ffield:string='cperson'):string;
Function ColumnIndexOfName(Var Grid:TDBGridEh;ColumnName: String):integer;
Procedure ColumnVis(Var Grid:TDBGridEh;ColumnName: String;vis:boolean);
Procedure ColumnSetTitle(Var Grid:TDBGridEh;ColumnName: String;Capt:string);
Procedure ColumnSetOtherFieldName(Var Grid:TDBGridEh;ColumnName:String;OtherFieldName:string);
Procedure NotImplementedFunctionMessage;
Function EmptyIfZero(s:string):string;
Function GetRecordInfoText(nrec:int64;insert_user:string;insert_date:TDateTime):string;
procedure UniUpdateButton(Var ADOC:TAdoConnection;nrec:int64;Var Button:TButtonedEdit;TableName,NameField,NullString:string);
procedure UniUpdateMultiButton(Var ADOC:TAdoConnection;Var nrecList:TStringList;Var Button:TButtonedEdit;TableName,NameField,NullString:string);
procedure UniUpdateButton2(Var ADOC:TAdoConnection;nrec:string;Var Button:TButtonedEdit;SchemName,TableName,NrecField,NameField,NullString:string);
function CharN(s:string;n:integer):string;
Function MVDate(d:TDateTime;Postfix:string):string;
Function CommonDate(d:TDateTime;Postfix:string=''):string;
Function SocrFIO(s1,s2,s3:string):string;
Function SocrFIO2(s:string):string;
Function TrimCommas(s:string):string;
Function GetTableDescription(table:string;DescrOnly:boolean=False):string;
Function GetJOperTypeDescription(oper:integer):string;
Procedure GetCheckLinksList(Var CheckLinksList:TMemTableEh;table:string);
Function UniCheckAllLinksForTable(Table:string;nrec:int64;Var LinksComment:string):boolean;
function IniReadString(const FileName, Section, Line: string;Var Value:string):boolean;
function IniWriteString(const FileName, Section, Line, Value: string):boolean;
function IniReadBool(const FileName, Section, Line: string;Var Value:boolean):boolean;
function IniWriteBool(const FileName, Section, Line:string; Value: boolean):boolean;
function GetCurrentOsUserName: string;
Function GetGalNaklName(vidsopr:integer):string;
Procedure DelOldHistoryStrings(Var mains:string;limit:integer=4000);
Procedure AppendHistoryString(Var mains:string;s:string;AppendEmpty:boolean=False;UseLimit:boolean=True);
function GetRightFileName(const FileName: string): string;
Function GetTextColorOfTheme(col:TColor;style:string):TColor;

implementation

Function GetTextColorOfTheme(col:TColor;style:string):TColor;
Begin
 result:=col;
 style:=AnsiUpperCase(Trim(style));
 if (col=clGreen) and ((style='METRO BLUE') or (style='METRO GREEN')) then result:=clLime;
 if (col=clMaroon) and ((style='METRO BLUE') or (style='METRO GREEN')) then result:=clFuchsia;

End;

function GetRightFileName(const FileName: string): string;
const
  CHARS=  ['\', '/', ':', '*', '?', '"', '<', '>', '|'];
var
  I: integer;
begin
 result:=EmptyStr;
 for i:=1 to Length(FileName) do
  Begin
   if FileName[i] in CHARS then result:=result+'_'
                           else result:=result+FileName[i];
  End;
end;

Function GetStrVers(v:integer):string;
Var
 m,d:integer;
Begin
 m:=v div 100;
 d:=v mod 100;
 result:=IntToStr(m)+'.'+Padl(IntToStr(d),2,zero);
End;

Procedure DelOldHistoryStrings(Var mains:string;limit:integer=4000);
Var
 lines:TStringList;
Begin
 if Length(mains)>limit then
  Begin
   lines:=TStringList.Create;
   lines.Text:=mains;
   while (lines.Count>0) and (Length(lines.Text)>limit) do lines.Delete(0);
   mains:=Trim(lines.Text);
   lines.Free;
  End;
End;

Procedure AppendHistoryString(Var mains:string;s:string;AppendEmpty:boolean=False;UseLimit:boolean=True);
Begin
 if Not Empty(s) or AppendEmpty then
  Begin
   if Not Empty(mains) then mains:=mains+lf;
   mains:=mains+s;
   if UseLimit then DelOldHistoryStrings(mains);
  End;
End;

Function GetGalNaklName(vidsopr:integer):string;
Begin
 case vidsopr of
  501: result:='на отпуск в производство (модуль "Учет в производстве")';
  506: result:='на внутреннее перемещение (модуль "Учет в производстве")';
  602: result:='"склад -> спецоснастка" (модуль "Складской учет")';
  2: result:='на внутреннее перемещение (модуль "Учет спецоснастки")';
  else result:=EmptyStr;
 end;
End;

function GetCurrentOsUserName: string;
 const
   cnMaxUserNameLen = 254;
 var
   sUserName: string;
   dwUserNameLen: DWORD;
 begin
   dwUserNameLen := cnMaxUserNameLen - 1;
   SetLength(sUserName, cnMaxUserNameLen);
   GetUserName(PChar(sUserName), dwUserNameLen);
   SetLength(sUserName, dwUserNameLen);
   Result := sUserName;
 end;


Function GetJOperTypeDescription(oper:integer):string;
Begin
 result:=IntToStr(oper);
 case oper of
  0: result:='добавление';
  1: result:='изменение';
  2: result:='удаление';
  3: result:='вход в программу';
  4: result:='выход из программы';
  5: result:='прочие';
 end;
End;

Function GetTableDescription(table:string;DescrOnly:boolean=False):string;
Begin
 table:=AnsiUpperCase(Trim(table));
 result:=table;
 if table=AnsiUpperCase(MachinesTable) then result:='Справочник станков';
 if table=AnsiUpperCase(ShopsTable) then result:='Справочник цехов/организаций';
 if table=AnsiUpperCase(JournalTable) then result:='Журнал действий пользователей';
 if table=AnsiUpperCase(PersonTable) then result:='Справочник сотрудников';
 if table=AnsiUpperCase(ProfTable) then result:='Справочник профессий';
 if (result<>table) and Not DescrOnly then result:=result+' ('+table+')';
End;

Function UniCheckAllLinksForTable(Table:string;nrec:int64;Var LinksComment:string):boolean;
Var
 CheckLinksList:TMemTableEh;
Begin
 result:=True;
 LinksComment:=EmptyStr;
 GetCheckLinksList(CheckLinksList,Table);
 CheckLinksList.First;
 while Not CheckLinksList.Eof and result do
  Begin
   result:=result and UniCheckLinks(CheckLinksList.FieldByName('LTable').AsString,CheckLinksList.FieldByName('LField').AsString,nrec,CheckLinksList.FieldByName('dopusl').AsString);
   if Not result then LinksComment:='в '+Quoted(GetTableDescription(CheckLinksList.FieldByName('LTable').AsString,True))+' имеется ссылка на данную запись';
   CheckLinksList.Next;
  End;
 CheckLinksList.Close; CheckLinksList.Free;
End;

Procedure GetCheckLinksList(Var CheckLinksList:TMemTableEh;table:string);
Begin
 CheckLinksList:=TMemTableEh.Create(nil);
 CheckLinksList.FieldDefs.Add('LTable', ftString, 20);
 CheckLinksList.FieldDefs.Add('LField', ftString, 20);
 CheckLinksList.FieldDefs.Add('dopusl', ftString, 255);
 CheckLinksList.CreateDataSet;
 CheckLinksList.Open;
 table:=AnsiUpperCase(Trim(table));
 if table=AnsiUpperCase(PersonTable) then
  Begin
   CheckLinksList.Append;
   CheckLinksList.FieldByName('LTable').AsString:=PersonTable;
   CheckLinksList.FieldByName('LField').AsString:='cparent';
   CheckLinksList.Post;
  End;
 if table=AnsiUpperCase(MachinesTable) then
  Begin
   CheckLinksList.Append;
   CheckLinksList.FieldByName('LTable').AsString:=PersonTable;
   CheckLinksList.FieldByName('LField').AsString:='cmachine';
   CheckLinksList.Post;
  End;
 if table=AnsiUpperCase(ShopsTable) then
  Begin
   CheckLinksList.Append;
   CheckLinksList.FieldByName('LTable').AsString:=PersonTable;
   CheckLinksList.FieldByName('LField').AsString:='ccontractor';
   CheckLinksList.Post;
   CheckLinksList.Append;
   CheckLinksList.FieldByName('LTable').AsString:=ProfTable;
   CheckLinksList.FieldByName('LField').AsString:='ccontractor';
   CheckLinksList.Post;
  End;
 if table=AnsiUpperCase(ProfTable) then
  Begin
   CheckLinksList.Append;
   CheckLinksList.FieldByName('LTable').AsString:=PersonTable;
   CheckLinksList.FieldByName('LField').AsString:='cprof';
   CheckLinksList.Post;
  End;

 CheckLinksList.First;
End;


Function TrimCommas(s:string):string;
Begin
 result:=Trim(s);
 while (Length(result)>0) and (result[1]=comma) do
  Begin
   Delete(result,1,1);
   result:=Trim(result);
  End;
 while (Length(result)>0) and (result[Length(result)]=comma) do
  Begin
   Delete(result,Length(result),1);
   result:=Trim(result);
  End;
 while Pos(comma+comma,result)>0 do
  Begin
   result:=Trim(ReplChars(result,comma+comma,comma));
  End;
End;

Function SocrFIO(s1,s2,s3:string):string;
Var
 s:string;
Begin
 s:=EmptyStr;
 If Trim(s3)<>EmptyStr then s:=Trim(s3)[1]+'.';
 If Trim(s2)<>EmptyStr then s:=Trim(s2)[1]+'.'+s else s:=EmptyStr;
 result:=Trim(s1+' '+s);
End;

Function SocrFIO2(s:string):string;
Var
 s1,s2,s3:string;
 i:integer;
Begin
 s:=Trim(s);
 i:=1;
 s1:=GetNextWord(s,i,space);
 s2:=GetNextWord(s,i,space);
 s3:=GetNextWord(s,i,space);
 result:=SocrFIO(s1,s2,s3);
End;

Function CommonDate(d:TDateTime;Postfix:string=''):string;
Begin
 result:=EmptyStr;
 if d<>0 then
  Begin
   result:=Trim(DateToStr(d)+space+Postfix);
  End;
End;

Function MVDate(d:TDateTime;Postfix:string):string;
Var
 Year,Month,Day:word;
Begin
 result:=EmptyStr;
 if d<>0 then
  Begin
   DecodeDate(d,Year,Month,Day);
   result:=IntToStr(Day)+space+MonthArray[Month]+space+IntToStr(Year)+space+postfix;
  End;
End;

function CharN(s:string;n:integer):string;
Begin
 if n<=Length(s) then result:=s[n]
                 else result:=space;
End;

function AddSpaces(s:string;n:integer;spc:char=' '):string;
Var
 i:integer;
Begin
 result:=s;
 for i:=1 to (n-Length(s)) do result:=result+spc;
End;

Function EmptyIfZero(s:string):string;
Begin
 if s=zero then result:=EmptyStr
           else result:=s;
End;

procedure UniUpdateButton(Var ADOC:TAdoConnection;nrec:int64;Var Button:TButtonedEdit;TableName,NameField,NullString:string);
Begin
 if nrec=0 then Button.Text:=NullString
           else Button.Text:=
 GetTextValueOfPointerADOC(ADOC,
  IntToStr(nrec)
  ,SchemaName+dot+TableName,'nrec',NameField,False);
End;

procedure UniUpdateButton2(Var ADOC:TAdoConnection;nrec:string;Var Button:TButtonedEdit;SchemName,TableName,NrecField,NameField,NullString:string);
Begin
 if Empty(nrec) then Button.Text:=NullString
                else
                 Try
                 Button.Text:=
 GetTextValueOfPointerADOC(ADOC,nrec,SchemName+dot+TableName,NrecField,NameField,True);
                 Except
                 Button.Text:=EmptyStr;
                 End;
End;

procedure UniUpdateMultiButton(Var ADOC:TAdoConnection;Var nrecList:TStringList;Var Button:TButtonedEdit;TableName,NameField,NullString:string);
Var
 i:integer;
 s:string;
Begin
 if nrecList.Count=0 then Button.Text:=NullString
           else
            Begin
            Button.Text:=EmptyStr;
            for i:=0 to nrecList.Count-1 do
             Begin
              if Not Empty(Button.Text) then Button.Text:=Button.Text+comma+space;
              s:=
               GetTextValueOfPointerADOC(ADOC,
               IntToStr(StrToIntM(nrecList[i]))
               ,SchemaName+dot+TableName,'nrec',NameField,False);
              if Empty(s) then s:='{NREC:'+nrecList[i]+'}';
              Button.Text:=Button.Text+s;
             End;
            End;
End;

Function GetRecordInfoText(nrec:int64;insert_user:string;insert_date:TDateTime):string;
Var
 udesc:string;
Begin
 if nrec=0 then result:='Новая запись'
           else result:='Уникальный идентификатор записи: '+IntToStr(nrec);
 if nrec<>0 then
 Begin
 insert_user:=AnsiUpperCase(insert_user);
 if (insert_user=AnsiUpperCase(SchemaName)) or (insert_user='SYS_GALADMIN') then udesc:='Системная учетная запись'
  else udesc:=
  Trim(
  Trim(GetTextValueOfPointerADOC(GlobADOC,insert_user,SchemaName+dot+UsersTable,'orauser','lname',True))+space+
  Trim(GetTextValueOfPointerADOC(GlobADOC,insert_user,SchemaName+dot+UsersTable,'orauser','fname',True))+space+
  Trim(GetTextValueOfPointerADOC(GlobADOC,insert_user,SchemaName+dot+UsersTable,'orauser','mname',True))
  );
 if Empty(udesc) then udesc:='Не определен';
 result:=result+comma+space+'добавлена пользователем '+Quoted(udesc)+space+DateTimeToStr(insert_date);
 End;
End;

Procedure NotImplementedFunctionMessage;
Begin
 ShowMessage('Извините, эта функция пока не реализована...');
End;

Function ColumnIndexOfName(Var Grid:TDBGridEh;ColumnName: String):integer;
var
  i: Integer;
begin
 result:=-1;
 ColumnName:=AnsiUpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if AnsiUpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      result:=i;
      break;
    end;
  end;
end;

Procedure ColumnVis(Var Grid:TDBGridEh;ColumnName: String;vis:boolean);
var
  i: Integer;
begin
 ColumnName:=AnsiUpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if AnsiUpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].Visible:=Vis;
      break;
    end;
  end;
end;

Procedure ColumnSetTitle(Var Grid:TDBGridEh;ColumnName: String;Capt:string);
var
  i: Integer;
begin
 ColumnName:=AnsiUpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if AnsiUpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].Title.Caption:=Capt;
      break;
    end;
  end;
end;

Procedure ColumnSetOtherFieldName(Var Grid:TDBGridEh;ColumnName:String;OtherFieldName:string);
var
  i: Integer;
begin
 ColumnName:=AnsiUpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if AnsiUpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].FieldName:=OtherFieldName;
      break;
    end;
  end;
end;

Function GetLastNumString(cshops,lastnum:int64):string;
Var
 code:string;
Begin
 result:=Padl(IntToStr(lastnum),5,zero);
 if true {cshops<>0} then
  Begin
   code:=Trim(GetTextValueOfPointerADOC(GlobADOC,IntToStr(cshops),SchemaName+dot+ShopsTable,'nrec','code',False));
   code:=Padl(code,3,zero);
   if true {code<>'000'} then
    result:=result+'/'+code;
  End;
End;

Procedure GetLastNumFromString(s:string;Var lastnum:int64);
Var
 i:integer;
 l:int64;
Begin
 i:=Pos('/',s);
 if i=0 then i:=Length(s)+1;
 s:=Trim(Copy(s,1,i-1));
 l:=StrToIntM(s);
 if l<>0 then lastnum:=l;
End;


Procedure GetMasterChilds(mnrec:int64;Var list:TStringList);
Var
 adoq:TAdoQuery;
 s:string;
Begin
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=GlobADOC;
 adoq.SQL.Text:='select * from '+SchemaName+dot+PersonTable+' where cparent='+IntToStr(mnrec);
 adoq.Open;
 while Not adoq.Eof do
  Begin
   s:=IntToStr(adoq.FieldByName('nrec').AsLargeInt);
   if list.IndexOf(s)=-1 then
    Begin
     list.Append(s);
     GetMasterChilds(adoq.FieldByName('nrec').AsLargeInt,list);
    End;
   adoq.Next;
  End;
 adoq.Close;
 adoq.Free;
End;

Function GetMasterPFilter(mnrec:int64;ffield:string='cperson'):string;
Var
 list:TStringList;
Begin
 if mnrec=0 then result:=Truu
  else
   Begin
    list:=TStringList.Create;
    list.Append(IntToStr(mnrec));
    GetMasterChilds(mnrec,list);
    result:=ffield+' in ('+list.CommaText+')';
    list.Free;
   End;
End;

Function SpaceIfEmpty(s:string):string;
Begin
 if Length(s)=0 then result:=space
                else result:=s;
End;

Function GetShopFilter(CUcshops:int64;CUshop2shop:boolean;field:string='ccontractor'):string;
Begin
 if (CUcshops=0) or CUshop2shop then result:=Truu
                                else result:=field+'='+IntToStr(CUcshops);
End;

Function UniCheckLinks(LTable,LField:string;nrec:int64;dopusl:string=''):boolean;
Var
 adoq:TAdoQuery;
Begin
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=GlobADOC;
 adoq.CursorLocation:=clUseServer;
 ADOQ.SQL.Text:='select count(*) as cnt from '+SchemaName+dot+LTable+' where '+LField+'='+IntToStr(nrec);
 if Not Empty(dopusl) then ADOQ.SQL.Text:=ADOQ.SQL.Text+andd+dopusl;
 ADOQ.Open;
 result:=(ADOQ.FieldByName('cnt').AsInteger=0);
 ADOQ.Close;
 adoq.Free;
End;


Function OraInsertRecordAnGetID(Var ADOC:TAdoConnection;TableName,PKFieldName,SEQName:string;Fields:string='';Values:string=''):LargeInt;
Var
 adoq:TAdoQuery;
Begin
 adoq:=TAdoQuery.Create(nil);
 adoq.Connection:=ADOC;
 adoq.Parameters.CreateParameter('nrec',ftLargeInt,pdOutput,0,0);
 if Not Empty(Fields) then Fields:=comma+Fields;
 if Not Empty(Values) then Values:=comma+Values;
 adoq.SQL.Text:='begin insert into '+TableName+' ('+PKFieldName+Fields+') VALUES ('+SEQName+'.nextval'+Values+') returning '+PKFieldName+' into :nrec; commit; end;';
 Try
  adoq.ExecSQL;
  result:=adoq.Parameters.ParamByName('nrec').Value;
 Except on E:Exception do
  Begin
   result:=0;
//   ToLog(E.Message);
  End;
 End;
 adoq.Free;
End;


Function FloatToStrPro(v:double):string;
Begin
 result:=EmptyStr;
 if v<>0 then result:=FloatToStr(v);
End;

Function IntToStrPro(v:integer):string;
Begin
 result:=EmptyStr;
 if v<>0 then result:=IntToStr(v);
End;

Function AddSlashes(s:string):string;
Var
 i:integer;
 ss:string;
Begin
 ss:=EmptyStr;
 For i:=1 to Length(s) do
  Begin
   if (s[i]='''') or (s[i]='`') then ss:=ss+''''''
                else
                    if s[i]='"' then ss:=ss+''''''
                                else ss:=ss+s[i];
  End;
 result:=ss;
End;

Function GetTextValueOfPointerADOC(Var ADOC:TAdoConnection;Pointr,Table,NrecName,TextFldName:string;StrPointer:boolean=False):string;
Var
 ADOQ:TAdoQuery;
 cc:string;
Begin
 result:=EmptyStr;
 if Pointr<>zero then
  Begin
   ADOQ:=TAdoQuery.Create(ADOC);
   ADOQ.Connection:=ADOC;
   if Not StrPointer then Pointr:=IntToStr(StrToIntM(Pointr));
   if StrPointer then cc:=''''
                 else cc:=EmptyStr;
   if StrPointer then pointr:=AddSlashes(pointr);
   ADOQ.SQL.Text:='select '+TextFldName+' from '+Table+' where '+NrecName+'='+cc+Pointr+cc;
   ADOQ.Open;
   if ADOQ.RecordCount>0 then result:=ADOQ.FieldByName(TextFldName).AsString;
   ADOQ.Close;
   ADOQ.Free;
  End;
End;

procedure SaveDBGridEhParams(DBGridEh: TDBGridEh; const FileName, Section: string);
var r: TIniFile;
begin
 Try
     if DBGridEh <> nil then
     begin
      r := TIniFile.Create(FileName);
      DBGridEh.SaveColumnsLayout(r, Section);
      r.Free;
     end;
 Except
 End;
end;

procedure RestoreDBGridEhParams(DBGridEh: TDBGridEh; const FileName, Section: string);
var r: TIniFile;
begin
 Try
     if DBGridEh <> nil then
     begin
      r := TIniFile.Create(FileName);
      DBGridEh.RestoreColumnsLayout(r, Section, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
      r.Free;
     end;
 Except
 End;
end;



Function GetIntVers(s:string):integer;
Var
 i:integer;
 m,d:integer;
Begin
 i:=Pos('.',s);
 If i=0 then i:=Length(s)+1;
 m:=StrToIntM(Copy(s,1,i-1));
 d:=StrToIntM(Padl(Copy(s,i+1,Length(s)-i),2,'0'));
 result:=m*100+d;
End;

Function GetStyle(bold,italic:boolean):TFontStyles;
Begin
 result:=[];
 If bold then result:=result+[fsBold];
 If italic then result:=result+[fsItalic];
End;

Function GetINNKPPS(inn,kpp:string):string;
Begin
 If Empty(kpp) then result:=inn
               else result:=inn+'/'+kpp;
End;

Procedure ToLog(s:string;username:string;rewrit:boolean=False);
Var
 f:TextFile;
 fn:string;
 n:TDateTime;
 opened:boolean;
Begin
 If true {debug} then
  Begin
   fn:=IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'debug.txt';
   AssignFile(f,fn);
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
      opened:=True;
     Except
      opened:=False;
     End;
    End else opened:=False;

   If opened then
    Begin
     n:=Now;
     Try
      WriteLn(f,DateTimeToStr(n)+space+username+dotdot+space+{CurrentUser.Login+dotdot+space+}s);
     Finally
      CloseFile(f);
     End;
    End;

  End;
End;

Procedure InitLog;
Var
 fn:string;
Begin
 If true then
  Begin
   fn:=IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'debug.txt';
   If FileExists(fn) then
    Try
     DeleteFile(PWideChar(fn));
    Except
    End;
  End;
End;


Function RoundCurrency(c:currency):Currency;
Begin
 result:=RoundUp(c*100)/100;
End;

Function SokrFIO(s:string):string;
Var
 ss,s1,s2,s3:string;
 i:integer;
Begin
 If Pos(dot,s)=0 then
 Begin
 i:=1;
 s1:=GetNextWord(s,i,space);
 s2:=GetNextWord(s,i,space);
 s3:=GetNextWord(s,i,space);
 ss:=EmptyStr;
 If Trim(s3)<>EmptyStr then ss:=Trim(s3)[1]+dot;
 If Trim(s2)<>EmptyStr then ss:=Trim(s2)[1]+dot+ss else ss:=EmptyStr;
 result:=Trim(s1+space+ss);
 End
  else result:=Trim(s);
End;


Function GetNumOfLinesInTXTFile(Sender:TComponent;FileName:string):integer;
Var
 mw:TMagsoftWaitDialog;
 f:TextFile;
 s:string;
Begin
 result:=0;
 If FileExists(FileName) then
  Begin
   AssignFile(f,FileName);
   Try
    ReSet(f);
    mw:=TMagsoftWaitDialog.Create(Sender);
    mw.CreateWait('Загрузка данных из файла '+ExtractFileName(FileName),0);
    While Not Eof(f) do
     Begin
      ReadLn(f,s);
      Inc(result);
      mw.Update(0);
     End;
    CloseFile(f);
    mw.KillWait;
    mw.Free;
   Except
   End;
  End;
End;

Function FirstCharUpper(s:string):string;
Begin
 result:=s;
 If Not Empty(s) then result[1]:=AnsiUpperCase(Copy(result,1,1))[1];
End;

Function CurrToStrM(s:Currency):string;
Begin
 result:=FormatCurr('0.00',s);
End;


Function SetRegKey(RootKey:HKEY;Root,Key,Value:string):boolean;
Var
 reg:TRegistry;
Begin
  result:=False;
  Try
  reg := TRegistry.Create;
  reg.RootKey := RootKey;
  If (reg.OpenKey(Root,True)) then
   Begin
    reg.WriteString(Key, Value);
    result:=True;
    reg.CloseKey;
   End;
  reg.Destroy;
  Except
  End;
End;


Function StrToFloatM(s:string):Extended;
Begin
 result:=0;
 TryStrToFloat(s,result);
End;

Function StrToDateM(s:string):TDateTime;
Begin
 If Not TryStrToDate(s,result) then result:=0;
End;

Function To_OraDate(dt:integer):TDateTime;
Var
 yy,mm,tmp:integer;
Begin
 YY := dt div 65536;
 TMP := dt mod 65536;
 MM := TMP div 256;
 TMP := TMP mod 256;
 result:=StrToDateM(Padl(IntToStr(TMP),2,zero)+dot+Padl(IntToStr(MM),2,zero)+dot+Padl(IntToStr(YY),4,zero));
End;

Function To_AtlDate(dt:TDateTime):integer;
Var
 yy,mm,dd:word;
Begin
 DecodeDate(dt,yy,mm,dd);
 result:=dd+mm*256+yy*65536;
End;

function IsKeyDown(vk: Word):Boolean;
begin
  Result := GetKeyState(vk) and $8000 = $8000;
end;
// vk для Ctrl, Shift, Alt соответственно равны: vk_control, vk_shift и vk_menu


{
function DateTimeToUnixTime(DelphiDate : TDateTime) : LongInt;
begin
  Result := Trunc((DelphiDate - Offset1970) * SecPerDay);
end;
}
Function MyGetTempFileName(path,prefix,ext:string):string;
Var
 i:integer;
Begin
 i:=OldTempFileNameNum+1;
 While FileExists(path+prefix+IntToStr(i)+ext) do Inc(i);
 OldTempFileNameNum:=i;
 result:=path+prefix+IntToStr(i)+ext;
End;

Procedure HMHMPeriod(s:string;Var h1,m1,h2,m2:integer);
Var
 s1,s2:string;
 i:integer;
Begin
 i:=1;
 s1:=GetNextWord(s,i,tire);
 s2:=GetNextWord(s,i,tire);
 CHMSToInteger(s1,h1,m1,i);
 CHMSToInteger(s2,h2,m2,i);
End;

Function GetTrueDelim(s:string):char;
Var
 ss:string;
Begin
 result:=space;
 If Length(s)=1 then result:=s[1];
 If Length(s)>2 then
  Begin
   If (s[1]='<') and (s[Length(s)]='>') then
    Begin
     ss:=AnsiUpperCase(Copy(s,2,Length(s)-2));
     If ss='SPACE' then result:=space;
     If ss='ПРОБЕЛ' then result:=space;
     If ss='TAB' then result:=#9;
     If ss='ТАБ' then result:=#9;
    End;
  End;
End;

function RusLatStr(s:string): boolean;
Var
 i:integer;
 ss:string;
begin
 result:=True;
 ss:=AnsiUpperCase(s);
 For i:=1 to Length(ss) do If not (ss[i] in Buk) then result:=False;
end;


Function GetKodFromName(s:string):string;
Const
 sk1='[';
 sk2=']';
Var
 i,start,len:integer;
 ns:string;
Begin
 ns:=zero;
 i:=Length(s);
 While (i>0) and (s[i]<>sk1) do Dec(i);
 If (i>0) and (s[i]=sk1) then
  Begin
   Inc(i);
   start:=i;
   len:=0;
   While (i<=Length(s)) and (s[i]<>sk2) do
    Begin
     Inc(i);
     Inc(len);
    End;
   If (i<=Length(s)) and (s[i]=sk2) then
    Begin
     ns:=Copy(s,start,len);
    End;
  End;
 result:=Trim(ns);
End;


Function SetRegKey(Key:string;Value:string):boolean;
var
  reg : TRegistry;
begin
  result:=False;
  reg := TRegistry.Create;
  if (reg.OpenKey(BaseKey,True)) then
  begin
    reg.WriteString(Key, Value);
    result:=True;
    reg.CloseKey;
  end;
  reg.Destroy;
end;

Function ReadRegKey(Key:string;Var Value:string):boolean;
var
  reg : TRegistry;
begin
  result:=False;
  reg := TRegistry.Create;
  if (reg.OpenKey(BaseKey,False)) then
  begin
    Value:=reg.ReadString(Key);
    result:=True;
    reg.CloseKey;
  end;
  reg.Destroy;
  If Value='' then result:=False;
end;


Function CorrectDateTime(s:string;df:integer):string;
Var
 date,time:string;
 i:integer;
Begin
 i:=1;
 date:=GetNextWord(s,i,space);
 time:=GetNextWord(s,i,space);
 result:=Trim(GetGoodDate(date,df)+space+time);
End;

Function GetGoodDate(date:string;dateformat:integer):string;
Var
 i:integer;
 s1,s2,s3,ddel:string;
 dd,mm,yy:string;
Begin
 ddel:=DetectDateDelimiter(date);
 i:=1;
 s1:=Trim(GetNextWord(date,i,ddel));
 s2:=Trim(GetNextWord(date,i,ddel));
 s3:=Trim(GetNextWord(date,i,ddel));
 Case dateformat of
  0,1: Begin dd:=s1; mm:=s2; yy:=s3; End;
    2: Begin dd:=s2; mm:=s1; yy:=s3; End;
    3: Begin dd:=s3; mm:=s2; yy:=s1; End;
    4: Begin dd:=s2; mm:=s3; yy:=s1; End;
    5: Begin dd:=s1; mm:=s3; yy:=s2; End;
    6: Begin dd:=s3; mm:=s1; yy:=s2; End;
 End;
 If Length(yy)<3 then yy:=Padl(yy,2,zero)
                 else yy:=Padl(yy,4,zero);
 result:=dd+dot+mm+dot+yy;
End;

{
Function SecToTime(sec:integer):double;
Var
 t:TDateTime;
 h,m,s:integer;
Begin
 SecToCHMS2(sec,h,m,s);
 t:=EncodeTime(h,m,s,0);
 result:=sec*MSecsPerSec/MSecsPerDay;
End;
}
Function SecToCHMS(sec:integer):string;
Begin
 result:=
 Padl2(IntToStr(sec div 3600),2,zero)+':'+
 Padl(IntToStr((sec mod 3600) div 60),2,zero)+':'+
 Padl(IntToStr(((sec mod 3600) mod 60)),2,zero);
End;

Procedure SecToCHMS2(sec:integer;Var ch,m,s:integer);
Begin
 ch:=sec div 3600;
 m:=(sec mod 3600) div 60;
 s:=(sec mod 3600) mod 60;
End;

Function ChmsToSec(s:string;Var sec:integer):boolean;
Var
 n,i,hours,mins,secs:integer;
 s1,s2,s3:string;
Begin
 sec:=0;
 n:=NumOfChar(dotdot,s);
 If (n=1) or (n=2) then
  Begin
   i:=1;
   s1:=GetNextWord(s,i,dotdot);
   s2:=GetNextWord(s,i,dotdot);
   s3:=GetNextWord(s,i,dotdot);
   If Empty(s3) then
    Begin
     s3:=s2; s2:=s1; s1:='0';
    End;
   result:=TryStrToInt(s1,hours) and TryStrToInt(s2,mins) and TryStrToInt(s3,secs);
   If result then sec:=hours*MinsPerHour*SecsPerMin+mins*SecsPerMin+secs;
  End
   else result:=False;
End;

Function ChmsToSec2(ch,m,s:integer):integer;
Begin
 result:=ch*MinsPerHour*SecsPerMin+m*SecsPerMin+s;
End;

Procedure ChmsToInteger(s:string;Var hours,mins,secs:integer);
Var
 n,i:integer;
 s1,s2,s3:string;
Begin
 hours:=0; mins:=0; secs:=0;
 n:=NumOfChar(dotdot,s);
 If (n=1) or (n=2) then
  Begin
   i:=1;
   s1:=GetNextWord(s,i,dotdot);
   s2:=GetNextWord(s,i,dotdot);
   s3:=GetNextWord(s,i,dotdot);
   If Empty(s3) then
    Begin
     s3:=zero;
    End;
   TryStrToInt(s1,hours); TryStrToInt(s2,mins); TryStrToInt(s3,secs);
  End
End;


Function DayOfWeekM(date:TDateTime):integer;
Var
 n:integer;
Begin
 n:=DayOfWeek(date)-2;
 If n=-1 then n:=6;
 result:=n;
End;

Function WeekFromDate(date:TDateTime):string;
Var
 dt:TDateTime;
Begin
 dt:=date;
 While DayOfWeekM(dt)<>0 do dt:=dt-1;
 result:=DateToStr(dt)+tire;
 dt:=date;
 While DayOfWeekM(dt)<>6 do dt:=dt+1;
 result:=result+DateToStr(dt);
End;

Function DetectDateDelimiter(s:string):string;
Var
 i:integer;
Begin
 i:=1;
 result:=dot;
 While (i<=Length(s)) and (s[i] in cif) do Inc(i);
 If (i<=Length(s)) and Not (s[i] in cif) then result:=s[i];
End;

Function GetNextWord(s:AnsiString;Var i:integer;r:string):string;
Var
 ss:string;
Begin
 ss:='';
 While (i<=Length(s)) and (s[i]<>r) do
  Begin
   ss:=ss+s[i];
   Inc(i);
  End;
 Inc(i);
 result:=ss;
End;

Function SqlString(s:string):string;
Var
 i:integer;
 ss:string;
Begin
 ss:=EmptyStr;
 For i:=1 to Length(s) do
  If s[i]=kav then ss:=ss+kav+kav
              else ss:=ss+s[i];
 result:=ss;
End;

Function ReplChars(s:string;c1,c2:char):string;
Var
 i:integer;
 ss:string;
Begin
 ss:=EmptyStr;
 For i:=1 to Length(s) do
  If s[i]=c1 then ss:=ss+c2
             else ss:=ss+s[i];
 result:=ss;
End;

Function ReplChars(s:string;c1,c2:string):string; overload;
Var
 i:integer;
 ss:string;
Begin
 ss:=s;
 i:=Pos(c1,ss);
 While i>0 do
  Begin
   Delete(ss,i,Length(c1));
   Insert(c2,ss,i);
   i:=Pos(c1,ss);
  End;
 result:=ss;
End;

Function Quoted(s:string):string;
Begin
 result:=quote+ReplChars(Trim(s),quote,'''')+quote;
End;

Function DeQuoted(s:string):string;
Begin
 result:=s;
 If Not Empty(s) then
  If (s[1]=quote) and (s[Length(s)]=quote) then result:=Trim(Copy(s,2,Length(s)-2))
                                           else
   If (s[1]=kav) and (s[Length(s)]=kav) then result:=Trim(Copy(s,2,Length(s)-2));
End;

Function MyMkDir(dir:string):boolean;
Var
 i:integer;
 s,ss:string;
Begin
 result:=True;
 If Not Empty(dir) then
 Begin
 s:=IncludeTrailingPathDelimiter(dir);
 ss:=EmptyStr;
 For i:=1 to Length(s) do
  Begin
   ss:=ss+s[i];
   If s[i]=PathDelim then
    Begin
     {$I-}
     MkDir(Copy(ss,1,Length(ss)-1));
     {$I+}
     If IOResult<>0 then result:=False;
    End;
  End;
 End;
End;

function RoundUp(X: Extended): int64;
begin
 Result := Trunc(X) + Trunc (Frac(X) * 2);
end;

function CurrToStr100M(X: Extended): string;
begin
 Result:=CurrToStr(RoundUp(x*100)/100);

 If Pos(dot,result)=0 then
end;

Function LostTime(Past,PastPr,FullPr:integer):integer;
Begin
 If PastPr>0 then result:=RoundUp(Past*FullPr/PastPr-Past)
             else result:=3600;
End;

Function SecToTime(sec:integer):string;
Var
 h,m,s:integer;
Begin
 h:=sec div 3600;
 m:=(sec-h*3600) div 60;
 s:=sec-h*3600-m*60;
 SecToTime:=Padl(IntToStr(h),2,'0')+':'+Padl(IntToStr(m),2,'0')+':'+Padl(IntToStr(s),2,'0');
End;

Function GetOkonchanie(s:string;n:integer):string;
Var
 l:integer;
Begin
 l:=Length(s);
 If n<=l then result:=Copy(s,l-n+1,n)
         else result:=s;
End;

Function NumOfChar(c:char;s:string):integer;
Var
 i,n:integer;
Begin
 n:=0;
 For i:=1 to Length(s) do If s[i]=c then Inc(n);
 result:=n;
End;

Function GetLastCharNum(c:char;s:string):integer;
Var
 i:integer;
 fnd:boolean;
Begin
 i:=Length(s);
 fnd:=False;
 While (i>0) and Not fnd do
  Begin
   If s[i]=c then fnd:=True;
   If Not fnd then Dec(i);
  End;
 result:=i;
End;

Function GetLastWord(s:string):string;
Var
 n:integer;
Begin
 result:=EmptyStr;
 If NumOfChar(' ',s)>0 then
  Begin
   n:=GetLastCharNum(' ',s);
   result:=Trim(Copy(s,n+1,Length(s)-n));
  End;
End;

Function BezLastWord(s:string):string;
Var
 n:integer;
Begin
 result:=s;
 If NumOfChar(' ',s)>0 then
  Begin
   n:=GetLastCharNum(' ',s);
   result:=Trim(Copy(s,1,n-1));
  End;
End;

Function Empty(s:string):boolean;
Begin
 If Length(Trim(s))=0 then result:=True
                      else result:=False;
End;

Function Cifry(s:string):boolean;
Var
 i:integer;
begin
 result:=True;
 For i:=1 to Length(s) do If not (s[i] in cif) then result:=False;
end;

Function StrToIntM(s:string):integer;
Begin
 If GoodInteger(s) then result:=StrToInt(s)
                   else result:=0;
End;

Function StrToCurrM(s:string):currency;
Begin
 result:=0;
 TryStrToCurr(s,result);
End;

Function GoodInteger(s:string):boolean;
Var
 i,l:integer;
 ss:string;
 ok:boolean;
begin
 ok:=True;
 l:=Length(s);
 If (l=0) or (l>10) then ok:=False;
 If ok then
  Begin
   ss:=s;
   If ss[1]='-' then
    Begin
     Delete(ss,1,1);
     ok:=False;
    End;
   For i:=1 to Length(ss) do If not (ss[i] in cif) then ok:=False;
  End;
 result:=ok;
end;

Function GetCod(s:string;Var bez:string):string;
Var
 ss:string;
 i:integer;
Begin
 ss:='';
 bez:=s;
 i:=Length(s);
 If i>0 then
  If s[i]=')' then
   Begin
    bez:='';
    Dec(i);
    While (i>0) and (s[i]<>'(') do
     Begin
      ss:=s[i]+ss;
      Dec(i);
     End;
    {If Not Cifry(ss) then ss:='';}
    Dec(i); Dec(i);
    While (i>0) do
     Begin
      bez:=s[i]+bez;
      Dec(i);
     End;
   End;
 GetCod:=ss;
End;

Function Padl(s:string;n:integer;c:char):string;
Var
 ss:string;
 i,l:integer;
Begin
 l:=Length(s);
 If l>=n then ss:=Copy(s,1,n)
                 else
                  Begin
                   ss:=s;
                   For i:=1 to n-l do ss:=c+ss;
                  End;
 Padl:=ss;
End;

Function Padl2(s:string;n:integer;c:char):string;
Var
 ss:string;
 i,l:integer;
Begin
 l:=Length(s);
 ss:=s;
 If l<n then
                  Begin
                   For i:=1 to n-l do ss:=c+ss;
                  End;
 result:=ss;
End;

Function Padr(s:string;n:integer;c:char):string;
Var
 ss:string;
 i,l:integer;
Begin
 l:=Length(s);
 If l>=n then ss:=Copy(s,1,n)
                 else
                  Begin
                   ss:=s;
                   For i:=1 to n-l do ss:=ss+c;
                  End;
 Padr:=ss;
End;

Function BezExt(s:string):string;
Var
 ss:string;
 i:integer;
Begin
 ss:=s;
 i:=Length(s);
 While (i>0) and (s[i]<>'.') and (s[i]<>'\') and (s[i]<>':') do Dec(i);
 If (i>0) and (s[i]='.') then ss:=Copy(s,1,i-1);
 BezExt:=ss;
End;

Function UniMTEToExcel(Sender:TComponent;MTE:TDataSet;filenam:string):boolean;
Var
 Excel,WorkBook:Variant;
 mw:TMagsoftWaitDialog;
 i,j,n,i0:integer;
 ss,shtuk,curvin:string;
 grsht,grtn,grnch:double;
begin
 result:=True;
 mw:=TMagsoftWaitDialog.Create(Sender);
 mw.CreateWait('Выгрузка данных в '+filenam,MTE.RecordCount);
 CoInitialize(nil);
 i:=1;
 Try
  Excel:=CreateOLEObject('Excel.Application');
  WorkBook:=Excel.WorkBooks.Add;
  For j:=0 to MTE.FieldList.Count-1 do
   Begin
    WorkBook.WorkSheets[1].Cells[i,j+1].Value:=MTE.FieldList[j].FullName;
    WorkBook.WorkSheets[1].Cells[i,j+1].Font.Bold:=True;
   End;
  Inc(i);
 MTE.First;
 While Not MTE.Eof do
  Begin
   For j:=0 to MTE.FieldList.Count-1 do
    Begin
     If MTE.FieldList[j].DataType=ftString then ss:=''''
                                           else ss:=EmptyStr;
     WorkBook.WorkSheets[1].Cells[i,j+1].Value:=ss+MTE.FieldByName(MTE.FieldList[j].FullName).AsString;
     If MTE.FieldList[j].DataType=ftString then
      Begin
       WorkBook.WorkSheets[1].Cells[i,j+1].NumberFormat:='@';
      End;
     If MTE.FieldList[j].DataType=ftFloat then
      Begin
       WorkBook.WorkSheets[1].Cells[i,j+1].NumberFormat:='0,0000';
      End;
    End;
   mw.Update(MTE.RecNo);
   MTE.Next;
   Inc(i);
  End;
 WorkBook.WorkSheets[1].Cells.Columns.AutoFit;
 If FileExists(filenam) then DeleteFile(PWideChar(filenam));
 WorkBook.SaveAs(filenam,18);
 WorkBook.Close(False);
 VarClear(WorkBook);
 VarClear(Excel);
 Except
  on E: Exception do
   Begin
    mw.KillWait;
    result:=False;
    Application.MessageBox(PWideChar(E.Message), 'Ошибка при экспорте данных в Excel', MB_OK +MB_ICONERROR);
   End;
 End;
 CoUnInitialize;
 mw.KillWait;
 mw.Free;
end;

function IniReadString(const FileName, Section, Line: string;Var Value:string):boolean;
var
  Ini: TIniFile;
begin
  result:=True;
  Ini := TIniFile.Create(FileName);
  try
    Value := Ini.ReadString(Section, Line, EmptyStr);
    Ini.Free;
  except
    result:=False;
    Value:=EmptyStr;
  end;
end;

function IniWriteString(const FileName, Section, Line, Value: string):boolean;
var
  Ini: TIniFile;
begin
  result:=True;
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteString(Section, Line, Value);
    Ini.Free;
  except
    result:=False;
  end;
end;

function IniReadBool(const FileName, Section, Line: string;Var Value:boolean):boolean;
var
  Ini: TIniFile;
begin
  result:=True;
  Ini := TIniFile.Create(FileName);
  try
    Value := Ini.ReadBool(Section, Line, False);
    Ini.Free;
  except
    result:=False;
    Value:=False;
  end;
end;

function IniWriteBool(const FileName, Section, Line:string; Value: boolean):boolean;
var
  Ini: TIniFile;
begin
  result:=True;
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteBool(Section, Line, Value);
    Ini.Free;
  except
    result:=False;
  end;
end;

end.
