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

  procedure InitDB();


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

  procedure InitDB();
  begin
    Tab := Database.GetTable('select 1 from patient');
    if Tab.Row < 1 then
    begin
      Database.ExecSQL('insert into patient(id, name, birthday) ' +
          'values (1, "ÇëÊäÈëÄúµÄÃû×Ö", "2000-01-01")');
    end;
  end;
end.
