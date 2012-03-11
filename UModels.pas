unit UModels;

interface

uses
  System.SysUtils, System.DateUtils, System.Classes, Vcl.Dialogs;

const ExamName: array[0..9] of string = (
  '心电图', '心血管造影', 'B超', 'X光检查', 'MR/DR', 'CT',
  '核磁', 'PED-CI', '病理', '其它');

type
  TDomain = class
  public
    procedure Update(); virtual; abstract;
    function Insert(): Integer; virtual; abstract;
    procedure Delete(); virtual; abstract;
  end;

  // 病人模型表
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
    function  Insert(): Integer; override;
    procedure Delete(); override;

    procedure Update2();

    property age: string read FAge;
  end;

  //病历记录模型
  TMedicalRecord = class(TDomain)
  private
    function FmrTypeName(): string;
  public
    id: Integer;
    patientId: Integer;
    hospital: string;
    mrType: Integer;    //1: 门诊病历 2：住院病历 3：体检病历 4：其他病历
    mrRecord: string;
    treatment: string;
    seeTime: string;
    publishTime: string;
    updateTime: string;

    property mrTypeName: string read FmrTypeName;

    constructor Create();

    procedure Update(); override;
    function  Insert(): Integer; override;
    procedure Delete(); override;

    class procedure One(id: Integer); static;
    class procedure FindAll(); static;

  end;

  //病历记录--检查项目模型
  TMedicalExam = class(TDomain)
  public
    id: Integer;
    med_id: Integer;
    exam_name: string;
    exam_value: string;

    constructor Create();

    procedure Update(); override;
    function  Insert(): Integer; override;
    procedure Delete(); override;

    class procedure InitAll(medId: Integer); static;
    class procedure FindAll(medId: Integer); static;
    class procedure UpdateAll(medId: Integer; examList: TStrings); static;
  end;

  //病历记录--检验项目模型
  TMedicalLis = class(TDomain)
  public
    id: Integer;
    med_id: Integer;
    lis_name: string;
    lis_value: string;
    positive: Integer;

    constructor Create();

    procedure Update(); override;
    function  Insert(): Integer; override;
    procedure Delete(); override;

    class procedure InitAll(medId: Integer); static;
    class procedure FindAll(medId: Integer); static;
    class procedure FindPositive(); static;
  end;

  function GetMRTypeName(mrType: Integer): string;
implementation

{ TPatient }

Uses
  UDB;

function GetMRTypeName(mrType: Integer): string;
var r: string;
begin
  case mrType of
    1: r := '门诊病历';
    2: r := '住院病历';
    3: r := '体检病历';
    4: r := '其他病历';
  end;
  result := r;
