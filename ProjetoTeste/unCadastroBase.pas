unit unCadastroBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, SqlExpr, DB, Grids, DBGrids, DBClient, DBLocal,
  DBLocalS;

type
  TfmCadastroBase = class(TForm)
    cdsProduto: TSQLClientDataSet;
    cdsProdutoID: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    gridProduto: TDBGrid;
    dsProdutos: TDataSource;
    cdsCliente: TSQLClientDataSet;
    cdsClienteID: TIntegerField;
    cdsClienteDESCRICAO: TStringField;
    gridCliente: TDBGrid;
    dsCliente: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    procedure Executa(q: TSQLClientDataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCadastroBase: TfmCadastroBase;
  qryTeste: TSQLClientDataSet;

implementation

{$R *.dfm}

procedure TfmCadastroBase.FormCreate(Sender: TObject);
begin
  cdsProduto.Open;
  cdsCliente.Open;
end;

procedure TfmCadastroBase.Executa(q: TSQLClientDataSet);
begin
  qryTeste := q;
end;

end.
