unit UAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Winapi.ShellAPI;

type
  TfrmAbout = class(TForm)
    btnOK: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lnklbl1: TLinkLabel;
    procedure btnOKClick(Sender: TObject);
    procedure lnklbl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.btnOKClick(Sender: TObject);
begin
  frmAbout.Close;
end;

procedure TfrmAbout.lnklbl1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'www.zgwlyy.com', nil, nil, SW_SHOWNORMAL);
end;

end.