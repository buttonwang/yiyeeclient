unit UBodyRecord;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmBodyRecord = class(TForm)
    pnl1: TPanel;
    lblHospital: TLabel;
    lblSeeTime: TLabel;
    dtpInDocTime: TDateTimePicker;
    ctrlbr1: TControlBar;
    pnl2: TPanel;
    btn2: TButton;
    btn4: TButton;
    edtTemperature: TEdit;
    shp1: TShape;
    lbl11: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    dtpHeartTime: TDateTimePicker;
    edtHeartBeat: TEdit;
    shp2: TShape;
    lbl3: TLabel;
    lbl4: TLabel;
    edtPee: TEdit;
    shp3: TShape;
    lbl6: TLabel;
    lbl5: TLabel;
    edtShit: TEdit;
    lbl7: TLabel;
    edtDrink: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl12: TLabel;
    edtBloodLowM: TEdit;
    edtBloodHighM: TEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    edtBloodLowA: TEdit;
    edtBloodHighA: TEdit;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    edtBloodLowE: TEdit;
    edtBloodHighE: TEdit;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    edtBloodSugar: TEdit;
    edtWeight: TEdit;
    dtp2: TDateTimePicker;
    procedure btn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtTemperatureKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function CheckBloodPressure(LowStr,HighStr: String;var Blood: String): Boolean;
    procedure FillBodyCase();
  public
    { Public declarations }
    body_ID: Integer;
  end;

var
  frmBodyRecord: TfrmBodyRecord;

implementation

{$R *.dfm}

uses UModels, UDB;

procedure TfrmBodyRecord.btn2Click(Sender: TObject);
var
  mr: TBodySign;
  i:Integer;
begin
  mr := TBodySign.Create;
  with mr do
  begin
    id:= body_ID;
    temperature:= Trim(edtTemperature.Text);
    tempDate:= FormatDateTime('yyyy-MM-dd',dtpInDocTime.Date);
    heartBeat:= Trim(edtHeartBeat.Text);
    heartBeatDate:= FormatDateTime('yyyy-MM-dd',dtpHeartTime.Date);
    peeVolume:= Trim(edtPee.Text);
    shitTimes:= Trim(edtShit.Text);
    drinkVolume:= Trim(edtDrink.Text);
    bloodSugar:= Trim(edtBloodSugar.Text);
    weight:= Trim(edtWeight.Text);
    bobyTime:= FormatDateTime('yyyy-MM-dd',dtp2.Date);
    SubTime:= FormatDateTime('yyyy-MM-dd hh:mm',Now);

    if temperature <> '' then
    begin
      if (StrToFloat(temperature) < 33) or (StrToFloat(temperature) > 42) then
      begin
        ShowMessage('体温必须在33-42');
        Exit;
      end;
      //if True then
    end;

    if heartBeat <> '' then
    begin
      if (StrToInt(heartBeat) < 20) or (StrToInt(heartBeat) > 200) then
      begin
        ShowMessage('脉搏必须在20-200');
        Exit;
      end;
    end;

    if peeVolume <> '' then
    begin
      if StrToInt(peeVolume) > 10000 then
      begin
        ShowMessage('小便量必须在0-10000');
        Exit;
      end;
    end;

    if shitTimes <> '' then
    begin
      if StrToInt(shitTimes) > 100 then
      begin
        ShowMessage('大便次数在0-100');
        Exit;
      end;
    end;

    if drinkVolume <> '' then
    begin
      if StrToInt(drinkVolume) > 10000 then
      begin
        ShowMessage('饮入量在0-10000');
        Exit;
      end;
    end;

    if not CheckBloodPressure(Trim(edtBloodLowM.Text),Trim(edtBloodHighM.Text),bloodPressureM) then Exit;
    if not CheckBloodPressure(Trim(edtBloodLowA.Text),Trim(edtBloodHighA.Text),bloodPressureA) then Exit;
    if not CheckBloodPressure(Trim(edtBloodLowE.Text),Trim(edtBloodHighE.Text),bloodPressureE) then Exit;

    if bloodSugar <> '' then
    begin
      if StrToInt(bloodSugar) > 100 then
      begin
        ShowMessage('血糖在0-100');
        Exit;
      end;
    end;

    if weight <> '' then
    begin
      if (StrToInt(weight) < 5) or (StrToInt(weight) > 150)then
      begin
        ShowMessage('体重在5-150');
        Exit;
      end;
    end;

    if body_ID =0 then
      Insert
    else
      Update;
  end;
