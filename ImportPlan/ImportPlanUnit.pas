unit ImportPlanUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, DBGridEhGrouping,
  GridsEh, DBGridEh, EhLibADO, Vcl.Tabs, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, DBAxisGridsEh, Vcl.OleServer, ComObj, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ImgList, ExcelXP, Generics.Collections, GlobVars, DanatelaSharedUnit,
  Vcl.DockTabSet, CmkUserUnit, ADOInt, MagsoftWaitDialog, Vcl.DBCtrls, Vcl.Mask, DateUtils;

type
  TImportPlanForm = class(TForm)
    ADOConnection: TADOConnection;
    PlansDataSource: TDataSource;
    SpPlansDataSource: TDataSource;
    PlansQuery: TADOQuery;
    SpPlansQuery: TADOQuery;
    ClientImportPanel: TPanel;
    SpPlansDBGrid: TDBGridEh;
    PlansDBGrid: TDBGridEh;
    RightImportPanel: TPanel;
    PlansQueryID: TFloatField;
    PlansQueryMONTH: TStringField;
    PlansQueryYEAR: TFloatField;
    PlansQueryOPEN: TStringField;
    ImportBitBtn: TBitBtn;
    PlansQueryMONTH_NUM: TFloatField;
    EditPanel: TPanel;
    ImportPanel: TPanel;
    RightEditPanel: TPanel;
    AddHeaderBitBtn: TBitBtn;
    GoToEditingBitBtn: TBitBtn;
    AddSpecifBitBtn: TBitBtn;
    GoToImportBitBtn: TBitBtn;
    ClientEditPanel: TPanel;
    EditPlansDBGrid: TDBGridEh;
    ImportSplitter: TSplitter;
    EditSplitter: TSplitter;
    EditPlansDataSource: TDataSource;
    EditSpPlansDataSource: TDataSource;
    EditPlansQuery: TADOQuery;
    EditSpPlansQuery: TADOQuery;
    EditPlansQueryPMONTH: TFloatField;
    EditPlansQueryMONTH: TStringField;
    EditPlansQueryPYEAR: TFloatField;
    EditSpPlansQueryNREC: TFloatField;
    EditSpPlansQueryCPLANS: TFloatField;
    EditSpPlansQueryCCONTRACTOR: TFloatField;
    EditSpPlansQueryCONTRACTOR_S: TStringField;
    EditSpPlansQueryCRECIPIENT: TFloatField;
    EditSpPlansQueryRECIPIENT_S: TStringField;
    EditSpPlansQueryORDERNUM: TStringField;
    EditSpPlansQueryORDERNUM2: TStringField;
    EditSpPlansQueryORDN: TStringField;
    EditSpPlansQueryCMARK: TFloatField;
    EditSpPlansQueryMARK_S: TStringField;
    EditSpPlansQueryKOLSHT: TFloatField;
    EditSpPlansQueryWEIGHT1: TFloatField;
    EditSpPlansQueryWEIGHT: TFloatField;
    EditSpPlansQueryPTYPE: TFloatField;
    EditSpPlansQueryPPONREC: TFloatField;
    EditSpPlansQuerySTATE: TFloatField;
    EditSpPlansQueryDRAWING: TStringField;
    EditSpPlansQueryGRAPH: TStringField;
    EditSpPlansQueryRELDATE: TDateTimeField;
    EditSpPlansQueryUPDATED: TDateTimeField;
    EditSpPlansQueryPRIM: TStringField;
    EditPlansQueryCPLANS: TFloatField;
    DeleteSpecifBitBtn: TBitBtn;
    DeleteHeaderBitBtn: TBitBtn;
    EditPlanBitBtn: TBitBtn;
    EditSpecifBitBtn: TBitBtn;
    EditSpPlansQueryUPDATED_US: TDateTimeField;
    EditSpPlansDBGridEh: TDBGridEh;
    CorrSpPlanBitBtn: TBitBtn;
    EditPlansQueryPPONREC: TFloatField;
    ContractorsQuery: TADOQuery;
    ContractorsQueryNREC: TFloatField;
    ContractorsQueryABBR: TStringField;
    ImportIntoKDBitBtn: TBitBtn;
    SelectKDQuery: TADOQuery;
    SelectMarksQuery: TADOQuery;
    EditPlansQueryORAUSER: TStringField;
    LcaDepQuery: TADOQuery;
    SelectContractorsQuery: TADOQuery;
    EnhPlanPanel: TPanel;
    RightEPPanel: TPanel;
    ClientEPPanel: TPanel;
    EPSplitter: TSplitter;
    PlanMarksDBGridEh: TDBGridEh;
    DMarksDBGridEh: TDBGridEh;
    BackBitBtn: TBitBtn;
    PlanMarksDataSource: TDataSource;
    DMarksDataSource: TDataSource;
    PlanMarksQuery: TADOQuery;
    GoToEnhPlanBitBtn: TBitBtn;
    PlanMarksQueryNREC: TFloatField;
    PlanMarksTotalDBGridEh: TDBGridEh;
    TopEPPanel: TPanel;
    PlanMarksSplitter: TSplitter;
    PlanMarksQueryORDERNUM: TStringField;
    PlanMarksQueryINPUTDATE: TDateTimeField;
    PlanMarksQueryLUPDDATE: TDateTimeField;
    PlanMarksQueryCCONTRACTOR: TFloatField;
    PlanMarksQueryACTDATE: TDateTimeField;
    PlanMarksQueryCONTRACTOR_S: TStringField;
    PlanMarksQueryORAUSER: TStringField;
    PlanMarksQueryORDERNUM2: TStringField;
    PlanMarksQueryEMPTY: TFloatField;
    PlanMarksQueryORDN: TStringField;
    PlanMarksQueryQUEUE: TStringField;
    PlanMarksQueryMARK: TStringField;
    PlanMarksQueryNAME: TStringField;
    PlanMarksQueryRKOEF: TFloatField;
    PlanMarksQueryCMKGROUP: TFloatField;
    PlanMarksQueryWEIGHT1: TFloatField;
    PlanMarksQueryWEIGHTZ: TFloatField;
    PlanMarksQueryDRAWING: TStringField;
    PlanMarksQueryCRECIPIENT: TFloatField;
    PlanMarksQueryPRIM: TStringField;
    PlanMarksQueryMKGROUP_S: TStringField;
    PlanMarksQueryRECIPIENT_S: TStringField;
    DMarksTabSet: TTabSet;
    DMarksTotalQuery: TADOQuery;
    FMTBCDField1: TFloatField;
    FMTBCDField3: TFloatField;
    DMarksTotalQueryNUMP: TStringField;
    PlanMarksQueryCKD: TFloatField;
    PlanMarksQueryT_SBORKA_NV: TFloatField;
    PlanMarksQueryT_SBORKA_PR: TStringField;
    PlanMarksQueryT_SVARKA_WE: TFloatField;
    PlanMarksQueryT_SVARKA_M: TFloatField;
    PlanMarksQueryT_SVARKA_CEQ: TFloatField;
    PlanMarksQueryT_SVARKA_NV: TFloatField;
    PlanMarksQueryT_ZACHIST_CEQ: TFloatField;
    PlanMarksQueryT_ZACHIST_NV: TFloatField;
    PlanMarksQueryT_GRPOKR_GR: TStringField;
    PlanMarksQueryT_GRPOKR_POKR: TStringField;
    PlanMarksQueryT_GRPOKR_NV: TFloatField;
    PlanMarksQueryT_DOVODKA_CEQ: TFloatField;
    PlanMarksQueryT_DOVODKA_NV: TFloatField;
    PlanMarksQueryT_DOVODKA_PR: TStringField;
    PlanMarksQueryT_SVARKA_EQ_S: TStringField;
    PlanMarksQueryT_ZACHIST_EQ_S: TStringField;
    PlanMarksQueryT_DOVODKA_EQ_S: TStringField;
    PlanMarksQueryKOLSHT: TFloatField;
    PlanMarksQueryWEIGHT1_1: TFloatField;
    PlanMarksQueryWEIGHT: TFloatField;
    DMarksTotalQueryGIBKA: TStringField;
    PlanMarksTotalQuery: TADOQuery;
    PlanMarksTotalDataSource: TDataSource;
    PlanMarksTotalQueryORDN: TStringField;
    PlanMarksTotalQueryNAME: TStringField;
    PlanMarksTotalQuerySUMSPPLANSKOLSHT: TFloatField;
    PlanMarksTotalQueryAVGMARKSWEIGHT1: TFloatField;
    PlanMarksTotalQuerySUMSPPLANSWEIGHT1: TFloatField;
    PlanMarksTotalQueryAVGSPPLANSWEIGHT: TFloatField;
    PlanMarksQueryRELDATE: TDateTimeField;
    FillPlanBitBtn: TBitBtn;
    PlanMarksQuerySBORKA: TStringField;
    PlanMarksQuerySVARKA: TStringField;
    PlanMarksQueryZACHIST: TStringField;
    PlanMarksQueryGRPOKR: TStringField;
    PlanMarksQueryDOVODKA: TStringField;
    EditSpPlansQueryKOEF: TStringField;
    EditSpPlansQueryPRIM_PRB: TStringField;
    EditSpPlansQueryISSUEDATE: TDateTimeField;
    EditSpPlansQueryDRAWINGEXISTANCE: TFloatField;
    EditSpPlansQueryARTICLE: TStringField;
    EditSpPlansQueryMATERIAL: TStringField;
    EditSpPlansQueryQUEUE: TFloatField;
    PrintRepBtn: TBitBtn;
    EditCoolBar: TCoolBar;
    EditToolBar: TToolBar;
    AccountingToolButton: TToolButton;
    IPImageList: TImageList;
    EnhPlanCoolBar: TCoolBar;
    EnhPlanToolBar: TToolBar;
    EPSumToolButton: TToolButton;
    DetailsADOQuery: TADOQuery;
    DetailsADOQueryCKD: TFloatField;
    DetailsADOQueryNUMP: TStringField;
    DetailsADOQueryGRMATERIALS_S: TStringField;
    DetailsADOQueryT_RAZMET_EQ_S: TStringField;
    DetailsADOQueryT_RAZMET_NV: TFloatField;
    DetailsADOQueryT_RAZMET_PR: TStringField;
    DetailsADOQueryT_REZKA_EQ_S: TStringField;
    DetailsADOQueryT_REZKA_PR: TStringField;
    DetailsADOQueryT_REZKA_M: TFloatField;
    DetailsADOQueryT_REZKA_NV: TFloatField;
    DetailsADOQueryT_ZACHIST_TYPE_S: TStringField;
    DetailsADOQueryT_ZACHIST_NV: TFloatField;
    DetailsADOQueryT_STROZH_EQ_S: TStringField;
    DetailsADOQueryT_STROZH_PR: TStringField;
    DetailsADOQueryT_STROZH_M: TFloatField;
    DetailsADOQueryT_STROZH_NV: TFloatField;
    DetailsADOQueryT_OTVERST_EQ_S: TStringField;
    DetailsADOQueryT_OTVERST_PR: TStringField;
    DetailsADOQueryT_OTVERST_COUNT: TFloatField;
    DetailsADOQueryT_OTVERST_DIAM: TStringField;
    DetailsADOQueryT_OTVERST_NV: TFloatField;
    DetailsADOQueryT_GIBKA_EQ_S: TStringField;
    DetailsADOQueryT_GIBKA_PR: TStringField;
    DetailsADOQueryT_GIBKA_NV: TFloatField;
    DetailsADOQueryPRIM: TStringField;
    DMarksTotalQueryNREC: TFloatField;
    DMarksTotalQueryCPLANS: TFloatField;
    DMarksTotalQueryCMARK: TFloatField;
    DMarksTotalQueryWEIGHT1: TFloatField;
    DMarksTotalQueryGRMATERIALS_S: TStringField;
    DMarksTotalQueryT_RAZMET_EQ_S: TStringField;
    DMarksTotalQueryT_RAZMET_NV: TFloatField;
    DMarksTotalQueryT_RAZMET_PR: TStringField;
    DMarksTotalQueryT_REZKA_EQ_S: TStringField;
    DMarksTotalQueryT_REZKA_PR: TStringField;
    DMarksTotalQueryT_REZKA_M: TFloatField;
    DMarksTotalQueryT_REZKA_NV: TFloatField;
    DMarksTotalQueryT_ZACHIST_TYPE_S: TStringField;
    DMarksTotalQueryT_ZACHIST_NV: TFloatField;
    DMarksTotalQueryT_STROZH_EQ_S: TStringField;
    DMarksTotalQueryT_STROZH_PR: TStringField;
    DMarksTotalQueryT_STROZH_M: TFloatField;
    DMarksTotalQueryT_STROZH_NV: TFloatField;
    DMarksTotalQueryT_OTVERST_EQ_S: TStringField;
    DMarksTotalQueryT_OTVERST_PR: TStringField;
    DMarksTotalQueryT_OTVERST_COUNT: TFloatField;
    DMarksTotalQueryT_OTVERST_DIAM: TStringField;
    DMarksTotalQueryT_OTVERST_NV: TFloatField;
    DMarksTotalQueryT_GIBKA_EQ_S: TStringField;
    DMarksTotalQueryT_GIBKA_PR: TStringField;
    DMarksTotalQueryT_GIBKA_NV: TFloatField;
    DMarksTotalQueryRAZMET: TStringField;
    DMarksTotalQueryREZKA: TStringField;
    DMarksTotalQueryZACHIST: TStringField;
    DMarksTotalQuerySTROZH: TStringField;
    DMarksTotalQueryOTVERST: TStringField;
    DMarksTotalQueryPRIM: TStringField;
    DetailsADOQueryPROP_STEELMARK: TFloatField;
    DetailsADOQueryPROP_STEELMARK_C: TStringField;
    DMarksTotalQueryPROP_STEELMARK: TFloatField;
    DMarksTotalQueryPROP_STEELMARK_C: TStringField;
    DMarksTotalQueryORDERNUM2: TStringField;
    EditSpPlansQueryDOP: TStringField;
    EditSpPlansQueryRKOEF: TFloatField;
    xlApp: TExcelApplication;
    SPGOTADOQuery: TADOQuery;
    DMarksTotalQueryCPERSON: TFloatField;
    DMarksTotalQueryKOL: TFloatField;
    DMarksTotalQueryTRIMDATE: TDateTimeField;
    DMarksTotalQueryTRIMMED: TStringField;
    DMarksTotalQueryPUT: TStringField;
    DMarksTotalQueryPASSPORT: TStringField;
    DMarksTotalQueryTRIMDUTY: TStringField;
    PersonsADOQuery: TADOQuery;
    PersonsADOQueryAGGNAME: TStringField;
    DMarksTotalQueryPERSON: TStringField;
    DMarksTotalQueryRAZMETDATE: TDateField;
    DMarksTotalQueryRAZMETPERSON: TStringField;
    DMarksTotalQueryZACHISTDATE: TDateField;
    DMarksTotalQueryZACHISTPERSON: TStringField;
    DMarksTotalQuerySTROZHDATE: TDateField;
    DMarksTotalQuerySTROZHPERSON: TStringField;
    DMarksTotalQueryBENDINGDATE: TDateField;
    DMarksTotalQueryBENDINGPERSON: TStringField;
    DMarksTotalQueryHOLESDATE: TDateField;
    DMarksTotalQueryHOLESPERSON: TStringField;
    SPGOTADOQueryNREC: TFloatField;
    SPGOTADOQueryCMARK: TFloatField;
    SPGOTADOQueryNUMP: TStringField;
    SPGOTADOQueryCPERSON: TFloatField;
    SPGOTADOQueryKOL: TFloatField;
    SPGOTADOQueryTRIMDATE: TDateTimeField;
    SPGOTADOQueryTRIMMED: TFloatField;
    SPGOTADOQueryPUT: TFloatField;
    SPGOTADOQueryCPASSPORT: TFloatField;
    SPGOTADOQueryTRIMDUTY: TFloatField;
    SPGOTADOQueryOPERTYPE: TFloatField;
    DMarksTotalQueryRAZMETKOL: TIntegerField;
    DMarksTotalQueryZACHISTKOL: TIntegerField;
    DMarksTotalQuerySTROZHKOL: TIntegerField;
    DMarksTotalQueryBENDINGKOL: TIntegerField;
    DMarksTotalQueryHOLESKOL: TIntegerField;
    SPGOTADOQueryPERSON: TStringField;
    SPGOTADOQueryPASSPORT: TStringField;
    PassportsADOQuery: TADOQuery;
    PassportsADOQueryNREC: TFloatField;
    PassportsADOQueryCSPARRIVALS: TFloatField;
    PassportsADOQueryNUM: TStringField;
    PassportsADOQuerySPENT: TFloatField;
    PersonsADOQueryID: TFloatField;
    EditSpPlansQuerySCHAB: TStringField;
    LevelDockTabSet: TDockTabSet;
    EditSpPlansQuerySERVICE: TFloatField;
    SpPlansQueryORDER_ID: TFloatField;
    SpPlansQueryPLAN_ID: TFloatField;
    SpPlansQueryNUM: TFloatField;
    SpPlansQueryONUM: TFloatField;
    SpPlansQueryCNUM: TStringField;
    SpPlansQueryDRAWING: TStringField;
    SpPlansQueryTITLE: TStringField;
    SpPlansQueryNUM_OF: TFloatField;
    SpPlansQueryCADEP: TFloatField;
    SpPlansQueryWEIGHT: TFloatField;
    SpPlansQueryMATERIAL: TFloatField;
    SpPlansQueryARTICLE: TFloatField;
    SpPlansQueryDEPTH: TFloatField;
    SpPlansQueryPRODUCER: TFloatField;
    SpPlansQueryINUM: TFloatField;
    SpPlansQueryPAINT: TFloatField;
    SpPlansQueryBSS: TFloatField;
    SpPlansQueryQNUM: TFloatField;
    SpPlansQuerySERVICE: TFloatField;
    SpPlansQueryCONTINUE: TFloatField;
    SpPlansQueryGRAPH: TStringField;
    SpPlansQueryADVANCED: TFloatField;
    SpPlansQueryNOTE: TStringField;
    SpPlansQueryUPDATED: TDateTimeField;
    SpPlansQueryRELDATE: TDateTimeField;
    SpPlansQueryMETIZ: TFloatField;
    SpPlansQueryID: TFloatField;
    SpPlansQueryARTICLE_TITLE: TStringField;
    SpPlansQueryORD: TFloatField;
    SpPlansQueryFULL_NAME: TStringField;
    SpPlansQueryDOP: TFloatField;
    SpPlansQueryMATERIAL_TITLE: TStringField;
    SpPlansQueryPRODUCER_CA: TFloatField;
    SpPlansQueryPRODUCER_TITLE: TStringField;
    SpPlansQueryCADEP_CA: TFloatField;
    SpPlansQueryCADEP_TITLE: TStringField;
    ImportSpecifBitBtn: TBitBtn;
    EditSpPlansQueryTITLE: TStringField;
    ImportCoolBar: TCoolBar;
    ImportToolBar: TToolBar;
    SumToolButton: TToolButton;
    SpPlansDBNavigator: TDBNavigator;
    PlansDBNavigator: TDBNavigator;
    PlanMarksQueryCONTROL: TStringField;
    PlanMarksQueryNREC_1: TFloatField;
    PlanMarksQueryINPUTDATE_1: TDateTimeField;
    PlanMarksQueryLUPDDATE_1: TDateTimeField;
    PlanMarksQueryEMPTY_1: TFloatField;
    PlanMarksQueryCONTROL_1: TStringField;
    PlanMarksQueryCSPPLANS: TFloatField;
    EditPlanPanel: TPanel;
    PlanMarksQueryDMARKSCOUNT: TFloatField;
    PlanMarksQueryCPLANS: TFloatField;
    EditSpPlansQueryIMPORTED: TDateTimeField;
    EditSpPlansQueryMAVERICK: TFloatField;
    PlanMarksTotalQueryORDERNUM: TStringField;
    PlanMarksTotalQueryORDERNUM2: TStringField;
    LArticlesQuery: TADOQuery;
    LcaDepQueryID: TFloatField;
    LcaDepQueryCA: TFloatField;
    LcaDepQueryTITLE: TStringField;
    LArticlesQueryID: TFloatField;
    LArticlesQueryTITLE: TStringField;
    LArticlesQueryORD: TFloatField;
    LArticlesQueryFULL_NAME: TStringField;
    LArticlesQueryDOP: TFloatField;
    LMaterialQuery: TADOQuery;
    LMaterialQueryID: TFloatField;
    LMaterialQueryTITLE: TStringField;
    SpPlansQueryRES_WEIGHT: TFloatField;
    SpPlansQueryCALC_WEIGHT: TFloatField;
    EditSpPlansQueryRES_WEIGHT: TFloatField;
    SelectKDQueryNREC: TFloatField;
    SelectKDQueryORDERNUM: TStringField;
    SelectKDQueryINPUTDATE: TDateTimeField;
    SelectKDQueryLUPDDATE: TDateTimeField;
    SelectKDQueryCCONTRACTOR: TFloatField;
    SelectKDQueryACTDATE: TDateTimeField;
    SelectKDQueryCONTRACTOR_S: TStringField;
    SelectKDQueryORAUSER: TStringField;
    SelectKDQueryORDERNUM2: TStringField;
    SelectKDQueryEMPTY: TFloatField;
    SelectKDQueryCONTROL: TStringField;
    SelectMarksQueryNREC: TFloatField;
    SelectMarksQueryCKD: TFloatField;
    SelectMarksQueryORDN: TStringField;
    SelectMarksQueryQUEUE: TStringField;
    SelectMarksQueryMARK: TStringField;
    SelectMarksQueryNAME: TStringField;
    SelectMarksQueryRKOEF: TFloatField;
    SelectMarksQueryCMKGROUP: TFloatField;
    SelectMarksQueryWEIGHT1: TFloatField;
    SelectMarksQueryWEIGHTZ: TFloatField;
    SelectMarksQueryDRAWING: TStringField;
    SelectMarksQueryINPUTDATE: TDateTimeField;
    SelectMarksQueryLUPDDATE: TDateTimeField;
    SelectMarksQueryCRECIPIENT: TFloatField;
    SelectMarksQueryT_SBORKA_NV: TFloatField;
    SelectMarksQueryT_SBORKA_PR: TStringField;
    SelectMarksQueryT_SVARKA_WE: TFloatField;
    SelectMarksQueryT_SVARKA_M: TFloatField;
    SelectMarksQueryT_SVARKA_CEQ: TFloatField;
    SelectMarksQueryT_SVARKA_NV: TFloatField;
    SelectMarksQueryT_ZACHIST_CEQ: TFloatField;
    SelectMarksQueryT_ZACHIST_NV: TFloatField;
    SelectMarksQueryT_GRPOKR_GR: TStringField;
    SelectMarksQueryT_GRPOKR_POKR: TStringField;
    SelectMarksQueryT_GRPOKR_NV: TFloatField;
    SelectMarksQueryT_DOVODKA_CEQ: TFloatField;
    SelectMarksQueryT_DOVODKA_NV: TFloatField;
    SelectMarksQueryT_DOVODKA_PR: TStringField;
    SelectMarksQueryPRIM: TStringField;
    SelectMarksQueryMKGROUP_S: TStringField;
    SelectMarksQueryRECIPIENT_S: TStringField;
    SelectMarksQueryT_SVARKA_EQ_S: TStringField;
    SelectMarksQueryT_ZACHIST_EQ_S: TStringField;
    SelectMarksQueryT_DOVODKA_EQ_S: TStringField;
    SelectMarksQueryEMPTY: TFloatField;
    SelectMarksQueryCONTROL: TStringField;
    KDDataSource: TDataSource;
    SpPlansQueryPEREGRUZ: TFloatField;
    EditSpPlansQueryTONKOEF: TFloatField;
    EditSpPlansQueryTONCALC: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PlansQueryAfterScroll(DataSet: TDataSet);
    procedure ImportBitBtnClick(Sender: TObject);
    procedure GoNext(Sender: TObject);
    procedure EditPlansQueryAfterScroll(DataSet: TDataSet);
    procedure DeleteHeaderBitBtnClick(Sender: TObject);
    procedure DeleteSpecifBitBtnClick(Sender: TObject);
    procedure EditPlanBitBtnClick(Sender: TObject);
    procedure EditSpecifBitBtnClick(Sender: TObject);
    procedure CorrSpPlanBitBtnClick(Sender: TObject);
    procedure ImportIntoKDBitBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PlanMarksQueryAfterScroll(DataSet: TDataSet);
    procedure GoBack(Sender: TObject);
    procedure DMarksTabSetChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure DMarksQueryCalcFields(DataSet: TDataSet);
    procedure PlanMarksTotalQueryAfterScroll(DataSet: TDataSet);
    procedure PlanMarksQueryCalcFields(DataSet: TDataSet);
    procedure EditSpPlansQueryAfterScroll(DataSet: TDataSet);
    procedure PrintRepBtnClick(Sender: TObject);
    procedure AccountingSpeedButtonClick(Sender: TObject);
    procedure EPSumToolButtonClick(Sender: TObject);
    procedure BeforeOpen(DataSet: TDataSet);
    procedure EditButtonClick(Sender: TObject; var Handled: Boolean);
    procedure EditSpPlansDBGridEhDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure EditSpPlansDBGridEhKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FillPlanBitBtnClick(Sender: TObject);
    procedure LevelDockTabSetChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure WeightChange(Sender: TField);
    procedure EditSpPlansQueryAfterInsert(DataSet: TDataSet);
    procedure EditPlansQueryCalcFields(DataSet: TDataSet);
    procedure EditPlansQueryAfterInsert(DataSet: TDataSet);
    procedure SumToolButtonClick(Sender: TObject);
    procedure EditPlansDataSourceDataChange(Sender: TObject; Field: TField);
    procedure EditSpPlansDataSourceDataChange(Sender: TObject; Field: TField);
    procedure AfterPost(DataSet: TDataSet);
    procedure AddHeaderBitBtnClick(Sender: TObject);
    procedure AddSpecifBitBtnClick(Sender: TObject);
    procedure EditPlansQueryBeforeDelete(DataSet: TDataSet);
    procedure PlanMarksDBGridEhDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure EditSpPlansQueryBeforeEdit(DataSet: TDataSet);
    procedure EditSpPlansQueryMAVERICKChange(Sender: TField);
    procedure EditPlansQueryBeforeInsert(DataSet: TDataSet);
    procedure PlanMarksQueryBeforeScroll(DataSet: TDataSet);
    procedure PlanMarksTotalQueryBeforeScroll(DataSet: TDataSet);
    procedure SpPlansQueryCalcFields(DataSet: TDataSet);
    procedure EditSpPlansQueryCalcFields(DataSet: TDataSet);
    procedure SpPlansQueryAfterScroll(DataSet: TDataSet);
    procedure ImportSpecifBitBtnClick(Sender: TObject);
    procedure ADOConnectionWillConnect(Connection: TADOConnection;
      var ConnectionString, UserID, Password: WideString;
      var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
    procedure SelectMarksQueryAfterInsert(DataSet: TDataSet);
  private
    FPlanLevel: Integer;
    Strings1, Strings2: TStrings;
    OldMaverick: Integer;
    FTransitMavericks: Boolean;
    FMavericks: Variant;
    TransitFields: TStrings;
    procedure SetTransitMavericks(Value: Boolean);
    property TransitMavericks: Boolean read FTransitMavericks write SetTransitMavericks default False;
    procedure SetPlanLevel(Value: Integer);
    procedure DMarksTotalQuerySetFilter(TabIndex: Integer);
    procedure GridPaste(Grid: TDbGridEh);
    procedure CheckActions;
    procedure RunEditSpecifScreen;
    procedure RunEditHeaderScreen;
    procedure TransitSpPlan;
    procedure DisableEdit;
    procedure DisableImport;
    procedure EnableImport;
    procedure EnableEdit;
    procedure ImportSingleSpecif(Source, Target: TDataSet);
    { Private declarations }
  public
    property PlanLevel: Integer read FPlanLevel write SetPlanLevel;
    { Public declarations }
  end;

  TMyGrid = class(TCustomGridEh);

const
  FieldsStr1 = 'Article;Contractor_S;Recipient_S;OrderNum;OrderNum2;OrdN;Title;Queue;KolSht;Weight1;Material;Drawing;Graph;RELDATE;UPDATED';
  FieldsStr2 = 'Article_Title;Producer_Title;Cadep_Title;num;inum;onum;Title;QNum;num_of;weight;Material_Title;Drawing;Graph;RELDATE;UPDATED';

var
  ImportPlanForm: TImportPlanForm;

implementation

uses EditPlanUnit, EditSpPlanUnit, CorrSpPlanUnit, ComparisonSpPlanUnit,
     EditSPGotUnit, ClipBrd;

{$R *.dfm}

procedure TImportPlanForm.SelectMarksQueryAfterInsert(DataSet: TDataSet);
begin
  DataSet['CKD'] := DataSet.DataSource.DataSet['NREC'];
end;

procedure TImportPlanForm.SetPlanLevel(Value: Integer);
begin
  if Value <> PlanLevel then begin
    case Value of
    1: ImportPanel.BringToFront;
    2: EditPanel.BringToFront;
    3: EnhPlanPanel.BringToFront;
    else
      raise Exception.Create('Неверное значение параметра PlanLevel! Должно быть в диапазоне от 1 до 3.');
    end;
    FPlanLevel := Value;
    LevelDockTabSet.TabIndex := PlanLevel - 1;
  end;
end;

procedure TImportPlanForm.SetTransitMavericks(Value: Boolean);
var
  Key: Int64;
  Filter: string;
  Filtered: Boolean;
  I: Integer;
begin
  FTransitMavericks := Value;
  if TransitMavericks then try
    EditSpPlansQuery.DisableControls;
    Key := EditSpPlansQuery['NREC'];
    Filter := EditSpPlansQuery.Filter;
    Filtered := EditSpPlansQuery.Filtered;
    EditSpPlansQuery.Filter := 'MAVERICK=1';
    EditSpPlansQuery.Filtered := True;
    FMavericks := VarArrayCreate([0, EditSpPlansQuery.RecordCount - 1], varVariant);
    EditSpPlansQuery.First;
    for I := 0 to EditSpPlansQuery.RecordCount - 1 do
      FMavericks[I] := EditSpPlansQuery[TransitFields.DelimitedText];
  finally
    EditSpPlansQuery.Filter := Filter;
    EditSpPlansQuery.Filtered := Filtered;
    EditSpPlansQuery.Locate('NREC', Key, []);
    EditSpPlansQuery.EnableControls;
  end else
    VarClear(FMavericks);
end;

procedure TImportPlanForm.SpPlansQueryAfterScroll(DataSet: TDataSet);
begin
  if PlanLevel = 1 then
    EditSpPlansQuery.Locate('PPONREC', DataSet['ID'], []);
end;

procedure TImportPlanForm.SpPlansQueryCalcFields(DataSet: TDataSet);
begin
  if DataSet['SERVICE'] > 0 then
    DataSet['RES_WEIGHT'] := 0
  else
    DataSet['RES_WEIGHT'] := DataSet['CALC_WEIGHT'];
end;

procedure TImportPlanForm.SumToolButtonClick(Sender: TObject);
begin
  SpPlansDBGrid.SumList.Active := SumToolButton.Down;
end;

procedure TImportPlanForm.DMarksTotalQuerySetFilter(TabIndex: Integer);
begin
  with DMarksTotalQuery do
  try
    Filtered := TabIndex > 0;
    case TabIndex of
    0: Filter := '';
    1: Filter := 'NREC=' + VarToStr(PlanMarksQuery['CKD']);
    2: Filter := 'CMARK=' + VarToStr(PlanMarksQuery['NREC']);
    end;
  except
  end;
end;

procedure TImportPlanForm.PlansQueryAfterScroll(DataSet: TDataSet);
begin
  if PlanLevel = 1 then
    EditPlansQuery.Locate('PPONREC', DataSet['ID'], []);
end;

procedure TImportPlanForm.PrintRepBtnClick(Sender: TObject);
var
  TempBookmark: TArray<Byte>;
  Wbk: _Workbook;
  Wsh: _Worksheet;
  Rng: ExcelRange;
  Dialog: TMagsoftWaitDialog;
begin
  EditSpPlansQuery.DisableControls;
  TempBookmark := EditSpPlansQuery.Bookmark;
  Dialog := TMagsoftWaitDialog.Create(Self);
  try
    xlApp.Connect;
    Wbk := xlApp.Workbooks.Add('\\server1571\CMKNEW\Reports\ImportPlan\nomen.xlt', LOCALE_USER_DEFAULT);
    Wsh := Wbk.Worksheets.Item['план'] as _Worksheet;
    Rng := Wsh.Range['A9', 'X9'];
    Dialog.CreateWait('Формирование отчёта', EditSpPlansQuery.RecordCount);
    EditSpPlansQuery.First;
    while not EditSpPlansQuery.Eof do begin
      Rng.Cells.Item[1, 1] := VarToStr(EditSpPlansQuery['ARTICLE']);
      Rng.Cells.Item[1, 3] := VarToStr(EditSpPlansQuery['CONTRACTOR_S']);
      if not VarIsNull(EditSpPlansQuery['ORDERNUM2']) then
        Rng.Cells.Item[1, 4] := Integer(EditSpPlansQuery['ORDERNUM2']);
      if not VarIsNull(EditSpPlansQuery['ORDERNUM']) then
        Rng.Cells.Item[1, 5] := Integer(EditSpPlansQuery['ORDERNUM']);
      if not VarIsNull(EditSpPlansQuery['ORDN']) then
        Rng.Cells.Item[1, 6] := Integer(EditSpPlansQuery['ORDN']);
      Rng.Cells.Item[1, 7] := VarToStr(EditSpPlansQuery['DRAWING']);
      Rng.Cells.Item[1, 8] := VarToStr(EditSpPlansQuery['Title']);
      Rng.Cells.Item[1, 11] := VarToStr(EditSpPlansQuery['MATERIAL']);
      if not VarIsNull(EditSpPlansQuery['KOLSHT']) then
        Rng.Cells.Item[1, 12] := Real(EditSpPlansQuery['KOLSHT']);
      if not VarIsNull(EditSpPlansQuery['WEIGHT1']) then
        Rng.Cells.Item[1, 13] := Real(EditSpPlansQuery['WEIGHT1']);
      if not VarIsNull(EditSpPlansQuery['WEIGHT']) then
        Rng.Cells.Item[1, 14] := Real(EditSpPlansQuery['WEIGHT'] / 1000);
      if not VarIsNull(EditSpPlansQuery['RELDATE']) then
        Rng.Cells.Item[1, 16] := VarToDateTime(EditSpPlansQuery['RELDATE']);
      Rng.Cells.Item[1, 21] := VarToStr(EditSpPlansQuery['PRIM']);
      Rng.Cells.Item[1, 22] := VarToStr(EditSpPlansQuery['RECIPIENT_S']);
      Rng.Cells.Item[1, 23] := VarToDateTime(EditSpPlansQuery['UPDATED']);
      if EditSpPlansQuery['SERVICE'] > 0 then
        Rng.Cells.Item[1, 30] := 'услуга';
      //Rng.Cells.Item[1, 24] := VarToDateTime(EditSpPlansQuery['UPDATED_US']);
      Rng := Rng.Offset[1, 0];
      EditSpPlansQuery.Next;
    end;
  finally
    EditSpPlansQuery.GotoBookmark(TempBookmark);
    EditSpPlansQuery.FreeBookmark(TempBookmark);
    EditSpPlansQuery.EnableControls;
    xlApp.Visible[LOCALE_USER_DEFAULT] := True;
    xlApp.Disconnect;
  end;
end;

procedure AddStringValue(var Result: string; Desc, Value: string; Delim: string = ' ');
begin
  if Trim(Value) <> '' then begin
    if Result <> '' then Result := Result + Delim;
    Result := Result + Desc + Value;
  end;
end;

procedure AddFloatValue(var Result: string; Desc: string; Value: Extended; Delim: string = ' ');
begin
  if Value <> 0 then begin
    if Result <> '' then Result := Result + Delim;
    Result := Result + Desc + FloatToStr(Value);
  end;
end;

procedure AddIntegerValue(var Result: string; Desc: string; Value: Integer; Delim: string = ' ');
begin
  if Value <> 0 then begin
    if Result <> '' then Result := Result + Delim;
    Result := Result + Desc + IntToStr(Value);
  end;
end;

procedure TImportPlanForm.DMarksQueryCalcFields(DataSet: TDataSet);
var
  Result: string;
begin
  Result := '';
  if (Trim(DataSet['T_STROZH_EQ_S']) <> '') or (Trim(DataSet['T_STROZH_PR']) <> '') or (DataSet['T_STROZH_M'] <> 0) or (DataSet['T_STROZH_NV'] <> 0) then begin
    AddStringValue(Result, '', DataSet['T_STROZH_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_STROZH_NV']);
    AddFloatValue(Result, '', DataSet['T_STROZH_NV'] * DataSet['NUMCOUNT'], '/');
    AddFloatValue(Result, 'метраж ', DataSet['T_STROZH_M']);
    AddFloatValue(Result, '', DataSet['T_STROZH_M'] * DataSet['NUMCOUNT'], '/');
    AddStringValue(Result, '', DataSet['T_STROZH_PR']);
    DataSet['STROZH'] := Result;
    Result := '';
  End;
  if (Trim(DataSet['T_OTVERST_EQ_S']) <> '') or (Trim(DataSet['T_OTVERST_PR']) <> '') or (DataSet['T_OTVERST_COUNT'] > 0) or (Trim(DataSet['T_OTVERST_DIAM']) <> '') or (DataSet['T_OTVERST_NV']<>0) then
  Begin
    AddStringValue(Result, '', DataSet['T_OTVERST_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_OTVERST_NV']);
    AddFloatValue(Result, '', DataSet['T_OTVERST_NV'] * DataSet['NUMCOUNT'], '/');
    AddStringValue(Result, 'ᴓ', DataSet['T_OTVERST_DIAM']);
    AddIntegerValue(Result, 'кол-во отв. ', DataSet['T_OTVERST_COUNT']);
    AddIntegerValue(Result, '', DataSet['T_OTVERST_COUNT'] * DataSet['NUMCOUNT'], '/');
    AddStringValue(Result, '', DataSet['T_OTVERST_PR']);
    DataSet['OTVERST'] := Result;
    Result := '';
  End;
  if (Trim(DataSet['T_RAZMET_EQ_S']) <> '') or (Trim(DataSet['T_RAZMET_PR']) <> '') or (DataSet['T_RAZMET_NV'] <> 0) then
  Begin
    AddStringValue(Result, '', DataSet['T_RAZMET_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_RAZMET_NV']);
    AddFloatValue(Result, '', DataSet['T_RAZMET_NV'] * DataSet['NUMCOUNT'], '/');
    AddStringValue(Result, '', DataSet['T_RAZMET_PR'], ', ');
    DataSet['RAZMET'] := Result;
    Result := '';
  End;
  if (Trim(DataSet['T_REZKA_EQ_S']) <> '') or (Trim(DataSet['T_REZKA_PR']) <> '') or (DataSet['T_REZKA_M'] <> 0) or (DataSet['T_REZKA_NV'] <> 0) then
  Begin
    AddStringValue(Result, '', DataSet['T_REZKA_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_REZKA_NV']);
    AddFloatValue(Result, '', DataSet['T_REZKA_NV'] * DataSet['NUMCOUNT'], '/');
    AddFloatValue(Result, 'метраж ', DataSet['T_REZKA_M']);
    AddFloatValue(Result, '', DataSet['T_REZKA_M'] * DataSet['NUMCOUNT'], '/');
    AddStringValue(Result, '', DataSet['T_REZKA_PR'], ', ');
    DataSet['REZKA'] := Result;
    Result := '';
  End;
  if (Trim(DataSet['T_GIBKA_EQ_S']) <> '') or (Trim(DataSet['T_GIBKA_PR']) <> '') or (DataSet['T_GIBKA_NV'] <> 0) then
  Begin
    AddStringValue(Result, '', DataSet['T_GIBKA_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_GIBKA_NV']);
    AddFloatValue(Result, '', DataSet['T_GIBKA_NV'] * DataSet['NUMCOUNT'], '/');
    AddStringValue(Result, '', DataSet['T_GIBKA_PR'], ', ');
    DataSet['GIBKA'] := Result;
    Result := '';
  End;
  if (Trim(DataSet['T_ZACHIST_TYPE_S']) <> '') or (DataSet['T_ZACHIST_NV'] <> 0) then
  Begin
    AddStringValue(Result, '', DataSet['T_ZACHIST_TYPE_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_ZACHIST_NV']);
    AddFloatValue(Result, '', DataSet['T_ZACHIST_NV'] * DataSet['NUMCOUNT'], '/');
    DataSet['ZACHIST'] := Result;
    Result := '';
  End;
  SPGOTADOQuery.Parameters.ParamValues['PCMARK;PNUMP'] := DataSet['CMARK;NUMP'];
  if SPGOTADOQuery.Active then
    SPGOTADOQuery.Requery
  else
    SPGOTADOQuery.Open;
  SPGOTADOQuery.Filter := 'OPERTYPE=1';  // резка
  Result := IntToStr(SPGOTADOQuery.RecordCount) + ' запис(и, ей)';
  case SPGOTADOQuery.RecordCount of
  0: ;
  1: DataSet['TRIMDATE;TRIMMED;PUT;PASSPORT;TRIMDUTY;PERSON'] := SPGOTADOQuery['TRIMDATE;TRIMMED;PUT;PASSPORT;TRIMDUTY;PERSON'];
  else
    DataSet['PASSPORT;PERSON'] := VarArrayOf([Result, Result]);
  end;
  SPGOTADOQuery.Filter := 'OPERTYPE=0'; // разметка
  Result := IntToStr(SPGOTADOQuery.RecordCount) + ' запис(и, ей)';
  case SPGOTADOQuery.RecordCount of
  0: ;
  1: DataSet['RAZMETDATE;RAZMETPERSON;RAZMETKOL'] := SPGOTADOQuery['TRIMDATE;PERSON;KOL'];
  else
    DataSet['RAZMETPERSON'] := Result;
  end;
  SPGOTADOQuery.Filter := 'OPERTYPE=2'; // зачистка
  Result := IntToStr(SPGOTADOQuery.RecordCount) + ' запис(и, ей)';
  case SPGOTADOQuery.RecordCount of
  0: ;
  1: DataSet['ZACHISTDATE;ZACHISTPERSON;ZACHISTKOL'] := SPGOTADOQuery['TRIMDATE;PERSON;KOL'];
  else
    DataSet['ZACHISTPERSON'] := Result;
  end;
  SPGOTADOQuery.Filter := 'OPERTYPE=3'; // строжка
  Result := IntToStr(SPGOTADOQuery.RecordCount) + ' запис(и, ей)';
  case SPGOTADOQuery.RecordCount of
  0: ;
  1: DataSet['STROZHDATE;STROZHPERSON;STROZHKOL'] := SPGOTADOQuery['TRIMDATE;PERSON;KOL'];
  else
    DataSet['STROZHPERSON'] := Result;
  end;
  SPGOTADOQuery.Filter := 'OPERTYPE=4'; // отверстия
  Result := IntToStr(SPGOTADOQuery.RecordCount) + ' запис(и, ей)';
  case SPGOTADOQuery.RecordCount of
  0: ;
  1: DataSet['HOLESDATE;HOLESPERSON;HOLESKOL'] := SPGOTADOQuery['TRIMDATE;PERSON;KOL'];
  else
    DataSet['HOLESPERSON'] := Result;
  end;
  SPGOTADOQuery.Filter := 'OPERTYPE=5'; // гибка
  Result := IntToStr(SPGOTADOQuery.RecordCount) + ' запис(и, ей)';
  case SPGOTADOQuery.RecordCount of
  0: ;
  1: DataSet['STROZHDATE;STROZHPERSON;STROZHKOL'] := SPGOTADOQuery['TRIMDATE;PERSON;KOL'];
  else
    DataSet['STROZHPERSON'] := Result;
  end;
end;

procedure TImportPlanForm.DMarksTabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  DMarksDBGridEh.Columns[0].Visible := NewTab < 2;
  DMarksTotalQuerySetFilter(NewTab);
end;

procedure TImportPlanForm.AccountingSpeedButtonClick(Sender: TObject);
begin
  EditSpPlansDBGridEh.SumList.Active := AccountingToolButton.Down;
end;

procedure TImportPlanForm.PlanMarksDBGridEhDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if Field.DataSet['DMARKSCOUNT'] = 0 then
    PlanMarksDBGridEh.Canvas.Pen.Color:=clMaroon;
  PlanMarksDBGridEh.DefaultDrawDataCell(Rect, Field, State);
end;

procedure TImportPlanForm.PlanMarksQueryAfterScroll(DataSet: TDataSet);
begin
  with PlanMarksTotalQuery do begin
    if Active then
      Locate('ORDN', DataSet['ORDN'], [loCaseInsensitive]);
    AfterScroll := PlanMarksTotalQueryAfterScroll;
    BeforeScroll := PlanMarksTotalQueryBeforeScroll;
  end;
  DMarksTotalQuerySetFilter(DMarksTabSet.TabIndex);
end;

procedure TImportPlanForm.PlanMarksQueryBeforeScroll(DataSet: TDataSet);
begin
  PlanMarksTotalQuery.AfterScroll := nil;
  PlanMarksTotalQuery.BeforeScroll := nil;
end;

procedure TImportPlanForm.PlanMarksQueryCalcFields(DataSet: TDataSet);
var
  Result: string;
begin
  Result := '';
  if (DataSet['T_SBORKA_NV'] <> 0) or (Trim(DataSet['T_SBORKA_PR']) <> '') then begin
    AddFloatValue(Result, 'н/в-', DataSet['T_SBORKA_NV']);
    AddFloatValue(Result, '', DataSet['T_SBORKA_NV'] * DataSet['KOLSHT'], '/');
    AddStringValue(Result, '', DataSet['T_SBORKA_PR']);
    DataSet['SBORKA'] := Result;
    Result := '';
  end;
  if (Trim(DataSet['T_SVARKA_EQ_S']) <> '') or (DataSet['T_SVARKA_NV'] <> 0) or (DataSet['T_SVARKA_M'] <> 0) or (DataSet['T_SVARKA_WE'] <> 0) then begin
    AddStringValue(Result, '', DataSet['T_SVARKA_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_SVARKA_NV']);
    AddFloatValue(Result, '', DataSet['T_SVARKA_NV'] * DataSet['KOLSHT'], '/');
    AddIntegerValue(Result, 'метраж ', DataSet['T_SVARKA_M']);
    AddIntegerValue(Result, '', DataSet['T_SVARKA_M'] * DataSet['KOLSHT'], '/');
    AddFloatValue(Result, 'вес ', DataSet['T_SVARKA_WE']);
    AddFloatValue(Result, '', DataSet['T_SVARKA_WE'] * DataSet['KOLSHT'], '/');
    DataSet['SVARKA'] := Result;
    Result := '';
  end;
  if (Trim(DataSet['T_ZACHIST_EQ_S']) <> '') or (DataSet['T_ZACHIST_NV'] <> 0) then begin
    AddStringValue(Result, '', DataSet['T_ZACHIST_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_ZACHIST_NV']);
    AddFloatValue(Result, '', DataSet['T_ZACHIST_NV'] * DataSet['KOLSHT'], '/');
    DataSet['ZACHIST'] := Result;
    Result := '';
  end;
  if (Trim(DataSet['T_GRPOKR_GR']) <> '') or (Trim(DataSet['T_GRPOKR_POKR']) <> '') or (DataSet['T_GRPOKR_NV'] <> 0) then begin
    AddStringValue(Result, 'грунтование ', DataSet['T_GRPOKR_GR']);
    AddStringValue(Result, 'покраска ', DataSet['T_GRPOKR_POKR']);
    AddFloatValue(Result, 'н/в-', DataSet['T_GRPOKR_NV']);
    AddFloatValue(Result, '', DataSet['T_GRPOKR_NV'] * DataSet['KOLSHT'], '/');
    DataSet['GRPOKR'] := Result;
    Result := '';
  end;
  if (Trim(DataSet['T_DOVODKA_EQ_S']) <> '') or (Trim(DataSet['T_DOVODKA_PR']) <> '') or (DataSet['T_DOVODKA_NV'] <> 0) then begin
    AddStringValue(Result, '', DataSet['T_DOVODKA_EQ_S']);
    AddFloatValue(Result, 'н/в-', DataSet['T_DOVODKA_NV']);
    AddFloatValue(Result, '', DataSet['T_DOVODKA_NV'] * DataSet['KOLSHT'], '/');
    AddStringValue(Result, '', DataSet['T_DOVODKA_PR']);
    DataSet['DOVODKA'] := Result;
    Result := '';
  end;
end;

procedure TImportPlanForm.PlanMarksTotalQueryAfterScroll(DataSet: TDataSet);
begin
  with PlanMarksQuery do begin
    if Active then
      Locate('ORDERNUM;ORDERNUM2;ORDN', DataSet['ORDERNUM;ORDERNUM2;ORDN'], [loCaseInsensitive]);
    AfterScroll := PlanMarksQueryAfterScroll;
    BeforeScroll := PlanMarksQueryBeforeScroll;
  end;
  DMarksTotalQuerySetFilter(DMarksTabSet.TabIndex);
end;

procedure TImportPlanForm.PlanMarksTotalQueryBeforeScroll(DataSet: TDataSet);
begin
  PlanMarksQuery.AfterScroll := nil;
  PlanMarksQuery.BeforeScroll := nil;
end;

procedure TImportPlanForm.GoBack(Sender: TObject);
begin
  if PlanLevel > 1 then PlanLevel := PlanLevel - 1;
end;

procedure TImportPlanForm.AddHeaderBitBtnClick(Sender: TObject);
begin
  EditPlansQuery.Append;
  RunEditHeaderScreen;
end;

procedure TImportPlanForm.AddSpecifBitBtnClick(Sender: TObject);
begin
  EditSpPlansQuery.Append;
  RunEditSpecifScreen;
end;

procedure TImportPlanForm.ADOConnectionWillConnect(Connection: TADOConnection;
  var ConnectionString, UserID, Password: WideString;
  var ConnectOptions: TConnectOption; var EventStatus: TEventStatus);
var
  I: Integer;
begin
  for I := ADOConnection.DataSetCount - 1 downto 0 do
    if Assigned(ADOConnection.DataSets[I]) then
      ADOConnection.DataSets[I].Connection := Host.ADOC;
  EventStatus := esCancel;
end;

procedure TImportPlanForm.AfterPost(DataSet: TDataSet);
var
  Query: TADOQuery absolute DataSet;
begin
  Query.UpdateCursorPos;
  Query.Recordset.Resync(adAffectCurrent, adResyncAllValues);
  Query.Resync([]);
end;

procedure TImportPlanForm.BeforeOpen(DataSet: TDataSet);
var
  ADOQ: TADOQuery absolute DataSet;
begin
  ADOQ.Connection := Host.ADOC;
  ADOQ.BeforeOpen := nil;
end;

procedure TImportPlanForm.Button1Click(Sender: TObject);
begin
  LcaDepQuery.Open;
  SelectContractorsQuery.Open;
  while not SelectContractorsQuery.Eof do begin
    if LcaDepQuery.Locate('title', SelectContractorsQuery['abbr'], []) then begin
      SelectContractorsQuery.Edit;
      SelectContractorsQuery['pponrec'] := LcaDepQuery['id'];
      SelectContractorsQuery.Post;
    end else if LcaDepQuery.Locate('title', SelectContractorsQuery['name'], []) then begin
      SelectContractorsQuery.Edit;
      SelectContractorsQuery['pponrec'] := LcaDepQuery['id'];
      SelectContractorsQuery.Post;
    end;
    SelectContractorsQuery.Next;
  end;
  SelectContractorsQuery.Close;
  LcaDepQuery.Close;
end;

procedure TImportPlanForm.CorrSpPlanBitBtnClick(Sender: TObject);
begin
  ComparisonSpPlanForm := TComparisonSpPlanForm.Create(Application);
  ComparisonSpPlanForm.ShowModal;
  ComparisonSpPlanForm.Free;
end;

procedure TImportPlanForm.DeleteHeaderBitBtnClick(Sender: TObject);
begin
  EditPlansQuery.Delete;
end;

procedure TImportPlanForm.DeleteSpecifBitBtnClick(Sender: TObject);
begin
  EditSpPlansQuery.Delete;
end;

procedure TImportPlanForm.EditButtonClick(Sender: TObject;
  var Handled: Boolean);
begin
  EditSpGotForm := TEditSpGotForm.Create(Self);
  with EditSpGotForm do begin
    OperType := DMarksDBGridEh.Columns[DMarksDBGridEh.Col - 1].Tag;
    ShowModal;
  end;
  EditSpGotForm.Free;
  DMarksTotalQuery.Requery;
end;

procedure TImportPlanForm.EditPlanBitBtnClick(Sender: TObject);
begin
  EditPlansQuery.Edit;
  RunEditHeaderScreen;
end;

procedure TImportPlanForm.EditPlansDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  CheckActions;
end;

procedure TImportPlanForm.EditPlansQueryAfterInsert(DataSet: TDataSet);
begin
  DataSet['PMONTH'] := 0;
  DataSet['PYEAR'] := CurrentYear;
  {if TransitMavericks then
    Null;
  }
end;

procedure TImportPlanForm.EditPlansQueryAfterScroll(DataSet: TDataSet);
begin
  if PlanLevel = 2 then
    PlansQuery.Locate('id', DataSet['pponrec'], []);
end;

procedure TImportPlanForm.EditPlansQueryBeforeDelete(DataSet: TDataSet);
begin
  EditSpPlansQuery.DisableControls;
  EditSpPlansQuery.First;
  while not EditSpPlansQuery.Eof do
    EditSpPlansQuery.Delete;
  EditSpPlansQuery.EnableControls;
end;

procedure TImportPlanForm.EditPlansQueryBeforeInsert(DataSet: TDataSet);
begin
  case MessageDlg('Перенести переходящие заказы в новый план?', mtConfirmation, mbYesNoCancel, -1) of
  mrYes: TransitMavericks := True;
  mrCancel: Abort;
  end;
end;

procedure TImportPlanForm.EditPlansQueryCalcFields(DataSet: TDataSet);
var
  Num: Integer;
begin
  if not VarIsNull(DataSet['PMONTH']) then
    Num := DataSet['PMONTH']
  else
    Num := 0;
  case Num of
  1..12: DataSet['MONTH'] := MonthArray[Num - 1];
  else
    DataSet['MONTH'] := '';
  end;
end;

procedure TImportPlanForm.EditSpecifBitBtnClick(Sender: TObject);
begin
  EditSpPlansQuery.Edit;
  RunEditSpecifScreen;
end;

procedure TImportPlanForm.EditSpPlansDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  CheckActions;
end;

procedure TImportPlanForm.EditSpPlansDBGridEhDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
  Value: Variant;
  Idx: Integer;
  Grid: TDbGridEh absolute Sender;
begin
  Idx := Strings1.IndexOf(Column.FieldName);
  if Idx > -1 then begin
    Value := SpPlansQuery.Lookup('ID', Column.Field.DataSet['PPONREC'], Strings2[Idx]);
    if not VarIsNull(Value) then
      if Column.Field.Value <> Value then
        Grid.Canvas.Brush.Color := clYellow;
  end;
  Grid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TImportPlanForm.EditSpPlansDBGridEhKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  I: Integer;
  Grid: TDBGridEh absolute Sender;
  Bmk: TBookmark;
begin
  case Key of
  Ord('V'), Ord('v'):
    if ssCtrl in Shift then with Grid.DataSource.DataSet do begin
      DisableControls;
      Bmk := Bookmark;
      if Grid.SelectedRows.Count > 0 then
        for I := 0 to Grid.SelectedRows.Count - 1 do begin
          GotoBookmark(Grid.SelectedRows[I]);
          GridPaste(Grid);
        end
      else
        GridPaste(Grid);
      GotoBookmark(Bmk);
      FreeBookmark(Bmk);
      EnableControls;
    end;
  end;
end;

procedure TImportPlanForm.EditSpPlansQueryAfterInsert(DataSet: TDataSet);
begin
  DataSet['CPLANS'] := DataSet.DataSource.DataSet['CPLANS'];
  DataSet['IMPORTED'] := Date;
  DataSet['MAVERICK'] := 0;
  DataSet['DRAWINGEXISTANCE'] := 0;
end;

procedure TImportPlanForm.EditSpPlansQueryAfterScroll(DataSet: TDataSet);
begin
  if PlanLevel = 2 then
    SpPlansQuery.Locate('ID', DataSet['pponrec'], []);
end;

procedure TImportPlanForm.EditSpPlansQueryBeforeEdit(DataSet: TDataSet);
begin
  OldMaverick := DataSet['MAVERICK'];
end;

procedure TImportPlanForm.EditSpPlansQueryCalcFields(DataSet: TDataSet);
begin
  if DataSet['SERVICE'] > 0 then
    DataSet['RES_WEIGHT'] := 0
  else
    DataSet['RES_WEIGHT'] := DataSet['WEIGHT'];
end;

procedure TImportPlanForm.EditSpPlansQueryMAVERICKChange(Sender: TField);
begin
  if Sender.Value = 0 then
    if OldMaverick > 1 then
      case MessageDlg('Удалить переходящую позицию?', mtConfirmation, mbYesNoCancel, -1) of
      mrYes: Sender.DataSet.Delete;
      mrCancel: Sender.Value := OldMaverick;
      end;
  if (OldMaverick = 0) and (Sender.Value = 1) then
    TransitSpPlan;
end;

procedure TImportPlanForm.WeightChange(Sender: TField);
begin
  Sender.DataSet['WEIGHT'] := Sender.DataSet['WEIGHT1'] * Sender.DataSet['KOLSHT'];
end;

procedure TImportPlanForm.EPSumToolButtonClick(Sender: TObject);
begin
  DMarksDBGridEh.SumList.Active := EPSumToolButton.Down;
end;

procedure TImportPlanForm.FillPlanBitBtnClick(Sender: TObject);
begin
  Host.RunPlugin('TEditJobPlugin');
end;

procedure TImportPlanForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ImportPlanForm := nil;
  Strings1.Free;
  Strings2.Free;
  TransitFields.Free;
  if Assigned(EditPlanForm) then try EditPlanForm.Free; EditPlanForm := nil except end;
  if Assigned(EditSpPlanForm) then try EditSpPlanForm.Free; EditSpPlanForm := nil except end;
  if Assigned(CorrSpPlanForm) then try CorrSpPlanForm.Free; CorrSpPlanForm := nil except end;
  if Assigned(ComparisonSpPlanForm) then try ComparisonSpPlanForm.Free; ComparisonSpPlanForm := nil except end;
end;

procedure TImportPlanForm.FormCreate(Sender: TObject);
begin
  Strings1 := TStringList.Create;
  Strings2 := TStringList.Create;
  Strings1.Delimiter := ';';
  Strings2.Delimiter := ';';
  Strings1.DelimitedText := UpperCase(FieldsStr1);
  Strings2.DelimitedText := UpperCase(FieldsStr2);
  TransitFields := TStringList.Create;
  TransitFields.CommaText := EditSpPlansQuery.FieldList.CommaText;
  if TransitFields.IndexOf('NREC') > -1 then
    TransitFields.Delete(TransitFields.IndexOf('NREC'));
  if TransitFields.IndexOf('CPLANS') > -1 then
    TransitFields.Delete(TransitFields.IndexOf('CPLANS'));
  TransitFields.Delimiter := ';';
  ContractorsQuery.Open;
  SelectKDQuery.Open;
  SelectMarksQuery.Open;
  PlansQuery.Open;
  SpPlansQuery.Open;
  EditPlansQuery.Open;
  EditSpPlansQuery.Open;
  PlanMarksQuery.Open;
  PlanMarksTotalQuery.Open;
  DMarksTotalQuery.Open;
  PlanLevel := 2;
end;

procedure TImportPlanForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: if not ((PlanLevel = 2) and (EditPlansDBGrid.EditorMode or EditSpPlansDBGridEh.EditorMode)) then GoBack(Sender);
    VK_F10: GoNext(Sender);
  end;
end;

procedure TImportPlanForm.GoNext(Sender: TObject);
begin
  if PlanLevel < 3 then PlanLevel := PlanLevel + 1;
end;

procedure TImportPlanForm.GridPaste(Grid: TDbGridEh);
begin
  Grid.DataSource.DataSet.Edit;
  Grid.Columns[Grid.Col - 1].Field.Value := Clipboard.AsText;
  Grid.DataSource.DataSet.Post;
end;

procedure TImportPlanForm.CheckActions;
begin
  AddHeaderBitBtn.Enabled := EditPlansQuery.Active;
  AddSpecifBitBtn.Enabled := EditSpPlansQuery.Active;
  EditPlanBitBtn.Enabled := EditPlansQuery.Active and (EditPlansQuery.RecordCount > 0);
  EditSpecifBitBtn.Enabled := EditSpPlansQuery.Active and (EditSpPlansQuery.RecordCount > 0);
  DeleteHeaderBitBtn.Enabled := EditPlansQuery.Active and (EditPlansQuery.RecordCount > 0);
  DeleteSpecifBitBtn.Enabled := EditSpPlansQuery.Active and (EditSpPlansQuery.RecordCount > 0);
end;

procedure TImportPlanForm.RunEditSpecifScreen;
begin
  EditSpPlanForm := TEditSpPlanForm.Create(Application);
  with EditSpPlanForm do
    if ShowModal = mrOk then
      EditSpPlansQuery.Post
    else
      EditSpPlansQuery.Cancel;
  EditSpPlanForm.Free;
  EditSpPlanForm := nil;
end;

procedure TImportPlanForm.RunEditHeaderScreen;
begin
  EditPlanForm := TEditPlanForm.Create(Application);
  with EditPlanForm do
    if ShowModal = mrOk then
    begin
      EditPlansQuery['pmonth'] := MonthComboBox.ItemIndex + 1;
      EditPlansQuery.Post;
    end
    else
      EditPlansQuery.Cancel;
  EditPlanForm.Free;
  EditPlanForm := nil;
end;

procedure TImportPlanForm.TransitSpPlan;
var
  PlansBmk, SpPlansBmk: TBookmark;
  Values: Variant;
  NextPlanDate: TDate;
begin
  DisableEdit;
  PlansBmk := EditPlansQuery.Bookmark;
  SpPlansBmk := EditSpPlansQuery.Bookmark;
  Values := EditSpPlansQuery[TransitFields.DelimitedText];
  NextPlanDate := EncodeDate(EditPlansQuery['PYEAR'], EditPlansQuery['PMONTH'], 1);
  NextPlanDate := IncMonth(NextPlanDate);
  if EditPlansQuery.Locate('PYEAR;PMONTH', VarArrayOf([YearOf(NextPlanDate), MonthOf(NextPlanDate)]), []) then begin
    EditSpPlansQuery.Append;
    EditSpPlansQuery[TransitFields.DelimitedText] := Values;
    EditSpPlansQuery['MAVERICK'] := 2;// переходящий - перенесённый
    EditSpPlansQuery.Post;
  end;
  EditPlansQuery.GotoBookmark(PlansBmk);
  EditPlansQuery.FreeBookmark(PlansBmk);
  EditSpPlansQuery.GotoBookmark(SpPlansBmk);
  EditSpPlansQuery.FreeBookmark(SpPlansBmk);
  EnableEdit;
end;

procedure TImportPlanForm.DisableEdit;
begin
  EditPlansQuery.DisableControls;
  EditSpPlansQuery.DisableControls;
end;

procedure TImportPlanForm.DisableImport;
begin
  PlansQuery.DisableControls;
  SpPlansQuery.DisableControls;
end;

procedure TImportPlanForm.EnableImport;
begin
  PlansQuery.EnableControls;
  SpPlansQuery.EnableControls;
end;

procedure TImportPlanForm.EnableEdit;
begin
  EditPlansQuery.EnableControls;
  EditSpPlansQuery.EnableControls;
end;

procedure TImportPlanForm.ImportSingleSpecif(Source, Target: TDataSet);
begin
  if not Target.Locate('pponrec', Source['id'], []) then
    if not Target.Locate('ORDERNUM;ORDERNUM2;ORDN', Source['num;inum;onum'], [loCaseInsensitive]) then
      Target.Append
    else
      Target.Edit
  else
    Target.Edit;
  if ContractorsQuery.Locate('abbr', Source['CADEP_TITLE'], [loCaseInsensitive]) then
    Target['cContractor;Contractor_S'] := ContractorsQuery['nrec;abbr'];
  if ContractorsQuery.Locate('abbr', Source['PRODUCER_TITLE'], [loCaseInsensitive]) then
    Target['cRecipient;Recipient_S'] := ContractorsQuery['nrec;abbr'];
  if SelectMarksQuery.Locate('OrderNum;OrderNum2;OrdN', Source['num;inum;onum'], [loCaseInsensitive]) then
    Target['cMark;Mark_S'] := SelectMarksQuery['nrec;name'];
  Target['State'] := 0;
  Target['Drawing;Graph;Queue;RelDate;Prim;OrderNum;OrderNum2;OrdN;KolSht;Weight1;pponrec;Updated;Title;Article;Material;Service'] := Source['Drawing;Graph;QNUM;RelDate;Note;num;inum;onum;num_of;weight;id;Updated;Title;Article_Title;Material_Title;Service'];
  Target.Post;
end;

procedure TImportPlanForm.ImportBitBtnClick(Sender: TObject);
var
  I: Integer;
  TempBookmark, TempSpBookmark: TBookmark;
  Dialog: TMagsoftWaitDialog;
begin
  DisableImport;
  DisableEdit;
  Dialog := TMagsoftWaitDialog.Create(Self);
  with PlansDBGrid.SelectedRows do begin
    TempBookmark := PlansQuery.GetBookmark;
    TempSpBookmark := SpPlansQuery.GetBookmark;
    for I := 0 to Count - 1  do begin
      PlansQuery.Bookmark := Items[I];
      if not EditPlansQuery.Locate('pyear;pmonth', PlansQuery['year;month_num'], []) then begin
        EditPlansQuery.Append;
        EditPlansQuery['pyear;pmonth;pponrec'] := PlansQuery['year;month_num;id'];
        EditPlansQuery['ORAUSER'] := CurrentUser.NREC;
        EditPlansQuery.Post;
      end;
      Dialog.CreateWait('Импортирование плана на ' + VarToStr(EditPlansQuery['month']) + ' ' + VarToStr(EditPlansQuery['pyear']), SpPlansQuery.RecordCount);
      SpPlansQuery.First;
      while not SpPlansQuery.Eof and not Dialog.Canceled do begin
        ImportSingleSpecif(SpPlansQuery, EditSpPlansQuery);
        SpPlansQuery.Next;
        Dialog.Value := Dialog.Value + 1;
        Dialog.Update(Dialog.Value);
      end;
      Dialog.KillWait;
    end;
  end;
  Dialog.Free;
  PlansQuery.GotoBookmark(TempBookmark);
  PlansQuery.FreeBookmark(TempBookmark);
  SpPlansQuery.GotoBookmark(TempSpBookmark);
  SpPlansQuery.FreeBookmark(TempSpBookmark);
  EnableImport;
  EnableEdit;
  ShowMessage('Импорт завершён!');
end;

procedure TImportPlanForm.ImportIntoKDBitBtnClick(Sender: TObject);
begin
  if not SelectKDQuery.Locate('OrderNum;OrderNum2', EditSpPlansQuery['OrderNum;OrderNum2'], [loCaseInsensitive]) then begin
    SelectKDQuery.Append;
    SelectKDQuery['OrderNum;OrderNum2;ActDate;LUpdDate;cContractor;Contractor_S'] :=
      EditSpPlansQuery['OrderNum;OrderNum2;RelDate;Updated;cContractor;Contractor_S'];
    SelectKDQuery.Post;
  end;
  if not SelectMarksQuery.Locate('OrdN', EditSpPlansQuery['OrdN'], [loCaseInsensitive]) then begin
    SelectMarksQuery.Append;
    SelectMarksQuery['OrdN;Name;Prim;Recipient_S;Weight1;WeightZ;Drawing'] :=
    EditSpPlansQuery['OrdN;Title;Prim;Recipient_S;Weight1;Weight;Drawing'];
    SelectMarksQuery.Post;
  end;
  ShowMessage('Импорт завершён!');
end;

procedure TImportPlanForm.ImportSpecifBitBtnClick(Sender: TObject);
var
  I: Integer;
  TempSpBookmark: TBookmark;
  Dialog: TMagsoftWaitDialog;
begin
  SpPlansQuery.DisableControls;
  EditSpPlansQuery.DisableControls;
  Dialog := TMagsoftWaitDialog.Create(Self);
  Dialog.CreateWait('Импортирование плана на ' + VarToStr(EditPlansQuery['month']) + ' ' + VarToStr(EditPlansQuery['pyear']), SpPlansQuery.RecordCount);
  with SpPlansDBGrid.SelectedRows do begin
    TempSpBookmark := SpPlansQuery.GetBookmark;
    for I := 0 to Count - 1  do begin
      if Dialog.Canceled then
        Break;
      SpPlansQuery.Bookmark := Items[I];
      ImportSingleSpecif(SpPlansQuery, EditSpPlansQuery);
      Dialog.Value := Dialog.Value + 1;
      Dialog.Update(Dialog.Value);
    end;
    Dialog.KillWait;
  end;
  Dialog.Free;
  SpPlansQuery.GotoBookmark(TempSpBookmark);
  SpPlansQuery.FreeBookmark(TempSpBookmark);
  SpPlansQuery.EnableControls;
  EditSpPlansQuery.EnableControls;
end;

procedure TImportPlanForm.LevelDockTabSetChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
begin
  PlanLevel := NewTab + 1;
  Caption := LevelDockTabSet.Tabs[NewTab];
end;

end.
