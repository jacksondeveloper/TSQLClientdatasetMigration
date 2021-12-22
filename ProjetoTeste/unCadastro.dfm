inherited fmCadastro: TfmCadastro
  Caption = 'fmCadastro'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited gridProduto: TDBGrid
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
  inherited gridCliente: TDBGrid
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
  inherited cdsProduto: TSQLClientDataSet
    CommandText = 'select * from CLIENTE'
  end
  inherited cdsCliente: TSQLClientDataSet
    CommandText = 'select * from PRODUTOS'
  end
end
