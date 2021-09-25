object fmPrincipal: TfmPrincipal
  Left = 310
  Top = 186
  BorderStyle = bsSingle
  Caption = 'Projeto Teste'
  ClientHeight = 257
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gridProduto: TDBGrid
    Left = 88
    Top = 16
    Width = 577
    Height = 97
    DataSource = dsProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end>
  end
  object gridCliente: TDBGrid
    Left = 88
    Top = 136
    Width = 577
    Height = 97
    DataSource = dsCliente
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end>
  end
  object cdsProduto: TClientDataSet
    CommandText = 'select * from CLIENTE'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = dtmPrincipal.SQLConnection
    Left = 32
    Top = 16
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dsProdutos: TDataSource
    DataSet = cdsProduto
    Left = 16
    Top = 56
  end
  object cdsCliente: TClientDataSet
    CommandText = 'select * from CLIENTE'
    Aggregates = <>
    Options = [poAllowCommandText]
    ObjectView = True
    Params = <>
    DBConnection = dtmPrincipal.SQLConnection
    Left = 48
    Top = 128
    object cdsClienteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsClienteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 24
    Top = 176
  end
end
