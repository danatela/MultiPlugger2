object EditSpPlanForm: TEditSpPlanForm
  Left = 208
  Top = 146
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
  ClientHeight = 553
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    635
    553)
  PixelsPerInch = 96
  TextHeight = 13
  object ContractorLabel: TLabel
    Left = 8
    Top = 37
    Width = 74
    Height = 13
    Caption = #1062#1077#1093'-'#1079#1072#1082#1072#1079#1095#1080#1082':'
    FocusControl = ContractorComboBox
  end
  object RecipientLabel: TLabel
    Left = 217
    Top = 37
    Width = 98
    Height = 13
    Caption = #1062#1077#1093'-'#1080#1079#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100':'
    FocusControl = RecipientComboBox
  end
  object MarkLabel: TLabel
    Left = 425
    Top = 37
    Width = 36
    Height = 13
    Caption = #1052#1072#1088#1082#1072':'
    FocusControl = MarkComboBox
  end
  object OrderNumLabel: TLabel
    Left = 8
    Top = 13
    Width = 78
    Height = 13
    Caption = #8470' '#1079#1072#1082#1072#1079#1072' '#1052#1056#1050':'
    FocusControl = OrderNumEdit
  end
  object OrderNum2Label: TLabel
    Left = 217
    Top = 11
    Width = 80
    Height = 13
    Caption = #8470' '#1079#1072#1082#1072#1079#1072' '#1062#1052#1050':'
    FocusControl = OrderNum2Edit
  end
  object OrdNLabel: TLabel
    Left = 425
    Top = 11
    Width = 84
    Height = 13
    Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#8470':'
    FocusControl = OrdNEdit
  end
  object GraphLabel: TLabel
    Left = 8
    Top = 123
    Width = 63
    Height = 13
    Caption = #8470' '#1075#1088#1072#1092#1080#1082#1072':'
    FocusControl = GraphEdit
  end
  object DrawingLabel: TLabel
    Left = 8
    Top = 96
    Width = 64
    Height = 13
    Caption = #8470' '#1095#1077#1088#1090#1077#1078#1072':'
    FocusControl = DrawingEdit
  end
  object UpdatedLabel: TLabel
    Left = 255
    Top = 192
    Width = 148
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
    FocusControl = UpdatedEditEh
  end
  object RelDateLabel: TLabel
    Left = 255
    Top = 146
    Width = 160
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103':'
    FocusControl = RelDateEditEh
  end
  object PrimLabel: TLabel
    Left = 8
    Top = 256
    Width = 65
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    FocusControl = PrimMemo
  end
  object OrderNumEdit: TDBEdit
    Left = 88
    Top = 10
    Width = 121
    Height = 21
    DataField = 'ORDERNUM'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 0
  end
  object OrderNum2Edit: TDBEdit
    Left = 297
    Top = 8
    Width = 121
    Height = 21
    DataField = 'ORDERNUM2'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 1
  end
  object OrdNEdit: TDBEdit
    Left = 505
    Top = 8
    Width = 121
    Height = 21
    DataField = 'ORDN'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 2
  end
  object WeightGroupBox: TGroupBox
    Left = 8
    Top = 147
    Width = 241
    Height = 106
    Caption = #1042#1077#1089':'
    TabOrder = 3
    object KolShtLabel: TLabel
      Left = 9
      Top = 21
      Width = 64
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      FocusControl = KolShtEdit
    end
    object Weight1Label: TLabel
      Left = 18
      Top = 48
      Width = 55
      Height = 13
      Caption = #1042#1077#1089' '#1086#1076#1085#1086#1081':'
      FocusControl = Weight1Edit
    end
    object WeightLabel: TLabel
      Left = 14
      Top = 75
      Width = 59
      Height = 13
      Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089':'
    end
    object KolShtEdit: TDBEdit
      Left = 79
      Top = 18
      Width = 154
      Height = 21
      DataField = 'KOLSHT'
      DataSource = ImportPlanForm.EditSpPlansDataSource
      TabOrder = 0
      OnKeyPress = CheckCommaCount
    end
    object Weight1Edit: TDBEdit
      Left = 79
      Top = 45
      Width = 154
      Height = 21
      DataField = 'WEIGHT1'
      DataSource = ImportPlanForm.EditSpPlansDataSource
      TabOrder = 1
      OnKeyPress = CheckCommaCount
    end
  end
  object GraphEdit: TDBEdit
    Left = 77
    Top = 120
    Width = 549
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'GRAPH'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 4
  end
  object DrawingEdit: TDBEdit
    Left = 77
    Top = 93
    Width = 549
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DRAWING'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 5
  end
  object PrimMemo: TDBMemo
    Left = 8
    Top = 272
    Width = 618
    Height = 242
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'PRIM'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 6
  end
  object OkBitBtn: TBitBtn
    Left = 552
    Top = 520
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
  end
  object CancelBitBtn: TBitBtn
    Left = 471
    Top = 520
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
  end
  object ContractorComboBox: TDBLookupComboBox
    Left = 8
    Top = 56
    Width = 203
    Height = 21
    DataField = 'CONTRACTOR_S'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 9
    OnKeyDown = ComboBoxKeyDown
  end
  object RecipientComboBox: TDBLookupComboBox
    Left = 217
    Top = 56
    Width = 203
    Height = 21
    DataField = 'RECIPIENT_S'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 10
    OnKeyDown = ComboBoxKeyDown
  end
  object MarkComboBox: TDBLookupComboBox
    Left = 426
    Top = 56
    Width = 203
    Height = 21
    DataField = 'MARK_S'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    TabOrder = 11
    OnKeyDown = ComboBoxKeyDown
  end
  object RelDateEditEh: TDBDateTimeEditEh
    Left = 255
    Top = 165
    Width = 186
    Height = 21
    DataField = 'RELDATE'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 12
    Visible = True
  end
  object UpdatedEditEh: TDBDateTimeEditEh
    Left = 255
    Top = 211
    Width = 186
    Height = 21
    DataField = 'UPDATED'
    DataSource = ImportPlanForm.EditSpPlansDataSource
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 13
    Visible = True
  end
  object WeightEdit: TButtonedEdit
    Left = 87
    Top = 219
    Width = 154
    Height = 21
    Images = ImageList
    NumbersOnly = True
    RightButton.HotImageIndex = 0
    RightButton.ImageIndex = 0
    RightButton.PressedImageIndex = 0
    RightButton.Visible = True
    TabOrder = 14
    Text = 'WeightEdit'
    OnRightButtonClick = CalcWeightSpeedButtonClick
  end
  object ImageList: TImageList
    Left = 16
    Top = 512
    Bitmap = {
      494C010101000500040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000CBBEB900FCB29E00FFDE
      BC00CE8F7600DA8C7300FBAD8C00B87D6600A4746300A08B85008F8685007979
      7900A9A9A900DCDCDC00F8F8F800FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCC0BD00F2AF9C00FFD1
      B200D5A59200FFBE9E00D59A8300BB776100FCB09000D78E7500D6816300B99F
      960092929200D2D2D200F5F5F500FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEBFBC00F7B5A200FFD0
      AF00E8C1AC00E8CDB100D6A28E00FFFFFA00D29C8400EAB5A000E69F8100CBAC
      A0008B8B8B00CECECE00F4F4F400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBBDB700FAB9A800FFDA
      B900C2846D00C37B6500FFE2BB00A0746100FFD8B700E2C2A900E9BFA200CAA9
      9D0089898900CDCDCD00F4F4F400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9B8B200FBBFB000FFD1
      B200DAB09E00FFDFBF00B8837100EBA38900E0A38700C8867200DE957900CDB1
      A40089898900CDCDCD00F4F4F400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5C9C600FCC1B100FFD7
      B500E6C1AA00E3C7AA00F3C0AA00FFFAE100E1B49A00F6C7B000E6B39800CCAE
      A10089898900CDCDCD00F4F4F400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600D3C6C200FFC8B900FFDC
      BC00BC816C00CA826C00FFD4B100A46C5900FFD5B100DBB59600FFD1A000D2B6
      AA0089898900CCCCCC00F3F3F300FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F6F6F600D0BEB900FFCCC100FFDA
      BA00D6AF9F00FFEECD00C6958400FFD2B600EFAC8900296BD1004876B900DDC7
      AD0086868600CBCBCB00F3F3F300FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500C7AFA900FFD4C900FFD7
      B700F0CEB600DCB9A100FCD2B800DCC7B100F7C19B0064AAE90079A2EB00E4BB
      A20083838300C9C9C900F2F2F200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500C9B2AB00FFDAD000FFDF
      C000F1BF9F00E1AE9300EABFA100FFDFC000FFEAC700D4CFC000D6CEC400DAB7
      A40081818100C8C8C800F2F2F200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500CBB2AA00FFE0DA00F6CB
      AE00E89E7900FFBF9000FCB28900E1A28000DDA08100E9AA8900F4BF9B00DAC2
      B4007F7F7F00C6C6C600F2F2F200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F500CCB2AB00FFE6E300F5CD
      AD00EE844F00FF965700FF975C00FF9F6600FFA56D00FFA97300F0996D00D6BA
      AD007F7F7F00C6C6C600F2F2F200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F8F800CBAEA300FFE4E300FFE3
      C400E0A08100E18A6000E2875D00DE7D4F00D87E5600F6844E00DC7E5000D6B5
      A20088888800CBCBCB00F2F2F200FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFCFC00D6B9B000FFFFFF00FFFB
      E000FFFFDE00FFFFE400FFFEE000FFFFE300FFF8DA00F3D1B700FFE0C400EED3
      C000A2A2A200D8D8D800F6F6F600FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00F9F9F900E4D3C500E6D5
      C700E0CABA00E1C8B400E3C8AA00D5B39200EFD6AE00F8E3BA00FFFDCB00D2B3
      9C00D0D0D000ECECEC00FBFBFB00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0080000000000000008000000000000000
      8000000000000000800000000000000080000000000000008000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000}
  end
end
