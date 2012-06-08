unit UCRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components;

type
  TfrmCaseRecord = class(TForm)
    grp1: TGroupBox;
    lblRecord: TLabel;
    lblTreatment: TLabel;
    mmoRemark: TMemo;
    pnl1: TPanel;
    lblHospital: TLabel;
    lblSeeTime: TLabel;
    dtpInDocTime: TDateTimePicker;
    cbbDiet: TComboBox;
    lbl1: TLabel;
    cbbSleep: TComboBox;
    lbl2: TLabel;
    cbbShit: TComboBox;
    lbl3: TLabel;
    cbbPee: TComboBox;
    lbl4: TLabel;
    cbbSpirit: TComboBox;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    cbb1: TComboBox;
    edt1: TEdit;
    lbl7: TLabel;
    edt2: TEdit;
    lbl8: TLabel;
    cbb2: TComboBox;
    lbl9: TLabel;
    lbl10: TLabel;
    cbb3: TComboBox;
    edt3: TEdit;
    mmoMainDescribe: TMemo;
    ctrlbr1: TControlBar;
    pnl2: TPanel;
    btn1: TButton;
    btnSave: TButton;
    btnAdd: TButton;
    btn4: TButton;
    BindingsList1: TBindingsList;
    ScrollBar1: TScrollBar;
    BtnDel: TButton;
    EdtDiet: TEdit;
    EdtSleep: TEdit;
    EdtPee: TEdit;
    EdtShit: TEdit;
    EdtSpirit: TEdit;
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure EdtDietExit(Sender: TObject);
    procedure cbbDietSelect(Sender: TObject);
    procedure EdtPeeExit(Sender: TObject);
    procedure EdtShitExit(Sender: TObject);
    procedure EdtSleepExit(Sender: TObject);
    procedure EdtSpiritExit(Sender: TObject);
    procedure cbbPeeSelect(Sender: TObject);
    procedure cbbShitSelect(Sender: TObject);
    procedure cbbSleepSelect(Sender: TObject);
    procedure cbbDietEnter(Sender: TObject);
    procedure cbbSpiritSelect(Sender: TObject);
  private
    { Private declarations }
    addSymptomList: TList;     //动态创建的所有控件
    allEditList: TList;        //存放所有添加症状Edit；
    allCbbList: TList;         //存放所有添加症状ComboBox；
    SymptomCount: Integer;
    procedure AddSymptom;
    procedure FillCondition;
    procedure FillAddCondition;
    procedure SelectOtherCase(cbb: TComboBox; Edt: TEdit);
    procedure UnSelectOtherCase(cbb: TComboBox; Edt: TEdit);
    procedure CheckSelectOtherCase;
    procedure UpDateAddSymptom;
  public
    { Public declarations }
    condition_id: Integer;       //healthcondition ID
  end;

var
  frmCaseRecord: TfrmCaseRecord;

implementation

{$R *.dfm}

uses UBodyRecord, UModels, UDB;

procedure TfrmCaseRecord.AddSymptom;
var
  aLabel,bLabel: TLabel;
  aEdit: TEdit;
  aComboBox: TComboBox;
begin
  grp2.Height:= grp2.Height + 35;
  Self.Height:= Self.Height + 35;
  btnAdd.Top:= btnAdd.Top + 35;
  BtnDel.Top:= BtnDel.Top + 35;
  BtnDel.Enabled:= True;

  aEdit:= TEdit.Create(Self);
  aEdit.Parent:= grp2;
  aEdit.Top:= grp2.Height - 70;
  aEdit.Left:= 83;
  aEdit.Width:= 171;


  aLabel:= TLabel.Create(Self);
  aLabel.Parent:= grp2;
  aLabel.Top:= grp2.Height - 70;
  aLabel.Left:= 40;
  aLabel.Caption:= '症状：';


  bLabel:= TLabel.Create(Self);
  bLabel.Parent:= grp2;
  bLabel.Top:= grp2.Height - 70;
  bLabel.Left:= 285;
  bLabel.Caption:= '程度：';

  aComboBox:= TComboBox.Create(Self);
  aComboBox.Parent:= grp2;
  aComboBox.Top:= grp2.Height - 70;
  aComboBox.Left:= 327;
  aComboBox.Width:= 171;
  aComboBox.Items.Add('-');
  aComboBox.Items.Add('±');
  aComboBox.Items.Add('+');
  aComboBox.Items.Add('++');
  aComboBox.Items.Add('+++');
  aComboBox.Items.Add('++++');
  aComboBox.ItemIndex:= 0;

  addSymptomList.Add(aEdit);
  addSymptomList.Add(aLabel);
  addSymptomList.Add(bLabel);
  addSymptomList.Add(aComboBox);

  allEditList.Add(aEdit);
  allCbbList.Add(aComboBox);
