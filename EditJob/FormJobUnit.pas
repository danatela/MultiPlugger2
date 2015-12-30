unit FormJobUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DockTabSet, Vcl.Tabs, Vcl.StdCtrls,
  Vcl.CheckLst, DBGridEhGrouping, Vcl.Buttons, GridsEh, DBGridEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, Data.DB, Datasnap.DBClient,
  Data.Win.ADODB;

type
  TFormJobForm = class(TForm)
    NumDBGridEh: TDBGridEh;
    FormJobBitBtn: TBitBtn;
    NumOrderClientDataSet: TClientDataSet;
    NumOrderClientDataSetNumOrder: TIntegerField;
    NumOrderDataSource: TDataSource;
    UpdADOQuery: TADOQuery;
    NumOrderClientDataSetCutting: TBooleanField;
    NumOrderClientDataSetHoles: TBooleanField;
    NumOrderClientDataSetBending: TBooleanField;
    NumOrderClientDataSetGouging: TBooleanField;
    NumOrderClientDataSetAll: TBooleanField;
    CloneDS: TClientDataSet;
    EnhPlanADOQuery: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormJobBitBtnClick(Sender: TObject);
    procedure NumDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure NumOrderClientDataSetChange(Sender: TField);
    procedure NumOrderClientDataSetAllChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure NumDBGridEhKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CloneDSAfterInsert(DataSet: TDataSet);
  private
    AllOperations: array[1..5] of Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormJobForm: TFormJobForm;

implementation

{$R *.dfm}

uses
  EditJobUnit, System.DateUtils, System.StrUtils;

procedure TFormJobForm.CloneDSAfterInsert(DataSet: TDataSet);
begin
  DataSet['CUTTING;HOLES;BENDING;GOUGING'] := VarArrayOf([False, False, False, False]);
end;

procedure TFormJobForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;


procedure TFormJobForm.FormCreate(Sender: TObject);
begin
  CloneDS.CloneCursor(NumOrderClientDataSet, False);
  CloneDS.Fields.Fields[1].OnChange := NumOrderClientDataSetChange;
  CloneDS.Fields.Fields[2].OnChange := NumOrderClientDataSetChange;
  CloneDS.Fields.Fields[3].OnChange := NumOrderClientDataSetChange;
  CloneDS.Fields.Fields[4].OnChange := NumOrderClientDataSetChange;
  CloneDS.Fields.Fields[5].OnChange := NumOrderClientDataSetAllChange;
end;

procedure TFormJobForm.FormJobBitBtnClick(Sender: TObject);
var
  sFields, sValues, sFlds: string;
  bmk: TBookmark;
