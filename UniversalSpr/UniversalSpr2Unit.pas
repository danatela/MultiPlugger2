unit UniversalSpr2Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits, InclFileUnit,
  Spr1LabeledEditUnit, EquipmentUnit, ContractorUnit, DBGridEhGrouping,
  Vcl.DBCtrls, GridsEh, DBGridEh, Vcl.PlatformDefaultStyleActnCtrls,
  ActnCtrls,  SteelMarkUnit, MagsoftMsgDlgUnit, Vcl.ImgList, EhLibADO, Vcl.Menus,
  Spr1JvCalcEditUnit, NormdocUnit, CMKUserUnit, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, DBAxisGridsEh;


type
  TUniversalSpr2Form = class(TForm)
    ADOQ: TADOQuery;
    DS: TDataSource;
    Panel2: TPanel;
    Grid: TDBGridEh;
    Panel3: TPanel;
    Splitter1: TSplitter;
    BitBtn1: TBitBtn;
    ActionManager1: TActionManager;
    AppendRecordAction: TAction;
    EditRecordAction: TAction;
    DeleteRecordAction: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionsEnabling;
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure ADOQBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    f_EditRights:boolean;
    f_SprFilterString,f_SprTableName,f_UnicalField: string;
    f_BeforePostField1: string;
    f_BeforePostValue1: int64;
    f_BeforePostField2: string;
    f_BeforePostValue2: int64;
  end;

TSpr2 = class
 SprTableName: string;
 SprVisibleFieldNames: string;
 SprVisibleFieldTitles: string;
 SprVisibleFieldWidths: string;
 SprFilterString: string;
 SprOrderByString: string;
 SprDescription: string;
 UnicalField: string;
 BeforePostField1: string;
 BeforePostValue1: int64;
 BeforePostField2: string;
 BeforePostValue2: int64;
 EditRights: boolean;
 Procedure Clear;
 Function ToForm(Var Form:TUniversalSpr2Form):boolean;
 Function FromForm(Var Form:TUniversalSpr2Form):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  UniversalSpr2Form: TUniversalSpr2Form;

implementation

{$R *.dfm}

procedure TUniversalSpr2Form.ADOQBeforePost(DataSet: TDataSet);
begin
 if Not Empty(f_BeforePostField1) then DataSet[f_BeforePostField1]:=f_BeforePostValue1;
 if Not Empty(f_BeforePostField2) then DataSet[f_BeforePostField2]:=f_BeforePostValue2;
end;



procedure TUniversalSpr2Form.DSDataChange(Sender: TObject; Field: TField);
begin
 ActionsEnabling;
end;

procedure TUniversalSpr2Form.FormCreate(Sender: TObject);
begin
 ADOQ.Connection:=Host.ADOC;
end;

procedure TUniversalSpr2Form.FormDestroy(Sender: TObject);
begin
 ADOQ.Close;
end;

procedure TUniversalSpr2Form.FormShow(Sender: TObject);
begin
 Grid.SetFocus;
end;

Constructor TSpr2.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TSpr2.Clear;
begin
 SprTableName:=EmptyStr;
 SprVisibleFieldNames:=EmptyStr;
 SprVisibleFieldTitles:=EmptyStr;
 SprVisibleFieldWidths:=EmptyStr;
 SprFilterString:=EmptyStr;
 SprOrderByString:=EmptyStr;
 SprDescription:=EmptyStr;
 UnicalField:='NAME';
 BeforePostField1:=EmptyStr;
 BeforePostValue1:=0;
 BeforePostField2:=EmptyStr;
 BeforePostValue2:=0;
 EditRights:=True;
end;

Function TSpr2.Edit(OForm:TComponent):boolean;
Var
 Form: TUniversalSpr2Form;
begin
 Form:=TUniversalSpr2Form.Create(OForm);
 if ToForm(Form) then
  Begin
   Form.ShowModal;
   result:=FromForm(Form);
  End;
 Form.Free;
end;

Function TSpr2.ToForm(Var Form:TUniversalSpr2Form):boolean;
Var
 i:integer;
 orderby:string;
 wh:string;
 column:TColumnEh;
 ColumnsList,ColumnsTitlesList,ColumnsWidthsList:TStringList;
Begin
 result:=False;
 Form.f_EditRights:=EditRights;
 Form.f_SprTableName:=UpperCase(SprTableName);
 Form.f_UnicalField:=UnicalField;
 Form.f_SprFilterString:=SprFilterString;
 Form.f_BeforePostField1:=BeforePostField1;
 Form.f_BeforePostValue1:=BeforePostValue1;
 Form.f_BeforePostField2:=BeforePostField2;
 Form.f_BeforePostValue2:=BeforePostValue2;
 if Not Empty(SprTableName) then
  Begin
   if Not Empty(SprDescription) then Form.Caption:=SprDescription;
   if Empty(SprFilterString) then wh:=Truu
                             else wh:=SprFilterString;
   if Empty(SprOrderByString) then orderby:=EmptyStr
                              else orderby:=' order by '+SprOrderByString;
   Form.ADOQ.SQL.Text:='select * from '+SchemaName+SprTableName+' where '+wh+orderby;
   Form.ADOQ.Open;

   if Not Empty(SprVisibleFieldNames) then
    Begin
      ColumnsList:=TStringList.Create;
      ColumnsList.CommaText:=SprVisibleFieldNames;
      ColumnsTitlesList:=TStringList.Create;
      ColumnsTitlesList.CommaText:=SprVisibleFieldTitles;
      ColumnsWidthsList:=TStringList.Create;
      ColumnsWidthsList.CommaText:=SprVisibleFieldWidths;

      for i:=0 to ColumnsList.Count-1 do
       Begin
        column:=Form.grid.columns.Add;
        column.AutoDropDown:=True;
        column.ToolTips:=True;
        column.DropDownSizing:=True;
        column.FieldName:=ColumnsList[i];
        column.Visible:=True;
//        ShowMessage(ColumnsTitlesList[i]);
        if i<ColumnsTitlesList.Count then
         column.Title.Caption:=DeQuoted(ColumnsTitlesList[i]);
        column.Title.TitleButton:=True;
        column.Title.ToolTips:=True;
        column.ToolTips:=True;
        if i<ColumnsWidthsList.Count then
         Begin
          if ColumnsWidthsList[i]=zero then
           Begin
            column.AutoFitColWidth:=True;
           End
            else
           Begin
            column.AutoFitColWidth:=False;
            column.Width:=StrToIntM(ColumnsWidthsList[i]);
           End;
         End;
       End;
      ColumnsWidthsList.Free;
      ColumnsTitlesList.Free;
      ColumnsList.Free;

    End;


   Form.ActionsEnabling;
   result:=True;
  End
End;

Function TSpr2.FromForm(Var Form:TUniversalSpr2Form):boolean;
Begin
 EditRights:=Form.f_EditRights;
 result:=True;
End;

Destructor TSpr2.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TUniversalSpr2Form.ActionsEnabling;
Begin
 AppendRecordAction.Enabled:=f_EditRights and ADOQ.Active;
 EditRecordAction.Enabled:=ADOQ.Active and (ADOQ.RecNo>0);
 DeleteRecordAction.Enabled:=f_EditRights and ADOQ.Active and (ADOQ.RecNo>0);

 AppendRecordAction.Enabled:=False;
 EditRecordAction.Enabled:=False;
 DeleteRecordAction.Enabled:=False;
End;

end.
