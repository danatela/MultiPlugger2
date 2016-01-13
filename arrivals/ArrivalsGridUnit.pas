unit ArrivalsGridUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Data.Win.ADODB, Generics.Collections, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  StrUtils, Vcl.Menus, DBGridEhGrouping, Vcl.Buttons, GridsEh, DBGridEh,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, GlobVars, EhLibADO,
  ArrivalUnit, CmkUserUnit, Vcl.ImgList, InclFileUnit,
  MagsoftSharedUnit, MagsoftMsgDlgUnit, ArrivalsFilterUnit, MemTableEh,
  FastReportUnit, MagsoftUniSelector2Unit, frxClass, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, UPlugin, ADOInt;

type
  TArrivalsGridForm = class(TForm)
    ArrivalsGrid: TDBGridEh;
    PanelKDL1: TPanel;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    ArrivalsSource: TDataSource;
    ArrivalsADOQ: TADOQuery;
    ArrivalsAppendAction: TAction;
    ArrivalsDelAction: TAction;
    ArrivalsEditAction: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ImageList1: TImageList;
    ArrivalsSetFilterAction: TAction;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    ArrivalsReportAction: TAction;
    F21: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    CtrlP1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ArrivalsAppendActionExecute(Sender: TObject);
    procedure ArrivalsEditActionExecute(Sender: TObject);
    procedure ArrivalsDelActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ActionsEnabling;
    procedure ArrivalsSourceDataChange(Sender: TObject; Field: TField);
    Procedure UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset);
    procedure FormDestroy(Sender: TObject);
    Procedure OpenArrivalsADOQ;
    procedure ArrivalsSetFilterActionExecute(Sender: TObject);
    procedure ArrivalsReportActionExecute(Sender: TObject);
    Procedure ArrivalReportBuild(fr3:string);
    procedure ArrivalsGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArrivalsGridForm: TArrivalsGridForm;
  ArrivalsFilter:TArrivalsFilter;

implementation

{$R *.dfm}

Procedure ReplEmptyToSpace(Var DataSet: TDataSet;FieldName:string);
begin
 Try
 if Dataset.FieldByName(FieldName).IsNull or (Dataset.FieldByName(FieldName).AsString=EmptyStr) then Dataset.FieldByName(FieldName).AsString:=space;
 Except
 End;
end;

procedure TArrivalsGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ArrivalsADOQ.Close;
 Action := caFree;
 ArrivalsGridForm := nil;
end;

Procedure TArrivalsGridForm.OpenArrivalsADOQ;
Var
 OldNREC:int64;
Begin
 ArrivalsADOQ.DisableControls;
 if ArrivalsADOQ.Active and (ArrivalsADOQ.RecNo>0) then OldNREC:=ArrivalsADOQ['NREC']
                                                   else OldNREC:=0;
 ArrivalsADOQ.Close;
 ArrivalsADOQ.Parameters.Clear;
 ArrivalsADOQ.Parameters.CreateParameter('ad1',ftDateTime,pdInput,0,Trunc(ArrivalsFilter.ADATE1));
 ArrivalsADOQ.Parameters.CreateParameter('ad2',ftDateTime,pdInput,0,Trunc(ArrivalsFilter.ADATE2)+0.99999);

// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE1)));
// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE2)+0.99999));

 ArrivalsADOQ.SQL.Text:='select * from '+SchemaName+'arrivals'+' where '+ArrivalsFilter.GetFilterString+' order by ADATE desc,NUM desc';
// ShowMessage(KD1ADOQ.SQL.Text);
 ArrivalsADOQ.Open;
// ShowMessage('2');
 if OldNREC<>0 then ArrivalsADOQ.Locate('NREC',OldNREC,[]);
// ShowMessage('3');
 ArrivalsADOQ.EnableControls;
// ShowMessage('4');
End;


procedure TArrivalsGridForm.FormCreate(Sender: TObject);
Var
 i:integer;
 s:string;
begin
 Randomize;

 Application.UpdateFormatSettings:=False;
 DecimalSeparator:='.';
 DateSeparator:='.';
 CurrencyDecimals:=4;
 ThousandSeparator:=' ';
 CurrencyString:='';
 ShortDateFormat:='dd.MM.yyyy';
{
 s:='АБВГДЕЖИКЛМНПРСТУФХЦЧШЭЮЯ';
 for i:= 1 to 100 do
  Begin
   ShowMessage(IntToStr(i)+' - '+CharEncoder(i,s,False));
  End;
}

 if not Assigned(FRForm) then FRForm:=TFRForm.Create(nil);

 ArrivalsFilter:=TArrivalsFilter.Create;

 Try
  ArrivalsADOQ.Connection:=Host.ADOC;

  OpenArrivalsADOQ;
//  KD1ADOQ.SQL.Text:='select * from '+SchemaName+'kd'+' where '+KDFilter.GetFilterString+' order by INPUTDATE desc';
//  KD1ADOQ.Open;
//  ShowMessage(IntToStr(KDADOQ.RecordCount));
 Except on E:Exception do
  Begin
   ShowMessage(E.Message);
  End;
 End;
