object frmAbout: TfrmAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #20851#20110#32593#32476#21307#38498#21161#25163
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
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 97
    Width = 249
    Height = 21
    Caption = #29256#26435#25152#26377' @2012 '#21271#20140#29233#29983#35850#32852#31185#25216#26377#38480#20844#21496#13#10
  end
  object lbl2: TLabel
    Left = 24
    Top = 65
    Width = 168
    Height = 13
    Caption = #27426#36814#20351#29992#20013#22269#32593#32476#21307#38498#21161#25163#24037#20855
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
  object lbl4: TLabel
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
  object lnklbl1: TLinkLabel
    Left = 24
    Top = 124
    Width = 104
    Height = 21
    Caption = '<a href="http://www.zgwlyy.com">www.zgwlyy.com</a> '
    TabOrder = 1
    UseVisualStyle = True
    OnClick = lnklbl1Click
  end
end