end;

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

  Tab := db.GetTable('select id, name, sex, blood, birthday, address, ' +
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

function TPatient.Insert: Integer;
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
  db.ExecSQL(sql);
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

  db.AddParamInt(':id', patient.id);
  db.AddParamText(':name', patient.name);
  db.AddParamText(':birthday', patient.birthday);
  db.AddParamText(':sex', patient.sex);
  db.AddParamText(':blood', patient.blood);
  db.AddParamText(':tel', patient.tel);
  db.AddParamText(':mobile', patient.mobile);
  db.AddParamText(':email', patient.email);
  db.AddParamText(':headImage', patient.headImage);
  db.AddParamText(':patientCondition', patient.patientCondition);
  db.AddParamText(':address', patient.address);
  db.AddParamBlobPtr(':photo', Pointer(buffer), len);

  try
    db.ExecSQL(sql);
  finally
    patient.photo.Position := 0;
    buffer := nil;
  end;
end;

{ TMedicalRecord }

function TMedicalRecord.FmrTypeName(): string;
begin
  GetMRTypeName(mrType);
end;

constructor TMedicalRecord.Create();
begin
  //
end;

procedure TMedicalRecord.Delete;
var sql: string;
begin
  db.AddParamInt(':id', id);
  sql := 'delete from medicalrecord where id = :id';
  db.ExecSQL(sql);
end;

function TMedicalRecord.Insert: Integer;
var sql: string;
begin
  sql := 'insert into medicalrecord(patientId, hospital, type, record, treatment, ' +
         'seeTime, updateTime, publishTime) ' +
         'values(:patientId, :hospital, :mrtype, :mrrecord, :treatment, ' +
         ':seeTime, :updateTime, :publishTime)';

  db.AddParamInt(':patientId', patientId);
  db.AddParamText(':hospital', hospital);
  db.AddParamInt(':mrtype', mrtype);
  db.AddParamText(':mrrecord', mrrecord);
  db.AddParamText(':treatment', treatment);
  db.AddParamText(':seeTime', seeTime);
  db.AddParamText(':updateTime', updateTime);
  db.AddParamText(':publishTime', publishTime);

  try
    db.ExecSQL(sql);
    result := db.LastInsertRowID;
    TMedicalExam.InitAll(db.LastInsertRowID);
    ShowMessage('成功保存病历记录!');
  except
    ShowMessage('保存病历记录失败！');
    raise;
  end;
end;

procedure TMedicalRecord.Update;
var
  sql: string;
  fs: TFileStream;
  buffer: TBytes;
  len: Integer;
begin
  sql := 'update medicalrecord set patientId=:patientId, hospital=:hospital, ' +
         'type=:mrtype, record=:mrrecord, treatment=:treatment,  ' +
         'seeTime=:seeTime, updateTime=:updateTime ' +
         'where id = :id';

  db.AddParamInt(':id', id);
  db.AddParamInt(':patientId', patientId);
  db.AddParamText(':hospital', hospital);
  db.AddParamInt(':mrtype', mrtype);
  db.AddParamText(':mrrecord', mrrecord);
  db.AddParamText(':treatment', treatment);
  db.AddParamText(':seeTime', seeTime);
  db.AddParamText(':updateTime', updateTime);

  try
    db.ExecSQL(sql);
    ShowMessage('成功保存病历记录!');
  except
    ShowMessage('保存病历记录失败！');
    raise;
  end;
end;

class procedure TMedicalRecord.FindAll();
begin
  Tab := db.GetTable('select id, type, hospital, record, treatment, ' +
          'seeTime, updateTime, publishTime, patientId ' +
          'from medicalrecord order by seeTime desc');
end;

class procedure TMedicalRecord.One(id: Integer);
begin
  Tab := db.GetTable('select * from medicalrecord where id =' + IntToStr(id));
end;

{ TMedicalExam }

constructor TMedicalExam.Create;
begin
 //
end;

procedure TMedicalExam.Delete;
begin
  //
end;

class procedure TMedicalExam.FindAll(medId: Integer);
begin
  Tab := db.GetTable('select id, med_id, exam_name, exam_value ' +
          'from medicalexam where med_id=' + IntToStr(medId));
end;

class procedure TMedicalExam.InitAll(medId: Integer);
var
  I: Integer;
  sql: string;
  exam: TMedicalExam;
begin
  exam := TMedicalExam.Create;
  for I := Low(ExamName) to High(ExamName) do
  begin
    exam.med_id := medId;
    exam.exam_name := ExamName[I];
    exam.exam_value := '';
    exam.Insert;
  end;
end;

class procedure TMedicalExam.UpdateAll(medId: Integer; examList: TStrings);
var
  I: Integer;
  sql: string;
  exam: TMedicalExam;
begin
  exam := TMedicalExam.Create;
  for I := 0 to examList.Count - 1 do
  begin
    exam.med_id := medId;
    exam.exam_name := examList.Names[i];
    exam.exam_value := examList.Values[exam.exam_name];
    exam.Update;
  end;
end;

function TMedicalExam.Insert: Integer;
var sql: string;
begin
  sql := 'insert into medicalexam(med_id, exam_name, exam_value) ' +
         'values(:med_id, :exam_name, :exam_value)';

  db.AddParamInt(':med_id', med_id);
  db.AddParamText(':exam_name', exam_name);
  db.AddParamText(':exam_value', exam_value);

  try
    db.ExecSQL(sql);
    result := db.LastInsertRowID;
  except
    raise;
  end;
end;

procedure TMedicalExam.Update;
var sql: string;
begin
  sql := 'update medicalexam set exam_value = :exam_value ' +
         'where med_id=:med_id and exam_name=:exam_name';

  db.AddParamInt(':med_id', med_id);
  db.AddParamText(':exam_name', exam_name);
  db.AddParamText(':exam_value', exam_value);

  try
    db.ExecSQL(sql);
  except
    raise;
  end;
end;



{ TMedicalLis }

constructor TMedicalLis.Create;
begin
  //
end;

function TMedicalLis.Insert: Integer;
var sql: string;
begin
  sql := 'insert into medicallis(med_id, lis_name, lis_value, positive) ' +
         'values(:med_id, :lis_name, :lis_value, :positive)';

  db.AddParamInt(':med_id', med_id);
  db.AddParamText(':lis_name', lis_name);
  db.AddParamText(':lis_value', lis_value);
  db.AddParamInt(':positive', positive);

  try
    db.ExecSQL(sql);
    result := db.LastInsertRowID;
  except
    raise;
  end;
end;

procedure TMedicalLis.Update;
begin

end;

procedure TMedicalLis.Delete;
begin
  //
end;

class procedure TMedicalLis.FindAll(medId: Integer);
begin
  Tab := db.GetTable('select id, med_id, lis_name, lis_value, positive ' +
          'from medicallis where med_id=' + IntToStr(medId));
end;

class procedure TMedicalLis.FindPositive();
begin
  Tab := db.GetTable('select lis_name, count(*) as positive_count ' +
          'from medicallis where positive=1 group by lis_name order by 2 desc');
end;

class procedure TMedicalLis.InitAll(medId: Integer);
begin

end;


end.
