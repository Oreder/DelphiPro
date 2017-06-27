object Form1: TForm1
  Left = 214
  Top = 141
  Width = 486
  Height = 231
  Caption = 'Matrix Count'
  Color = clMoneyGreen
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
    Width = 101
    Height = 19
    Caption = 'Number Column'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 192
    Top = 8
    Width = 93
    Height = 19
    Caption = ' Number Rows'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 32
    Width = 47
    Height = 19
    Caption = 'Matrix'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 240
    Top = 32
    Width = 44
    Height = 19
    Caption = 'Result'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 56
    Width = 207
    Height = 129
    ColCount = 6
    DefaultColWidth = 30
    DefaultRowHeight = 20
    RowCount = 6
    TabOrder = 0
    ColWidths = (
      30
      30
      30
      30
      30
      30)
  end
  object Button1: TButton
    Left = 368
    Top = 8
    Width = 97
    Height = 25
    Caption = 'Enter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 120
    Top = 8
    Width = 65
    Height = 25
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 296
    Top = 8
    Width = 57
    Height = 25
    TabOrder = 3
  end
  object StringGrid2: TStringGrid
    Left = 224
    Top = 56
    Width = 241
    Height = 129
    ColCount = 4
    DefaultColWidth = 36
    DefaultRowHeight = 20
    RowCount = 6
    ScrollBars = ssVertical
    TabOrder = 4
    ColWidths = (
      36
      65
      76
      40)
  end
end
