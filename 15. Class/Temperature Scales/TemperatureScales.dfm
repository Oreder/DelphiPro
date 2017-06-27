object Form1: TForm1
  Left = 1013
  Top = 178
  Width = 233
  Height = 208
  Caption = 'Temperature Scales'
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 201
    Height = 19
    Caption = ' Temperature in Celsius scale '
    Color = clHighlightText
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 112
    Width = 71
    Height = 19
    Caption = 'Fahrenhiet  '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 80
    Width = 205
    Height = 19
    Caption = 'Temperature Scales (degrees):'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 144
    Width = 54
    Height = 19
    Caption = 'Reaumur'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 88
    Top = 144
    Width = 52
    Height = 15
    BiDiMode = bdRightToLeft
    Caption = '(degrees)'
    Color = clWindow
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 88
    Top = 112
    Width = 52
    Height = 15
    BiDiMode = bdRightToLeft
    Caption = '(degrees)'
    Color = clWindow
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGray
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object Button1: TButton
    Left = 136
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Enter'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 40
    Width = 113
    Height = 21
    BiDiMode = bdRightToLeft
    HideSelection = False
    ParentBiDiMode = False
    TabOrder = 1
  end
end
