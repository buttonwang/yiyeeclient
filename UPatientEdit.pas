unit UPatientEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components;

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
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
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
    edtAddress.Text := address;
  end;
end;

procedure TfrmPatientEdit.btnSaveClick(Sender: TObject);
begin
  with patient do
  begin
    name := edtName.Text;
    sex := cbbSex.Text;
    birthday := DateToStr(dtpBirthday.Date);
    patientCondition := edtPD.Text;
    tel := edtTel.Text;
    mobile := edtMobile.Text;
    email := edtEmail.Text;
    address := edtAddress.Text;

    Update();
  end;

  Close;
end;

procedure TfrmPatientEdit.btnCloseClick(Sender: TObject);
begin
  close;
end;

end.