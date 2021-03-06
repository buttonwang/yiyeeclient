unit UPatientEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Vcl.ExtDlgs, Vcl.Imaging.jpeg;

type
  TfrmPatientEdit = class(TForm)
    img1: TImage;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl4: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl11: TLabel;
    btnSave: TButton;
    btnClose: TButton;
    cbbSex: TComboBox;
    dtpBirthday: TDateTimePicker;
    edtTel: TEdit;
    edtMobile: TEdit;
    edtEmail: TEdit;
    edtPD: TEdit;
    edtAddress: TEdit;
    edtName: TEdit;
    pnl2: TPanel;
    btnChooseFile: TButton;
    dlgOpenPic1: TOpenPictureDialog;
    lbl6: TLabel;
    cbbblood: TComboBox;
    Label1: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnChooseFileClick(Sender: TObject);
    procedure img1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowPatient();
  public
    { Public declarations }

  end;

var
  frmPatientEdit: TfrmPatientEdit;

implementation

{$R *.dfm}

uses UDB;

procedure TfrmPatientEdit.FormShow(Sender: TObject);
begin
  ShowPatient();
end;

procedure TfrmPatientEdit.img1DblClick(Sender: TObject);
begin
  btnChooseFile.Click;
end;

procedure TfrmPatientEdit.ShowPatient;
begin
  with patient do
  begin
    edtName.Text := name;
    cbbSex.Text := sex;
    dtpBirthday.Date := StrToDateTime(birthday);
    edtPD.Text := patientCondition;
    edtTel.Text := tel;
    edtMobile.Text := mobile;
    edtEmail.Text := email;
    cbbblood.Text := blood;
    edtAddress.Text := address;
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

procedure TfrmPatientEdit.btnSaveClick(Sender: TObject);
var
  vMailTemp: String;
begin
  if Trim(edtMobile.Text) <> '' then
  begin
    if (Length(edtMobile.Text) <> 11) or
       (copy(edtMobile.Text, 1, 2) <> '13') and
       (copy(edtMobile.Text, 1, 2) <> '15') and
       (copy(edtMobile.Text, 1, 2) <> '18') then
    begin
      ShowMessage('不是有效的手机号');
      Exit;
    end;
  end;



  if Trim(edtEmail.Text) <> '' then
  begin
    vMailTemp:= Copy(edtEmail.Text,Pos('@',edtEmail.Text) + 1,Length(edtEmail.Text));
    if not (
            (Pos('@',edtEmail.Text) > 1)  and
            (not (pos('@',vMailTemp) > 0)) and
            (Pos('.',vMailTemp) > 1) and
            (vMailTemp[Length(vMailTemp)] <> '.')
           ) then
    begin
      ShowMessage('邮箱格式不正确');
      Exit;
    end;
  end;


  with patient do
  begin
    name := edtName.Text;
    sex := cbbSex.Text;
    birthday := DateToStr(dtpBirthday.Date);
    patientCondition := edtPD.Text;
    tel := edtTel.Text;
    mobile := edtMobile.Text;
    email := edtEmail.Text;
    blood := cbbblood.Text;
    address := edtAddress.Text;

    patient.photo.Clear;      //if delete then picture will be merge.
    img1.Picture.Graphic.SaveToStream(patient.photo);

    Update();
  end;

  Close;
end;

procedure TfrmPatientEdit.btnChooseFileClick(Sender: TObject);
begin
  if dlgOpenPic1.Execute(Application.Handle) then
  begin
    img1.Picture.LoadFromFile(dlgOpenPic1.FileName);
    patient.headImage := dlgOpenPic1.FileName;
  end;
end;

procedure TfrmPatientEdit.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.