end;

procedure TfrmCaseRecord.btn1Click(Sender: TObject);
begin
  with TfrmBodyRecord.Create(owner) do
  try
    body_ID:= 0;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmCaseRecord.btnAddClick(Sender: TObject);
begin
  AddSymptom;
end;

procedure TfrmCaseRecord.BtnDelClick(Sender: TObject);
var
  i: Integer;
begin
  if addSymptomList.Count > 0 then
  begin
    grp2.Height:= grp2.Height - 35;
    Self.Height:= Self.Height - 35;
    btnAdd.Top:= btnAdd.Top - 35;
    BtnDel.Top:= BtnDel.Top - 35;

    allEditList.Delete(allEditList.Count - 1);
    allCbbList.Delete(allCbbList.Count - 1);
    for i:=0 to 3 do
    begin
      TComponent(addSymptomList.Items[addSymptomList.Count - 1]).Free;
      addSymptomList.Delete(addSymptomList.Count - 1);
    end;


    if addSymptomList.Count = 0 then
      BtnDel.Enabled:= False;
  end;
end;

procedure TfrmCaseRecord.btnSaveClick(Sender: TObject);
var
  Condition: TCondition;
begin
  Condition:= TCondition.Create;
  with Condition do
  begin
    id:= condition_id;
    describe:= mmoMainDescribe.Text;
    remark:= mmoRemark.Text;
    con_Time:= FormatDateTime('yyyy-MM-dd',dtpInDocTime.Date);

    diet:= IntToStr(cbbDiet.ItemIndex + 1);
    sleep:= IntToStr(cbbSleep.ItemIndex + 1);
    shit:= IntToStr(cbbShit.ItemIndex + 1);
    pee:= IntToStr(cbbPee.ItemIndex + 1);
    spirit:= IntToStr(cbbSpirit.ItemIndex + 1);

    dietStr:= Trim(EdtDiet.Text);
    sleepStr:= Trim(EdtSleep.Text);
    shitStr:= Trim(EdtShit.Text);
    peeStr:= Trim(EdtPee.Text);
    spiritStr:= Trim(EdtSpirit.Text);

    if id = 0 then
      condition_id:= Insert
    else
      Update;
    UpDateAddSymptom;
  end;
end;


procedure TfrmCaseRecord.btn4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCaseRecord.FormCreate(Sender: TObject);
begin
  addSymptomList:= TList.Create;
  allEditList:= TList.Create;
  allCbbList:= TList.Create;

  allEditList.Add(edt1);
  allEditList.Add(edt2);
  allEditList.Add(edt3);

  allCbbList.Add(cbb1);
  allCbbList.Add(cbb2);
  allCbbList.Add(cbb3);
end;

procedure TfrmCaseRecord.FormDestroy(Sender: TObject);
begin
  addSymptomList.Free;
  allEditList.Free;
  allCbbList.Free;
end;

procedure TfrmCaseRecord.FormShow(Sender: TObject);
begin
  if condition_id = 0  then
  begin
    dtpInDocTime.Date:= Date;
  end
  else
  begin
    FillCondition;
    FillAddCondition;
  end;
end;

procedure TfrmCaseRecord.FillCondition;
begin
  TCondition.One(condition_id);

  mmoMainDescribe.Text:= Tab.FieldByName['message'];
  mmoRemark.Text:= Tab.FieldByName['Remark'];
  dtpInDocTime.Date:= StrToDateTime(Tab.FieldByName['time']);

  cbbDiet.ItemIndex:= StrToInt(Tab.FieldByName['diet']) - 1;
  cbbSleep.ItemIndex:= StrToInt(Tab.FieldByName['sleep']) - 1;
  cbbShit.ItemIndex:= StrToInt(Tab.FieldByName['shit']) - 1;
  cbbPee.ItemIndex:= StrToInt(Tab.FieldByName['pee']) - 1;
  cbbSpirit.ItemIndex:= StrToInt(Tab.FieldByName['Spirit']) - 1;

  EdtDiet.Text:= Tab.FieldByName['dietStr'];
  EdtSleep.Text:= Tab.FieldByName['sleepStr'];
  EdtShit.Text:= Tab.FieldByName['shitStr'];
  EdtPee.Text:= Tab.FieldByName['peeStr'];
  EdtSpirit.Text:= Tab.FieldByName['SpiritStr'];

  CheckSelectOtherCase;

