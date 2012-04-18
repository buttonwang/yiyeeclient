object frmCaseRecord: TfrmCaseRecord
  Left = 0
  Top = 0
  Caption = #20010#20154#30149#24535#24405#20837
  ClientHeight = 429
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 266
    Width = 508
    Height = 163
    Align = alBottom
    Caption = #36215#23621#24773#20917
    TabOrder = 0
    ExplicitTop = 215
    ExplicitWidth = 756
    object lblRecord: TLabel
      Left = 43
      Top = 118
      Width = 36
      Height = 13
      Caption = #22791#27880#65306
    end
    object lblTreatment: TLabel
      Left = 43
      Top = 29
      Width = 33
      Height = 13
      Caption = #39278#39135#65306
    end
    object lbl1: TLabel
      Left = 284
      Top = 32
      Width = 36
      Height = 13
      Caption = #30561#30496#65306
    end
    object lbl2: TLabel
      Left = 43
      Top = 56
      Width = 33
      Height = 13
      Caption = #22823#20415#65306
    end
    object lbl3: TLabel
      Left = 284
      Top = 59
      Width = 36
      Height = 13
      Caption = #23567#20415#65306
    end
    object lbl4: TLabel
      Left = 20
      Top = 78
      Width = 57
      Height = 13
      Caption = #31934#31070#20307#21147#65306
    end
    object mmoTreatment: TMemo
      Left = 85
      Top = 105
      Width = 428
      Height = 41
      TabOrder = 0
    end
    object cbb1: TComboBox
      Left = 86
      Top = 24
      Width = 168
      Height = 21
      TabOrder = 1
      Items.Strings = (
        '1 '#27491#24120
        '2 '#19981#24819#21507#39277
        '3 '#39278#39135#37327#23569
        '4 '#26377#39269#39295#24863
        '5 '#21916#28909#39135
        '6 '#21916#20919#39278
        '7 '#20854#23427#19981#36866)
    end
    object cbb2: TComboBox
      Left = 327
      Top = 27
      Width = 171
      Height = 21
      TabOrder = 2
      Items.Strings = (
        '1 '#27491#24120
        '2 '#19981#24819#21507#39277
        '3 '#39278#39135#37327#23569
        '4 '#26377#39269#39295#24863
        '5 '#21916#28909#39135
        '6 '#21916#20919#39278
        '7 '#20854#23427#19981#36866)
    end
    object cbb3: TComboBox
      Left = 86
      Top = 51
      Width = 168
      Height = 21
      TabOrder = 3
      Items.Strings = (
        '1 '#27491#24120
        '2 '#19981#24819#21507#39277
        '3 '#39278#39135#37327#23569
        '4 '#26377#39269#39295#24863
        '5 '#21916#28909#39135
        '6 '#21916#20919#39278
        '7 '#20854#23427#19981#36866)
    end
    object cbb4: TComboBox
      Left = 327
      Top = 54
      Width = 171
      Height = 21
      TabOrder = 4
      Items.Strings = (
        '1 '#27491#24120
        '2 '#19981#24819#21507#39277
        '3 '#39278#39135#37327#23569
        '4 '#26377#39269#39295#24863
        '5 '#21916#28909#39135
        '6 '#21916#20919#39278
        '7 '#20854#23427#19981#36866)
    end
    object cbb5: TComboBox
      Left = 86
      Top = 78
      Width = 168
      Height = 21
      TabOrder = 5
      Items.Strings = (
        '1 '#27491#24120
        '2 '#19981#24819#21507#39277
        '3 '#39278#39135#37327#23569
        '4 '#26377#39269#39295#24863
        '5 '#21916#28909#39135
        '6 '#21916#20919#39278
        '7 '#20854#23427#19981#36866)
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 40
    Width = 508
    Height = 106
    Align = alClient
    TabOrder = 1
    ExplicitTop = 29
    ExplicitHeight = 92
    object lblHospital: TLabel
      Left = 20
      Top = 13
      Width = 60
      Height = 13
      Caption = #20027#30151#25551#36848#65306
    end
    object lblSeeTime: TLabel
      Left = 42
      Top = 69
      Width = 36
      Height = 13
      Caption = #26102#38388#65306
    end
    object dtpInDocTime: TDateTimePicker
      Left = 84
      Top = 69
      Width = 168
      Height = 19
      Date = 40945.932047824080000000
      Time = 40945.932047824080000000
      TabOrder = 0
    end
    object mmo1: TMemo
      Left = 86
      Top = 10
      Width = 407
      Height = 47
      TabOrder = 1
    end
  end
  object grp2: TGroupBox
    Left = 0
    Top = 146
    Width = 508
    Height = 120
    Align = alBottom
    Caption = #30151#29366
    TabOrder = 2
    ExplicitTop = 288
    ExplicitWidth = 756
    object lbl5: TLabel
      Left = 40
      Top = 18
      Width = 36
      Height = 13
      Caption = #30151#29366#65306
    end
    object lbl6: TLabel
      Left = 283
      Top = 18
      Width = 36
      Height = 13
      Caption = #31243#24230#65306
    end
    object lbl7: TLabel
      Left = 40
      Top = 50
      Width = 36
      Height = 13
      Caption = #30151#29366#65306
    end
    object lbl8: TLabel
      Left = 284
      Top = 50
      Width = 36
      Height = 13
      Caption = #31243#24230#65306
    end
    object lbl9: TLabel
      Left = 40
      Top = 88
      Width = 36
      Height = 13
      Caption = #30151#29366#65306
    end
    object lbl10: TLabel
      Left = 285
      Top = 88
      Width = 36
      Height = 13
      Caption = #31243#24230#65306
    end
    object cbb7: TComboBox
      Left = 326
      Top = 14
      Width = 168
      Height = 21
      TabOrder = 0
      Items.Strings = (
        '-'
        #177
        '+'
        '++'
        '+++'
        '++++')
    end
    object edt1: TEdit
      Left = 83
      Top = 14
      Width = 171
      Height = 21
      TabOrder = 1
    end
    object edt2: TEdit
      Left = 83
      Top = 49
      Width = 171
      Height = 21
      TabOrder = 2
    end
    object cbb6: TComboBox
      Left = 325
      Top = 46
      Width = 168
      Height = 21
      TabOrder = 3
      Items.Strings = (
        '-'
        #177
        '+'
        '++'
        '+++'
        '++++')
    end
    object cbb8: TComboBox
      Left = 328
      Top = 84
      Width = 168
      Height = 21
      TabOrder = 4
      Items.Strings = (
        '-'
        #177
        '+'
        '++'
        '+++'
        '++++')
    end
    object edt3: TEdit
      Left = 84
      Top = 84
      Width = 171
      Height = 21
      TabOrder = 5
    end
  end
  object ctrlbr1: TControlBar
    Left = 0
    Top = 0
    Width = 508
    Height = 40
    Align = alTop
    TabOrder = 3
    object pnl2: TPanel
      Left = 18
      Top = 2
      Width = 483
      Height = 48
      BevelOuter = bvNone
      TabOrder = 0
      object btn2: TButton
        Left = 208
        Top = 5
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
      end
      object btn4: TButton
        Left = 400
        Top = 5
        Width = 75
        Height = 25
        Caption = #20851#38381
        TabOrder = 1
        OnClick = btn4Click
      end
    end
  end
  object btn1: TButton
    Left = 134
    Top = 8
    Width = 75
    Height = 25
    Caption = #20307#24449#24405#20837
    TabOrder = 4
  end
  object btn3: TButton
    Left = 40
    Top = 8
    Width = 75
    Height = 25
    Caption = #22686#21152#30151#29366
    TabOrder = 5
  end
end
