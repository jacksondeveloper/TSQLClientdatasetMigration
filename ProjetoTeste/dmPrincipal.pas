unit dmPrincipal;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr;

type
  TdtmPrincipal = class(TDataModule)
    SQLConnection: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPrincipal: TdtmPrincipal;

implementation

{$R *.dfm}

procedure TdtmPrincipal.DataModuleCreate(Sender: TObject);
begin
  SQLConnection.Params.Values['Database'] := ExtractFilePath(ParamStr(0)) + '\Dados\DADOS.FDB';
  dtmPrincipal.SQLConnection.Connected := True;
end;

end.
