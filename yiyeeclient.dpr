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
  UMRecord in 'UMRecord.pas' {frmMedicalRecord},
  UConst in 'UConst.pas',
  UCRecord in 'UCRecord.pas' {frmCaseRecord},
  UBodyRecord in 'UBodyRecord.pas' {frmBodyRecord};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //TStyleManager.TrySetStyle('Sapphire Kamri');
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmPatientEdit, frmPatientEdit);
  Application.CreateForm(TfrmCaseRecord, frmCaseRecord);
  Application.CreateForm(TfrmBodyRecord, frmBodyRecord);
  Application.Title := ApplicationName;
  Application.Run;
end.
