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
  UDB, UModels, Vcl.ComCtrls, Vcl.Imaging.jpeg;

const
  WM_UPDATE= WM_USER+1002;
type
  TFrmMain = class(TForm)
    pnl2: TPanel;
    btnCaseOut: TButton;
    btnCaseIn: TButton;
    btnCaseExam: TButton;
    btnCaseOther: TButton;
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
    lbl6: TLabel;
    lblblood: TLabel;
    grdpnl1: TGridPanel;
    lvRecord: TListView;
    lvExam: TListView;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    actRecord: TAction;
    actBodyRecord: TAction;
    lvCase: TListView;
    Splitter1: TSplitter;
    GridPanel1: TGridPanel;
    lvBody: TListView;
    N21: TMenuItem;
    acUpdate: TAction;
    procedure Button1Click(Sender: TObject);
    procedure actQuitExecute(Sender: TObject);
    procedure actYiyeeExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actSkinExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actPatientConfigExecute(Sender: TObject);
    procedure actCaseInExecute(Sender: TObject);
    procedure actCaseOutExecute(Sender: TObject);
    procedure actCaseExamExecute(Sender: TObject);
    procedure actCaseOtherExecute(Sender: TObject);
    procedure img1DblClick(Sender: TObject);
    procedure lvRecordColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvRecordCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvRecordDblClick(Sender: TObject);
    procedure actBodyRecordExecute(Sender: TObject);
    procedure actRecordExecute(Sender: TObject);
    procedure lvCaseDblClick(Sender: TObject);
    procedure lvBodyDblClick(Sender: TObject);
    procedure acUpdateExecute(Sender: TObject);
  private
    { Private declarations }
    FStyle: Integer;
    procedure  changeSkill(index: Byte);

    procedure ShowPatient();
    procedure fill();
    procedure fillMRecord();
    procedure fillMExamAndLis();
    procedure fillCase();
    procedure fillBody();

    procedure WMClose(var msg: TMessage);  Message WM_UPDATE;
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UAbout, UPatientEdit, UMRecord, UConst, UCRecord, UBodyRecord;

var
  MRColumnToSort: Integer;

procedure TFrmMain.actAboutExecute(Sender: TObject);
begin
  frmAbout.ShowModal;
end;

procedure TFrmMain.actCaseOutExecute(Sender: TObject);
begin
  with TfrmMedicalRecord.Create(owner) do
  try
    mrType := 1;
    ShowModal;

    fill;
  finally
    Free;
  end;
end;

procedure TFrmMain.actCaseInExecute(Sender: TObject);
begin
  with TfrmMedicalRecord.Create(owner) do
  try
    mrType := 2;
    ShowModal;

    fill;
  finally
    Free;
  end;
end;

procedure TFrmMain.actBodyRecordExecute(Sender: TObject);
begin
  with TfrmBodyRecord.Create(owner) do
  try
    body_ID:= 0;
    ShowModal;

    fill;
  finally
    Free;
  end;
end;

procedure TFrmMain.actCaseExamExecute(Sender: TObject);
begin
  with TfrmMedicalRecord.Create(owner) do
  try
    mrType := 3;
    ShowModal;

    fill;
  finally
    Free;
  end;
end;

procedure TFrmMain.actCaseOtherExecute(Sender: TObject);
begin
  with TfrmMedicalRecord.Create(owner) do
  try
    mrType := 4;
    ShowModal;

    fill;
  finally
    Free;
  end;
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

