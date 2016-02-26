object FrmPPTTime: TFrmPPTTime
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderStyle = bsToolWindow
  Caption = #28436#31034#29992#35745#26102#22120
  ClientHeight = 123
  ClientWidth = 233
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitle: TLabel
    Left = 0
    Top = 2
    Width = 3
    Height = 13
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300
    OnTimer = Timer1Timer
    Left = 16
    Top = 16
  end
end
