unit UCRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ExtCtrls;

type
  TfrmCaseRecord = class(TForm)
    grp1: TGroupBox;
    lblRecord: TLabel;
    lblTreatment: TLabel;
    mmoTreatment: TMemo;
    pnl1: TPanel;
    lblHospital: TLabel;
    lblSeeTime: TLabel;
    dtpInDocTime: TDateTimePicker;
    cbb1: TComboBox;
    lbl1: TLabel;
    cbb2: TComboBox;
    lbl2: TLabel;
    cbb3: TComboBox;
    lbl3: TLabel;
    cbb4: TComboBox;
    lbl4: TLabel;
    cbb5: TComboBox;
    grp2: TGroupBox;
    lbl5: TLabel;
    lbl6: TLabel;
    cbb7: TComboBox;
    edt1: TEdit;
    lbl7: TLabel;
    edt2: TEdit;
    lbl8: TLabel;
    cbb6: TComboBox;
    lbl9: TLabel;
    lbl10: TLabel;
    cbb8: TComboBox;
    edt3: TEdit;
    mmo1: TMemo;
    ctrlbr1: TControlBar;
    pnl2: TPanel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaseRecord: TfrmCaseRecord;

implementation

{$R *.dfm}

procedure TfrmCaseRecord.btn4Click(Sender: TObject);
begin
  close;
end;

end.