end;

procedure TArrivalsGridForm.FormDestroy(Sender: TObject);
begin
 ArrivalsFilter.Free;
end;

Procedure TArrivalsGridForm.UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset);
var
  i: Integer;
begin
 ColumnName:=UpperCase(ColumnName);
 for i := 0 to Grid.Columns.Count-1 do
  begin
    if UpperCase(Grid.Columns[i].FieldName) = ColumnName then
    begin
      Grid.Columns[i].KeyList.Clear;
      Grid.Columns[i].PickList.Clear;
      Grid.Columns[i].KeyList.Append(zero);
      Grid.Columns[i].PickList.Append('');
      ADOQ.First;
      while Not ADOQ.Eof do
       Begin
        Grid.Columns[i].KeyList.Append(ADOQ.FieldByName('NREC').AsString);
        Grid.Columns[i].PickList.Append(ADOQ.FieldByName('NAME').AsString);
        ADOQ.Next;
       End;
//      SendMessage(Grid.Columns[i].PickList.Handle, CB_SETDROPPEDWIDTH, 200, 0);
//        Grid.Columns[i].Perform(CB_SETDROPPEDWIDTH, 1024, 0);
//      Grid.Columns[i].DropDownSizing:=True;
//      Grid.Columns[i].DropDownWidth:=300;
      break;
    end;
  end;
end;

Procedure TArrivalsGridForm.ArrivalReportBuild(fr3:string);
Begin

// Application := TApplication(App);
// Screen := TScreen(Scr);


 FRForm.Report.Clear;
 FRForm.Report.LoadFromFile(fr3);

// MTE2.SortOrder:='table';

// FRForm.DBDataset.DataSet:=MTE;
// FRForm.DBDataset2.DataSet:=MTE2;

 FRForm.Report.PrepareReport();
 FRForm.Report.ShowPreparedReport;
End;

procedure TArrivalsGridForm.ArrivalsReportActionExecute(Sender: TObject);
Var
 ReportsList:TMemTableEh;
 Arrival:TArrival;
begin
 if ArrivalsReportAction.Enabled then
  Begin
   Arrival:=TArrival.Create;
   ReportsList:=TMemTableEh.Create(nil);
   if GetReportsList(Self,ReportsList,'arrival') and (ReportsList.RecordCount>0) then
    Begin
     ReportsList.First;
     while Not ReportsList.Eof do
      Begin
       if Arrival.Read(ArrivalsADOQ) then Arrival.Report(Self,ReportsList.FieldByName('fr3').AsString);
       ReportsList.Next;
      End;
    End;
   ReportsList.Close;
   ReportsList.Free;
   Arrival.Free;
   ArrivalsGrid.SetFocus;
  End;
end;

procedure TArrivalsGridForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
 edit:boolean;
begin
      case Key of
       Ord('P'),Ord('p'),Ord('З'),Ord('з'):
              Begin
               if ssCtrl in Shift then ArrivalsReportActionExecute(Sender);
               Key:=0;
              End;
       vk_F2: Begin
               ArrivalsSetFilterActionExecute(Sender);
               Key:=0;
              End;
       vk_F4,vk_return: Begin
               ArrivalsEditActionExecute(Sender);
               Key:=0;
              End;
       vk_F7: Begin
               ArrivalsAppendActionExecute(Sender);
               Key:=0;
              End;
   vk_Delete: Begin
               ArrivalsDelActionExecute(Sender);
               Key:=0;
              End;
      end;

end;

procedure TArrivalsGridForm.FormShow(Sender: TObject);
begin
 ArrivalsGrid.SetFocus;
end;

procedure TArrivalsGridForm.ArrivalsSetFilterActionExecute(Sender: TObject);
begin
 if ArrivalsSetFilterAction.Enabled then
  Begin
   if ArrivalsFilter.Edit(Self) then OpenArrivalsADOQ;
   ArrivalsGrid.SetFocus;
//   ShowMessage('5');
  End;
end;

