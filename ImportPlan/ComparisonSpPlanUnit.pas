unit ComparisonSpPlanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,
  Vcl.OleServer, Vcl.StdCtrls, Vcl.Buttons, OfficeXP, Data.DB, Data.Win.ADODB,
  Datasnap.DBClient, Generics.Collections, WordXP;

type
  TComparisonSpPlanForm = class(TForm)
    ComparisonDBGridEh: TDBGridEh;
    RightPanel: TPanel;
    MutationBitBtn: TBitBtn;
    ComparisonDataSource: TDataSource;
    PPUQuery: TADOQuery;
    ImportBitBtn: TBitBtn;
    ComparisonDataSet: TClientDataSet;
    ComparisonDataSetNREC: TFloatField;
    ComparisonDataSetCONTRACTOR_S: TStringField;
    ComparisonDataSetRECIPIENT_S: TStringField;
    ComparisonDataSetARTICLE: TStringField;
    ComparisonDataSetORDERNUM: TStringField;
    ComparisonDataSetORDERNUM2: TStringField;
    ComparisonDataSetORDN: TStringField;
    ComparisonDataSetTitle: TStringField;
    ComparisonDataSetKOLSHT: TFloatField;
    ComparisonDataSetWEIGHT1: TFloatField;
    ComparisonDataSetPPONREC: TFloatField;
    ComparisonDataSetMATERIAL: TStringField;
    ComparisonDataSetDRAWING: TStringField;
    ComparisonDataSetGRAPH: TStringField;
    ComparisonDataSetRELDATE: TDateTimeField;
    ComparisonDataSetUPDATED: TDateTimeField;
    ComparisonDataSetArticle_PPU: TStringField;
    ComparisonDataSetContractor_S_PPU: TStringField;
    ComparisonDataSetRecipient_S_PPU: TStringField;
    ComparisonDataSetOrderNum_PPU: TStringField;
    ComparisonDataSetOrderNum2_PPU: TStringField;
    ComparisonDataSetOrdn_PPU: TStringField;
    ComparisonDataSetTitle_PPU: TStringField;
    ComparisonDataSetQUEUE_PPU: TFMTBCDField;
    ComparisonDataSetKolSht_PPU: TFloatField;
    ComparisonDataSetWeight1_PPU: TFloatField;
    ComparisonDataSetMaterial_PPU: TStringField;
    ComparisonDataSetDrawing_PPU: TStringField;
    ComparisonDataSetGraph_PPU: TStringField;
    ComparisonDataSetQUEUE: TFMTBCDField;
    ComparisonDataSetOper: TByteField;
    ComparisonDataSetCCONTRACTOR: TFloatField;
    ComparisonDataSetCRECIPIENT: TFloatField;
    ComparisonDataSetOperStr: TStringField;
    ComparisonDataSetUPDATED_PPU: TDateTimeField;
    ComparisonDataSetRELDATE_PPU: TDateTimeField;
    ComparisonDataSetUPDATED_US: TDateTimeField;
    ComparisonDataSetDiffField: TStringField;
    SpPlansQuery: TADOQuery;
    App: TWordApplication;
    CorrBitBtn: TBitBtn;
    ComparisonDataSetPRIM: TStringField;
    ComparisonDataSetNOTE: TStringField;
    PPUQueryNUM: TFloatField;
    PPUQueryINUM: TFloatField;
    PPUQueryONUM: TFloatField;
    PPUQueryDRAWING: TStringField;
    PPUQueryTITLE: TStringField;
    PPUQueryPRODUCER: TFloatField;
    PPUQueryGRAPH: TStringField;
    PPUQueryNOTE: TStringField;
    PPUQueryUPDATED: TDateTimeField;
    PPUQueryRELDATE: TDateTimeField;
    PPUQueryID: TFloatField;
    PPUQueryNUM_OF: TFloatField;
    PPUQueryWEIGHT: TFloatField;
    PPUQueryCALC_WEIGHT: TFloatField;
    PPUQueryRES_WEIGHT: TFloatField;
    PPUQueryORDER_ID: TFloatField;
    PPUQueryPLAN_ID: TFloatField;
    PPUQueryCNUM: TStringField;
    PPUQueryCADEP: TFloatField;
    PPUQueryMATERIAL: TFloatField;
    PPUQueryARTICLE: TFloatField;
    PPUQueryDEPTH: TFloatField;
    PPUQueryPAINT: TFloatField;
    PPUQueryBSS: TFloatField;
    PPUQueryQNUM: TFloatField;
    PPUQuerySERVICE: TFloatField;
    PPUQueryCONTINUE: TFloatField;
    PPUQueryADVANCED: TFloatField;
    PPUQueryMETIZ: TFloatField;
    PPUQueryARTICLE_TITLE: TStringField;
    PPUQueryARTICLE_ORD: TFloatField;
    PPUQueryARTICLE_FULL_NAME: TStringField;
    PPUQueryARTICLE_DOP: TFloatField;
    PPUQueryMATERIAL_TITLE: TStringField;
    PPUQueryPRODUCER_CA: TFloatField;
    PPUQueryPRODUCER_TITLE: TStringField;
    PPUQueryCADEP_CA: TFloatField;
    PPUQueryCADEP_TITLE: TStringField;
    EditSpPlansQueryNREC: TFloatField;
    EditSpPlansQueryCPLANS: TFloatField;
    EditSpPlansQueryCCONTRACTOR: TFloatField;
    EditSpPlansQueryCONTRACTOR_S: TStringField;
    EditSpPlansQueryCRECIPIENT: TFloatField;
    EditSpPlansQueryRECIPIENT_S: TStringField;
    EditSpPlansQueryARTICLE: TStringField;
    EditSpPlansQueryORDERNUM: TStringField;
    EditSpPlansQueryORDERNUM2: TStringField;
    EditSpPlansQueryORDN: TStringField;
    EditSpPlansQueryCMARK: TFloatField;
    EditSpPlansQueryMARK_S: TStringField;
    SpPlansQueryKOLSHT: TFloatField;
    SpPlansQueryWEIGHT1: TFloatField;
    EditSpPlansQueryWEIGHT: TFloatField;
    EditSpPlansQueryPTYPE: TFloatField;
    EditSpPlansQueryPPONREC: TFloatField;
    EditSpPlansQuerySTATE: TFloatField;
    EditSpPlansQueryMATERIAL: TStringField;
    EditSpPlansQueryDRAWING: TStringField;
    EditSpPlansQueryGRAPH: TStringField;
    EditSpPlansQueryRELDATE: TDateTimeField;
    EditSpPlansQueryISSUEDATE: TDateTimeField;
    EditSpPlansQueryUPDATED: TDateTimeField;
    EditSpPlansQueryIMPORTED: TDateTimeField;
    EditSpPlansQueryUPDATED_US: TDateTimeField;
    EditSpPlansQueryKOEF: TStringField;
    EditSpPlansQueryQUEUE: TFloatField;
    EditSpPlansQueryPRIM_PRB: TStringField;
    EditSpPlansQueryDRAWINGEXISTANCE: TFloatField;
    EditSpPlansQueryDOP: TStringField;
    EditSpPlansQueryRKOEF: TFloatField;
    EditSpPlansQuerySCHAB: TStringField;
    EditSpPlansQuerySERVICE: TFloatField;
    EditSpPlansQueryTITLE: TStringField;
    SpPlansQueryMAVERICK: TFloatField;
    SpPlansQueryPRIM: TStringField;
    procedure MutationBitBtnClick(Sender: TObject);
    procedure ImportBitBtnClick(Sender: TObject);
    procedure ComparisonDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ComparisonDataSetCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ComparisonDBGridEhDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure QueryBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CorrBitBtnClick(Sender: TObject);
  private
    procedure RefillDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

