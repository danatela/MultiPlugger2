object PaspDetailForm: TPaspDetailForm
  Left = 0
  Top = 0
  Caption = #1048#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
  ClientHeight = 220
  ClientWidth = 645
  Color = clBtnFace
  Constraints.MinHeight = 231
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 174
    Width = 645
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      645
      46)
    object ImportBtn: TBitBtn
      Left = 312
      Top = 8
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 489
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 174
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      645
      174)
    object Label3: TLabel
      Left = 19
      Top = 19
      Width = 103
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103':'
      ExplicitLeft = 11
    end
    object f_cdetailLabel: TLabel
      Left = 24
      Top = 60
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = #1044#1077#1090#1072#1083#1100':'
    end
    object Label4: TLabel
      Left = 420
      Top = 94
      Width = 82
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1090#1077#1086#1088'. '#1074#1077#1089' 1 '#1096#1090'.:'
      FocusControl = f_WEIGHT1
    end
    object Label5: TLabel
      Left = 34
      Top = 137
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1074#1077#1089':'
      FocusControl = f_WEIGHT1F
    end
    object Label6: TLabel
      Left = 445
      Top = 137
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1086#1073#1097#1080#1081' '#1074#1077#1089':'
      FocusControl = f_WEIGHT
    end
    object Label1: TLabel
      Left = 225
      Top = 19
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = #1079'-'#1079' '#8470' '#1052#1056#1050':'
    end
    object Label2: TLabel
      Left = 391
      Top = 19
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = #1079'-'#1079' '#8470' '#1062#1052#1050':'
    end
    object Label7: TLabel
      Left = 537
      Top = 19
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = #8470'/'#1087':'
    end
    object f_DATEIZG: TJvDateEdit
      Left = 128
      Top = 16
      Width = 89
      Height = 21
      Anchors = [akTop, akRight]
      ShowNullDate = False
      TabOrder = 0
    end
    object f_CDETAIL: TComboBox
      Left = 72
      Top = 57
      Width = 562
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = f_CDETAILChange
    end
    object f_KOLSHTP: TLabeledEdit
      Left = 131
      Top = 91
      Width = 70
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 114
      EditLabel.Height = 13
      EditLabel.Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1083#1072#1085#1086#1074#1086#1077':'
      LabelPosition = lpLeft
      MaxLength = 9
      TabOrder = 2
    end
    object f_WEIGHT1: TJvCalcEdit
      Left = 508
      Top = 91
      Width = 126
      Height = 21
      DecimalPlaces = 8
      DisplayFormat = '0.########'
      ReadOnly = True
      TabOrder = 4
      DecimalPlacesAlwaysShown = False
    end
    object f_KOLSHTF: TLabeledEdit
      Left = 352
      Top = 91
      Width = 57
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 133
      EditLabel.Height = 13
      EditLabel.Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077':'
      LabelPosition = lpLeft
      MaxLength = 9
      TabOrder = 3
      OnChange = f_KOLSHTFChange
    end
    object f_WEIGHT1F: TJvCalcEdit
      Left = 131
      Top = 134
      Width = 118
      Height = 21
      DecimalPlaces = 8
      DisplayFormat = '0.########'
      TabOrder = 5
      DecimalPlacesAlwaysShown = False
      OnChange = f_KOLSHTFChange
    end
    object f_WEIGHT: TJvCalcEdit
      Left = 508
      Top = 134
      Width = 126
      Height = 21
      DecimalPlaces = 8
      DisplayFormat = '0.########'
      ReadOnly = True
      TabOrder = 6
      DecimalPlacesAlwaysShown = False
    end
    object f_ORDERNUM: TComboBox
      Left = 289
      Top = 16
      Width = 89
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Sorted = True
      TabOrder = 7
      OnChange = OrdChange
      OnExit = f_ORDERNUMChange
    end
    object f_ORDERNUM2: TComboBox
      Left = 457
      Top = 16
      Width = 64
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Sorted = True
      TabOrder = 8
      OnChange = OrdChange
      OnExit = f_ORDERNUMChange
    end
    object f_ORDN: TComboBox
      Left = 570
      Top = 16
      Width = 64
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Sorted = True
      TabOrder = 9
      OnChange = OrdChange
      OnExit = f_ORDERNUMChange
    end
  end
  object detailsADOQ: TADOQuery
    Parameters = <>
    Left = 232
    Top = 8
  end
  object sparrivalsDS: TDataSource
    DataSet = detailsADOQ
    Left = 680
    Top = 24
  end
end
