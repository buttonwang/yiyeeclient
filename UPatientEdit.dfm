object frmPatientEdit: TfrmPatientEdit
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #20010#20154#20449#24687#20462#25913
  ClientHeight = 186
  ClientWidth = 591
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
  object img1: TImage
    Left = 0
    Top = 0
    Width = 145
    Height = 186
    Align = alLeft
    ExplicitHeight = 171
  end
  object pnl1: TPanel
    Left = 145
    Top = 0
    Width = 446
    Height = 186
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 29
      Top = 21
      Width = 36
      Height = 13
      Caption = #22995#21517#65306
    end
    object lbl2: TLabel
      Left = 157
      Top = 21
      Width = 36
      Height = 13
      Caption = #24615#21035#65306
    end
    object lbl3: TLabel
      Left = 274
      Top = 21
      Width = 36
      Height = 13
      Caption = #24180#40836#65306
    end
    object lbl5: TLabel
      Left = 29
      Top = 85
      Width = 36
      Height = 13
      Caption = #30149#21490#65306
    end
    object lbl4: TLabel
      Left = 29
      Top = 57
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object lbl7: TLabel
      Left = 157
      Top = 57
      Width = 36
      Height = 13
      Caption = #25163#26426#65306
    end
    object lbl9: TLabel
      Left = 274
      Top = 57
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#31665#65306
    end
    object lbl11: TLabel
      Left = 29
      Top = 111
      Width = 36
      Height = 13
      Caption = #20303#22336#65306
    end
    object btnSave: TButton
      Left = 248
      Top = 146
      Width = 75
      Height = 25
      Caption = #20445#23384
      TabOrder = 8
      OnClick = btnSaveClick
    end
    object btnClose: TButton
      Left = 344
      Top = 146
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 9
      OnClick = btnCloseClick
    end
    object cbbSex: TComboBox
      Left = 188
      Top = 17
      Width = 69
      Height = 21
      ItemIndex = 0
      TabOrder = 1
      Text = #30007
      Items.Strings = (
        #30007
        #22899)
    end
    object dtpBirthday: TDateTimePicker
      Left = 316
      Top = 17
      Width = 109
      Height = 21
      Date = 40945.020375405090000000
      Time = 40945.020375405090000000
      TabOrder = 2
    end
    object edtTel: TEdit
      Left = 63
      Top = 53
      Width = 80
      Height = 21
      TabOrder = 3
    end
    object edtMobile: TEdit
      Left = 188
      Top = 53
      Width = 80
      Height = 21
      TabOrder = 4
    end
    object edtEmail: TEdit
      Left = 340
      Top = 53
      Width = 85
      Height = 21
      TabOrder = 5
    end
    object edtPD: TEdit
      Left = 63
      Top = 81
      Width = 362
      Height = 21
      TabOrder = 6
    end
    object edtAddress: TEdit
      Left = 63
      Top = 107
      Width = 362
      Height = 21
      TabOrder = 7
    end
    object edtName: TEdit
      Left = 63
      Top = 17
      Width = 80
      Height = 21
      TabOrder = 0
    end
  end
end