object frmCaseRecord: TfrmCaseRecord
  Left = 0
  Top = 0
  Caption = #20010#20154#30149#24535#24405#20837
  ClientHeight = 510
  ClientWidth = 533
  Color = clBtnFace
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
  object grp1: TGroupBox
    Left = 0
    Top = 306
    Width = 533
    Height = 204
    Align = alClient
    Caption = #36215#23621#24773#20917
    TabOrder = 0
    object lblRecord: TLabel
      Left = 43
      Top = 139
      Width = 36
      Height = 13
      Caption = #22791#27880#65306
    end
    object lblTreatment: TLabel
      Left = 43
      Top = 27
      Width = 36
      Height = 13
      Caption = #39278#39135#65306
    end
    object lbl1: TLabel
      Left = 284
      Top = 27
      Width = 36
      Height = 13
      Caption = #30561#30496#65306
    end
    object lbl2: TLabel
      Left = 44
      Top = 61
      Width = 36
      Height = 13
      Caption = #22823#20415#65306
    end
    object lbl3: TLabel
      Left = 284
      Top = 61
      Width = 36
      Height = 13
      Caption = #23567#20415#65306
    end
    object lbl4: TLabel
      Left = 20
      Top = 96
      Width = 60
      Height = 13
      Caption = #31934#31070#20307#21147#65306
    end
    object EdtSpirit: TEdit
      Left = 83
      Top = 93
      Width = 171
      Height = 21
      TabOrder = 10
      Visible = False
      OnExit = EdtSpiritExit
    end
    object EdtDiet: TEdit
      Left = 83
      Top = 24
      Width = 171
      Height = 21
      TabOrder = 6
      Visible = False
      OnExit = EdtDietExit
    end
    object cbbDiet: TComboBox
      Left = 83
      Top = 24
      Width = 171
      Height = 21
      TabOrder = 1
      Text = #27491#24120
      OnEnter = cbbDietEnter
      OnSelect = cbbDietSelect
      Items.Strings = (
        #27491#24120
        #19981#24819#21507#39277
        #39278#39135#37327#23569
        #26377#39269#39295#24863
        #21916#28909#39135
        #21916#20919#39278
        #20854#23427#19981#36866)
    end
    object EdtShit: TEdit
      Left = 83
      Top = 58
      Width = 171
      Height = 21
      TabOrder = 9
      Visible = False
      OnExit = EdtShitExit
    end
    object EdtPee: TEdit
      Left = 326
      Top = 58
      Width = 171
      Height = 21
      TabOrder = 8
      Visible = False
      OnExit = EdtPeeExit
    end
    object EdtSleep: TEdit
      Left = 326
      Top = 25
      Width = 171
      Height = 21
      TabOrder = 7
      Visible = False
      OnExit = EdtSleepExit
    end
    object mmoRemark: TMemo
      Left = 83
      Top = 126
      Width = 415
      Height = 41
      TabOrder = 0
    end
    object cbbSleep: TComboBox
      Left = 326
      Top = 24
      Width = 171
      Height = 21
      TabOrder = 2
      Text = #27491#24120
      OnEnter = cbbDietEnter
      OnSelect = cbbSleepSelect
      Items.Strings = (
        #27491#24120
        #24605#30561#21980#30561
        #30496#24046#22810#26790
        #20837#30561#22256#38590
        #30496#20013#26131#37266
        #37266#21518#30130#20047
        #20854#20182#19981#36866)
    end
    object cbbShit: TComboBox
      Left = 83
      Top = 58
      Width = 171
      Height = 21
      TabOrder = 3
      Text = #27491#24120
      OnEnter = cbbDietEnter
      OnSelect = cbbShitSelect
      Items.Strings = (
        #27491#24120
        #20415#31245#24178
        #20415#31192
        #20415#28303
        #27700#26679#20415
        #20854#23427#19981#36866)
    end
    object cbbPee: TComboBox
      Left = 326
      Top = 58
      Width = 171
      Height = 21
      TabOrder = 4
      Text = #27491#24120
      OnEnter = cbbDietEnter
      OnSelect = cbbPeeSelect
      Items.Strings = (
        #27491#24120
        #23615#23569#33394#40644
        #23567#20415#27425#25968#22686#22810
        #23615#19981#23613#24863
        #20854#23427#19981#36866)
    end
    object cbbSpirit: TComboBox
      Left = 83
      Top = 93
      Width = 171
      Height = 21
      TabOrder = 5
      Text = #27491#24120
      OnEnter = cbbDietEnter
      OnSelect = cbbSpiritSelect
      Items.Strings = (
        #27491#24120
        #31934#21147#26106#30427
        #31070#30130#20047#21147
        #21313#20998#30130#24811
        #20854#20182#19981#36866)
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 40
    Width = 533
    Height = 106
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
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
    object mmoMainDescribe: TMemo
      Left = 86
      Top = 16
      Width = 412
      Height = 47
      TabOrder = 1
    end
  end
  object grp2: TGroupBox
    Left = 0
    Top = 146
    Width = 533
    Height = 160
    Align = alTop
    Caption = #30151#29366
    TabOrder = 2
    object lbl5: TLabel
      Left = 40
      Top = 24
      Width = 36
      Height = 13
      Caption = #30151#29366#65306
    end
    object lbl6: TLabel
      Left = 284
      Top = 24
      Width = 36
      Height = 13
      Caption = #31243#24230#65306
    end
    object lbl7: TLabel
      Left = 40
      Top = 59
      Width = 36
      Height = 13
      Caption = #30151#29366#65306
    end
    object lbl8: TLabel
      Left = 284
      Top = 59
      Width = 36
      Height = 13
      Caption = #31243#24230#65306
    end
    object lbl9: TLabel
      Left = 40
      Top = 94
      Width = 36
      Height = 13
      Caption = #30151#29366#65306
    end
    object lbl10: TLabel
      Left = 285
      Top = 94
      Width = 36
      Height = 13
      Caption = #31243#24230#65306
    end
    object cbb1: TComboBox
      Left = 326
      Top = 20
      Width = 171
      Height = 21
      ItemIndex = 0
      TabOrder = 0
      Text = '-'
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
      Top = 20
      Width = 171
      Height = 21
      TabOrder = 1
    end
    object edt2: TEdit
      Left = 83
      Top = 55
      Width = 171
      Height = 21
      TabOrder = 2
    end
    object cbb2: TComboBox
      Left = 326
      Top = 55
      Width = 171
      Height = 21
      ItemIndex = 0
      TabOrder = 3
      Text = '-'
      Items.Strings = (
        '-'
        #177
        '+'
        '++'
        '+++'
        '++++')
    end
    object cbb3: TComboBox
      Left = 326
      Top = 90
      Width = 171
      Height = 21
      ItemIndex = 0
      TabOrder = 4
      Text = '-'
      Items.Strings = (
        '-'
        #177
        '+'
        '++'
        '+++'
        '++++')
    end
    object edt3: TEdit
      Left = 83
      Top = 90
      Width = 171
      Height = 21
      TabOrder = 5
    end
    object btnAdd: TButton
      Left = 40
      Top = 123
      Width = 75
      Height = 25
      Caption = #22686#21152#30151#29366
      TabOrder = 6
      OnClick = btnAddClick
    end
    object ScrollBar1: TScrollBar
      Left = 514
      Top = 15
      Width = 17
      Height = 143
      Align = alRight
      Kind = sbVertical
      PageSize = 0
      TabOrder = 7
      Visible = False
    end
    object BtnDel: TButton
      Left = 136
      Top = 123
      Width = 75
      Height = 25
      Caption = #21024#38500#30151#29366
      Enabled = False
      TabOrder = 8
      OnClick = BtnDelClick
    end
  end
  object ctrlbr1: TControlBar
    Left = 0
    Top = 0
    Width = 533
    Height = 40
    Align = alTop
    TabOrder = 3
    object pnl2: TPanel
      Left = 11
      Top = 2
      Width = 473
      Height = 48
      BevelOuter = bvNone
      TabOrder = 0
      object btnSave: TButton
        Left = 304
        Top = 5
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
        OnClick = btnSaveClick
      end
      object btn4: TButton
        Left = 392
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
    Left = 20
    Top = 9
    Width = 75
    Height = 25
    Caption = #20307#24449#24405#20837
    TabOrder = 4
    OnClick = btn1Click
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    UseAppManager = True
    Left = 140
    Top = 5
  end
end
