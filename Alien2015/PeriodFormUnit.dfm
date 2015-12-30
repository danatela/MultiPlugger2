object PeriodForm: TPeriodForm
  Left = 192
  Top = 127
  BorderStyle = bsDialog
  Caption = #1055#1077#1088#1080#1086#1076
  ClientHeight = 123
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 70
    Width = 272
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      272
      50)
    object BitBtn2: TBitBtn
      Left = 144
      Top = 8
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
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
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 272
    Height = 61
    Align = alClient
    Caption = #1047#1072#1076#1072#1081#1090#1077' '#1087#1077#1088#1080#1086#1076':'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 9
      Height = 13
      Alignment = taRightJustify
      Caption = #1089':'
    end
    object Label2: TLabel
      Left = 138
      Top = 24
      Width = 15
      Height = 13
      Alignment = taRightJustify
      Caption = #1087#1086':'
    end
    object date1: TJvDateEdit
      Left = 32
      Top = 22
      Width = 89
      Height = 21
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 0
    end
    object date2: TJvDateEdit
      Left = 160
      Top = 22
      Width = 89
      Height = 21
      Weekends = [Sun, Sat]
      YearDigits = dyFour
      TabOrder = 1
    end
  end
end
