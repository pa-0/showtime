unit PPTTimeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OSSFiles, ApConst, GVCtrls, ExtCtrls, StdCtrls, ErpTools, DateUtils;

type
  TFrmPPTTime = class(TForm)
    Timer1: TTimer;
    lblTitle: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
    TimerCount: Integer;
    StartTime: TDateTime;
    procedure ResetTimer;
  public
    { Public declarations }
  end;

var
  FrmPPTTime: TFrmPPTTime;

implementation

{$R *.dfm}

procedure TFrmPPTTime.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg('您确认需要退出吗？',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes;
  if CanClose then
    Timer1.Enabled := False;
end;

procedure TFrmPPTTime.FormCreate(Sender: TObject);
begin
  StartTime := Time();
  Self.ClientHeight := 19;
  Self.Width := 120;
end;

procedure TFrmPPTTime.FormDblClick(Sender: TObject);
begin
  ResetTimer;
end;

procedure TFrmPPTTime.FormShow(Sender: TObject);
begin
  ResetTimer;
  Timer1.Enabled := True;
end;

procedure TFrmPPTTime.ResetTimer;
var
  num: Integer;
begin
  num := StrToIntDef(InputBox('倒计时器', '请输入您要计时的分钟数：', '5'), 0);
  if num > 0 then
    begin
      TimerCount := num;
      StartTime := Time();
    end
  else
    TimerCount := 0;
end;

procedure TFrmPPTTime.Timer1Timer(Sender: TObject);
var
  num1, num2: Double;
begin
  if Timer1.Tag = 0 then
  begin
    Self.Top := 4;
    Self.Left := Screen.Width - Self.Width - 2;
    Timer1.Tag := 1;
  end;
  Caption := 'Time: ' + FormatDatetime('HH:MM:SS', Time());
  if TimerCount > 0 then
  begin
    num2 := MinutesBetween(Time(), StartTime);
    num1 := TimerCount - num2;
    if num1 > 0 then
      lblTitle.Caption := Format('已过 %g 分钟', [num2])
    else
      TimerCount := 0;
  end;
  if TimerCount = 0 then
    lblTitle.Caption := Format('计时器停止！',
      [TimerCount - SecondsBetween(Time(), StartTime)]);
end;

end.
