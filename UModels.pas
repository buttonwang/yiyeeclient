unit UModels;

interface

uses
  System.SysUtils, System.DateUtils ;

type
  TPatient = class
  private
    function FAge(): String;
  public
    id: Integer;
    name: string;
    sex: string;
    birthday: string;
    blood: string;
    tel: string;
    mobile: string;
    email: string;
    patientCondition: string;
    headImage: string;
    address: string;


    constructor Create();

    procedure Update();
    procedure Insert();
    procedure Delete();

    property age: string read FAge;
  end;

implementation

{ TPatient }

Uses
  UDB;

function TPatient.FAge: string;
begin
  if birthday = '' then result := ''
  else result := IntToStr(YearsBetween(now, StrToDateTime(birthday)));
end;

constructor TPatient.Create;
begin
  id := 0;

  Tab := Database.GetTable('select id, name, sex, blood, birthday, address, ' +
      ' tel, mobile, patientCondition, headImage' +
      ' from patient where id <> 0');

  if Tab.Row <> 0 then
  begin
    id := Tab.FieldAsInteger(0);
    name := Tab.FieldAsString(1);
    sex := Tab.FieldAsString(2);
    blood := Tab.FieldAsString(3);
    birthday := Tab.FieldAsString(4);
    address := Tab.FieldAsString(5);
    tel := Tab.FieldAsString(6);
    mobile := Tab.FieldAsString(7);
    patientCondition := Tab.FieldAsString(8);
    headImage := Tab.FieldAsString(9);
  end;
end;

procedure TPatient.Delete;
begin

end;

procedure TPatient.Insert;
begin

end;

procedure TPatient.Update;
var sql: string;
begin
  sql := 'update patient set name="#name", sex="#sex", birthday="#birthday", blood="#blood", ' +
         'tel="#tel", mobile="#mobile", email="#email", headImage="#headImage", ' +
         'patientCondition="#patientCondition", address="#address"';
  sql := StringReplace(sql, '#name', patient.name, []);
  sql := StringReplace(sql, '#birthday', patient.birthday, []);
  sql := StringReplace(sql, '#sex', patient.sex, []);
  sql := StringReplace(sql, '#blood', patient.blood, []);
  sql := StringReplace(sql, '#tel', patient.tel, []);
  sql := StringReplace(sql, '#mobile', patient.mobile, []);
  sql := StringReplace(sql, '#email', patient.email, []);
  sql := StringReplace(sql, '#headImage', patient.headImage, []);
  sql := StringReplace(sql, '#patientCondition', patient.patientCondition, []);
  sql := StringReplace(sql, '#address', patient.address, []);
  Database.ExecSQL(sql);
end;

end.