end;

procedure TfrmCaseRecord.FillAddCondition;
var
  i: Integer;
begin
  SymptomCount:= TAddCondition.FindAll(condition_id);
  i:=0;
  while not Tab.EOF do
  begin
    if Tab.Row > 3 then
      AddSymptom;
    TEdit(allEditList.Items[i]).Text:= Tab.FieldByName['name'];
    TComboBox(allCbbList.Items[i]).ItemIndex:= StrToInt(Tab.FieldByName['level']) + 1;
    Inc(i);
    Tab.Next;
  end;
end;

procedure TfrmCaseRecord.EdtDietExit(Sender: TObject);
begin
  UnSelectOtherCase(cbbDiet,EdtDiet);
end;

procedure TfrmCaseRecord.EdtPeeExit(Sender: TObject);
begin
  UnSelectOtherCase(cbbPee,EdtPee);
end;

procedure TfrmCaseRecord.EdtShitExit(Sender: TObject);
begin
  UnSelectOtherCase(cbbShit,EdtShit);
end;

procedure TfrmCaseRecord.EdtSleepExit(Sender: TObject);
begin
  UnSelectOtherCase(cbbSleep,EdtSleep);
end;

procedure TfrmCaseRecord.EdtSpiritExit(Sender: TObject);
begin
  UnSelectOtherCase(cbbSpirit,EdtSpirit);
end;

procedure TfrmCaseRecord.cbbDietSelect(Sender: TObject);
begin
  SelectOtherCase(cbbDiet,EdtDiet);
end;

procedure TfrmCaseRecord.cbbPeeSelect(Sender: TObject);
begin
  SelectOtherCase(cbbPee,EdtPee);
end;

procedure TfrmCaseRecord.cbbShitSelect(Sender: TObject);
begin
  SelectOtherCase(cbbShit,EdtShit);
end;

procedure TfrmCaseRecord.cbbSleepSelect(Sender: TObject);
begin
  SelectOtherCase(cbbSleep,EdtSleep);
end;

procedure TfrmCaseRecord.cbbSpiritSelect(Sender: TObject);
begin
  SelectOtherCase(cbbSpirit,EdtSpirit);
end;

procedure TfrmCaseRecord.CheckSelectOtherCase;
begin
  SelectOtherCase(cbbDiet,EdtDiet);
  SelectOtherCase(cbbSleep,EdtSleep);
  SelectOtherCase(cbbShit,EdtShit);
  SelectOtherCase(cbbPee,EdtPee);
  SelectOtherCase(cbbSpirit,EdtSpirit);
end;

procedure TfrmCaseRecord.SelectOtherCase(cbb: TComboBox; Edt: TEdit);
begin
  if cbb.ItemIndex = cbb.Items.Count - 1 then
  begin
    cbb.Visible:= False;
    Edt.Visible:= True;
    Edt.Focused;
  end;
end;

procedure TfrmCaseRecord.UnSelectOtherCase(cbb: TComboBox; Edt: TEdit);
begin
  if (Trim(Edt.Text)='') and Edt.Visible then
  begin
    Edt.Visible:= False;
    cbb.Visible:= True;
    cbb.ItemIndex:= 0;
  end;
end;

procedure TfrmCaseRecord.UpDateAddSymptom;
var
  i: Integer;
  addCase: TAddCondition;
begin
  addCase:= TAddCondition.Create;
  with addCase do
  begin
    con_id:= condition_id;
    Delete;
    for i := 0 to allEditList.Count-1 do
    begin
      if Trim(TEdit(allEditList.Items[i]).Text) <> ''  then
      begin
        add_name:= Trim(TEdit(allEditList.Items[i]).Text);
        add_level:= TComboBox(allCbbList.Items[i]).ItemIndex - 1;
        Insert;
      end;
    end;
  end;
end;

procedure TfrmCaseRecord.cbbDietEnter(Sender: TObject);
begin
  EdtDietExit(nil);
  EdtPeeExit(nil);
  EdtShitExit(nil);
  EdtSleepExit(nil);
  EdtSpiritExit(nil);
end;

end.