const
  // ВАЖНО: необходимо следить, чтоб количество полей в следующих двух строках всегда было равным
  // IMPORTANT: check that fields count in next 2 lines would be the same
  FieldsStr1 = 'Article_PPU;Contractor_S_PPU;Recipient_S_PPU;OrderNum_PPU;OrderNum2_PPU;OrdN_PPU;Title_PPU;Queue_PPU;KolSht_PPU;Weight1_PPU;Material_PPU;Drawing_PPU;Graph_PPU;RELDATE_PPU;UPDATED_PPU;PRIM_PPU';
  FieldsStr2 = 'Article_Title;Producer_Title;Cadep_Title;num;inum;onum;Title;QNum;num_of;weight;Material_Title;Drawing;Graph;RELDATE;UPDATED;NOTE';
  // поля с не найденным источником, но необходимые для работы алгоритма
  FieldsStr3 = 'NREC;CCONTRACTOR;CRECIPIENT;UPDATED_US';
var
  ComparisonSpPlanForm: TComparisonSpPlanForm;

implementation

{$R *.dfm}
uses ImportPlanUnit, StrUtils, Types, CorrSpPlanUnit, MagSoftWaitDialog;

procedure TComparisonSpPlanForm.ComparisonDataSetCalcFields(DataSet: TDataSet);
begin
  if not VarIsNull(DataSet['Oper']) then
    case DataSet['Oper'] of
      0: DataSet['OperStr'] := 'вставка';
      1: DataSet['OperStr'] := 'модификация';
      2: DataSet['OperStr'] := 'удаление';
      else
        DataSet['OperStr'] := 'другое';
    end
  else
    DataSet['OperStr'] := 'другое';
