object SplashForm: TSplashForm
  Left = 207
  Top = 142
  BorderStyle = bsNone
  Caption = 'SplashForm'
  ClientHeight = 217
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LoadingLabel: TLabel
    Left = 0
    Top = 187
    Width = 326
    Height = 13
    Align = alBottom
    Caption = 'Loading: '
    ExplicitLeft = 8
    ExplicitTop = 181
    ExplicitWidth = 44
  end
  object PaintBox: TPaintBox
    Left = 0
    Top = 0
    Width = 326
    Height = 187
    Align = alClient
    ExplicitTop = 24
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object ProgressBar: TProgressBar
    Left = 0
    Top = 200
    Width = 326
    Height = 17
    Align = alBottom
    Smooth = True
    TabOrder = 0
  end
end
