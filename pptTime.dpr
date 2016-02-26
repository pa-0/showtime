program pptTime;

uses
  Forms,
  PPTTimeFrm in 'PPTTimeFrm.pas' {FrmPPTTime};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPPTTime, FrmPPTTime);
  Application.Run;
end.
