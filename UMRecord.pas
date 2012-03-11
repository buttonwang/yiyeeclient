unit UMRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.StrUtils,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.Buttons, Vcl.Samples.Spin;

type
  TfrmMedicalRecord = class(TForm)
    grp1: TGroupBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    vlsExam: TValueListEditor;
    rgType: TRadioGroup;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    mmoRecord: TMemo;
    edtHospital: TEdit;
    dtpInDocTime: TDateTimePicker;
    tvLisItem: TTreeView;
    pnl1: TPanel;
    grpLisInfo: TGroupBox;
    mmo2: TMemo;
    btnSave: TButton;
    btnClose: TButton;
    lbl4: TLabel;
    edtTreatment: TEdit;
    edtID: TEdit;
    lvLis: TListView;
    lblLisName: TLabel;
    btnSaveLis: TButton;
    chkPositive: TCheckBox;
    edtLisValue: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLisClick(Sender: TObject);
    procedure tvLisItemClick(Sender: TObject);
  private
    procedure InitExamAndLis;
    procedure FillExamList;
    procedure FillLisList;
    { Private declarations }
  public
    { Public declarations }
    mrType: Integer;
    medId: Integer; //medicalrecord.id
  end;

var
  frmMedicalRecord: TfrmMedicalRecord;

implementation

{$R *.dfm}

uses UModels, UDB;

procedure TfrmMedicalRecord.btnSaveClick(Sender: TObject);
var mr: TMedicalRecord;
begin
  mr :=  TMedicalRecord.Create();
  with mr do
  begin
    id := StrToInt(edtId.Text);
    patientId := patient.id;
    hospital := Trim(edtHospital.Text);
    seeTime := DateToStr(dtpInDocTime.Date);
    treatment := Trim(edtTreatment.Text);
    mrRecord := Trim(mmoRecord.Text);
    mrType := rgType.ItemIndex + 1;
    publishTime := DateTimeToStr(now());
    updateTime := publishTime;

    if id = 0 then
    begin
      medId :=mr.Insert();
      edtId.Text := IntToStr(medId);
      pgc1.Visible := True;
      top := top - 200;
      Height := 610;

      FillExamList;

    end else
    begin
      mr.Update();
      TMedicalExam.UpdateAll(mr.id, vlsExam.Strings);
    end;
  end;
end;

procedure TfrmMedicalRecord.btnCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMedicalRecord.FillExamList;
begin
  TMedicalExam.FindAll(medId);
  with Tab do
  begin
    if Tab.Row <> 0 then
    begin
      while not EOF do
      begin
        vlsExam.InsertRow(Tab.FieldByName['exam_name'], Tab.FieldByName['exam_value'], True);
        Next;
      end;
    end;
  end;
end;

procedure TfrmMedicalRecord.FillLisList;
var ListItem: TListItem;
begin
  lvLis.Items.Clear;

  TMedicalLis.FindAll(medId);
  with Tab do
  begin
    if Tab.Row <> 0 then
    begin
      while not EOF do
      begin
        ListItem := lvLis.Items.Add;
        ListItem.Caption := Tab.FieldByName['lis_name'];
        ListItem.SubItems.Add(Tab.FieldByName['lis_value']);
        ListItem.SubItems.Add(IfThen(Tab.FieldByName['positive']='1', '阳性', '阴性'));
        ListItem.SubItems.Add(Tab.FieldByName['id']);

        Next;
      end;
    end;
  end;
end;

procedure TfrmMedicalRecord.FormCreate(Sender: TObject);
begin
  medId := 0;
end;

procedure TfrmMedicalRecord.FormShow(Sender: TObject);
begin
  if medId = 0 then
  begin
    pgc1.Visible := false;
    Height := Height - pgc1.Height;

    rgType.ItemIndex := mrType -1;
    dtpInDocTime.Date := Date();

    //InitExamLis;
  end else if medId > 0 then
  begin
    TMedicalRecord.One(medId);
    if Tab.Row <> 0 then
    begin
      edtHospital.Text := Tab.FieldByName['hospital'];
      dtpInDocTime.Date := StrToDate(Tab.FieldByName['seeTime']);
      edtTreatment.Text := Tab.FieldByName['treatment'];
      mmoRecord.Text := Tab.FieldByName['record'];
      rgType.ItemIndex := StrToInt(Tab.FieldByName['type']) - 1;
      edtID.Text := Tab.FieldByName['id'];

      FillExamList;
      FillLisList;
    end;


  end;

  edtHospital.SetFocus;
end;

procedure TfrmMedicalRecord.InitExamAndLis;
begin
  with vlsExam do
  begin
    InsertRow('心电图', '正常', true);
    InsertRow('心血管造影', '', true);
    InsertRow('B超', '', true);
    InsertRow('X光检查', '', true);
    InsertRow('MR/DR', '', true);
    InsertRow('CT', '', true);
    InsertRow('核磁', '', true);
    InsertRow('PED-CI', '', true);
    InsertRow('病理', '', true);
    InsertRow('其它', '', true);
  end;
  //with vlsLis do
  //begin
  //  InsertRow('总胆红素', '10', true);
  //  InsertRow('间接胆红素', '11', true);
  //  InsertRow('直接胆红素', '2', true);
  //  InsertRow('钠（Na）', '120', true);
  //  InsertRow('钙（Ca）', '3', true);
  //end;
end;

procedure TfrmMedicalRecord.tvLisItemClick(Sender: TObject);
begin
  with tvLisItem.Selected do
  begin
    grpLisInfo.Enabled := not HasChildren;
    if not HasChildren then
    begin
      lblLisName.Caption := Text + ':';
    end;
  end;
end;

procedure TfrmMedicalRecord.btnSaveLisClick(Sender: TObject);
begin
  if SameText(Trim(edtLisValue.Text), EmptyStr) then
  begin
    ShowMessage('请填写检验结果！');
    edtLisValue.SetFocus;
    exit;
  end else
  begin
    with TMedicalLis.Create() do
    begin
      med_id := medId;
      lis_name := StringReplace(lblLisName.Caption, ':', '', []);
      lis_value := edtLisValue.Text;
      positive := StrToInt(IfThen(chkPositive.Checked, '1', '0'));

      if Insert <> 0 then
      begin
        ShowMessage('成功增加检验项目！');

        FillLisList;
      end;
    end;
  end;
end;

end.
