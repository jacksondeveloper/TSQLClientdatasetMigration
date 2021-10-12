object frMigrationView: TfrMigrationView
  Left = 313
  Top = 193
  Width = 800
  Height = 525
  Caption = 'TSQLClientdatasetMigration'
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
  DesignSize = (
    784
    486)
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
    Width = 713
    Height = 28
    Anchors = [akLeft, akTop, akRight]
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
    Left = 733
    Top = 38
    Width = 41
    Height = 25
    Anchors = [akTop, akRight]
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
    Top = 88
    Width = 764
    Height = 361
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object btProcessar: TButton
    Left = 332
    Top = 456
    Width = 98
    Height = 25
    Anchors = [akRight, akBottom]
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