end;

procedure TComparisonSpPlanForm.ComparisonDBGridEhDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  FieldName, CompFieldName: string;
begin
  if EndsStr('_PPU', Column.FieldName) then begin
    FieldName := Column.FieldName;
    CompFieldName := ReplaceStr(FieldName, '_PPU', '');
    if ComparisonDataSet[FieldName] <> ComparisonDataSet[CompFieldName] then
      TDBGridEh(Sender).Canvas.Brush.Color := clYellow;
  end;
  TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TComparisonSpPlanForm.ComparisonDBGridEhKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_INSERT: begin
      ComparisonDBGridEh.SelectedRows.CurrentRowSelected := not ComparisonDBGridEh.SelectedRows.CurrentRowSelected;
      ComparisonDataSet.Next;
    end;
    VK_SUBTRACT: ComparisonDBGridEh.SelectedRows.Clear;
    VK_RETURN: CorrBitBtnClick(CorrBitBtn);
  end;
end;

procedure TComparisonSpPlanForm.CorrBitBtnClick(Sender: TObject);
begin
  CorrSpPlanForm := TCorrSpPlanForm.Create(Application);
  CorrSpPlanForm.ShowModal;
  CorrSpPlanForm.Free;
  CorrSpPlanForm := nil;
end;

procedure TComparisonSpPlanForm.QueryBeforeOpen(DataSet: TDataSet);
begin
  ImportPlanForm.BeforeOpen(DataSet);
end;

procedure TComparisonSpPlanForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ComparisonSpPlanForm := nil;
end;

procedure TComparisonSpPlanForm.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  PPUQuery.Clone(ImportPlanForm.SpPlansQuery);
  SpPlansQuery.Clone(ImportPlanForm.EditSpPlansQuery);
end;

procedure TComparisonSpPlanForm.FormShow(Sender: TObject);
begin
  RefillDataSet;
end;

procedure TComparisonSpPlanForm.RefillDataSet;
var
  Changed, Deleted: Boolean;
  J: Integer;
  FieldValues1, FieldValues2: Variant;
  FieldName, CompFieldName: string;
  Fields: TStringDynArray;
  Dialog: TMagsoftWaitDialog;
