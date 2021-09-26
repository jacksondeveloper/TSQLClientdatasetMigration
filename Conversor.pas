unit Conversor;

interface

uses
  SysUtils, Classes, MigrationTipos;

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
var
  Arquivo: TStringList;
  Contador, Contador2: Integer;
  ArquivoFoiAlterado: Boolean;
begin
  DoLog('Substituição iniciada...');

  for Contador := 0 to Pred(ListaArquivos.Count) do
  begin

    Arquivo := TStringList.Create;
    try

      Arquivo.LoadFromFile(ListaArquivos[Contador]);
      ArquivoFoiAlterado := False;

      for Contador2 := 0 to Pred(Arquivo.Count) do
      begin
        if Pos(SQLClientDataSetObjName, Arquivo.Strings[Contador2]) > 0 then
        begin
          ArquivoFoiAlterado := True;
          Arquivo.Strings[Contador2] := StringReplace(Arquivo.Strings[Contador2], SQLClientDataSetObjName, ClientDataSetObjName, [rfReplaceAll, rfIgnoreCase]);
          DoLog(ExtractFileName(ListaArquivos[Contador]) + ' -> ' + Arquivo.Strings[Contador2] + ' -> ' + Arquivo.Strings[Contador2]);

          // Todo - Adcionar os componentes de query e provider aqui
          {

          PAS

          SQLQuery1: TSQLQuery;
          DataSetProvider1: TDataSetProvider;
          ClientDataSet1: TClientDataSet;

          DFM

          object SQLQuery1: TSQLQuery
            NoMetadata = True
            SQLConnection = SQLConnection1
            Params = <>
            Left = 384
            Top = 112
          end
          object DataSetProvider1: TDataSetProvider
            DataSet = SQLQuery1
            Constraints = True
            Left = 440
            Top = 120
          end
          object ClientDataSet1: TClientDataSet
            Aggregates = <>
            CommandText = 'select * from teste'
            Params = <>
            ProviderName = 'DataSetProvider1'
            Left = 512
            Top = 112
          end
          }
        end;
      end;

      if ArquivoFoiAlterado then
        Arquivo.SaveToFile(ListaArquivos[Contador]);

    finally
      FreeAndNil(Arquivo);
    end;

  end;

  DoLog('Substituição finalizada.');
end;

end.
