unit BotizReportSummaryUnit;

interface

uses
  Data.DB, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ADODB, SprPersonUnit, SharedUnit,
  LoginUnit, GlobVarsUnit, JclFileUtils, EncryptorUnit, Vcl.ExtCtrls, Vcl.Themes,
  MagsoftUniSelector2Unit, UniDocumentUnit, UniLoggerUnit, MagsoftWaitDialog,
  ComObj, ActiveX, ExcelXP, MagsoftMsgDlgUnit, PeriodFormUnit, MemTableEh,
  UniDocumentExcelControllerUnit;

type
  TMainForm = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadVars(Sender:TObject);
    procedure BuildReport;
    procedure ReportToExcel(ReportDocument,PlanDocument:TUniDocument;Logger:TUniLogger);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure LoadConstVars;
Var
 Shell,Envir:variant;
Begin
 OraConString:='Provider=MSDAORA.1';
 MainDir:=IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'..'+PathDelim;
 INIFile:=MainDir+'MultiPlug2.ini';
 PicturesDir:=EmptyStr;
 FlagClose:=MainDir+'flagClose.txt';
 ReportsDir:=MainDir+IncludeTrailingPathDelimiter('Reports');
 TempDir:=IncludeTrailingPathDelimiter(PathGetTempPath);
End;

procedure TMainForm.LoadVars(Sender:TObject);
Var
 s:string;
Begin
 If Not IniReadString(INIFile,INIMainSection,'PicturesDir',s) then s:=EmptyStr;
 if Not Empty(s) then PicturesDir:=IncludeTrailingPathDelimiter(s);

 If Not IniReadString(INIFile,INIMainSection,'FlagClose',s) then s:=EmptyStr;
 if Not Empty(s) then FlagClose:=s;

 Timer1.Enabled:=True;

 If ParamCount>0 then
  Begin
   if Not Empty(ParamStr(1)) then
    Begin
     orcl:=ParamStr(1);
     SetRegKey('orcl',orcl);
    End;
  End
   else
  Begin
 If Not ReadRegKey('orcl',orcl) then
  Begin
   orcl:='server1571';
   SetRegKey('orcl',orcl);
  End;
  End;

 LastUserLogin:=EmptyStr;
 If ReadRegKey('LastUserLogin',s) then LastUserLogin:=Trim(s);

 if Empty(LastUserLogin) then LastUserLogin:=GetCurrentOsUserName;

 OraConString:=OraConString+';Data Source='+orcl;
End;


procedure TMainForm.Timer1Timer(Sender: TObject);
begin
 if Not Empty(FlagClose) and FileExists(FlagClose) then
  Begin
   Timer1.Enabled:=False;
   Self.OnCloseQuery:=nil;
   Try
    Application.Terminate;
   Except
   End;
  End;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 SprPerson:TSprPerson;
 estr:TEncryptStr;
 sm:TStyleManager;