begin
  Dialog := TMagsoftWaitDialog.Create(Self);
  Dialog.CancelButtonVisible := False;
  ComparisonDataSet.DisableControls;
  PPUQuery.DisableControls;
  SpPlansQuery.DisableControls;
  Fields := SplitString(ReplaceStr(FieldsStr1, '_PPU', ''), ';');
  ComparisonDataSet.Close;
  try
    ComparisonDataSet.CreateDataSet;
  except

  end;
  // ищем удалённые и изменённые записи
  SpPlansQuery.First;
  Dialog.CreateWait('Ищем удалённые и изменённые записи...', SpPlansQuery.RecordCount);
  while not SpPlansQuery.Eof do
  begin
    FieldValues1 := SpPlansQuery[ReplaceStr(FieldsStr1, '_PPU', '')];
    Deleted := not PPUQuery.Locate('ID', SpPlansQuery['PPONREC'], []);
    if not Deleted then
    begin
      FieldValues2 := PPUQuery[FieldsStr2];
      Changed := False;
      for J := VarArrayLowBound(FieldValues1, 1) to VarArrayHighBound(FieldValues1, 1) do
      begin
        if Changed then begin
          ComparisonDataSet.Append;
          ComparisonDataSet['Oper'] := 1;
          ComparisonDataSet[FieldsStr1] := FieldValues2;
          ComparisonDataSet[ReplaceStr(FieldsStr1, '_PPU', '')] := FieldValues1;
          ComparisonDataSet[FieldsStr3] := SpPlansQuery[FieldsStr3];
          ComparisonDataSet['DiffField'] := Fields[J - 1];
          ComparisonDataSet.Post;
          System.Break;
        end;
        {
        if VarIsNull(FieldValues1[J]) then
          FieldValues1[J] := '';
        if VarIsNull(FieldValues2[J]) then
          FieldValues2[J] := '';
        }
        if (Fields[J] = 'Title') or (Fields[J] = 'Drawing') then begin
          Changed := Changed or not SameStr(Trim(VarToStr(FieldValues1[J])), Trim(VarToStr(FieldValues2[J])))
        end else
          Changed := Changed or (FieldValues1[J] <> FieldValues2[J]);
      end;
    end;
    if Deleted then
    begin
      ComparisonDataSet.Append;
      ComparisonDataSet[ReplaceStr(FieldsStr1, '_PPU', '')] := FieldValues1;
      ComparisonDataSet['Oper'] := 2;
      ComparisonDataSet[FieldsStr3] := SpPlansQuery[FieldsStr3];
      ComparisonDataSet.Post;
    end;
    SpPlansQuery.Next;
    Dialog.Value := Dialog.Value + 1;
    Dialog.Update(Dialog.Value);
  end;
  Dialog.KillWait;
  // теперь ищем добавленные записи
  PPUQuery.First;
  Dialog.CreateWait('Ищем добавленные записи...', PPUQuery.RecordCount);
  while not PPUQuery.Eof do begin
    if not SpPlansQuery.Locate('PPONREC', PPUQuery['ID'], []) then begin
      ComparisonDataSet.Append;
      ComparisonDataSet[FieldsStr1] := PPUQuery[FieldsStr2];
      ComparisonDataSet['PPONREC'] := PPUQuery['ID'];
      ComparisonDataSet['Oper'] := 0;
      ComparisonDataSet.Post;
    end;
    PPUQuery.Next;
    Dialog.Value := Dialog.Value + 1;
    Dialog.Update(Dialog.Value);
  end;
  Dialog.KillWait;
  ComparisonDataSet.First;
  PPUQuery.EnableControls;
  SpPlansQuery.EnableControls;
  ComparisonDataSet.EnableControls;
  Dialog.Free;
end;

procedure TComparisonSpPlanForm.ImportBitBtnClick(Sender: TObject);
var
  FieldName, CompFieldName: string;
  Field, CompField: TField;
  I, J: integer;
  FieldValues: Variant;
  FieldsStr4: string;
  Dialog: TMagsoftWaitDialog;
