unit Conversor;

interface

uses
  SysUtils, Classes, MigrationTipos, Uteis;

type

  IConversor = interface
    ['{2716246B-B753-47BF-B8D1-364FB29EA708}']
    procedure Substituir(ListaArquivos: TStringList; ComponentConexao: String);
  end;

  TConversor = class(TInterfacedObject, IConversor)
  private
    FEvLog: TEvLog;
    procedure DoLog(Value: String);
  public
    constructor Create(EvLog: TEvLog); reintroduce;
    destructor Destroy; override;
    class function New(EvLog: TEvLog): IConversor;
    procedure Substituir(ListaArquivos: TStringList; ComponentConexao: String);
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

procedure TConversor.Substituir(ListaArquivos: TStringList; ComponentConexao: String);
var
  Arquivo: TStringList;
  Contador, Contador2, Contador3: Integer;
  ArquivoFoiAlterado: Boolean;
  NomeCdsAtual, EspacosIdentacao: string;
  NomeNovoProvider, NomeNovaQuery: String;
  ComponenteQuery, ComponenteProvider: String;
  PropriedadeCds: String;
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
        NomeCdsAtual := '';
        EspacosIdentacao := '';

        if Pos(SQLClientDataSetObjName, Arquivo.Strings[Contador2]) > 0 then
        begin

          if LowerCase(ExtractFileExt(ListaArquivos[Contador])) = '.pas' then
          begin
            {

            PAS

            SQLQuery1: TSQLQuery;
            DataSetProvider1: TDataSetProvider;
            ClientDataSet1: TClientDataSet;

            }

            NomeCdsAtual := Trim(Copy(Arquivo.Strings[Contador2], 0, Pos(':', Arquivo.Strings[Contador2]) - 1));
            EspacosIdentacao := Copy(Arquivo.Strings[Contador2], 0, PosicaoPrimeiroCaracter(Arquivo.Strings[Contador2]) - 1);
            ArquivoFoiAlterado := True;

            // Troca TSQLClientDataSet para ClientDataSet
            Arquivo.Strings[Contador2] := StringReplace(Arquivo.Strings[Contador2], SQLClientDataSetObjName, ClientDataSetObjName, [rfReplaceAll, rfIgnoreCase]);

            // Adiciona provider novo
            NomeNovoProvider := EspacosIdentacao + PrefixoDataSetProvider + NomeCdsAtual + ': ' + DataSetProviderObjName + ';';
            Arquivo.Insert(Contador2 + 1,  NomeNovoProvider);

            // Adiciona query nova
            NomeNovaQuery := EspacosIdentacao + PrefixoQuery + NomeCdsAtual + ': ' + QueryObjName + ';';
            Arquivo.Insert(Contador2 + 2,  NomeNovaQuery);
            
          end
          else
          begin

            NomeCdsAtual := Trim(Copy(Arquivo.Strings[Contador2], 0, Pos(':', Arquivo.Strings[Contador2]) - 1));
            EspacosIdentacao := Copy(Arquivo.Strings[Contador2], 0, PosicaoPrimeiroCaracter(Arquivo.Strings[Contador2]) - 1);
            NomeCdsAtual := Trim(StringReplace(NomeCdsAtual, 'object', '', [rfIgnoreCase]));
            ArquivoFoiAlterado := True;

            // Troca TSQLClientDataSet para ClientDataSet
            Arquivo.Strings[Contador2] := StringReplace(Arquivo.Strings[Contador2], SQLClientDataSetObjName, ClientDataSetObjName, [rfReplaceAll, rfIgnoreCase]);
            // Insere provider no clientdaset
            Arquivo.Insert(Contador2 + 1, EspacosIdentacao + '  ProviderName = ' + QuotedStr(PrefixoDataSetProvider + NomeCdsAtual));

            // Adiciona query nova
            NomeNovaQuery := PrefixoQuery + NomeCdsAtual;
            ComponenteQuery := '';
            ComponenteQuery := EspacosIdentacao + 'object ' + NomeNovaQuery + ': ' + QueryObjName + sLineBreak +
                               EspacosIdentacao + '  NoMetadata = True' + sLineBreak +
                               EspacosIdentacao + '  SQLConnection = ' + ComponentConexao + sLineBreak +
                               EspacosIdentacao + '  Params = <>' + sLineBreak +
                               EspacosIdentacao + '  Left = 0' + sLineBreak +
                               EspacosIdentacao + '  Top = 112' + sLineBreak +
                               EspacosIdentacao + 'end';
            Arquivo.Insert(Contador2, ComponenteQuery);

            // Adiciona provider novo
            ComponenteProvider := '';
            ComponenteProvider := EspacosIdentacao + 'object ' + PrefixoDataSetProvider + NomeCdsAtual + ': ' + DataSetProviderObjName + sLineBreak +
                                  EspacosIdentacao + '  DataSet = ' + NomeNovaQuery + sLineBreak +
                                  EspacosIdentacao + '  Constraints = True' + sLineBreak +
                                  EspacosIdentacao + '  Left = 0' + sLineBreak +
                                  EspacosIdentacao + '  Top = 120' + sLineBreak +
                                  EspacosIdentacao + 'end';
            Arquivo.Insert(Contador2, ComponenteProvider);  

            // Todo - remover propriedade options no sqlclientdataset
            // Todo - remover propriedade de conexao no sqlclientdataset
            // Todo - left e top dos componentes novo baseados no sqlclientdataset atual
            // Todo - no provider novo colocar o allowcomandtext

            {

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
