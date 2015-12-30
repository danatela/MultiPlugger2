unit PassportsGridUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Data.Win.ADODB, Generics.Collections, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  StrUtils, Vcl.Menus, DBGridEhGrouping, Vcl.Buttons, GridsEh, DBGridEh,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, GlobVars, EhLibADO,
  {ArrivalUnit,} CmkUserUnit, Vcl.ImgList, InclFileUnit,
  MagsoftSharedUnit, MagsoftMsgDlgUnit, consumptionFilterUnit, MemTableEh,
  FastReportUnit, MagsoftUniSelector2Unit, frxClass, PassportUnit, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, UPlugin;

type
  TconsumptionGridForm = class(TForm)
    consumptionGrid: TDBGridEh;
    PanelKDL1: TPanel;
    Splitter1: TSplitter;
    ActionManager1: TActionManager;
    consumptionSource: TDataSource;
    consumptionADOQ: TADOQuery;
    consumptionDelAction: TAction;
    consumptionEditAction: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ImageList1: TImageList;
    consumptionSetFilterAction: TAction;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    consumptionReportAction: TAction;
    F21: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    CtrlP1: TMenuItem;
    MergeADOQuery: TADOQuery;
    MergeBitBtn: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure consumptionEditActionExecute(Sender: TObject);
    procedure consumptionDelActionExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ActionsEnabling;
    procedure consumptionSourceDataChange(Sender: TObject; Field: TField);
    Procedure UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset);
    procedure FormDestroy(Sender: TObject);
    Procedure OpenconsumptionADOQ;
    procedure consumptionSetFilterActionExecute(Sender: TObject);
    procedure consumptionReportActionExecute(Sender: TObject);
    Procedure ArrivalReportBuild(fr3:string);
    procedure consumptionGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure MergeBitBtnClick(Sender: TObject);
    procedure consumptionGridSelectionChanged(Sender: TObject);
    procedure consumptionADOQAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  consumptionGridForm: TconsumptionGridForm;
  consumptionFilter:TconsumptionFilter;

implementation

{$R *.dfm}

uses MergeUnit;

Procedure ReplEmptyToSpace(Var DataSet: TDataSet;FieldName:string);
begin
 Try
 if VarIsNull(Dataset[FieldName]) or (VarToStr(Dataset[FieldName])=EmptyStr) then Dataset[FieldName]:=space;
 Except
 End;
end;

procedure TconsumptionGridForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 consumptionADOQ.Close;
 consumptionGridForm := nil;
 Action := caFree;
end;

Procedure TconsumptionGridForm.OpenconsumptionADOQ;
Var
 OldNREC:int64;
Begin
 consumptionADOQ.DisableControls;
 if consumptionADOQ.Active and (consumptionADOQ.RecNo>0) then OldNREC:=consumptionADOQ['NREC']
                                                   else OldNREC:=0;
 consumptionADOQ.Close;
 consumptionADOQ.Parameters.Clear;
 consumptionADOQ.Parameters.CreateParameter('ad1',ftDateTime,pdInput,0,Trunc(consumptionFilter.ADATE1));
 consumptionADOQ.Parameters.CreateParameter('ad2',ftDateTime,pdInput,0,Trunc(consumptionFilter.ADATE2)+0.99999);

// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE1)));
// ShowMessage(DateTimeToStr(Trunc(KDFilter.INPUTDATE2)+0.99999));

 consumptionADOQ.SQL.Text:='select * from '+SchemaName+'passports'+' where '+consumptionFilter.GetFilterString+' order by NUM';
// ShowMessage(KD1ADOQ.SQL.Text);
 consumptionADOQ.Open;
// ShowMessage('2');
 if OldNREC<>0 then consumptionADOQ.Locate('NREC',OldNREC,[]);
// ShowMessage('3');
 consumptionADOQ.EnableControls;
// ShowMessage('4');
End;


procedure TconsumptionGridForm.FormCreate(Sender: TObject);
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
 s:='јЅ¬√ƒ≈∆» ЋћЌѕ–—“”‘’÷„ЎЁёя';
 for i:= 1 to 100 do
  Begin
   ShowMessage(IntToStr(i)+' - '+CharEncoder(i,s,False));
  End;
}

 if not Assigned(FRForm) then FRForm:=TFRForm.Create(nil);

 consumptionFilter:=TconsumptionFilter.Create;

 Try
  consumptionADOQ.Connection:=Host.ADOC;

  OpenconsumptionADOQ;
