unit UMRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.StrUtils,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.Buttons, Vcl.Samples.Spin, SQLiteWrap;

type
  TfrmMedicalRecord = class(TForm)
    grp1: TGroupBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    vlsExam: TValueListEditor;
    rgType: TRadioGroup;
    lblHospital: TLabel;
    lblSeeTime: TLabel;
    lblRecord: TLabel;
    mmoRecord: TMemo;
    edtHospital: TEdit;
    dtpInDocTime: TDateTimePicker;
    tvLisItem: TTreeView;
    pnl1: TPanel;
    grpLisInfo: TGroupBox;
    mmoRemark: TMemo;
    btnSave: TButton;
    btnClose: TButton;
    lblTreatment: TLabel;
    edtID: TEdit;
    lvLis: TListView;
    lblLisName: TLabel;
    btnSaveLis: TButton;
    chkPositive: TCheckBox;
    edtLisValue: TEdit;
    edtTreatment: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    edtLisScope: TEdit;
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
    procedure FillLisDict;
    procedure MarkTree(tab: TSQLiteTable; TreeView: TTreeView);
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

  FillLisDict;
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
      mrType := StrToInt(Tab.FieldByName['type']);
      rgType.ItemIndex := StrToInt(Tab.FieldByName['type']) - 1;
      edtID.Text := Tab.FieldByName['id'];


      FillExamList;
      FillLisList;
    end;
  end;

  if mrType=3 then
  begin
    lblHospital.Caption := '体检医院：';
    lblSeeTime.Caption := '体检时间：';
    lblRecord.Caption := '异常项目：';
    lblTreatment.Caption := '体检结果：';
  end;

  pgc1.ActivePageIndex := 0;
  rgType.Enabled := False;
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
var
  sql: string;
begin
  with tvLisItem.Selected do
  begin
    grpLisInfo.Enabled := not HasChildren;
    if not HasChildren then
    begin
      lblLisName.Caption := Text;
      edtLisValue.Text := '';
      sql := 'Select * from medicallisdict where lis_name =''#lisname''';
      sql := StringReplace(sql, '#lisname', Text, []);
      Tab:= db.GetTable(sql);
      if Not Tab.EOF then
      begin
        edtLisScope.Text := tab.FieldByName['scope'];
        mmoRemark.Lines.Clear;
        mmoRemark.Lines.Add(tab.FieldByName['remark']);
      end;
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

procedure TfrmMedicalRecord.FillLisDict;
var
  dictTab: TSQLiteTable;
begin
  dictTab := db.GetTable('select id, parent_id, lis_name from medicallisdict order by parent_id');

  MarkTree(dictTab, tvLisItem)
end;

procedure TfrmMedicalRecord.MarkTree(tab: TSQliteTable; TreeView: TTreeView);
var
  List: TStringList;
  Node: TTreeNode;
  Index: Integer;
begin
  TreeView.Items.BeginUpdate;
  try
    TreeView.Items.Clear;

    List := TStringList.Create;
    try
      List.Sorted := True;
      while not tab.Eof do
      begin
        if tab.FieldByName['parent_id']  = '0' then { ParentID=0，顶层节点 }
          Node := TreeView.Items.AddChild(nil, tab.FieldByName['lis_name'])
        else
        begin
          Index := List.IndexOf(tab.FieldByName['parent_id']);
          Node := TreeView.Items.AddChild(TTreeNode(List.Objects[Index]),
           tab.FieldByName['lis_name']);
        end;
        List.AddObject(tab.FieldByName['id'], Node);
        tab.Next;
      end;
    finally
      List.Free;
    end;
  finally
    TreeView.Items.EndUpdate;
  end;
end;

end.
