object SpPassportForm: TSpPassportForm
  Left = 0
  Top = 0
  Caption = #1055#1086#1079#1080#1094#1080#1103' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' '#1087#1072#1089#1087#1086#1088#1090#1072
  ClientHeight = 331
  ClientWidth = 589
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
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 589
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 562
    ExplicitWidth = 880
    DesignSize = (
      589
      46)
    object ImportBtn: TBitBtn
      Left = 256
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
      ExplicitLeft = 547
    end
    object BitBtn1: TBitBtn
      Left = 433
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
      ExplicitLeft = 724
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 589
    Height = 285
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 880
    ExplicitHeight = 97
    DesignSize = (
      589
      285)
    object Label3: TLabel
      Left = 403
      Top = 19
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1079#1072#1076#1072#1085#1080#1103':'
      ExplicitLeft = 694
    end
    object f_NUM: TLabeledEdit
      Left = 96
      Top = 16
      Width = 161
      Height = 21
      EditLabel.Width = 80
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103':'
      LabelPosition = lpLeft
      MaxLength = 16
      TabOrder = 0
    end
    object f_ADATE: TJvDateEdit
      Left = 484
      Top = 16
      Width = 97
      Height = 21
      Anchors = [akTop, akRight]
      ShowNullDate = False
      TabOrder = 1
      ExplicitLeft = 775
    end
  end
end