//  KD1ADOQ.SQL.Text:='select * from '+SchemaName+'kd'+' where '+KDFilter.GetFilterString+' order by INPUTDATE desc';
//  KD1ADOQ.Open;
//  ShowMessage(IntToStr(KDADOQ.RecordCount));
 Except on E:Exception do
  Begin
   ShowMessage(E.Message);
  End;
 End;
end;

procedure TconsumptionGridForm.FormDestroy(Sender: TObject);
begin
 consumptionFilter.Free;
end;

Procedure TconsumptionGridForm.UpdateColumnPicks(Var Grid:TDBGridEh;ColumnName: String;ADOQ:TDataset);
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
        Grid.Columns[i].KeyList.Append(VarToStr(ADOQ['NREC']));
        Grid.Columns[i].PickList.Append(VarToStr(ADOQ['NAME']));
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

Procedure TconsumptionGridForm.ArrivalReportBuild(fr3:string);
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

procedure TconsumptionGridForm.consumptionReportActionExecute(Sender: TObject);
Var
 ReportsList:TMemTableEh;
 Passport:TPassport;
begin
 if consumptionReportAction.Enabled then
  Begin
   Passport:=TPassport.Create;
   ReportsList:=TMemTableEh.Create(nil);
   if GetReportsList(Self,ReportsList,'passport') and (ReportsList.RecordCount>0) then
    Begin
     ReportsList.First;
     while Not ReportsList.Eof do
      Begin
       if Passport.Read(consumptionADOQ) then Passport.Report(Self,VarToStr(ReportsList['fr3']));
       ReportsList.Next;
      End;
    End;
   ReportsList.Close;
   ReportsList.Free;
   Passport.Free;
   consumptionGrid.SetFocus;
  End;
end;

procedure TconsumptionGridForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
 edit:boolean;
begin
      case Key of
       Ord('P'),Ord('p'),Ord('«'),Ord('з'):
              Begin
               if ssCtrl in Shift then consumptionReportActionExecute(Sender);
               Key:=0;
              End;
       vk_F2: Begin
               consumptionSetFilterActionExecute(Sender);
               Key:=0;
              End;
       vk_F4,vk_return: Begin
               consumptionEditActionExecute(Sender);
               Key:=0;
              End;
   vk_Delete: Begin
               consumptionDelActionExecute(Sender);
               Key:=0;
              End;
      end;

end;

procedure TconsumptionGridForm.FormShow(Sender: TObject);
begin
 consumptionGrid.SetFocus;
end;

procedure TconsumptionGridForm.MergeBitBtnClick(Sender: TObject);
var
  tmp: TBookmark;
  I: Integer;
begin
  if not Assigned(MergeForm) then
    MergeForm := TMergeForm.Create(Self);
  MergeForm.ResultComboBox.Items.Clear;
  consumptionADOQ.DisableControls;
  tmp := consumptionADOQ.GetBookmark;
  for I := 0 to consumptionGrid.SelectedRows.Count - 1 do begin
    consumptionADOQ.GotoBookmark(consumptionGrid.SelectedRows.Items[I]);
    MergeForm.ResultComboBox.Items.Add(consumptionADOQ['num']);
  end;
  MergeForm.ResultComboBox.ItemIndex := 0;
  if MergeForm.ShowModal = mrOk then begin
    MergeADOQuery.Connection := Host.ADOC;
    consumptionADOQ.Locate('num', MergeForm.ResultComboBox.Text, []);
    MergeADOQuery.Parameters.ParamValues['pnewpas'] := consumptionADOQ['nrec'];
    for I := 0 to consumptionGrid.SelectedRows.Count - 1 do begin
      consumptionADOQ.GotoBookmark(consumptionGrid.SelectedRows.Items[I]);
      if MergeForm.ResultComboBox.Text = consumptionADOQ['num'] then
        Continue;
      MergeAdoQuery.Parameters.ParamValues['poldpas'] := consumptionADOQ['nrec'];
      MergeAdoQuery.ExecSQL;
      consumptionADOQ.Delete;
    end;
  end;
  FreeAndNil(MergeForm);
  consumptionADOQ.GotoBookmark(tmp);
  consumptionADOQ.FreeBookmark(tmp);
  consumptionADOQ.EnableControls;
end;

procedure TconsumptionGridForm.consumptionSetFilterActionExecute(Sender: TObject);
begin
 if consumptionSetFilterAction.Enabled then
  Begin
   if consumptionFilter.Edit(Self) then OpenconsumptionADOQ;
   consumptionGrid.SetFocus;
//   ShowMessage('5');
  End;
