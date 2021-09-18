unit dmPrincipal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr;

type
  TdtmPrincipal = class(TDataModule)
    SQLConnection: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}

end.
