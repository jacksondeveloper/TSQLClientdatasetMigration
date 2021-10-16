unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, SqlExpr, Grids, DBGrids, DB, DBClient, DBLocal,
  DBLocalS, dmPrincipal;

type
  TfmPrincipal = class(TForm)
    cdsProduto: TSQLClientDataSet;
    dsProdutos: TDataSource;
    gridProduto: TDBGrid;
    gridCliente: TDBGrid;
    cdsCliente: TSQLClientDataSet;
    dsCliente: TDataSource;
    cdsProdutoID: TIntegerField;
    cdsProdutoDESCRICAO: TStringField;
    cdsClienteID: TIntegerField;
    cdsClienteDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Executa(q: TSQLClientDataSet);
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;
  qryTeste: TSQLClientDataSet;

implementation

{$R *.dfm}

procedure TfmPrincipal.Executa(q: TSQLClientDataSet);
begin
  qryTeste := q;
end;

procedure TfmPrincipal.FormCreate(Sender: TObject);
begin
  cdsProduto.Open;
  cdsCliente.Open;
end;

end.
