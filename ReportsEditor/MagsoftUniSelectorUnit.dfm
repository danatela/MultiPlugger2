object MagsoftUniSelectorForm: TMagsoftUniSelectorForm
  Left = 401
  Top = 358
  BorderStyle = bsDialog
  ClientHeight = 175
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 134
    Width = 264
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
      Left = 152
      Top = 6
      Width = 97
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 264
    Height = 134
    Align = alClient
    TabOrder = 1
  end
end
