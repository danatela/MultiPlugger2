unit MaterialsEditUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Data.Win.ADODB, Generics.Collections, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  StrUtils, Vcl.Menus, AddMaterialUnit, UPlugin, GlobVars;

type
  TPropList = TList<TControl>;
  TAllProp = TDictionary<string, TComponentClass>;
  TPropNames = TDictionary<string, string>;
  TMaterialsEditForm = class(TForm)
    SelectTreeView: TTreeView;
    TreeEditSplitter: TSplitter;
    ADOConnection: TADOConnection;
    TreeQuery: TADOQuery;
    TreeQueryNAME: TStringField;
    TreeQueryNREC: TFloatField;
    UpdateTreeQuery: TADOQuery;
    EditQuery: TADOQuery;
    EditQueryNREC: TFloatField;
    EditQueryACTIVE: TFMTBCDField;
    EditQueryGALNREC: TStringField;
    EditQueryCPARENT: TFloatField;
    EditQueryNAME: TStringField;
    EditQueryCHILDPROP: TMemoField;
    EditQueryPROP_STEELMARK: TFloatField;
    EditQueryPROP_NORMDOC0: TFloatField;
    EditQueryPROP_NORMDOC1: TFloatField;
    EditQueryPROP_LINEDENS: TFloatField;
    EditQueryPROP_PWIDTH1: TFloatField;
    EditQueryPROP_PWIDTH2: TFloatField;
    EditQueryPROP_WTHICK: TFloatField;
    EditQueryPROP_PROFTYPE: TFloatField;
    EditQueryPROP_DIAM: TFloatField;
    EditQueryPROP_SIZE: TFloatField;
    EditQueryPROP_UW: TFloatField;
    EditQueryPROP_PROFILE: TFloatField;
    EditQueryPROP_THICK: TFloatField;
    EditQueryPROP_WIDTH: TFloatField;
    EditQueryPROP_LENGTH: TFloatField;
    EditQueryPROP_SIZE1: TFloatField;
    EditQueryPROP_SIZE2: TFloatField;
    EditQueryPROP_SLENGTH: TFMTBCDField;
    EditQueryPROP_STEELMARK_C: TStringField;
    EditQueryPROP_NORMDOC0_C: TStringField;
    EditQueryPROP_NORMDOC1_C: TStringField;
    EditQueryPROP_PROFTYPE_C: TStringField;
    EditQueryPROP_PROFILE_C: TStringField;
    EditQueryPROP_THICK_C: TFMTBCDField;
    EditQueryPROP_WIDTH_C: TFMTBCDField;
    EditQueryPROP_LENGTH_C: TFMTBCDField;
    EditDataSource: TDataSource;
    EditPanel: TPanel;
    EditQuerySTEELMARK_NAME: TStringField;
    EditQueryNORMDOC0_NAME: TStringField;
    EditQueryNORMDOC1_NAME: TStringField;
    EditQueryPROFTYPE_NAME: TStringField;
    EditQueryPROFILE_NAME: TStringField;
    EditQueryTHICK_NAME: TFloatField;
    EditQueryWIDTH_NAME: TFloatField;
    EditQueryLENGTH_NAME: TFloatField;
    DropDownQuery: TADOQuery;
    UpdateEditQuery: TADOQuery;
    TreePopupMenu: TPopupMenu;
    AddMenuItem: TMenuItem;
    DeleteMenuItem: TMenuItem;
    DeleteTreeQuery: TADOQuery;
    AddQuery: TADOQuery;
    Edit1: TMenuItem;
    UpdQuery: TADOQuery;
    EditQueryCHILDPROP_1: TMemoField;
    MaxNrecQuery: TADOQuery;
    DetQuery: TADOQuery;
    EditQueryORD: TFloatField;
    EditQueryPROP_PROFNUM: TStringField;
    RenameByFormula: TMenuItem;
    EditQueryCGRMATERIALS: TFloatField;
    EditQueryGRMATERIALS_NAME: TStringField;
    GrMaterialsComboBox: TDBComboBox;
    GrMaterialsLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SelectTreeViewEdited(Sender: TObject; Node: TTreeNode;
      var S: string);
    procedure SelectTreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure ComboBoxChange(Sender: TObject);
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteMenuItemClick(Sender: TObject);
    procedure TreePopupMenuPopup(Sender: TObject);
    procedure AddMenuItemClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure DBEditChange(Sender: TObject);
    procedure RenameByFormulaClick(Sender: TObject);
    procedure SelectTreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrMaterialsComboBoxChange(Sender: TObject);
    procedure GrMaterialsComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOConnectionWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
  private
    PropList: TPropList;
    procedure PopulateTree(Node: TTreeNode; NRec: Integer);
    procedure ComboBoxDropDown(Sender: TObject);
    procedure ClearPropList;
    procedure ClearTree;
    function GetListProp(ListBox: TListBox): string;
    procedure MakePropList(Panel: TWinControl; ChildProp: string; Top, Left: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MaterialsEditForm: TMaterialsEditForm;
  AllProp: TAllProp;
  PropNames: TPropNames;

implementation

{$R *.dfm}

procedure TMaterialsEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearTree;
  ClearPropList;
  PropList.Free;
  PropNames.Free;
  AllProp.Free;
  Action := caFree;
  MaterialsEditForm := nil;
end;

procedure TMaterialsEditForm.FormCreate(Sender: TObject);
begin
  PopulateTree(nil, 0);
  PropList := TPropList.Create;
  AllProp := TAllProp.Create;
  PropNames := TPropNames.Create;
  with AllProp do begin
    Add('PROP_PROFNUM', TDBEdit);
    Add('PROP_STEELMARK', TDBComboBox);
    Add('PROP_NORMDOC0', TDBComboBox);
    Add('PROP_NORMDOC1', TDBComboBox);
    Add('PROP_LINEDENS', TDBEdit);
    Add('PROP_PWIDTH1', TDBEdit);
    Add('PROP_PWIDTH2', TDBEdit);
    Add('PROP_SIZE1', TDBEdit);
    Add('PROP_SIZE2', TDBEdit);
    Add('PROP_WTHICK', TDBEdit);
    Add('PROP_SLENGTH', TDBEdit);
    Add('PROP_PROFTYPE', TDBComboBox);
    Add('PROP_DIAM', TDBEdit);
    Add('PROP_SIZE', TDBEdit);
    Add('PROP_UW', TDBEdit);
    Add('PROP_PROFILE', TDBComboBox);
    Add('PROP_THICK', TDBComboBox);
    Add('PROP_WIDTH', TDBComboBox);
    Add('PROP_LENGTH', TDBComboBox);
  end;
  with PropNames do begin
    Add('PROP_PROFNUM', 'Номер профиля');
    Add('PROP_STEELMARK', 'Марка стали');
    Add('PROP_NORMDOC0', 'Нормативный документ по сортаменту');
    Add('PROP_NORMDOC1', 'Нормативный документ по материалу');
    Add('PROP_LINEDENS', 'Линейная плотность');
    Add('PROP_PWIDTH1', 'Ширина полки1');
    Add('PROP_PWIDTH2', 'Ширина полки2');
    Add('PROP_SIZE1', 'Размер1');
    Add('PROP_SIZE2', 'Размер2');
    Add('PROP_WTHICK', 'Толщина стенки');
    Add('PROP_SLENGTH', 'Длина');
    Add('PROP_PROFTYPE', 'Вид');
    Add('PROP_DIAM', 'Диаметр');
    Add('PROP_SIZE', 'Размер');
    Add('PROP_UW', 'Удельный вес');
    Add('PROP_PROFILE', 'Профиль');
    Add('PROP_THICK', 'Толщина');
    Add('PROP_WIDTH', 'Ширина');
    Add('PROP_LENGTH', 'Длина');
  end;
end;

procedure TMaterialsEditForm.PopulateTree(Node: TTreeNode; NRec: Integer);
var
  X: PInteger;
  N: TTreeNode;
begin
  with TreeQuery, Parameters do begin
    if Active then
      Close;
    ParamValues['pParent'] := NRec;
    Open;
    while not Eof do begin
      New(X);
      X^ := Integer(TreeQuery['NRec']);
      SelectTreeView.Items.AddChildObject(Node, TreeQuery['Name'], X);
      Next;
    end;
    Close;
    if Node = nil then
      for N in SelectTreeView.Items do
        PopulateTree(N, Integer(N.Data^));
  end;
end;

procedure TMaterialsEditForm.RenameByFormulaClick(Sender: TObject);
var
  S: string;
begin
  with SelectTreeView, EditQuery do begin
    if (Selected.Parent = nil) or (Selected.Parent.Parent = nil) then
      Exit;
    Selected.Text := Selected.Parent.Text + ' ';
    case Integer(Selected.Parent.Data^) of
      4: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' '
        + FieldByName('THICK_NAME').AsString + '*' + FieldByName('WIDTH_NAME').AsString + '*'
        + FieldByName('LENGTH_NAME').AsString + ' мм ' + FieldByName('PROFILE_NAME').AsString;
      5: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' '
        + FieldByName('PROP_SIZE').AsString + '*' + FieldByName('PROP_SLENGTH').AsString
        + ' мм ' + FieldByName('NORMDOC1_NAME').AsString;
      6: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' '
        + FieldByName('PROP_SIZE1').AsString + '*' + FieldByName('PROP_SIZE2').AsString + '*'
        + FieldByName('PROP_WTHICK').AsString + ' ' + FieldByName('NORMDOC1_NAME').AsString;
      7: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' d '
        + FieldByName('PROP_DIAM').AsString + '*' + FieldByName('PROP_WTHICK').AsString
        + ' ' + FieldByName('NORMDOC1_NAME').AsString;
      8,9: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' '
        + FieldByName('PROP_PROFNUM').AsString + ' ' + FieldByName('PROP_SLENGTH').AsString
        + ' ' + FieldByName('NORMDOC1_NAME').AsString;
      10: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' '
        + FieldByName('PROP_PWIDTH1').AsString + '*' + FieldByName('PROP_PWIDTH2').AsString + ' '
        + FieldByName('PROP_WTHICK').AsString + 'мм ' + FieldByName('PROP_SLENGTH').AsString
        + ' ' + FieldByName('NORMDOC1_NAME').AsString;
      11: Selected.Text := Selected.Text + FieldByName('STEELMARK_NAME').AsString + ' '
        + FieldByName('PROP_PROFNUM').AsString + ' ' + FieldByName('LENGTH_NAME').AsString
        + ' ' + FieldByName('NORMDOC1_NAME').AsString;
    end;
    S := Selected.Text;
    SelectTreeViewEdited(SelectTreeView, Selected, S);
  end;
end;

procedure TMaterialsEditForm.TreePopupMenuPopup(Sender: TObject);
var
  Point: TPoint;
  TreeNode: TTreeNode;
begin
  with SelectTreeView do begin
    Point := ScreenToClient(Mouse.CursorPos);
    TreeNode := GetNodeAt(Point.X, Point.Y);
    if TreeNode <> nil then
      Selected := TreeNode;
    RenameByFormula.Visible := (Selected.Parent <> nil) and (Selected.Parent.Parent <> nil);
    AddMenuItem.Enabled := (Selected.Parent <> nil) or (Integer(Selected.Data^) > 1);
  end;
end;

procedure TMaterialsEditForm.SelectTreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  ClearPropList;
  with EditQuery, Parameters do begin
    if Active then
      Close;
    ParamValues['pNRec'] := Integer(Node.Data^);
    Open;
    with DropDownQuery, Parameters do begin
      SQL.Text := 'select Name, NRec from CmkNew.GrMaterials where cParent=:pParent';
      if SelectTreeView.Selected.Parent <> nil then
        ParamValues['pParent'] := Integer(SelectTreeView.Selected.Parent.Data^)
      else
        ParamValues['pParent'] := 0;
      Open;
      GrMaterialsComboBox.Items.Clear;
      while not Eof do begin
        GrMaterialsComboBox.Items.AddObject(DropDownQuery['Name'], TObject(Integer(DropDownQuery['NRec'])));
        Next;
      end;
      Close;
    end;
    MakePropList(EditPanel, EditQuery['CHILDPROP'], 32, 8);
  end;
end;

procedure TMaterialsEditForm.SelectTreeViewEdited(Sender: TObject;
  Node: TTreeNode; var S: string);
begin
  with UpdateTreeQuery, Parameters do try
    ParamValues['pName;pNRec'] := VarArrayOf([S, Integer(Node.Data^)]);
    ExecSQL;
  except
    on Ex: Exception do MessageBox(Handle, PChar(Ex.Message), 'Ошибка!', MB_OK or MB_ICONHAND);
  end;
end;

procedure TMaterialsEditForm.SelectTreeViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F9: RenameByFormulaClick(Sender);
  end;
end;

procedure TMaterialsEditForm.ComboBoxChange(Sender: TObject);
begin
  with Sender as TDBComboBox do begin
    UpdateEditQuery.SQL.Text := 'update cmknew.materials set PROP_' + LeftStr(DataField, Length(DataField) - 5)
    + '=:pProp where nRec=:pNrec';
    UpdateEditQuery.Parameters.ParamValues['pProp;pNrec'] := VarArrayOf([Integer(Items.Objects[ItemIndex]), Integer(SelectTreeView.Selected.Data^)]);
    UpdateEditQuery.ExecSQL;
  end;

end;

procedure TMaterialsEditForm.ComboBoxDropDown(Sender: TObject);
begin
  if DropDownQuery.Active then
    DropDownQuery.Close;
  with Sender as TDBComboBox do begin
    if DataField = 'STEELMARK_NAME' then
      DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.SteelMarks'
    else if (DataField = 'NORMDOC0_NAME') or (DataField = 'NORMDOC1_NAME')
    or (DataField = 'PROFILE_NAME') then
      DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.NormDoc'
    else if DataField = 'PROFTYPE_NAME' then
      DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.ProfTypes'
    else if DataField = 'THICK_NAME' then
      DropDownQuery.SQL.Text := 'select NRec, Value Name from cmknew.Thicks'
    else if DataField = 'WIDTH_NAME' then
      DropDownQuery.SQL.Text := 'select NRec, Value Name from cmknew.Widths'
    else if DataField = 'LENGTH_NAME' then
      DropDownQuery.SQL.Text := 'select NRec, Value Name from cmknew.Lengths';
    DropDownQuery.Open;
    while not DropDownQuery.Eof do begin
      Items.AddObject(DropDownQuery['Name'], TObject(Integer(DropDownQuery['NRec'])));
      DropDownQuery.Next;
    end;
    DropDownQuery.Close;
    OnDropDown := nil;
  end;
end;

procedure TMaterialsEditForm.ComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DELETE: with Sender as TDBComboBox do begin
      ItemIndex := -1;
      Text := '';
      UpdateEditQuery.SQL.Text := 'update cmknew.materials set PROP_' + LeftStr(DataField, Length(DataField) - 5)
      + '=:pProp where nRec=:pNrec';
      UpdateEditQuery.Parameters.ParamValues['pProp;pNrec'] := VarArrayOf([0, Integer(SelectTreeView.Selected.Data^)]);
      UpdateEditQuery.ExecSQL;
    end;
  end;
end;

procedure TMaterialsEditForm.DBEditChange(Sender: TObject);
begin
  with Sender as TDBEdit do if Text <> '' then begin
    UpdateEditQuery.SQL.Text := 'update cmknew.materials set ' + DataField
    + '=:pProp where nRec=:pNrec';
    UpdateEditQuery.Parameters.ParamValues['pProp;pNrec'] := VarArrayOf([StrToFloat(Text), Integer(SelectTreeView.Selected.Data^)]);
    UpdateEditQuery.ExecSQL;
  end;
end;

procedure TMaterialsEditForm.DeleteMenuItemClick(Sender: TObject);
begin
  try
    if (SelectTreeView.Selected.Parent <> nil) and ((SelectTreeView.Selected.Parent.Parent <> nil)
    or (Integer(SelectTreeView.Selected.Parent.Data^) = 3)) then begin
      if SelectTreeView.Selected.Count > 0 then
        raise Exception.Create('Невозможно удалить родительский элемент!');
      with DetQuery, Parameters do begin
        if Active then
          Close;
        ParamValues['pMaterial'] := Integer(SelectTreeView.Selected.Data^);
        DetQuery.Open;
        if RecordCount > 0 then
          raise Exception.Create('Невозможно удалить используемый элемент!');
      end;
      DeleteTreeQuery.Parameters.ParamValues['pNRec'] := Integer(SelectTreeView.Selected.Data^);
      DeleteTreeQuery.ExecSQL;
      Dispose(SelectTreeView.Selected.Data);
      SelectTreeView.Items.Delete(SelectTreeView.Selected);
    end else raise Exception.Create('Невозможно удалить корневой элемент!');
  except
    on Ex: Exception do MessageBox(Handle, PChar(Ex.Message), 'Ошибка удаления', MB_OK or MB_ICONHAND);
  end;
end;

procedure TMaterialsEditForm.Edit1Click(Sender: TObject);
var
  I: Integer;
  sProp: string;
  s, s1: string;
begin
  Application.CreateForm(TAddMaterialForm, AddMaterialForm);
  AddMaterialForm.Caption := 'Редактирование материала';
  AddMaterialForm.MaterialNameEdit.Text := SelectTreeView.Selected.Text;
  for s in SplitString(Trim(EditQuery['CHILDPROP_1']), ',') do begin
    s1 := Trim(s);
    with AddMaterialForm, AvlPropListBox do for I := 0 to Count - 1 do
      if s1 = string(Items.Objects[I]) then begin
        MoveItem(I, AvlPropListBox, SelPropListBox);
        break;
      end;
  end;
  case AddMaterialForm.ShowModal of
    mrOk: begin
      sProp := ' ';
      for I := 0 to AddMaterialForm.SelPropListBox.Count - 1 do
        sProp := sProp + ',' + string(AddMaterialForm.SelPropListBox.Items.Objects[I]);
      if Length(sProp) > 1 then
        sProp := RightStr(sProp, Length(sProp) - 2);
      with UpdQuery, Parameters do begin
        ParamValues['pName;pChildProp;pNRec'] := VarArrayOf([AddMaterialForm.MaterialNameEdit.Text, sProp, Integer(SelectTreeView.Selected.Data^)]);
        ExecSQL;
        SelectTreeView.Selected.Text := AddMaterialForm.MaterialNameEdit.Text;
        SelectTreeViewChange(Sender, SelectTreeView.Selected);
      end;
    end;
  end;
  AddMaterialForm.Free;
end;

procedure TMaterialsEditForm.AddMenuItemClick(Sender: TObject);
var
  ParentNode: TTreeNode;
  X: PInteger;
  PropList1: TPropList;
  I: Integer;
  sField: string;
begin
  Application.CreateForm(TAddMaterialForm, AddMaterialForm);
  with SelectTreeView, AddMaterialForm do begin
    if Selected.Parent <> nil then begin
      PropGroupBox.Visible := False;
      Height := Height - PropGroupBox.Height;
    end else
      ParentNode := Selected;
    if not Assigned(ParentNode) then if Selected.Parent.Parent = nil then
      ParentNode := Selected
    else
      ParentNode := Selected.Parent;
    MaterialNameEdit.Text := ParentNode.Text;
    case ShowModal of
      mrOk:begin
        with Items do begin
          with AddQuery, Parameters do begin
            ParamValues['pName;pParent'] := VarArrayOf([MaterialNameEdit.Text, Integer(ParentNode.Data^)]);
            ExecSql;
          end;
          MaxNrecQuery.Open;
          New(X);
          X^ := Integer(MaxNrecQuery['MaxNrec']);
          Selected := AddChildObject(ParentNode, MaterialNameEdit.Text, X);
          MaxNrecQuery.Close;
        end;
      end;
    end;
    Free;
  end;
end;

procedure TMaterialsEditForm.ADOConnectionWillConnect(
  Connection: TADOConnection; var ConnectionString, UserID,
  Password: WideString; var ConnectOptions: TConnectOption;
  var EventStatus: TEventStatus);
var
  I: Integer;
begin
  for I := ADOConnection.DataSetCount - 1 downto 0 do
    ADOConnection.DataSets[I].Connection := Host.ADOC;
  EventStatus := esCancel;
end;

procedure TMaterialsEditForm.ClearPropList;
var
  I: Integer;
begin
  for I := 0 to PropList.Count - 1 do try
    PropList[I].Parent := nil;
    PropList[I].Free;
  finally
  end;
  PropList.Clear;
end;

procedure TMaterialsEditForm.ClearTree;
var
  N: TTreeNode;
begin
  for N in SelectTreeView.Items do
    Dispose(N.Data);
  SelectTreeView.Items.Clear;
end;

function TMaterialsEditForm.GetListProp(ListBox: TListBox): string;
var
  I: Integer;
begin
  Result := ' ';
  for I := 0 to ListBox.Count - 1 do
    Result := Result + ',' + string(ListBox.Items.Objects[I]);
  if Length(Result) > 1 then
    Result := RightStr(Result, Length(Result) - 2);
end;

procedure TMaterialsEditForm.GrMaterialsComboBoxChange(Sender: TObject);
begin
  with Sender as TDBComboBox, UpdateEditQuery do begin
    SQL.Text := 'update CmkNew.Materials set cGrMaterials=:pGrMaterials where NRec=:pNRec';
    Parameters.ParamValues['pGrMaterials;pNRec'] := VarArrayOf([Integer(Items.Objects[ItemIndex]), Integer(SelectTreeView.Selected.Data^)]);
    ExecSQL;
  end;
end;

procedure TMaterialsEditForm.GrMaterialsComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DELETE: with Sender as TDBComboBox, UpdateEditQuery do begin
      ItemIndex := -1;
      Text := '';
      SQL.Text := 'update cmknew.materials set cGrMaterials=:pGrMaterials where nRec=:pNrec';
      Parameters.ParamValues['pGrMaterials;pNrec'] := VarArrayOf([0, Integer(SelectTreeView.Selected.Data^)]);
      ExecSQL;
    end;
  end;
end;

procedure TMaterialsEditForm.MakePropList(Panel: TWinControl; ChildProp: string; Top, Left: Integer);
var
  I: Integer;
  WinControl: TWinControl;
  s1: string;
  L: TLabel;
  s: string;
  J: Integer;
begin
  I := Top;
  J := 0;
  for s in SplitString(Trim(ChildProp), ',') do
    try
      s1 := Trim(s);
      if s1 = '' then
        Continue;
      L := TLabel.Create(Self);
      if Assigned(PropNames) then
        L.Caption := PropNames[s1]
      else
        L.Caption := s1;
      L.Left := Left;
      L.Top := I + 4;
      WinControl := AllProp[s1].Create(Self) as TWinControl;
      L.FocusControl := WinControl;
      L.Parent := Panel;
      with WinControl do
      begin
        Left := L.Width + L.Left + 8;
        Top := I;
        TabOrder := J;
        Parent := Panel;
        if ClassName = 'TDBEdit' then
          with WinControl as TDBEdit do
          begin
            DataSource := EditDataSource;
            DataField := s1;
            OnChange := DBEditChange;
          end
        else if ClassName = 'TDBComboBox' then
          with WinControl as TDBComboBox do
          begin
            DataSource := EditDataSource;
            DataField := RightStr(s1, Length(s1) - 5) + '_NAME';
            if DataField = 'STEELMARK_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, ShortName Name from cmknew.SteelMarks'
            else if DataField = 'NORMDOC0_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.NormDoc where NormType=0'
            else if DataField = 'NORMDOC1_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.NormDoc where NormType=1'
            else if DataField = 'PROFILE_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.NormDoc'
            else if DataField = 'PROFTYPE_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Name from cmknew.ProfTypes'
            else if DataField = 'THICK_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Value Name from cmknew.Thicks'
            else if DataField = 'WIDTH_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Value Name from cmknew.Widths'
            else if DataField = 'LENGTH_NAME' then
              DropDownQuery.SQL.Text := 'select NRec, Value Name from cmknew.Lengths';
            DropDownQuery.Open;
            while not DropDownQuery.Eof do
            begin
              Items.AddObject(DropDownQuery['Name'], TObject(Integer(DropDownQuery['NRec'])));
              DropDownQuery.Next;
            end;
            DropDownQuery.Close;
            OnKeyDown := ComboBoxKeyDown;
            OnChange := ComboBoxChange;
            AutoDropDown := True;
          end;
      end;
      PropList.Add(L);
      PropList.Add(WinControl);
    finally
      Inc(I, 24);
      Inc(J);
    end;
  if PropList.Count > 0 then
    (PropList[PropList.Count - 1] as TWinControl).TabStop := True;
end;

end.
