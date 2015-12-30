object SelectPassForm: TSelectPassForm
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1083#1105#1090':'
  ClientHeight = 239
  ClientWidth = 226
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    226
    239)
  PixelsPerInch = 96
  TextHeight = 13
  object OkBitBtn: TBitBtn
    Left = 62
    Top = 206
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    ExplicitTop = 200
  end
  object CancelBitBtn: TBitBtn
    Left = 143
    Top = 208
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    ExplicitTop = 202
  end
  object PassesDBGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 210
    Height = 192
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = PassesDataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = PassesDBGridDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PROL_NAME'
        Title.Caption = #1055#1088#1086#1083#1105#1090
        Visible = True
      end>
  end
  object PassesDataSource: TDataSource
    DataSet = DailyPlanForm.ProletADOQuery
    Left = 96
    Top = 80
  end
end
