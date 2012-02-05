unit UDB;

interface

uses
  SQLite3, SQLite3udf, SQLiteWrap, UModels, Vcl.Dialogs;

var
  Database : TsqliteDatabase;
  Tab: TSQLiteTable;

  patient: TPatient;

  procedure OpenDB();
  procedure CloseDB();


implementation

  procedure OpenDB();
  begin
    Database := TsqliteDatabase.Create('yiyee.db');
  end;

  procedure CloseDB();
  begin
    Tab.Free;
    Database.Free;
  end;

end.