end;

procedure TconsumptionGridForm.consumptionSourceDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TconsumptionGridForm.consumptionADOQAfterScroll(DataSet: TDataSet);
begin
  MergeBitBtn.Enabled := consumptionGrid.SelectedRows.Count > 1;
end;

procedure TconsumptionGridForm.consumptionDelActionExecute(Sender: TObject);
Var
 OldRecNo:int64;
 s:string;
 adoq:TAdoQuery;
 snrec:int64;
begin
 if consumptionDelAction.Enabled then
  Begin
     adoq:=TAdoQuery.Create(nil);
     adoq.Connection:=Host.ADOC;
     adoq.SQL.Text:='select ar.num as num,ar.adate as adate,spar.grmaterials_s as grmaterials_s from '+SchemaName+'arrivals ar,'+SchemaName+'sparrivals spar where spar.nrec='+VarToStr(consumptionADOQ['csparrivals'])+andd+'spar.carrivals=ar.nrec';
     adoq.Open;
     If adoq.RecordCount>0 then
      Begin
       ShowMessage('ƒл€ удалени€ "лишних" паспортов откройте задание на погрузку є'+
       VarToStr(adoq['num'])+' от '+
       VarToStr(adoq['adate'])+' и уменьшите в нем количество полученных материалов "'+
       VarToStr(adoq['grmaterials_s'])+'"!');
      End
       else
        If (MagsoftMessageDlg('¬ы уверены, что хотите удалить паспорт "'+VarToStr(consumptionADOQ['NUM'])+'" ?',mtConfirmation,[mbNo,mbYes],0,mbNo)=mrYes) then
         Begin
          snrec:=StrToIntM(GetTextValueOfPointer(VarToStr(consumptionADOQ['nrec']),SchemaName+'SPPASSPORTS','CPASSPORTS','nrec',False));
//       ShowMessage(IntToStr(snrec));
          KillPassportSpec(snrec);
          consumptionADOQ.Delete;
         End;
     adoq.Close;
     adoq.Free;
  End;
 consumptionGrid.SetFocus;
end;

procedure TconsumptionGridForm.consumptionEditActionExecute(Sender: TObject);
Var
 pas:TPassport;
// adoq:TAdoQuery;
// s:string;
begin
 if consumptionEditAction.Enabled then
  Begin
   pas:=TPassport.Create;
   consumptionADOQ.DisableControls;
   if pas.Read(consumptionADOQ) then
   Begin
    If pas.Edit(Self, False, 0) then
     Begin
      consumptionADOQ.Requery;
      if consumptionADOQ.Locate('nrec',pas.NREC,[]) then
       Begin
        consumptionADOQ.Edit;
        if Not pas.Save(consumptionADOQ) then consumptionADOQ.Cancel;
        consumptionADOQ.Requery;
        consumptionADOQ.Locate('nrec',pas.NREC,[]);
       End;
     End
   End;
   consumptionADOQ.EnableControls;
   pas.Free;
   consumptionGrid.SetFocus;
  End;
end;

procedure TconsumptionGridForm.consumptionGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
 active:boolean;
begin
 Try active:=VarIsNull(consumptionADOQ['spent']) or (consumptionADOQ['spent']=0); Except active:=True; End;

 If gdSelected in State then
  Begin
   consumptionGrid.Canvas.Brush.Color:=clSilver;
  End;

 if active then consumptionGrid.Canvas.Font.Color := clBlack
           else consumptionGrid.Canvas.Font.Color := clNavy;
 consumptionGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TconsumptionGridForm.consumptionGridSelectionChanged(Sender: TObject);
begin
  MergeBitBtn.Enabled := consumptionGrid.SelectedRows.Count > 1;
end;

procedure TconsumptionGridForm.ActionsEnabling;
Begin
 consumptionEditAction.Enabled:=consumptionADOQ.Active and (consumptionADOQ.RecNo>0) and (consumptionADOQ['NREC']<>0);
 consumptionDelAction.Enabled:=consumptionADOQ.Active and (consumptionADOQ.RecNo>0) and ((CurrentUser.CUSERGROUPS=1) or (CurrentUser.CUSERGROUPS=2) or (CurrentUser.CUSERGROUPS=3)) and (consumptionADOQ['NREC']<>0);
 consumptionSetFilterAction.Enabled:=consumptionADOQ.Active;
 consumptionReportAction.Enabled:=consumptionADOQ.Active and (consumptionADOQ.RecNo>0) and (consumptionADOQ['NREC']<>0);
End;

end.
