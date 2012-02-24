program yiyeeclient;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmMain},
  Vcl.Themes,
  Vcl.Styles,
  UAbout in 'UAbout.pas' {frmAbout},
  SQLite3 in 'SQLite3.pas',
  sqlite3udf in 'sqlite3udf.pas',
  SQLiteWrap in 'SQLiteWrap.pas',
  UDB in 'UDB.pas',
  UModels in 'UModels.pas',
  UPatientEdit in 'UPatientEdit.pas' {frmPatientEdit},
  UMRecord in 'UMRecord.pas' {frmMedicalEecord},
  UConst in 'UConst.pas',
  UCRecord in 'UCRecord.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sapphire Kamri');
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmPatientEdit, frmPatientEdit);
  Application.CreateForm(TfrmMedicalEecord, frmMedicalEecord);
  Application.CreateForm(TForm1, Form1);
  Application.Title := ApplicationName;
  Application.Run;
end.
