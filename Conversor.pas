unit Conversor;

interface

uses
  Classes, MigrationTipos;

type

  IConversor = interface
    ['{2716246B-B753-47BF-B8D1-364FB29EA708}']
    procedure Substituir(ListaArquivos: TStringList);
  end;

  TConversor = class(TInterfacedObject, IConversor)
  private
    FEvLog: TEvLog;
    procedure DoLog(Value: String);
  public
    constructor Create(EvLog: TEvLog); reintroduce;
    destructor Destroy; override;
    class function New(EvLog: TEvLog): IConversor;
    procedure Substituir(ListaArquivos: TStringList);
  end;

implementation

{ TConversor }

constructor TConversor.Create(EvLog: TEvLog);
begin
  FEvLog := EvLog;
end;

destructor TConversor.Destroy;
begin

  inherited;
end;

procedure TConversor.DoLog(Value: String);
begin
  if Assigned(FEvLog) then
    FEvLog(Value);
end;

class function TConversor.New(EvLog: TEvLog): IConversor;
begin
  Result := Self.Create(EvLog);
end;

procedure TConversor.Substituir(ListaArquivos: TStringList);
begin
  DoLog('Substituição iniciada...');

  

  DoLog('Substituição finalizada.');
end;

end.