begin
  CloneDS.First;
  while not CloneDS.Eof do begin
    sFields := 'ORDERNUM2';
    sValues := ':pOrderNum2';
    sFlds := '';
    EnhPlanADOQuery.Close;
    EnhPlanADOQuery.Parameters.ParamValues['pOrderNum2;ppMonth;ppYear'] := VarArrayOf([VarToStr(CloneDS['NUMORDER']), MonthOf(Date), YearOf(Date)]);
    EnhPlanADOQuery.Open;
    if not EnhPlanADOQuery.Eof then begin
      if not VarIsNull(CloneDS['Cutting']) and CloneDS['Cutting'] then begin
        sFields := sFields + ',T_REZKA_CEQ,T_REZKA_EQ_S,T_REZKA_M,T_REZKA_NV,T_REZKA_PR';
        sValues := sValues + ',:pT_REZKA_CEQ,:pT_REZKA_EQ_S,:pT_REZKA_M,:pT_REZKA_NV,:pT_REZKA_PR';
        sFlds := sFlds + 'T_REZKA_CEQ;T_REZKA_EQ_S;T_REZKA_M;T_REZKA_NV;T_REZKA_PR;';
      end;
      if not VarIsNull(CloneDS['Holes']) and CloneDS['Holes'] then begin
        sFields := sFields + ',T_OTVERST_CEQ,T_OTVERST_EQ_S,T_OTVERST_DIAM,T_OTVERST_COUNT,T_OTVERST_PR';
        sValues := sValues + ',:pT_OTVERST_CEQ,:pT_OTVERST_EQ_S,:pT_OTVERST_DIAM,:pT_OTVERST_COUNT,:pT_OTVERST_PR';
        sFlds := sFlds + 'T_OTVERST_CEQ;T_OTVERST_EQ_S;T_OTVERST_DIAM;T_OTVERST_COUNT;T_OTVERST_PR;';
      end;
      if not VarIsNull(CloneDS['Bending']) and CloneDS['Bending'] then begin
        sFields := sFields + ',T_GIBKA_CEQ,T_GIBKA_EQ_S,T_GIBKA_NV,T_GIBKA_PR';
        sValues := sValues + ',:pT_GIBKA_CEQ,:pT_GIBKA_EQ_S,:pT_GIBKA_NV,:pT_GIBKA_PR';
        sFlds := sFlds + 'T_GIBKA_CEQ;T_GIBKA_EQ_S;T_GIBKA_NV;T_GIBKA_PR;';
      end;
      if not VarIsNull(CloneDS['Gouging']) and CloneDS['Gouging'] then begin
        sFields := sFields + ',T_STROZH_CEQ,T_STROZH_EQ_S,T_STROZH_M,T_STROZH_NV,T_STROZH_PR';
        sValues := sValues + ',:pT_STROZH_CEQ,:pT_STROZH_EQ_S,:pT_STROZH_M,:pT_STROZH_NV,:pT_STROZH_PR';
        sFlds := sFlds + 'T_STROZH_CEQ;T_STROZH_EQ_S;T_STROZH_M;T_STROZH_NV;T_STROZH_PR;';
      end;
      if Length(sFlds) > 0 then
        sFlds := LeftStr(sFlds, Length(sFlds) - 1);
    end;
    UpdADOQuery.SQL.Text := 'insert into cmknew.jobs(' + sFields + ') values(' + sValues + ')';
    UpdADOQuery.Parameters.ParamValues['pOrderNum2'] := CloneDS['NUMORDER'];
    sValues := ReplaceStr(sValues, ',:', ';');
    sValues := ReplaceStr(sValues, ':pOrderNum2', '');
    if Length(sValues) > 0 then begin
      sValues := RightStr(sValues, Length(sValues) - 1);
      while not EnhPlanADOQuery.Eof do begin
        UpdADOQuery.Parameters.ParamValues[sValues] := EnhPlanADOQuery[sFlds];
        UpdADOQuery.ExecSQL;
        EnhPlanADOQuery.Next;
      end;
    end else
      UpdADOQuery.ExecSQL;
    CloneDS.Next;
  end;
  bmk := EditJobForm.AllADOQuery.GetBookmark;
  EditJobForm.AllADOQuery.Close;
  EditJobForm.AllADOQuery.Open;
  EditJobForm.AllADOQuery.GotoBookmark(bmk);
  EditJobForm.AllADOQuery.FreeBookmark(bmk);
  Close;
end;

procedure TFormJobForm.NumDBGridEhKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
  VK_DELETE: if not NumDBGridEh.EditorMode then NumOrderClientDataSet.Delete;             
  end;
end;

procedure TFormJobForm.NumDBGridEhTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if ACol > 0 then
  begin
    AllOperations[ACol] := not AllOperations[ACol];
    CloneDS.First;
    while not CloneDS.Eof do begin
      CloneDS.Edit;
      CloneDS[Column.FieldName] := AllOperations[ACol];
      CloneDS.Post;
      CloneDS.Next;
    end;
  end;
end;

procedure TFormJobForm.NumOrderClientDataSetAllChange(Sender: TField);
begin
  Sender.DataSet.FieldByName('Cutting').OnChange := nil;
  Sender.DataSet.FieldByName('Bending').OnChange := nil;
  Sender.DataSet.FieldByName('Gouging').OnChange := nil;
  Sender.DataSet.FieldByName('Holes').OnChange := nil;
  Sender.DataSet['Cutting'] := Sender.DataSet['All'];
  Sender.DataSet['Bending'] := Sender.DataSet['All'];
  Sender.DataSet['Gouging'] := Sender.DataSet['All'];
  Sender.DataSet['Holes'] := Sender.DataSet['All'];
  Sender.DataSet.FieldByName('Cutting').OnChange := NumOrderClientDataSetChange;
  Sender.DataSet.FieldByName('Bending').OnChange := NumOrderClientDataSetChange;
  Sender.DataSet.FieldByName('Gouging').OnChange := NumOrderClientDataSetChange;
  Sender.DataSet.FieldByName('Holes').OnChange := NumOrderClientDataSetChange;
end;

procedure TFormJobForm.NumOrderClientDataSetChange(Sender: TField);
begin
  Sender.DataSet.FieldByName('All').OnChange := nil;
  Sender.DataSet['All'] := Sender.DataSet['Cutting'] and
  Sender.DataSet['Holes'] and Sender.DataSet['Bending'] and
  Sender.DataSet['Gouging'];
  Sender.DataSet.FieldByName('All').OnChange := NumOrderClientDataSetAllChange;
end;

end.
