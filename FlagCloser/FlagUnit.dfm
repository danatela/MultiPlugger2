object FlagForm: TFlagForm
  Left = 407
  Top = 371
  BorderStyle = bsNone
  Caption = 'FlagForm'
  ClientHeight = 216
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = FormClick
  OnShow = FormShow
  DesignSize = (
    397
    216)
  PixelsPerInch = 96
  TextHeight = 13
  object AttentionLabel: TLabel
    Left = 8
    Top = 8
    Width = 389
    Height = 13
    Caption = 
      #1042#1085#1080#1084#1072#1085#1080#1077': '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1077' '#1062#1052#1050'-'#1089#1080#1089#1090#1077#1084#1072' '#1073#1099#1083#1086' '#1079#1072#1082#1088#1099#1090#1086' '#1087#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1087#1088#1080#1095#1080 +
      #1085#1077':'
    OnClick = FormClick
  end
  object ReasonMemo: TMemo
    Left = 8
    Top = 27
    Width = 381
    Height = 181
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderStyle = bsNone
    Color = clBtnFace
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    OnClick = FormClick
  end
  object FlagTimer: TTimer
    OnTimer = FlagTimerTimer
    Left = 8
    Top = 176
  end
end
