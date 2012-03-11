unit UDB;

interface

uses
  SQLite3, SQLite3udf, SQLiteWrap, UModels, Vcl.Dialogs;

var
  db : TsqliteDatabase;
  Tab: TSQLiteTable;

  patient: TPatient;

  procedure OpenDB();
  procedure CloseDB();

  procedure InitDB();


implementation

  procedure OpenDB();
  begin
    db := TsqliteDatabase.Create('yiyee.db');
  end;

  procedure CloseDB();
  begin
    Tab.Free;
    db.Free;
  end;

  procedure InitDB();
  begin
    Tab := db.GetTable('select 1 from patient');
    if Tab.Row < 1 then
    begin
      db.ExecSQL('insert into patient(id, name, birthday) ' +
          'values (1, "ÇëÊäÈëÄúµÄÃû×Ö", "2000-01-01")');
    end;
  end;
end.