begin
  Dialog := TMagsoftWaitDialog.Create(Self);
  ComparisonDataSet.DisableControls;
  ImportPlanForm.EditSpPlansQuery.DisableControls;
  FieldsStr4 := ReplaceStr(FieldsStr1, '_PPU', '') + ';' + ReplaceStr(FieldsStr3, 'NREC;', '');
  Dialog.CreateWait('Импорт изменений', ComparisonDBGridEh.SelectedRows.Count);
  for I := 0 to ComparisonDBGridEh.SelectedRows.Count - 1 do begin
    if Dialog.Canceled then
      Break;
    ComparisonDataSet.GotoBookmark(ComparisonDBGridEh.SelectedRows.Items[I]);
    case ComparisonDataSet['Oper'] of
    0, 1: begin
      ComparisonDataSet.Edit;
      for J := 0 to ComparisonDataSet.FieldList.Count - 1 do begin
        FieldName := ComparisonDataSet.FieldList[J].FieldName;
        CompFieldName := ReplaceStr(FieldName, '_PPU', '');
        if EndsStr('_PPU', FieldName) then
          if ComparisonDataSet.FieldByName(CompFieldName).FieldKind = fkLookup then begin
            Field := ComparisonDataSet.FieldByName(FieldName);
            CompField := ComparisonDataSet.FieldByName(CompFieldName);
            if CompField.LookupDataSet.Locate(CompField.LookupResultField, Field.Value, []) then
              ComparisonDataSet[CompField.KeyFields] := CompField.LookupDataSet[CompField.LookupKeyFields];
          end else
            ComparisonDataSet[CompFieldName] := ComparisonDataSet[FieldName];
      end;
      ComparisonDataSet['UPDATED_US'] := Now;
      ComparisonDataSet.Post;

      FieldValues := ComparisonDataSet[FieldsStr4];
      {
      for J := VarArrayLowBound(FieldValues, 1) to VarArrayHighBound(FieldValues, 1) do
        if VarIsNull(FieldValues[J]) then
          FieldValues[J] := '';
      {}
      if ComparisonDataSet['Oper'] = 1 then begin
        ImportPlanForm.EditSpPlansQuery.Locate('NREC', ComparisonDataSet['NREC'], []);
        ImportPlanForm.EditSpPlansQuery.Edit;
      end
      else begin
        ImportPlanForm.EditSpPlansQuery.Append;
        ImportPlanForm.EditSpPlansQuery['PPONREC'] := ComparisonDataSet['PPONREC'];
      end;
      ImportPlanForm.EditSpPlansQuery[FieldsStr4] := FieldValues;
      ImportPlanForm.EditSpPlansQuery.Post;
    end;
    2: if ImportPlanForm.EditSpPlansQuery.Locate('NREC', ComparisonDataSet['NREC'], []) then
      ImportPlanForm.EditSpPlansQuery.Delete;
    end;
    ComparisonDataSet.Delete;
    Dialog.Update(I + 1);
  end;
  Dialog.KillWait;
  Dialog.Free;
  ComparisonDataSet.EnableControls;
  ImportPlanForm.EditSpPlansQuery.EnableControls;
end;

procedure TComparisonSpPlanForm.MutationBitBtnClick(Sender: TObject);
var
  Doc: _Document;
  SubTitlePrinted: Boolean;
  I: Integer;
  FieldName, CompFieldName, s: string;
  HeaderRange, TableRange, EndRange, SearchRange: WordRange;
  TempBookmark: TArray<Byte>;
  Dialog: TMagsoftWaitDialog;
begin
  Dialog := TMagsoftWaitDialog.Create(Self);
  Dialog.CancelButtonVisible := False;
  With ImportPlanForm do begin
    Dialog.CreateWait('Подключение к серверу Word', 4);
    Self.App.Connect;
    Dialog.Update(1);
    Doc := Self.App.Documents.Add('\\Server1571\CMKNEW\Reports\ImportPlan\ReportChanges.dot', EmptyParam, EmptyParam, True);
    Dialog.Update(2);
    with Doc.Paragraphs.Item(1).Range.Find do begin
      Text := '${PlanDate}';
      Replacement.Text := EditPlansQueryMONTH.AsString + ' ' + EditPlansQueryPYEAR.AsString;
      Execute(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
              EmptyParam, EmptyParam, EmptyParam, EmptyParam, wdReplaceOne, EmptyParam,
              EmptyParam, EmptyParam, EmptyParam);
    end;
    Dialog.Update(3);
    HeaderRange := Doc.Bookmarks.Item('Header').Range;
    TableRange := Doc.Bookmarks.Item('Table').Range;
    EndRange := Doc.Content;
    Dialog.Update(4);
    Dialog.KillWait;
    TempBookmark := ComparisonDataSet.GetBookmark;
    ComparisonDataSet.DisableControls;
    try
      Dialog.CancelButtonVisible := True;
      Dialog.CreateWait('Выгрузка данных', ComparisonDataSet.RecordCount);
      ComparisonDataSet.First;
      while not ComparisonDataSet.Eof and not Dialog.Canceled do begin
        SubTitlePrinted := False;
        for I := 0 to ComparisonDataSet.FieldList.Count - 1 do begin
          FieldName := ComparisonDataSet.FieldList.Fields[I].FieldName;
          CompFieldName := ReplaceStr(FieldName, '_PPU', '');
          if EndsStr('_PPU', FieldName) then
            if ComparisonDataSet[FieldName] <> ComparisonDataSet[CompFieldName] then begin
              if not SubTitlePrinted then begin
                EndRange.Collapse(wdCollapseEnd);
                EndRange.FormattedText := HeaderRange;
                SearchRange := EndRange.FormattedText;
                SearchRange.Find.Execute('${OrderNum}', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                         EmptyParam, EmptyParam, EmptyParam, ComparisonDataSetORDERNUM.Value, wdReplaceOne, EmptyParam,
                                         EmptyParam, EmptyParam, EmptyParam);
                SearchRange := EndRange.FormattedText;
                SearchRange.Find.Execute('${OrderNum2}', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                         EmptyParam, EmptyParam, EmptyParam, ComparisonDataSetORDERNUM2.Value, wdReplaceOne, EmptyParam,
                                         EmptyParam, EmptyParam, EmptyParam);
                SearchRange := EndRange.FormattedText;
                SearchRange.Find.Execute('${OrdN}', EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                                         EmptyParam, EmptyParam, EmptyParam, ComparisonDataSetORDN.Value, wdReplaceOne, EmptyParam,
                                         EmptyParam, EmptyParam, EmptyParam);
                SubTitlePrinted := True;
              end;
              EndRange.Collapse(wdCollapseEnd);
              EndRange.FormattedText := TableRange;
              SearchRange := EndRange.FormattedText;
              with SearchRange.Find do begin
                Text := '${Field}';
                Replacement.Text := ComparisonDataSet.Fields.FieldByName(FieldName).DisplayLabel;
                Execute(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                        EmptyParam, EmptyParam, EmptyParam, EmptyParam, wdReplaceOne, EmptyParam,
                        EmptyParam, EmptyParam, EmptyParam);
              end;
              SearchRange := EndRange.FormattedText;
              with SearchRange.Find do begin
                Text := '${PrevValue}';
                if ComparisonDataSet['Oper'] <> 0 then
                  Replacement.Text := ComparisonDataSet.Fields.FieldByName(CompFieldName).AsString
                else
                  Replacement.Text := '<вставлено>';
                Execute(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                        EmptyParam, EmptyParam, EmptyParam, EmptyParam, wdReplaceOne, EmptyParam,
                        EmptyParam, EmptyParam, EmptyParam);
              end;
              SearchRange := EndRange.FormattedText;
              with SearchRange.Find do begin
                Text := '${CurValue}';
                if ComparisonDataSet['Oper'] <> 2 then
                  Replacement.Text := ComparisonDataSet.Fields.FieldByName(FieldName).AsString
                else
                  Replacement.Text := '<удалено>';
                Execute(EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
                        EmptyParam, EmptyParam, EmptyParam, EmptyParam, wdReplaceOne, EmptyParam,
                        EmptyParam, EmptyParam, EmptyParam);
              end;
            end;
        end;
        ComparisonDataSet.Next;
        Dialog.Value := Dialog.Value + 1;
        Dialog.Update(Dialog.Value);
      end;
      TableRange.Tables.Item(1).Delete;
      HeaderRange.Delete(EmptyParam, EmptyParam);
      HeaderRange.Delete(wdCharacter, 1);
    finally
      Self.App.Visible := True;
      Self.App.Disconnect;
      Dialog.KillWait;
      Dialog.Free;
      ComparisonDataSet.GotoBookmark(TempBookmark);
      ComparisonDataSet.FreeBookmark(TempBookmark);
      ComparisonDataSet.EnableControls;
    end;
  end;

end;

end.