end;

procedure TfrmBodyRecord.btn4Click(Sender: TObject);
begin
  Close;
end;

function TfrmBodyRecord.CheckBloodPressure(LowStr,HighStr: String;var Blood: String): Boolean; //-1如入错误，0无数据，1正确输入
begin
  Result:= False;
  if (LowStr = '')and (HighStr='') then
  begin
    Blood:='';
    Result:= True;
    Exit;
  end;
  if ((LowStr = '') and (HighStr <> '')) then
  begin
    ShowMessage('请输入低血压');
    Exit;
  end;

  if ((LowStr <> '') and (HighStr = '')) then
  begin
    ShowMessage('请输入高血压');
    Exit;
  end;

  if (StrToInt(LowStr)<30) or (StrToInt(LowStr)>140) or (StrToInt(HighStr)<30) or (StrToInt(HighStr)>140) then
  begin
    ShowMessage('血压在30-140');
    Exit;
  end;
  if StrToInt(LowStr) > StrToInt(HighStr) then
    ShowMessage('血压输入不正确')
  else
  begin
    Blood:=LowStr + '/' + HighStr;
    Result:= True;
  end;
end;

procedure TfrmBodyRecord.edtTemperatureKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9','.',#8]) then
    Key:= #0;
end;

procedure TfrmBodyRecord.FormShow(Sender: TObject);
begin
  dtpInDocTime.Date:= Date;
  dtpHeartTime.Date:= Date;
  dtp2.Date:= Date;
  if body_ID <> 0 then
    FillBodyCase;
end;

procedure TfrmBodyRecord.FillBodyCase;
var
  bM,bA,bE: String;
begin
  TBodySign.One(body_ID);
  if Tab.Row <> 0 then
  begin
    edtTemperature.Text:= Tab.FieldByName['temperature'];
    dtpInDocTime.Date:= StrToDate(Tab.FieldByName['temperatureTime']);


    edtHeartBeat.Text:= Tab.FieldByName['heartbeat'];
    dtpHeartTime.Date:= StrToDate(Tab.FieldByName['heartbeatTime']);

    edtPee.Text:= Tab.FieldByName['peeVolume'];
    edtShit.Text:= Tab.FieldByName['shitTimes'];
    edtDrink.Text:= Tab.FieldByName['drinkVolume'];

    bM:= Tab.FieldByName['bloodPressureM'];
    bA:= Tab.FieldByName['bloodPressureA'];
    bE:= Tab.FieldByName['bloodPressureE'];

    if pos('/',bM) > 0 then
    begin
      edtBloodLowM.Text:= Copy(bM,1,pos('/',bM)-1);
      edtBloodHighM.Text:= Copy(bM,pos('/',bM)+1,Length(bM));
    end;

    if pos('/',bA) > 0 then
    begin
      edtBloodLowA.Text:= Copy(bA,1,pos('/',bA)-1);
      edtBloodHighA.Text:= Copy(bA,pos('/',bA)+1,Length(bA));
    end;

    if pos('/',bE) > 0 then
    begin
      edtBloodLowE.Text:= Copy(bE,1,pos('/',bE)-1);
      edtBloodHighE.Text:= Copy(bE,pos('/',bE)+1,Length(bE));
    end;

    edtBloodSugar.Text:= Tab.FieldByName['bloodSugar'];
    edtWeight.Text:= Tab.FieldByName['weight'];
    dtp2.Date:= StrToDate(Tab.FieldByName['time']);
  end;
end;

end.
