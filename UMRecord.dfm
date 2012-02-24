object frmMedicalEecord: TfrmMedicalEecord
  Left = 0
  Top = 0
  Caption = #30149#21382#24405#20837
  ClientHeight = 567
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 674
    Height = 159
    Align = alTop
    Caption = #30149#21382#22522#26412#20449#24687
    TabOrder = 0
    object lbl1: TLabel
      Left = 156
      Top = 25
      Width = 60
      Height = 13
      Caption = #23601#35786#21307#38498#65306
    end
    object lbl2: TLabel
      Left = 380
      Top = 25
      Width = 60
      Height = 13
      Caption = #23601#35786#26102#38388#65306
    end
    object lbl3: TLabel
      Left = 156
      Top = 75
      Width = 60
      Height = 13
      Caption = #35786#26029#32467#26524#65306
    end
    object lbl4: TLabel
      Left = 156
      Top = 52
      Width = 60
      Height = 13
      Caption = #27835#30103#26041#27861#65306
    end
    object rg1: TRadioGroup
      Left = 29
      Top = 16
      Width = 107
      Height = 131
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        #38376#35786#30149#21382
        #20303#38498#30149#21382
        #20307#26816#30149#21382
        #20854#20182#30149#21382)
      TabOrder = 0
    end
    object mmo1: TMemo
      Left = 222
      Top = 75
      Width = 411
      Height = 41
      Lines.Strings = (
        #35831#22635#20889#21307#29983#32473#30340#35786#26029#32467#26524)
      TabOrder = 5
    end
    object edtHospital: TEdit
      Left = 222
      Top = 21
      Width = 139
      Height = 21
      TabOrder = 1
    end
    object dtpInDocTime: TDateTimePicker
      Left = 438
      Top = 22
      Width = 195
      Height = 19
      Date = 40945.932047824080000000
      Time = 40945.932047824080000000
      TabOrder = 2
    end
    object btn1: TButton
      Left = 456
      Top = 122
      Width = 81
      Height = 30
      Caption = #20445#23384
      TabOrder = 4
    end
    object btn2: TButton
      Left = 552
      Top = 122
      Width = 81
      Height = 30
      Caption = #36864#20986
      TabOrder = 6
      OnClick = btn2Click
    end
    object edt111: TEdit
      Left = 222
      Top = 48
      Width = 411
      Height = 21
      TabOrder = 3
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 159
    Width = 674
    Height = 408
    ActivePage = ts1
    Align = alClient
    TabOrder = 1
    object ts1: TTabSheet
      Caption = #26816#26597#39033#30446
      object vlsExam: TValueListEditor
        Left = 0
        Top = 0
        Width = 666
        Height = 380
        Align = alClient
        DropDownRows = 10
        TabOrder = 0
        TitleCaptions.Strings = (
          #39033#30446
          #26816#26597#32467#26524'   ('#35831#22635#20837#26412#27425#26816#26597#30340#32467#26524')')
        ColWidths = (
          113
          547)
      end
    end
    object ts2: TTabSheet
      Caption = #26816#39564#39033#30446
      ImageIndex = 1
      object tv1: TTreeView
        Left = 0
        Top = 0
        Width = 159
        Height = 380
        Align = alLeft
        Indent = 19
        TabOrder = 0
        Items.NodeData = {
          0306000000240000000000000000000000FFFFFFFFFFFFFFFF00000000000000
          0004000000010340881F751653280000000000000000000000FFFFFFFFFFFFFF
          FF0000000000000000070000000105BF8024760768D75F697226000000000000
          0000000000FFFFFFFFFFFFFFFF00000000000000000000000001043B60C680A2
          7E207D280000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
          0000000105F495A563C680A27E207D280000000000000000000000FFFFFFFFFF
          FFFFFF0000000000000000000000000105F476A563C680A27E207D2400000000
          00000000000000FFFFFFFFFFFFFFFF00000000000000000000000001033F5C20
          7D2E6C2A0000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
          00000001068C80509128004088056E2900220000000000000000000000FFFFFF
          FFFFFFFFFF00000000000000000000000001028C807891220000000000000000
          000000FFFFFFFFFFFFFFFF00000000000000000000000001023F5C7891320000
          000000000000000000FFFFFFFFFFFFFFFF000000000000000002000000010A40
          88056E3575E389288DCA53AE5FCF914351207D280000000000000000000000FF
          FFFFFFFFFFFFFF0000000000000000000000000105A09408FF4E00610009FF26
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
          04BE9408FF4B0009FF280000000000000000000000FFFFFFFFFFFFFFFF000000
          00000000000000000001054088056E7691C068E5673000000000000000000000
          00FFFFFFFFFFFFFFFF00000000000000000000000001094088028101304088D6
          7C0130CB867D76288D240000000000000000000000FFFFFFFFFFFFFFFF000000
          00000000000000000001034088385EC489240000000000000000000000FFFFFF
          FFFFFFFFFF00000000000000000000000001033F5C385EC48924000000000000
          0000000000FFFFFFFFFFFFFFFF0000000000000000000000000103BF4F385EC4
          89280000000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000
          000105BF8024760768D75F6972220000000000000000000000FFFFFFFFFFFFFF
          FF00000000000000000000000001027651835B}
      end
      object pnl1: TPanel
        Left = 159
        Top = 0
        Width = 507
        Height = 380
        Align = alClient
        TabOrder = 1
        object grp2: TGroupBox
          Left = 1
          Top = 290
          Width = 505
          Height = 89
          Align = alBottom
          Caption = #22791#27880#35828#26126
          TabOrder = 0
          object mmo2: TMemo
            Left = 5
            Top = 13
            Width = 476
            Height = 65
            Lines.Strings = (
              #27491#24120#24773#20917#65306' (5.1-17.1)umol/L '
              #22686#39640#65306' '#24613#12289#24930#24615#32925#28814#65292#26775#38459#24615#40644#30136#65292#34880#33394#32032#27785#30528#30151#65292#32925#30284#65292#32966
              #32467#30707#65292#32966#31649#28814#65292#32925#30828#21270#65292#28342#34880#24615#30142#30149)
            ReadOnly = True
            TabOrder = 0
          end
        end
        object vlsLis: TValueListEditor
          Left = 1
          Top = 36
          Width = 505
          Height = 254
          Align = alClient
          TabOrder = 1
          TitleCaptions.Strings = (
            #39033#30446
            #26816#39564#32467#26524'     ('#35831#22635#20837#26412#27425#26816#39564#30340#32467#26524')')
          ColWidths = (
            75
            424)
        end
        object pnl2: TPanel
          Left = 1
          Top = 1
          Width = 505
          Height = 35
          Align = alTop
          TabOrder = 2
          object btnAppend: TBitBtn
            Left = 5
            Top = 5
            Width = 58
            Height = 24
            Caption = #22686#21152
            TabOrder = 0
          end
        end
      end
    end
  end
end
