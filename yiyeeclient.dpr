program yiyeeclient;

uses
  Vcl.Forms,
  UMain in 'C:\Users\Administrator\Documents\RAD Studio\Projects\UMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TForm1, Form1);
  Application.Title := '医业网病人助手客户端';
  Application.Run;
end.