procedure TFrmMain.actRecordExecute(Sender: TObject);
begin
  with TfrmCaseRecord.Create(owner) do
  try
    condition_id:= 0;
    ShowModal;

    fill;
  finally
    Free;
  end;
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
  ShellExecute(Handle, 'open', PChar(ApplicationUrl), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmMain.acUpdateExecute(Sender: TObject);
var
  UpdateFileName: String;
begin
  UpdateFileName:= ExtractFilePath(ParamStr(0)) + 'UpDate.exe';
  if FileExists(UpdateFileName) then
    ShellExecute(Handle,nil,Pchar(UpdateFileName),Pchar(IntToStr(FStyle)),nil,SW_SHOWNORMAL)
  else
    ShowMessage('无法启动更新程序');
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  TStyleManager.TrySetStyle('Carbon');
end;

procedure TFrmMain.changeSkill(index: Byte);
begin
  FStyle:= index;
  case index of
    0: TStyleManager.TrySetStyle('Sapphire Kamri');
    1: TStyleManager.TrySetStyle('Carbon');
    2: TStyleManager.TrySetStyle('Smokey Quartz Kamri');
    3: TStyleManager.TrySetStyle('Emerald Light Slate');
  end;
end;

procedure TFrmMain.fill;
begin
  fillMRecord;
  fillMExamAndLis;
  fillCase;
  fillBody;
end;

procedure TFrmMain.fillBody;
var
  ListItem: TListItem;
  bodyCase: String;
begin
  TBodySign.FindAll;
  with lvBody do
  begin
    Items.Clear;
    while not Tab.EOF do
    begin
      ListItem := Items.Add;
      bodyCase:= '体温:'+ Tab.FieldByName['temperature'] +
                 '  心率:'  + Tab.FieldByName['heartbeat'] +
                 '  小便量:'+ Tab.FieldByName['peeVolume'] +
                 '  大便次数:'  +Tab.FieldByName['shitTimes'] +
                 '  饮入量:'+ Tab.FieldByName['drinkVolume'] +
                 '  血压:'+ Tab.FieldByName['bloodPressureM'] +','+ Tab.FieldByName['bloodPressureA'] +','+Tab.FieldByName['bloodPressureE'] +
                 '  血糖:'+ Tab.FieldByName['bloodSugar'] +
                 '  体重:'+ Tab.FieldByName['weight'];
      ListItem.Caption:= FormatDateTime('yyyy-M-D',StrToDateTime(Tab.FieldByName['Subtime']));
      ListItem.SubItems.Add(bodyCase);
      ListItem.SubItems.Add(Tab.FieldByName['id']);
      Tab.Next;
    end;
  end;
end;

procedure TFrmMain.fillMRecord;
var ListItem: TListItem;
begin
  TMedicalRecord.FindAll;
  with lvRecord do
  begin
    lvRecord.Items.Clear;

    while not Tab.EOF do
    begin
      ListItem := Items.Add;
      ListItem.Caption := GetMRTypeName(Tab.FieldAsInteger(1));
      ListItem.SubItems.Add(Tab.FieldByName['seeTime']);
      ListItem.SubItems.Add(Tab.FieldByName['record']);
      ListItem.SubItems.Add(Tab.FieldByName['id']);
      Tab.Next;
    end;
  end;
end;

procedure TFrmMain.fillMExamAndLis;
var ListItem: TListItem;
begin
  TMedicalLis.FindPositive;
  with lvExam do
  begin
    lvExam.Items.Clear;

    while not Tab.EOF do
    begin
      ListItem := Items.Add;
      ListItem.Caption := Tab.FieldByName['lis_name'];
      ListItem.SubItems.Add(Tab.FieldByName['positive_count']);
      Tab.Next;
    end;
  end;
end;

procedure TFrmMain.fillCase;
var ListItem: TListItem;
begin
  TCondition.FindAll;
  with lvCase do
  begin
    Items.Clear;
    while not Tab.EOF do
    begin
      ListItem := Items.Add;
      ListItem.Caption:= FormatDateTime('yyyy-MM-dd',StrToDateTime(Tab.FieldByName['time']));
      ListItem.SubItems.Add(Tab.FieldByName['message']);
      ListItem.SubItems.Add(Tab.FieldByName['id']);
      Tab.Next;
    end;
  end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  ShowPatient;
end;

procedure TFrmMain.img1DblClick(Sender: TObject);
begin
  actPatientConfig.Execute();
end;

procedure TFrmMain.lvBodyDblClick(Sender: TObject);
begin
  if lvBody.Selected <> nil then
  begin
    with TfrmBodyRecord.Create(owner) do
    try
      body_ID:= StrToInt(lvBody.Selected.SubItems[1]);
      ShowModal;

      fill;
    finally
      Free;
    end;
  end;
end;

procedure TFrmMain.lvCaseDblClick(Sender: TObject);
begin
  if lvCase.Selected <> nil then
  begin
    with TfrmCaseRecord.Create(owner) do
    try
      condition_id := StrToInt(lvCase.Selected.SubItems[1]);
      ShowModal;

      fill;
    finally
      Free;
    end;
  end;
end;

procedure TFrmMain.lvRecordColumnClick(Sender: TObject; Column: TListColumn);
begin
   MRColumnToSort := Column.Index;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TFrmMain.lvRecordCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if MRColumnToSort = 0 then
    Compare := CompareText(Item1.Caption,Item2.Caption)
  else begin
   ix := MRColumnToSort - 1;
   Compare := CompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
  end;
end;

procedure TFrmMain.lvRecordDblClick(Sender: TObject);
begin
  if lvRecord.Selected <> nil then
  begin
    with TfrmMedicalRecord.Create(owner) do
    try
      medId := StrToInt(lvRecord.Selected.SubItems[2]);
      ShowModal;

      fill;
    finally
      Free;
    end;
  end;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseDB();
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FStyle:= 0;
  OpenDB();
  InitDB();
  Fill();
end;

procedure TFrmMain.ShowPatient;
begin
  caption := ApplicationName;

  with patient do
  begin
    if patient=nil then patient := TPatient.Create();

    lblName.Caption := name;
    lblSex.Caption := sex;
    lblAge.Caption := age;
    lblPD.Caption := patientCondition;
    lblTel.Caption := tel;
    lblMobile.Caption := mobile;
    lblEmail.Caption := email;
    lblblood.Caption := blood;
    lblAddress.Caption := address;
    photo.Position := 0;
    if photo.Size > 0 then
      img1.Picture.Graphic.LoadFromStream(photo);
    //    if headImage <> '' then
    //    begin
    //      try
    //        img1.Picture.LoadFromFile(headImage);
    //      except
    //      end;
    //    end;
  end;
end;

procedure TFrmMain.WMClose(var msg: TMessage);
begin
  Application.Terminate;
end;

end.
