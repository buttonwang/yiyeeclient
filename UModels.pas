unit UModels;

interface

uses
  System.SysUtils, System.DateUtils, System.Classes, Vcl.Dialogs;

type
  TDomain = class
  public
    procedure Update(); virtual; abstract;
    procedure Insert(); virtual; abstract;
    procedure Delete(); virtual; abstract;
  end;

  TPatient = class(TDomain)
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
    photo: TMemoryStream;

    constructor Create();
    destructor Destroy; override;

    procedure Update(); override;
    procedure Insert(); override;
    procedure Delete(); override;

    procedure Update2();

    property age: string read FAge;
  end;

  TMedicalRecord = class(TDomain)
  public
    id: Integer;
    patientId: Integer;
    mrType: Integer;    //1: 门诊病历 2：住院病历 3：体检病历 4：其他病历
    birthday: string;
    hospital: string;
    mrRecord: string;
    treatment: string;
    seeTime: string;
    publishTime: string;
    updateTime: string;

    constructor Create(id: Integer);

    procedure Update(); override;
    procedure Insert(); override;
    procedure Delete(); override;

    procedure One();
    procedure Find();

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
var s: TMemoryStream;
begin
  id := 0;

  //photo := TMemoryStream.Create;

  Tab := Database.GetTable('select id, name, sex, blood, birthday, address, ' +
      ' tel, mobile, patientCondition, headImage, photo' +
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
    s := Tab.FieldAsBlob(10);
    s.Position := 0;
    photo := s;
    //ShowMessage(IntToStr(s.Size));
  end;
end;

destructor TPatient.Destroy;
begin
  photo.Free;
  inherited;
end;

procedure TPatient.Delete;
begin

end;

procedure TPatient.Insert;
begin

end;

procedure TPatient.Update2;
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

procedure TPatient.Update();
var
  sql: string;
  fs: TFileStream;
  buffer: TBytes;
  len: Integer;
begin
  sql := 'update patient set name=:name, sex=:sex, birthday=:birthday, blood=:blood, ' +
         'tel=:tel, mobile=:mobile, email=:email, headImage=:headImage, ' +
         'patientCondition=:patientCondition, address=:address, photo=:photo ' +
         'where id = :id';

  len := patient.photo.Size;
  patient.photo.Position := 0;
  setlength(buffer, len);
  patient.photo.ReadBuffer(buffer[0], len);

  Database.AddParamInt(':id', patient.id);
  Database.AddParamText(':name', patient.name);
  Database.AddParamText(':birthday', patient.birthday);
  Database.AddParamText(':sex', patient.sex);
  Database.AddParamText(':blood', patient.blood);
  Database.AddParamText(':tel', patient.tel);
  Database.AddParamText(':mobile', patient.mobile);
  Database.AddParamText(':email', patient.email);
  Database.AddParamText(':headImage', patient.headImage);
  Database.AddParamText(':patientCondition', patient.patientCondition);
  Database.AddParamText(':address', patient.address);
  Database.AddParamBlobPtr(':photo', Pointer(buffer), len);

  try
    Database.ExecSQL(sql);
  finally
    patient.photo.Position := 0;
    buffer := nil;
  end;
end;

{ TMedicalRecord }

constructor TMedicalRecord.Create(id: Integer);
begin
  //
end;

procedure TMedicalRecord.Delete;
begin
  //
end;

procedure TMedicalRecord.Find;
begin
  Tab := Database.GetTable('select id, name, sex, blood, birthday, address, ' +
      ' tel, mobile, patientCondition, headImage, photo' +
      ' from patient where id <> 0');
end;

procedure TMedicalRecord.Insert;
begin
  //
end;

procedure TMedicalRecord.One;
begin

end;

procedure TMedicalRecord.Update;
begin
  //
end;

end.
