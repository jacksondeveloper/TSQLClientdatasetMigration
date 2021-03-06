unit Configuracoes;

interface

uses
  SysUtils, IniFiles;

type

  iConfiguracoes = interface
    ['{CF210A53-B849-433B-89D0-6A655C3F0A62}']
    function GetDiretorio: String;
    procedure SetDiretorio(Value: String);
    procedure SalvarConfiguracoes;
  end;

  TConfiguracoes = class(TInterfacedObject, iConfiguracoes)
  private
    FArquivo: TIniFile;
    FDiretorio: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConfiguracoes;
    function GetDiretorio: String;
    procedure SetDiretorio(Value: String);
    procedure SalvarConfiguracoes;
  end;

implementation

{ TConfiguracoes }

constructor TConfiguracoes.Create;
begin
  FArquivo := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Configuracoes.ini');

  if FArquivo.ReadString('Configuracao', 'Diretorio', '') <> EmptyStr then
    FDiretorio := FArquivo.ReadString('Configuracao', 'Diretorio', '')
  else
    FDiretorio := ExtractFilePath(ParamStr(0)) + 'ProjetoTeste';
end;

destructor TConfiguracoes.Destroy;
begin
  FreeAndNil(FArquivo);
  inherited;
end;

function TConfiguracoes.GetDiretorio: String;
begin
  Result := FDiretorio;
end;

class function TConfiguracoes.New: iConfiguracoes;
begin
  Result := Self.Create;
end;

procedure TConfiguracoes.SalvarConfiguracoes;
begin
  FArquivo.WriteString('Configuracao', 'Diretorio', FDiretorio);
end;

procedure TConfiguracoes.SetDiretorio(Value: String);
begin
  FDiretorio := Value;
end;

end.
 