begin
 sm := TStyleManager.Create;
 if Not ReadRegKey('ActiveStyle',ActiveStyle) then ActiveStyle:=DefaultStyle;
 if Not sm.TrySetStyle(ActiveStyle, false) then
  Begin
   ActiveStyle:=DefaultStyle;
   sm.TrySetStyle(ActiveStyle, false);
  End;
 if Not Empty(sm.ActiveStyle.Name) then SetRegKey('ActiveStyle',sm.ActiveStyle.Name);
 sm.Free;


 LoggedIn:=False;
 Winapi.Windows.SetEnvironmentVariable(PChar('NLS_LANG'), PChar('RUSSIAN_CIS.CL8MSWIN1251'));
 Randomize;
 System.SysUtils.FormatSettings.DecimalSeparator:=dot;
 System.SysUtils.FormatSettings.CurrencyDecimals:=2;
 System.SysUtils.FormatSettings.ThousandSeparator:=space;
 System.SysUtils.FormatSettings.CurrencyString:=EmptyStr;
 System.SysUtils.FormatSettings.ShortDateFormat:='dd.MM.yyyy';
 System.SysUtils.FormatSettings.LongTimeFormat:='hh:mm:ss';
 Application.UpdateFormatSettings:=False;

 LoadConstVars;
 LoadVars(Sender);

 Timer1Timer(Sender);

 CurrentUser.Init;

 If ParamCount>=3 then
  Begin
   estr:=TEncryptStr.Create;
   LoggedIn:=CurrentUser.InitFromLP(ParamStr(2),estr.DecryptStr(ParamStr(3)));
   estr.Free;
  End
                  else LoggedIn:=CurrentUser.InitFromForm(Sender);
 If Not LoggedIn then Application.Terminate
                 else
                  Begin
                   SetRegKey('LastUserLogin',CurrentUser.login);
                   OraConString:=OraConString+';Password='+CurrentUser.psw+';User ID='+CurrentUser.login;
                  End;
 GlobADOC:=TAdoConnection.Create(Self);
 GlobADOC.LoginPrompt:=False;
 GlobADOC.ConnectionString:=OraConString;
 GlobADOC.CursorLocation:=clUseServer;
 Try
  GlobADOC.Open;
  LoggedIn:=True;
 Except
  ShowMessage('Ошибка подключения к базе данных!');
  Application.Terminate;
 End;

 BuildReport;
{ SprPerson:=TSprPerson.Create;
 SprPerson.Edit(Self,(CurrentUser.cusergroup<>1) and (CurrentUser.cusergroup<>8));
 SprPerson.Free;
}

end;

procedure TMainForm.BuildReport;
var
 planIndex:integer;
 planList:TStringList;
 adoq:TADOQuery;
 dadoq:TADOQuery;
 spAktsADOQ:TADOQuery;
 s:string;
 Logger:TUniLogger;
 ReportDocument,PlanDocument,SpPlanDocument,KdDocument,MarkDocument:TUniDocument;
 SpPlanDataset:TUniChildDataset;
 Field:TUniField;
 cmark:Largeint;
 dkol:integer;
 ok,onlyInAkts:boolean;
 aktDate1,aktDate2:TDateTime;
 mw:TMagsoftWaitDialog;
 spAktsMTE:TMemTableEh;
 kolsht,weight:double;
 goodMark:boolean;
