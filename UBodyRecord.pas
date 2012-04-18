unit UBodyRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmBodyRecord = class(TForm)
    pnl1: TPanel;
    lblHospital: TLabel;
    lblSeeTime: TLabel;
    dtpInDocTime: TDateTimePicker;
    ctrlbr1: TControlBar;
    pnl2: TPanel;
    btn2: TButton;
    btn4: TButton;
    edt4: TEdit;
    shp1: TShape;
    lbl11: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtp1: TDateTimePicker;
    edt1: TEdit;
    shp2: TShape;
    lbl3: TLabel;
    lbl4: TLabel;
    edt2: TEdit;
    shp3: TShape;
    lbl6: TLabel;
    lbl5: TLabel;
    edt3: TEdit;
    lbl7: TLabel;
    edt5: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    edt6: TEdit;
    edt7: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    edt8: TEdit;
    edt9: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    edt10: TEdit;
    edt11: TEdit;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    edt12: TEdit;
    edt13: TEdit;
    dtp2: TDateTimePicker;
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBodyRecord: TfrmBodyRecord;

implementation

{$R *.dfm}

procedure TfrmBodyRecord.btn4Click(Sender: TObject);
begin
  close;
end;

end.
