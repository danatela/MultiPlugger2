object InclFileForm: TInclFileForm
  Left = 0
  Top = 0
  Caption = #1042#1083#1086#1078#1077#1085#1085#1099#1081' '#1092#1072#1081#1083
  ClientHeight = 363
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 240
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 317
    Width = 632
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      632
      46)
    object ImportBtn: TBitBtn
      Left = 299
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
      Left = 476
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 408
    Top = 0
    Width = 224
    Height = 317
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 16
      Top = 16
      Width = 193
      Height = 25
      Action = SelectFileAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083
      TabOrder = 0
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 56
      Width = 193
      Height = 25
      Action = OpenFileAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      TabOrder = 1
    end
    object BitBtn4: TBitBtn
      Left = 16
      Top = 96
      Width = 193
      Height = 25
      Action = SaveFileAsAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1082#1072#1082'...'
      TabOrder = 2
    end
    object BitBtn5: TBitBtn
      Left = 16
      Top = 136
      Width = 193
      Height = 25
      Action = DeleteFileAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083
      TabOrder = 3
    end
  end
  object PreviewGroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 408
    Height = 317
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object PreviewImage: TImage
      Left = 32
      Top = 16
      Width = 305
      Height = 209
      Proportional = True
      Stretch = True
    end
    object ImageFiles: TImage
      Left = 120
      Top = 176
      Width = 105
      Height = 105
      Proportional = True
      Stretch = True
    end
    object PreviewRichEdit: TRichEdit
      Left = 200
      Top = 72
      Width = 185
      Height = 89
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Lines.Strings = (
        'PreviewRichEdit')
      ParentFont = False
      TabOrder = 0
    end
  end
  object ActionManager1: TActionManager
    Left = 512
    Top = 168
    StyleName = 'Platform Default'
    object SelectFileAction: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083
      OnExecute = SelectFileActionExecute
    end
    object OpenFileAction: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
      OnExecute = OpenFileActionExecute
    end
    object SaveFileAsAction: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1082#1072#1082'...'
      OnExecute = SaveFileAsActionExecute
    end
    object DeleteFileAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083
      OnExecute = DeleteFileActionExecute
    end
  end
  object OpenDialog: TOpenDialog
    Left = 48
    Top = 240
  end
  object SaveDialog: TSaveDialog
    Left = 48
    Top = 184
  end
end