begin
 ok:=True;
 Logger:=TUniLogger.Create(EmptyStr,'BotizReportSummaryProject',CurrentUser.login);
 planList:=TStringList.Create;

 spAktsADOQ:=TADOQuery.Create(nil);
 spAktsADOQ.Connection:=GlobADOC;

 spAktsMTE:=TMemTableEh.Create(nil);
 spAktsMTE.FieldDefs.Add('cmark', ftLargeint);
 spAktsMTE.FieldDefs.Add('kol', ftFloat);
 spAktsMTE.FieldDefs.Add('weight', ftFloat);
 spAktsMTE.CreateDataset;
 spAktsMTE.Open;

 adoq:=TADOQuery.Create(nil);
 adoq.Connection:=GlobADOC;
 adoq.SQL.Text:='select * from '+SchemaName+dot+PlansTable+' order by pyear desc,pmonth desc';
 Try
  adoq.Open;
  while Not adoq.Eof do
  begin
   try
    s:=MonthArray[adoq.FieldByName('pmonth').AsInteger-1];
   except
    s:=adoq.FieldByName('pmonth').AsString;
   end;
   s:=s+space+adoq.FieldByName('pyear').AsString+' года';
   planList.Append(s);
   adoq.Next;
  end;
 Except on E:Exception do
  Begin
   ok:=False;
   if Logger <> nil then TUniLogger(Logger).ToLog(E.Message);
   ShowMessage('Ошибка при загрузке списка планов! '+E.Message);
  End;
 End;

 if (planList.Count>0) and ok then
  Begin
   planIndex:=GetUniSelect2Result(Self,planList,0,'Выберите план');
   if planIndex<>-1 then // пользователь выбрал план из списка
    begin
     onlyInAkts:=(MagsoftMessageDlg(
     'Отчет по ВСЕМ строкам выбранного плана? Да - по всем позициям плана, Нет - только позиции плана, имеющиеся в актах сдачи ГП.'
     ,mtConfirmation,[mbNo,mbYes],0,mbYes)<>mrYes);
     try
     adoq.RecNo:=planIndex+1;
     ReportDocument:=TUniDocument.Create(Logger);
     Field:=TUniField.Create; Field.SetFieldName('shablon_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('razmet_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('messesab_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('zachist_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('cincina_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('rezka2_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('pelszonnt_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('valcov_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('gibka_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('strozh_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('otverst_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('pilaol222_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('pravka_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('gibkavkuz_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     // Остальные нормы (для марки)-->
     Field:=TUniField.Create; Field.SetFieldName('sborka_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('svarka_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('grpokr_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('dovodka_nv'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     // <-- Остальные нормы (для марки)
     Field:=TUniField.Create; Field.SetFieldName('weight'); Field.DataType:=ftFloat; ReportDocument.fields.Add(Field);
     Field:=TUniField.Create; Field.SetFieldName('repdate'); Field.DataType:=ftDate; ReportDocument.fields.Add(Field);

     PlanDocument:=TUniDocument.Create(Logger);
     SpPlanDocument:=TUniDocument.Create(Logger);
     KdDocument:=TUniDocument.Create(Logger);
     MarkDocument:=TUniDocument.Create(Logger);

     PlanDocument.ReadFromTable(GlobADOC,SchemaName+dot+PlansTable,'nrec',adoq.FieldByName('nrec').AsLargeInt,True,'nrec,pyear,pmonth');

     ReportDocument.FieldByName('repdate').SetValue(Trunc(Now));

     if onlyInAkts then
      Begin
       aktDate1:=EncodeDate(PlanDocument.FieldByName('pyear').AsInteger,PlanDocument.FieldByName('pmonth').AsInteger,1);
       aktDate2:=Trunc(Now);
       ok:=GetPeriodFromForm(Self,aktDate1,aktDate2,'Период создания актов');
       if ok then
        ReportDocument.FieldByName('repdate').SetValue(aktDate2);
      End;

     if ok and onlyInAkts then
      Begin
       spAktsADOQ.CursorLocation:=clUseServer;
       spAktsADOQ.EnableBCD:=False;
       spAktsADOQ.Parameters.CreateParameter('d1',ftDateTime,pdInput,0,Trunc(aktDate1));
       spAktsADOQ.Parameters.CreateParameter('d2',ftDateTime,pdInput,0,Trunc(aktDate2)+0.99999);
       spAktsADOQ.SQL.Text:=
       'select '+
       SpAktsTable+dot+'marks_nrec as cmark'+comma+
       'sum('+SpAktsTable+dot+'quantity) as kol'+comma+
       'sum('+SpAktsTable+dot+'weight) as weight'+
       ' from '+
       SchemaName+dot+AktsTable+space+AktsTable+comma+
       SchemaName+dot+SpAktsTable+space+SpAktsTable+
       ' where '+
       '('+AktsTable+dot+'actdate between :d1 and :d2)'+andd+
       SpAktsTable+dot+'acts_id='+AktsTable+dot+'id'+
       ' group by '+SpAktsTable+dot+'marks_nrec';
       try
        spAktsADOQ.Open;
       Except on E:Exception do
        Begin
         ok:=False;
         if Logger <> nil then TUniLogger(Logger).ToLog(E.Message);
         ShowMessage('Ошибка при загрузке списка актов сдачи ГП! '+E.Message);
        End;
       End;
       if ok then
        Begin
         while Not spAktsADOQ.Eof do
         begin
          spAktsMTE.Append;
          spAktsMTE.FieldByName('cmark').Value:=spAktsADOQ.FieldByName('cmark').Value;
          spAktsMTE.FieldByName('kol').Value:=spAktsADOQ.FieldByName('kol').Value;
          spAktsMTE.FieldByName('weight').Value:=spAktsADOQ.FieldByName('weight').Value;
          spAktsMTE.Post;
          spAktsADOQ.Next;
         end;
        End;
      End;


     if ok then
      PlanDocument.ReadChildDatasetFromSQL(
      GlobADOC,
      'select cmark as cmark,sum(kolsht) as kolsht,sum(weight) as weight from '+SchemaName+dot+SpPlansTable+' where cplans='+PlanDocument.FieldByName('nrec').AsString+' group by cmark',
      SchemaName+dot+SpPlansTable,
      '','','cmark',ftLargeint);
{
      PlanDocument.ReadChildDatasetFromTable(GlobADOC,SchemaName+dot+SpPlansTable,'nrec','cplans','nrec','ordernum,ordn',ftLargeint,
      'nrec,cmark,kolsht'
      );
}
     if ok then
      SpPlanDataset:=PlanDocument.ChildDatasetByTableName(SchemaName+dot+SpPlansTable);
     if ok and (SpPlanDataset<>nil) then
      begin
       dadoq:=TADOQuery.Create(nil);
       dadoq.Connection:=GlobADOC;

       mw:=TMagsoftWaitDialog.Create(Self);
       mw.CreateWait('Формирование отчета',SpPlanDataset.mte.RecordCount);
       SpPlanDataset.mte.First;
       while Not SpPlanDataset.mte.Eof and ok and Not mw.Canceled do
        begin
         mw.Update(SpPlanDataset.mte.RecNo);
//         if SpPlanDocument.ReadFromDataset(SpPlanDataset.mte,'nrec',(SpPlanDataset.mte.RecNo=1),True) then
         if SpPlanDocument.ReadFromDataset(SpPlanDataset.mte,'cmark',(SpPlanDataset.mte.RecNo=1),True) then
          Begin
//           ShowMessage(SpPlanDocument.FieldByNameStringValue('ordernum'));
           cmark:=SpPlanDocument.FieldByName('cmark').AsLargeInt;
           if cmark<>0 then // имеется ссылка на марку - определяем нормы времени
            begin

//             if onlyInAkts then
             if onlyInAkts then
              Begin
               goodMark:=spAktsMTE.Locate('cmark',cmark,[]);
               if goodMark then
                Begin
                 kolsht:=spAktsMTE.FieldByName('kol').AsFloat;
                 weight:=spAktsMTE.FieldByName('weight').AsFloat;
                End;
              End
               else
              Begin
               goodMark:=True;
               kolsht:=SpPlanDocument.FieldByName('kolsht').AsFloat;
               weight:=SpPlanDocument.FieldByName('weight').AsFloat;
              End;

             if goodMark then
             Begin

              ReportDocument.FieldByName('weight').SetValue(ReportDocument.FieldByName('weight').AsFloat+weight);


             MarkDocument.ReadFromTable(GlobADOC,SchemaName+dot+MarksTable,'nrec',cmark,True,'nrec,ckd,t_zachist_nv,t_sborka_nv,t_svarka_nv,t_grpokr_nv,t_dovodka_nv');
             if MarkDocument<>nil then
              Begin
//             ShowMessage('найдена марка для заказа '+SpPlanDocument.FieldByNameStringValue('ordernum'));
// DMARKS.CMARK=MARKS.NREC, DMARKS.NUMP=DETAILS.NUMP, DETAILS.CKD=KD.NREC, MARKS.CKD=KD.NREC

//fl1:=ReportDocument.FieldByName('zachist_nv').AsFloat;
//fl1:=MarkDocument.FieldByName('t_zachist_nv').AsFloat;
//fl1:=SpPlanDocument.FieldByName('kolsht').AsFloat;

               ReportDocument.FieldByName('zachist_nv').SetValue(
                ReportDocument.FieldByName('zachist_nv').AsFloat+
                MarkDocument.FieldByName('t_zachist_nv').AsFloat*
                kolsht
                );
               ReportDocument.FieldByName('sborka_nv').SetValue(
                ReportDocument.FieldByName('sborka_nv').AsFloat+
                MarkDocument.FieldByName('t_sborka_nv').AsFloat*
                kolsht
                );
               ReportDocument.FieldByName('svarka_nv').SetValue(
                ReportDocument.FieldByName('svarka_nv').AsFloat+
                MarkDocument.FieldByName('t_svarka_nv').AsFloat*
                kolsht
                );
               ReportDocument.FieldByName('grpokr_nv').SetValue(
                ReportDocument.FieldByName('grpokr_nv').AsFloat+
                MarkDocument.FieldByName('t_grpokr_nv').AsFloat*
                kolsht
                );
               ReportDocument.FieldByName('dovodka_nv').SetValue(
                ReportDocument.FieldByName('dovodka_nv').AsFloat+
                MarkDocument.FieldByName('t_dovodka_nv').AsFloat*
                kolsht
                );

               dadoq.SQL.Text:='select '+
               '*'+ // заменить перечнем полей, закомментированных ниже!!!
{
               DMarksTable+dot+'frozen as frozen'+comma+
               DMarksTable+dot+'numcount as numcount'+comma+
               DetailsTable+dot+'t_shablon_nv as t_shablon_nv'+comma+
               DetailsTable+dot+'t_pravka_nv as t_pravka_nv'+comma+
               DetailsTable+dot+'t_valcov_nv as t_valcov_nv'+comma+
               DetailsTable+dot+'t_rezka2_nv as t_rezka2_nv'+comma+
               DetailsTable+dot+'t_razmet_nv as t_razmet_nv'+comma+
               DetailsTable+dot+'t_rezka_ceq as t_rezka_ceq'+comma+
               DetailsTable+dot+'t_rezka_nv as t_rezka_nv'+comma+
               DetailsTable+dot+'t_zachist_nv as t_zachist_nv'+comma+
               DetailsTable+dot+'t_otverst_nv as t_otverst_nv'+comma+
               DetailsTable+dot+'t_strozh_nv as t_strozh_nv'+comma+
               DetailsTable+dot+'t_otverst_nv as t_otverst_nv'+comma+
               DetailsTable+dot+'t_gibka_ceq as t_gibka_ceq'+comma+
               DetailsTable+dot+'t_gibka_nv as t_gibka_nv'+}
               ' from '+
               SchemaName+dot+DMarksTable+space+DMarksTable+comma+
               SchemaName+dot+DetailsTable+space+DetailsTable+
               ' where '+
               DMarksTable+dot+'cmark='+IntToStr(cmark)+andd+
               DMarksTable+dot+'nump='+DetailsTable+dot+'nump'+andd+
               DetailsTable+dot+'ckd='+MarkDocument.FieldByName('ckd').AsString;
               Try
                dadoq.Open;
                while Not dadoq.Eof and ok do
                 begin
                  if dadoq.FieldByName('frozen').AsInteger=0 then dkol:=dadoq.FieldByName('numcount').AsInteger
                                                             else dkol:=1;
                  try
                  ReportDocument.FieldByName('shablon_nv').SetValue(
                   ReportDocument.FieldByName('shablon_nv').AsFloat+
                   dadoq.FieldByName('t_shablon_nv').AsFloat*dkol*
                   kolsht
                  );
                  except
                  end;
                  ReportDocument.FieldByName('razmet_nv').SetValue(
                   ReportDocument.FieldByName('razmet_nv').AsFloat+
                   dadoq.FieldByName('t_razmet_nv').AsFloat*dkol*
                   kolsht
                  );
                  try
                  ReportDocument.FieldByName('pravka_nv').SetValue(
                   ReportDocument.FieldByName('pravka_nv').AsFloat+
                   dadoq.FieldByName('t_pravka_nv').AsFloat*dkol*
                   kolsht
                  );
                  except
                  end;
                  try
                  ReportDocument.FieldByName('valcov_nv').SetValue(
                   ReportDocument.FieldByName('valcov_nv').AsFloat+
                   dadoq.FieldByName('t_valcov_nv').AsFloat*dkol*
                   kolsht
                  );
                  except
                  end;
                  try
                  ReportDocument.FieldByName('rezka2_nv').SetValue(
                   ReportDocument.FieldByName('rezka2_nv').AsFloat+
                   dadoq.FieldByName('t_rezka2_nv').AsFloat*dkol*
                   kolsht
                  );
                  except
                  end;
                  ReportDocument.FieldByName('strozh_nv').SetValue(
                   ReportDocument.FieldByName('strozh_nv').AsFloat+
                   dadoq.FieldByName('t_strozh_nv').AsFloat*dkol*
                   kolsht
                  );
                  ReportDocument.FieldByName('otverst_nv').SetValue(
                   ReportDocument.FieldByName('otverst_nv').AsFloat+
                   dadoq.FieldByName('t_otverst_nv').AsFloat*dkol*
                   kolsht
                  );
                  ReportDocument.FieldByName('zachist_nv').SetValue(
                   ReportDocument.FieldByName('zachist_nv').AsFloat+
                   dadoq.FieldByName('t_zachist_nv').AsFloat*dkol*
                   kolsht
                  );


                  case dadoq.FieldByName('t_rezka_ceq').AsLargeInt of
                   EqEsabNrec,EqMesser1Nrec,EqMesser2Nrec:
                    ReportDocument.FieldByName('messesab_nv').SetValue(
                     ReportDocument.FieldByName('messesab_nv').AsFloat+
                     dadoq.FieldByName('t_rezka_nv').AsFloat*dkol*
                     kolsht
                    );
                   EqCincinaNrec:
                    ReportDocument.FieldByName('cincina_nv').SetValue(
                     ReportDocument.FieldByName('cincina_nv').AsFloat+
                     dadoq.FieldByName('t_rezka_nv').AsFloat*dkol*
                     kolsht
                    );
                   EqPelsNrec,EqZonntagNrec:
                    ReportDocument.FieldByName('pelszonnt_nv').SetValue(
                     ReportDocument.FieldByName('pelszonnt_nv').AsFloat+
                     dadoq.FieldByName('t_rezka_nv').AsFloat*dkol*
                     kolsht
                    );
                   Eqpilaol222Nrec:
                    ReportDocument.FieldByName('pilaol222_nv').SetValue(
                     ReportDocument.FieldByName('pilaol222_nv').AsFloat+
                     dadoq.FieldByName('t_rezka_nv').AsFloat*dkol*
                     kolsht
                    );
                  end;

                  case dadoq.FieldByName('t_gibka_ceq').AsLargeInt of
                   EqPnevmopressNrec:
                    ReportDocument.FieldByName('gibkavkuz_nv').SetValue(
                     ReportDocument.FieldByName('gibkavkuz_nv').AsFloat+
                     dadoq.FieldByName('t_gibka_nv').AsFloat*dkol*
                     kolsht
                    );
                   else
                    ReportDocument.FieldByName('gibka_nv').SetValue(
                     ReportDocument.FieldByName('gibka_nv').AsFloat+
                     dadoq.FieldByName('t_gibka_nv').AsFloat*dkol*
                     kolsht
                    );
                  end;

                  dadoq.Next;
                 end;
               Except on E:Exception do
                Begin
                 ok:=False;
                 if Logger <> nil then TUniLogger(Logger).ToLog(E.Message);
                 ShowMessage('Ошибка при загрузке описаний деталей! '+E.Message);
                End;
               End;
              dadoq.Close;
              End;
             End;
            end;
          End;
         SpPlanDataset.mte.Next;
        end;
       mw.KillWait;
       mw.Free;
       dadoq.Free;

       if ok then
        Begin
         ReportDocument.FieldsToLog('Значения норм времени');
         ReportToExcel(ReportDocument,PlanDocument,Logger);
        End;
      end;


//     ShowMessage('Разметка: '+ReportDocument.FieldByName('razmet_nv').AsString);
//     ShowMessage('Зачистка: '+ReportDocument.FieldByName('zachist_nv').AsString);

     MarkDocument.Free;
     KdDocument.Free;
     SpPlanDocument.Free;
     PlanDocument.Free;
     ReportDocument.Free;
     except on E:Exception do
      begin
       if Logger <> nil then TUniLogger(Logger).ToLog(E.Message);
       ShowMessage('Ошибка при формировании отчета! '+E.Message);
      end;
     end;

    end;
  End;


 adoq.Close;
 adoq.Free;
 planList.Free;
 spAktsADOQ.Close;
 spAktsADOQ.Free;
 spAktsMTE.Close;
 spAktsMTE.Free;
 Logger.Free;
end;

procedure TMainForm.ReportToExcel(ReportDocument,PlanDocument:TUniDocument;Logger:TUniLogger);
var
 Excel,WorkBook,WorkSheet:Variant;
 i:integer;
 total,total_site:double;
 ExcelController:TUniDocumentExcelController;
begin
 Logger:=TUniLogger.Create(EmptyStr,'BotizReportSummaryProject',CurrentUser.login);

 total:=0;
   CoInitialize(nil);
   Try
    Excel:=CreateOLEObject('Excel.Application');
    Excel.Visible:=False;
    Excel.Application.EnableEvents := false;
    Excel.DisplayAlerts := False;
    WorkBook:=Excel.WorkBooks.Add;
    WorkSheet:=WorkBook.WorkSheets.Add;
    ExcelController:=TUniDocumentExcelController.Create(WorkSheet,ReportDocument,Logger);

    i:=1;

    with ExcelController do
    begin

    MergeCells(i,1,i,2);
    ValueToCell(i,1,'Планируемые нормируемые трудозатраты на изготовление металлоконструкций за',ftString,EmptyStr,[fsBold,WrapText],14,hCenter);
//    WorkSheet.Cells[i,1].HorizontalAlignment:=xlCenter;

//    WorkSheet.Cells[i,1].WrapText:=True;
//    WorkSheet.Range[ WorkSheet.Cells.Item[i,1], WorkSheet.Cells.Item[i,2] ].Select;
//    Excel.Selection.VerticalAlignment:=xlTop;
//    WorkSheet.Range[ WorkSheet.Cells.Item[i,1], WorkSheet.Cells.Item[i,2] ].VerticalAlignment:=xlTop;
//    WorkSheet.Range[ WorkSheet.Cells.Item[i,1], WorkSheet.Cells.Item[i,2] ].HorizontalAlignment:=xlCenter;

    SetRowHeight(i,40);
    DrawBorders(i,1,i,2,True);

    Inc(i);

//    ValueToCell(i,1,DateToStr(Now),ftString,EmptyStr,[fsBold],0,hCenter);
    FieldValueToCell(i,1,'repdate',EmptyStr,[fsBold],0,hCenter);
    FieldValueToCell(i,2,'weight','0,00',[fsBold]);
//    WorkSheet.Cells[i,2].NumberFormat:='0,00';
//    WorkSheet.Cells[i,2].Value:=<факт.тонны итого>;
    Inc(i);
    ValueToCell(i,1,'Вид операции',ftString,EmptyStr,[fsBold],12,hCenter);
    ValueToCell(i,2,'Нормируемые трудозатраты, нормир.чел.час',ftString,EmptyStr,[fsBold,WrapText],12,hCenter);
//    WorkSheet.Cells[i,2].WrapText:=True;
    SetRowHeight(i,30);

//    Inc(i); ValueToCell(i,1,'Заготовительный участок'); MergeCells(i,1,i,2);
    Inc(i); ValueToCell(i,1,'Шаблонировка'); FieldValueToCell(i,2,'shablon_nv','0,00');
    Inc(i); ValueToCell(i,1,'Разметка'); FieldValueToCell(i,2,'razmet_nv','0,00');
    Inc(i); ValueToCell(i,1,'Мессер и ESAB'); FieldValueToCell(i,2,'messesab_nv','0,00');
    Inc(i); ValueToCell(i,1,'Зачистка'); FieldValueToCell(i,2,'zachist_nv','0,00');
    Inc(i); ValueToCell(i,1,'Цинцинати (ножи)'); FieldValueToCell(i,2,'cincina_nv','0,00');
    Inc(i); ValueToCell(i,1,'Строжка (ручная газовая резка)'); FieldValueToCell(i,2,'rezka2_nv','0,00');
    Inc(i); ValueToCell(i,1,'Пельс, зоннтаг'); FieldValueToCell(i,2,'pelszonnt_nv','0,00');
    Inc(i); ValueToCell(i,1,'Вальцовка'); FieldValueToCell(i,2,'valcov_nv','0,00');
    Inc(i); ValueToCell(i,1,'Гибка'); FieldValueToCell(i,2,'gibka_nv','0,00');
    Inc(i); ValueToCell(i,1,'Строжка'); FieldValueToCell(i,2,'strozh_nv','0,00');
    Inc(i); ValueToCell(i,1,'Отверстия'); FieldValueToCell(i,2,'otverst_nv','0,00');
    Inc(i); ValueToCell(i,1,'Пила OL-222'); FieldValueToCell(i,2,'pilaol222_nv','0,00');
    Inc(i); ValueToCell(i,1,'Правка'); FieldValueToCell(i,2,'pravka_nv','0,00');
    Inc(i); ValueToCell(i,1,'Гибка в кузнице'); FieldValueToCell(i,2,'gibkavkuz_nv','0,00');

    // Остальные нормы (для марки)-->
    Inc(i); ValueToCell(i,1,'Сборка'); FieldValueToCell(i,2,'sborka_nv','0,00');
    Inc(i); ValueToCell(i,1,'Сварка'); FieldValueToCell(i,2,'svarka_nv','0,00');
    Inc(i); ValueToCell(i,1,'Грунтовка/покраска'); FieldValueToCell(i,2,'grpokr_nv','0,00');
    Inc(i); ValueToCell(i,1,'Доводка'); FieldValueToCell(i,2,'dovodka_nv','0,00');
     // <-- Остальные нормы (для марки)

    DrawBorders(2,1,i,2);

    Inc(i); ValueToCell(i,1,'ВСЕГО:',ftString,EmptyStr,[fsBold],12,hRight);
    ValueToCell(i,2,
     ReportDocument.FieldByName('shablon_nv').AsFloat+
     ReportDocument.FieldByName('razmet_nv').AsFloat+
     ReportDocument.FieldByName('messesab_nv').AsFloat+
     ReportDocument.FieldByName('zachist_nv').AsFloat+
     ReportDocument.FieldByName('cincina_nv').AsFloat+
     ReportDocument.FieldByName('rezka2_nv').AsFloat+
     ReportDocument.FieldByName('pelszonnt_nv').AsFloat+
     ReportDocument.FieldByName('valcov_nv').AsFloat+
     ReportDocument.FieldByName('gibka_nv').AsFloat+
     ReportDocument.FieldByName('strozh_nv').AsFloat+
     ReportDocument.FieldByName('otverst_nv').AsFloat+
     ReportDocument.FieldByName('pilaol222_nv').AsFloat+
     ReportDocument.FieldByName('pravka_nv').AsFloat+
     ReportDocument.FieldByName('gibkavkuz_nv').AsFloat+
     ReportDocument.FieldByName('sborka_nv').AsFloat+
     ReportDocument.FieldByName('svarka_nv').AsFloat+
     ReportDocument.FieldByName('grpokr_nv').AsFloat+
     ReportDocument.FieldByName('dovodka_nv').AsFloat
    ,ftFloat,'0,00',[fsBold]);
//    FieldValueToCell(i,2,'dovodka_nv','0,00');
    DrawBorders(i,1,i,2,True);


    SetColumnWidth(1,-1);
    SetColumnWidth(2,32);
    end;

    Try WorkSheet.PageSetup.Zoom:=False; Except End;
    Try WorkSheet.PageSetup.FitToPagesWide:=1; Except End;
    Try WorkSheet.PageSetup.FitToPagesTall:=1000; Except End;

    Excel.Visible:=True;
   except on E:Exception do
    begin
     if Logger <> nil then TUniLogger(Logger).ToLog(E.Message);
     Application.MessageBox(PWideChar(E.Message), PWideChar('Ошибка при экспорте в Excel!'), MB_OK +MB_ICONERROR);
     if ExcelController<>nil then ExcelController.Free;
     Try
      VarClear(Excel);
     Except
     End;
    end;
   End;

 CoUnInitialize;
 if ExcelController<>nil then ExcelController.Free;
 Logger.Free;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 CurrentUser.Kill;
 GlobADOC.Close;
 GlobADOC.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
 Close();
end;

end.
