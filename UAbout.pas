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
    lbltitle: TLabel;
    lnkUrl: TLinkLabel;
    procedure btnOKClick(Sender: TObject);
    procedure lnkUrlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

uses UConst;

procedure TfrmAbout.btnOKClick(Sender: TObject);
begin
  frmAbout.Close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  caption := '¹ØÓÚ' + ApplicationName;
  lbltitle.Caption := ApplicationName;
  lnkUrl.Caption  := '<a href="http://' + ApplicationUrl + '">' + ApplicationUrl + '</a>';
end;

procedure TfrmAbout.lnkUrlClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ApplicationUrl), nil, nil, SW_SHOWNORMAL);
end;

end.
