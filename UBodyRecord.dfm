object frmBodyRecord: TfrmBodyRecord
  Left = 0
  Top = 0
  Caption = #20307#24449#24405#20837
  ClientHeight = 538
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 40
    Width = 400
    Height = 498
    Align = alClient
    TabOrder = 0
    object lblHospital: TLabel
      Left = 32
      Top = 34
      Width = 56
      Height = 13
      Caption = #20307#28201'('#8451')'#65306
    end
    object lblSeeTime: TLabel
      Left = 32
      Top = 68
      Width = 60
      Height = 13
      Caption = #27979#23450#26102#38388#65306
    end
    object shp1: TShape
      Left = 26
      Top = 26
      Width = 375
      Height = 2
    end
    object lbl11: TLabel
      Left = 29
      Top = 7
      Width = 64
      Height = 16
      Caption = #20307#28201#24405#20837
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 32
      Top = 124
      Width = 72
      Height = 13
      Caption = #24515#29575'('#27425'/'#20998')'#65306
    end
    object lbl2: TLabel
      Left = 32
      Top = 156
      Width = 60
      Height = 13
      Caption = #27979#23450#26102#38388#65306
    end
    object shp2: TShape
      Left = 26
      Top = 114
      Width = 375
      Height = 2
    end
    object lbl3: TLabel
      Left = 29
      Top = 95
      Width = 64
      Height = 16
      Caption = #33033#25615#24405#20837
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 32
      Top = 223
      Width = 82
      Height = 13
      Caption = #23567#20415#37327'(ml/'#26085')'#65306
    end
    object shp3: TShape
      Left = 26
      Top = 210
      Width = 375
      Height = 2
    end
    object lbl6: TLabel
      Left = 29
      Top = 191
      Width = 64
      Height = 16
      Caption = #20854#20182#20449#24687
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 32
      Top = 250
      Width = 96
      Height = 13
      Caption = #22823#20415#27425#25968'('#27425'/'#26085')'#65306
    end
    object lbl7: TLabel
      Left = 32
      Top = 277
      Width = 82
      Height = 13
      Caption = #39278#20837#37327'(ml/'#26085')'#65306
    end
    object lbl8: TLabel
      Left = 29
      Top = 301
      Width = 83
      Height = 14
      Caption = ' '#34880#21387'(mmHg):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl9: TLabel
      Left = 32
      Top = 326
      Width = 24
      Height = 13
      Caption = #26089#65306
    end
    object lbl10: TLabel
      Left = 74
      Top = 326
      Width = 36
      Height = 13
      Caption = #20302#21387#65306
    end
    object lbl12: TLabel
      Left = 195
      Top = 326
      Width = 36
      Height = 13
      Caption = #39640#21387#65306
    end
    object lbl13: TLabel
      Left = 32
      Top = 353
      Width = 24
      Height = 13
      Caption = #20013#65306
    end
    object lbl14: TLabel
      Left = 75
      Top = 353
      Width = 36
      Height = 13
      Caption = #20302#21387#65306
    end
    object lbl15: TLabel
      Left = 196
      Top = 353
      Width = 36
      Height = 13
      Caption = #39640#21387#65306
    end
    object lbl16: TLabel
      Left = 32
      Top = 380
      Width = 24
      Height = 13
      Caption = #26202#65306
    end
    object lbl17: TLabel
      Left = 74
      Top = 380
      Width = 36
      Height = 13
      Caption = #20302#21387#65306
    end
    object lbl18: TLabel
      Left = 195
      Top = 380
      Width = 36
      Height = 13
      Caption = #39640#21387#65306
    end
    object lbl19: TLabel
      Left = 32
      Top = 407
      Width = 77
      Height = 13
      Caption = #34880#31958'(mmol/L)'#65306
    end
    object lbl20: TLabel
      Left = 32
      Top = 434
      Width = 55
      Height = 13
      Caption = #20307#37325'(kg)'#65306
    end
    object lbl21: TLabel
      Left = 32
      Top = 461
      Width = 60
      Height = 13
      Caption = #27979#23450#26102#38388#65306
    end
    object dtpInDocTime: TDateTimePicker
      Left = 110
      Top = 67
      Width = 159
      Height = 19
      Date = 40945.932047824080000000
      Time = 40945.932047824080000000
      TabOrder = 0
    end
    object edtTemperature: TEdit
      Left = 110
      Top = 33
      Width = 156
      Height = 21
      MaxLength = 5
      TabOrder = 1
      OnKeyPress = edtTemperatureKeyPress
    end
    object dtpHeartTime: TDateTimePicker
      Left = 111
      Top = 155
      Width = 159
      Height = 19
      Date = 40945.932047824080000000
      Time = 40945.932047824080000000
      TabOrder = 2
    end
    object edtHeartBeat: TEdit
      Left = 111
      Top = 121
      Width = 156
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 3
    end
    object edtPee: TEdit
      Left = 127
      Top = 220
      Width = 156
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 4
    end
    object edtShit: TEdit
      Left = 127
      Top = 247
      Width = 156
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 5
    end
    object edtDrink: TEdit
      Left = 127
      Top = 274
      Width = 156
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 6
    end
    object edtBloodLowM: TEdit
      Left = 111
      Top = 322
      Width = 63
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 7
    end
    object edtBloodHighM: TEdit
      Left = 229
      Top = 322
      Width = 70
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 8
    end
    object edtBloodLowA: TEdit
      Left = 111
      Top = 349
      Width = 63
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 9
    end
    object edtBloodHighA: TEdit
      Left = 230
      Top = 349
      Width = 70
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 10
    end
    object edtBloodLowE: TEdit
      Left = 111
      Top = 376
      Width = 63
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 11
    end
    object edtBloodHighE: TEdit
      Left = 229
      Top = 376
      Width = 70
      Height = 21
      MaxLength = 3
      NumbersOnly = True
      TabOrder = 12
    end
    object edtBloodSugar: TEdit
      Left = 111
      Top = 404
      Width = 156
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 13
    end
    object edtWeight: TEdit
      Left = 111
      Top = 431
      Width = 156
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 14
    end
    object dtp2: TDateTimePicker
      Left = 111
      Top = 458
      Width = 159
      Height = 19
      Date = 40945.932047824080000000
      Time = 40945.932047824080000000
      TabOrder = 15
    end
  end
  object ctrlbr1: TControlBar
    Left = 0
    Top = 0
    Width = 400
    Height = 40
    Align = alTop
    TabOrder = 1
    object pnl2: TPanel
      Left = 11
      Top = 2
      Width = 382
      Height = 48
      BevelOuter = bvNone
      TabOrder = 0
      object btn2: TButton
        Left = 55
        Top = 5
        Width = 75
        Height = 25
        Caption = #20445#23384
        TabOrder = 0
        OnClick = btn2Click
      end
      object btn4: TButton
        Left = 272
        Top = 5
        Width = 75
        Height = 25
        Caption = #20851#38381
        TabOrder = 1
        OnClick = btn4Click
      end
    end
  end
end
