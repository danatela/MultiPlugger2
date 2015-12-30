object MagsoftUniSelector2Form: TMagsoftUniSelector2Form
  Left = 401
  Top = 358
  BorderStyle = bsDialog
  ClientHeight = 107
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 66
    Width = 472
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 18
      Top = 6
      Width = 97
      Height = 25
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 360
      Top = 6
      Width = 97
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object GroupBox: TGroupBox
    Left = 0
    Top = 0
    Width = 472
    Height = 66
    Align = alClient
    TabOrder = 1
    DesignSize = (
      472
      66)
    object f_ComboBox: TComboBox
      Left = 18
      Top = 24
      Width = 439
      Height = 21
      AutoDropDown = True
      Anchors = [akLeft, akTop, akRight]
      DropDownCount = 16
      TabOrder = 0
    end
  end
end
