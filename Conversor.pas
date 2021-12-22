unit Conversor;

interface

uses
  SysUtils, Classes, MigrationTipos, Uteis, Forms;

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
  ArquivoFDM, ArquivoPAS: TStringList;
  Contador, Contador2, Contador3, LinhaPAS: Integer;
  ArquivoPASFoiAlterado, ArquivoDFMFoiAlterado, EhHeranca: Boolean;
  NomeCdsAtual, EspacosIdentacao: string;
  NomeNovoProvider, NomeNovaQuery: String;
  ComponenteQuery, ComponenteProvider: String;
  PropriedadeCds, ConnectionAtual, OptionsAtual: String;
  NomeArquivoPAS: String;
  LeftAtual, TopAtual: Integer;
begin
  DoLog('Substituição iniciada...');

  for Contador := 0 to Pred(ListaArquivos.Count) do
  begin
    Application.ProcessMessages;

    // Só substitui TSQClientDataSets que são visuais
    if not (LowerCase(ExtractFileExt(ListaArquivos[Contador])) = '.dfm') then
      Continue;

    ArquivoFDM := TStringList.Create;
    try
      // Inicializa variaveis
      ArquivoPASFoiAlterado := False;
      ArquivoDFMFoiAlterado := False;
      NomeArquivoPAS := '';

      // Carregar arquivo DFM
      ArquivoFDM.LoadFromFile(ListaArquivos[Contador]);

      for Contador2 := 0 to Pred(ArquivoFDM.Count) do
      begin

        // Inicializa variaveis
        NomeCdsAtual := '';
        EspacosIdentacao := '';
        EhHeranca := False;

        // Se encontrou um TSQLClientDataSet
        if Pos(SQLClientDataSetObjName, ArquivoFDM[Contador2]) > 0 then
        begin

          if Pos('inherited', ArquivoFDM.Strings[Contador2]) > 0 then
            EhHeranca := True
          else
            EhHeranca := False;

          // Busca nomes e identação dos componentes encontrados
          NomeCdsAtual := Trim(Copy(ArquivoFDM.Strings[Contador2], 0, Pos(':', ArquivoFDM.Strings[Contador2]) - 1));
          EspacosIdentacao := Copy(ArquivoFDM.Strings[Contador2], 0, PosicaoPrimeiroCaracter(ArquivoFDM.Strings[Contador2]) - 1);
          NomeCdsAtual := Trim(StringReplace(NomeCdsAtual, 'object', '', [rfIgnoreCase]));
          ArquivoDFMFoiAlterado := True;

          // Troca TSQLClientDataSet para ClientDataSet
          ArquivoFDM.Strings[Contador2] := StringReplace(ArquivoFDM.Strings[Contador2], SQLClientDataSetObjName, ClientDataSetObjName, [rfReplaceAll, rfIgnoreCase]);

          if not EhHeranca then
          begin

            // Insere provider no clientdaset
            ArquivoFDM.Insert(Contador2 + 1, EspacosIdentacao + '  ProviderName = ' + QuotedStr(PrefixoDataSetProvider + NomeCdsAtual));

            // Deleta e pegar propriedades do clientdataset atual
            Contador3 := Contador2;
            while ArquivoFDM.Strings[Contador3] <> (EspacosIdentacao + 'end') do
            begin
              Inc(Contador3);

              PropriedadeCds := Trim(ArquivoFDM.Strings[Contador3]);

              if Pos('Options = ', PropriedadeCds) > 0 then
                OptionsAtual := Trim(Copy(PropriedadeCds, Pos('=', PropriedadeCds) + 1, Length(PropriedadeCds)));

              if Pos('Options = ', PropriedadeCds) > 0 then
                ArquivoFDM.Delete(Contador3);

              if Pos('DBConnection = ', PropriedadeCds) > 0 then
                ConnectionAtual := Trim(Copy(PropriedadeCds, Pos('=', PropriedadeCds) + 1, Length(PropriedadeCds)));

              if Pos('DBConnection = ', PropriedadeCds) > 0 then
                ArquivoFDM.Delete(Contador3);

              if Pos('Left = ', PropriedadeCds) > 0 then
                LeftAtual := StrToInt(Trim(Copy(PropriedadeCds, Pos('=', PropriedadeCds) + 1, Length(PropriedadeCds))));

              if Pos('Top = ', PropriedadeCds) > 0 then
                TopAtual := StrToInt(Trim(Copy(PropriedadeCds, Pos('=', PropriedadeCds) + 1, Length(PropriedadeCds))));

            end;

            // Adiciona query nova
            NomeNovaQuery := PrefixoQuery + NomeCdsAtual;
            ComponenteQuery := '';
            ComponenteQuery := EspacosIdentacao + 'object ' + NomeNovaQuery + ': ' + QueryObjName + sLineBreak +
                               EspacosIdentacao + '  NoMetadata = True' + sLineBreak +
                               EspacosIdentacao + '  SQLConnection = ' + ConnectionAtual + sLineBreak +
                               EspacosIdentacao + '  Params = <>' + sLineBreak +
                               EspacosIdentacao + '  Left = ' + IntToStr(LeftAtual + 40) + sLineBreak +
                               EspacosIdentacao + '  Top = ' + IntToStr(TopAtual) + sLineBreak +
                               EspacosIdentacao + 'end';
            ArquivoFDM.Insert(Contador2, ComponenteQuery);
            LeftAtual := LeftAtual + 40;

            // Adiciona provider novo
            ComponenteProvider := '';
            ComponenteProvider := EspacosIdentacao + 'object ' + PrefixoDataSetProvider + NomeCdsAtual + ': ' + DataSetProviderObjName + sLineBreak +
                                  EspacosIdentacao + '  DataSet = ' + NomeNovaQuery + sLineBreak +
                                  EspacosIdentacao + '  Constraints = True' + sLineBreak +
                                  EspacosIdentacao + '  Options = ' + OptionsAtual + sLineBreak +
                                  EspacosIdentacao + '  Left = ' + IntToStr(LeftAtual + 40) + sLineBreak +
                                  EspacosIdentacao + '  Top = ' + IntToStr(TopAtual) + sLineBreak +
                                  EspacosIdentacao + 'end';
            ArquivoFDM.Insert(Contador2, ComponenteProvider);

            // Altera no PAS
            ArquivoPAS := TStringList.Create;
            try
              NomeArquivoPAS := Copy(ListaArquivos[Contador], 0, Length(ListaArquivos[Contador]) - 4) + '.pas';
              ArquivoPAS.LoadFromFile(NomeArquivoPAS);

              for LinhaPAS := 0 to Pred(ArquivoPAS.Count) do
              begin
                if Pos(NomeCdsAtual, ArquivoPAS[LinhaPAS]) > 0 then
                begin
                  EspacosIdentacao := Copy(ArquivoPAS.Strings[LinhaPAS], 0, PosicaoPrimeiroCaracter(ArquivoPAS.Strings[LinhaPAS]) - 1);
                  ArquivoPasFoiAlterado := True;

                  // Troca TSQLClientDataSet para ClientDataSet
                  ArquivoPAS.Strings[LinhaPAS] := StringReplace(ArquivoPAS.Strings[LinhaPAS], SQLClientDataSetObjName, ClientDataSetObjName, [rfReplaceAll, rfIgnoreCase]);

                  // Adiciona provider novo
                  NomeNovoProvider := EspacosIdentacao + PrefixoDataSetProvider + NomeCdsAtual + ': ' + DataSetProviderObjName + ';';
                  ArquivoPAS.Insert(LinhaPAS + 1,  NomeNovoProvider);

                  // Adiciona query nova
                  NomeNovaQuery := EspacosIdentacao + PrefixoQuery + NomeCdsAtual + ': ' + QueryObjName + ';';
                  ArquivoPAS.Insert(LinhaPAS + 2,  NomeNovaQuery);

                  Break;
                end;
              end;

              if ArquivoPasFoiAlterado then
                ArquivoPAS.SaveToFile(NomeArquivoPAS);

            finally
              FreeAndNil(ArquivoPAS);
            end;

          end;
        end;
      end;

      if ArquivoDFMFoiAlterado then
        ArquivoFDM.SaveToFile(ListaArquivos[Contador]);

    finally
      FreeAndNil(ArquivoFDM);
    end;

  end;

  DoLog('Substituição finalizada.');
end;

end.
