unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Grids,
  Vcl.Themes,
  Vcl.Styles, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.CategoryButtons, Vcl.ButtonGroup,
  Vcl.Tabs, Vcl.DockTabSet, Vcl.Menus, Vcl.ActnList,
  Winapi.ShellAPI, Vcl.ActnColorMaps,
  UDB, UModels;

type
  TFrmMain = class(TForm)
    pnl2: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    mmMain: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    actlstMain: TActionList;
    actCaseOut: TAction;
    actCaseIn: TAction;
    actCaseExam: TAction;
    actCaseOther: TAction;
    actPatientConfig: TAction;
    actSoftConfig: TAction;
    actSkin: TAction;
    actYiyee: TAction;
    actAbout: TAction;
    actQuit: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ctgrypnlgrp1: TCategoryPanelGroup;
    ctgrypnl1: TCategoryPanel;
    ctgrypnl2: TCategoryPanel;
    ctgrypnl3: TCategoryPanel;
    spl1: TSplitter;
    pnl1: TPanel;
    img1: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lblName: TLabel;
    lblSex: TLabel;
    lblAge: TLabel;
    lblPD: TLabel;
    lbl4: TLabel;
    lblTel: TLabel;
    lbl7: TLabel;
    lblMobile: TLabel;
    lbl9: TLabel;
    lblEmail: TLabel;
    lbl11: TLabel;
    lblAddress: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure actQuitExecute(Sender: TObject);
    procedure actYiyeeExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actSkinExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPatientConfigExecute(Sender: TObject);
  private
    { Private declarations }
    procedure  changeSkill(index: Byte);

    procedure ShowPatient();
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UAbout, UPatientEdit;

procedure TFrmMain.actAboutExecute(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TFrmMain.actPatientConfigExecute(Sender: TObject);
begin
  frmPatientEdit.ShowModal;
  ShowPatient();
end;

procedure TFrmMain.actQuitExecute(Sender: TObject);
begin
  FrmMain.Close;
end;

procedure TFrmMain.actSkinExecute(Sender: TObject);
begin
  N14.Checked := False;
  N15.Checked := False;
  N16.Checked := False;
  N17.Checked := False;
  changeSkill((Sender as TMenuItem).GroupIndex);
  (Sender as TMenuItem).Checked := True;
end;

procedure TFrmMain.actYiyeeExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'www.zgwlyy.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  TStyleManager.TrySetStyle('Carbon');
end;

procedure TFrmMain.changeSkill(index: Byte);
begin
  case index of
    0: TStyleManager.TrySetStyle('Sapphire Kamri');
    1: TStyleManager.TrySetStyle('Carbon');
    2: TStyleManager.TrySetStyle('Smokey Quartz Kamri');
    3: TStyleManager.TrySetStyle('Emerald Light Slate');
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  ShowPatient;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDB();
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  OpenDB();
end;

procedure TFrmMain.ShowPatient;
begin
  patient := TPatient.Create;
  with patient do
  begin
    lblName.Caption := name;
    lblSex.Caption := sex;
    lblAge.Caption := age;
    lblPD.Caption := patientCondition;
    lblTel.Caption := tel;
    lblMobile.Caption := mobile;
    lblEmail.Caption := email;
    lblAddress.Caption := address;
  end;
end;

end.