procedure TArrivalsGridForm.ArrivalsSourceDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TArrivalsGridForm.AfterPost(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.UpdateCursorPos;
  Query.Recordset.Resync(adAffectCurrent, adResyncAllValues);
  Query.Resync([]);
end;

procedure TArrivalsGridForm.ArrivalsAppendActionExecute(Sender: TObject);
Var
 ar:TArrival;
begin
 if ArrivalsAppendAction.Enabled then
  Begin
   ar:=TArrival.Create;
   ArrivalsADOQ.DisableControls;
   ar.NUM:=OraGetNextIntValueForField(Host.ADOC,SchemaName+'arrivals','num','adate',EncodeDate(CurrentYear,1,1),EncodeDate(CurrentYear,12,31));
   ar.NREC:=OraInsertRecordAnGetID(Host.ADOC,SchemaName+'arrivals','nrec',SchemaName+'ARRIVALS_SEQ','num',IntToStr(ar.NUM));
   if ar.NREC<>0 then
   Begin
    ArrivalsADOQ.Requery;
    If ArrivalsADOQ.Locate('nrec',ar.NREC,[]) then
     Begin
      If ar.Edit(Self,True) then
       Begin
        ArrivalsADOQ.Edit;
        if Not ar.Save(ArrivalsADOQ) then ArrivalsADOQ.Cancel;
        ArrivalsADOQ.Requery;
        if Not ArrivalsADOQ.Locate('nrec',ar.NREC,[]) then
         Begin
          ShowMessage('Добавленное задание не найдено! Вероятно, оно не попадает в выборку, определенную текущим фильтром...');
          ArrivalsSetFilterActionExecute(Sender);
         End;
       End
        else
       Begin
        Host.ADOC.Execute('delete from '+SchemaName+'sparrivals where carrivals='+IntToStr(ar.NREC));
        //Host.ADOC.Execute('delete from '+SchemaName+'arrivals where nrec='+IntToStr(ar.NREC));
        if ArrivalsADOQ.Locate('nrec', ar.NREC, []) then
          ArrivalsADOQ.Delete;
       End;
     End
      else
     Begin
      Host.ADOC.Execute('delete from '+SchemaName+'arrivals where nrec='+IntToStr(ar.NREC));
      ShowMessage('Новое задание не может быть добавлено! Проверьте параметры фильтра...');
      ArrivalsSetFilterActionExecute(Sender);
     End;
   End else ShowMessage('Ошибка при попытке добавления в БД нового задания!');
   ArrivalsADOQ.EnableControls;
   ArrivalsGrid.SetFocus;
   ar.Free;
  End;
end;

procedure TArrivalsGridForm.ArrivalsDelActionExecute(Sender: TObject);
Var
 OldRecNo:int64;
 s:string;
begin
 if ArrivalsDelAction.Enabled then
  Begin
   If (MagsoftMessageDlg('Вы уверены, что хотите удалить задание "'+ArrivalsADOQ.FieldByName('NUM').AsString+'" ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
    Begin
     s:=GetPaspnumsWithArrivalLinks(ArrivalsADOQ['NREC']);
     if Empty(s) then
      Begin
       Host.ADOC.Execute('delete from '+SchemaName+'sparrivals where carrivals='+ArrivalsADOQ.FieldByName('NREC').AsString);
       OldRecNo:=ArrivalsADOQ.RecNo;
       ArrivalsADOQ.Delete;
       Try ArrivalsADOQ.RecNo:=OldRecNo; Except ArrivalsADOQ.First; End;
      End
       else ShowMessage('В следующих паспортах присутствуют ссылки на позиции данного задания: '+s+'. Удаление невозможно!');
    End;
  End;
 ArrivalsGrid.SetFocus;
end;

procedure TArrivalsGridForm.ArrivalsEditActionExecute(Sender: TObject);
Var
 ar:TArrival;
// adoq:TAdoQuery;
// s:string;
begin
 if ArrivalsEditAction.Enabled then
  Begin
   ar:=TArrival.Create;
   ArrivalsADOQ.DisableControls;
   if ar.Read(ArrivalsADOQ) then
   Begin
    If ar.Edit(Self,False) then
     Begin
      ArrivalsADOQ.Requery;
      if ArrivalsADOQ.Locate('nrec',ar.NREC,[]) then
       Begin
        ArrivalsADOQ.Edit;
        if Not ar.Save(ArrivalsADOQ) then ArrivalsADOQ.Cancel;
        ArrivalsADOQ.Requery;
        ArrivalsADOQ.Locate('nrec',ar.NREC,[]);
       End;
     End
   End;
   ArrivalsADOQ.EnableControls;
   ar.Free;
   ArrivalsGrid.SetFocus;
  End;
end;

procedure TArrivalsGridForm.ArrivalsGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
 active:boolean;
begin
 Try active:=ArrivalsADOQ.FieldByName('active').AsInteger=1; Except active:=False; End;

 If gdSelected in State then
  Begin
   ArrivalsGrid.Canvas.Brush.Color:=clSilver;
  End;

 if active then ArrivalsGrid.Canvas.Font.Color := clBlack
           else ArrivalsGrid.Canvas.Font.Color := clNavy;
 ArrivalsGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TArrivalsGridForm.ActionsEnabling;
Begin
 ArrivalsAppendAction.Enabled:=ArrivalsADOQ.Active and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3));
 ArrivalsEditAction.Enabled:=ArrivalsADOQ.Active and (ArrivalsADOQ.RecNo>0) and (ArrivalsADOQ.FieldByName('NREC').AsLargeInt<>0);
 ArrivalsDelAction.Enabled:=ArrivalsADOQ.Active and (ArrivalsADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3)) and (ArrivalsADOQ.FieldByName('NREC').AsLargeInt<>0);
 ArrivalsSetFilterAction.Enabled:=ArrivalsADOQ.Active;
 ArrivalsReportAction.Enabled:=ArrivalsADOQ.Active and (ArrivalsADOQ.RecNo>0) and (ArrivalsADOQ.FieldByName('NREC').AsLargeInt<>0);
End;

end.
