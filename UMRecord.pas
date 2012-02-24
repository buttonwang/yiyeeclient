unit UMRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.ValEdit, Vcl.Buttons;

type
  TfrmMedicalEecord = class(TForm)
    grp1: TGroupBox;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    vlsExam: TValueListEditor;
    rg1: TRadioGroup;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    mmo1: TMemo;
    edtHospital: TEdit;
    dtpInDocTime: TDateTimePicker;
    tv1: TTreeView;
    pnl1: TPanel;
    grp2: TGroupBox;
    mmo2: TMemo;
    vlsLis: TValueListEditor;
    btnAppend: TBitBtn;
    btn1: TButton;
    btn2: TButton;
    lbl4: TLabel;
    edt111: TEdit;
    pnl2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMedicalEecord: TfrmMedicalEecord;

implementation

{$R *.dfm}

procedure TfrmMedicalEecord.btn2Click(Sender: TObject);
begin
  close;
end;

procedure TfrmMedicalEecord.FormCreate(Sender: TObject);
begin
  with vlsExam do
  begin
    InsertRow('�ĵ�ͼ', '����', true);
    InsertRow('��Ѫ����Ӱ', '', true);
    InsertRow('B��', '', true);
    InsertRow('X����', '', true);
    InsertRow('MR/DR', '', true);
    InsertRow('CT', '', true);
    InsertRow('�˴�', '', true);
    InsertRow('PED-CI', '', true);
    InsertRow('����', '', true);
    InsertRow('����', '', true);
  end;

  with vlsLis do
  begin
    InsertRow('�ܵ�����', '10', true);
    InsertRow('��ӵ�����', '11', true);
    InsertRow('ֱ�ӵ�����', '2', true);
    InsertRow('�ƣ�Na��', '120', true);
    InsertRow('�ƣ�Ca��', '3', true);
  end;
end;

end.
