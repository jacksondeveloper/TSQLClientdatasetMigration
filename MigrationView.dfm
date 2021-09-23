object frMigrationView: TfrMigrationView
  Left = 331
  Top = 241
  BorderStyle = bsSingle
  Caption = 'TSQLClientdatasetMigration'
  ClientHeight = 366
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 14
    Width = 102
    Height = 13
    Caption = 'Diret'#243'rio dos arquivos'
  end
  object Label2: TLabel
    Left = 10
    Top = 70
    Width = 18
    Height = 13
    Caption = 'Log'
  end
  object edDiretorio: TEdit
    Left = 10
    Top = 37
    Width = 579
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'C:\Users\jack\Desktop\TSQLClientdatasetMigration\ProjetoTeste'
  end
  object btAbrirPasta: TButton
    Left = 596
    Top = 38
    Width = 41
    Height = 25
    Caption = ' >> '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object mmLog: TMemo
    Left = 10
    Top = 96
    Width = 631
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btProcessar: TButton
    Left = 280
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Processar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btProcessarClick
  end
end
