object Form1: TForm1
  Left = 218
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 165
  ClientWidth = 335
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tmr1: TTimer
    Interval = 1
    OnTimer = tmr1Timer
  end
end
