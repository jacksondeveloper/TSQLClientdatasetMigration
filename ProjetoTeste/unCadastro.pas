unit unCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, unCadastroBase, Provider, SqlExpr, DB, DBClient, DBLocal,
  DBLocalS, Grids, DBGrids;

type
  TfmCadastro = class(TfmCadastroBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCadastro: TfmCadastro;

implementation

uses
  dmPrincipal;

{$R *.dfm}

end.
