object frmAbout: TfrmAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #20851#20110#20013#22269#32593#32476#20445#20581#38498
  ClientHeight = 222
  ClientWidth = 329
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
  object lbl1: TLabel
    Left = 24
    Top = 97
    Width = 256
    Height = 13
    Caption = #29256#26435#25152#26377' @2012 '#35199#37096#22825#20351#65288#21271#20140#65289#20581#24247#31185#25216#20013#24515
  end
  object lbl2: TLabel
    Left = 24
    Top = 65
    Width = 192
    Height = 13
    Caption = #27426#36814#20351#29992#20013#22269#32593#32476#20445#20581#38498#23458#25143#31471#24037#20855
  end
  object lbl3: TLabel
    Left = 224
    Top = 64
    Width = 89
    Height = 13
    Caption = #24403#21069#29256#26412#65306'V1.0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltitle: TLabel
    Left = 24
    Top = 16
    Width = 188
    Height = 30
    Caption = #32593#32476#21307#38498' '#21161#25163
    Color = clWhite
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -29
    Font.Name = #26041#27491#33298#20307
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object btnOK: TButton
    Left = 103
    Top = 160
    Width = 89
    Height = 33
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOKClick
  end
  object lnkUrl: TLinkLabel
    Left = 24
    Top = 124
    Width = 109
    Height = 21
    Caption = '<a href="http://www.zgwlyy.com">www.zgwlbjy.com</a> '
    TabOrder = 1
    UseVisualStyle = True
    OnClick = lnkUrlClick
  end
end
