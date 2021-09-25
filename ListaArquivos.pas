unit ListaArquivos;

interface

uses
  SysUtils, Classes, MigrationTipos;

type

  IListaArquivos = Interface
    ['{D97CA252-DD28-4C15-8D5D-484963B17B7A}']
    function Carregar(Diretorio: string; PesquisarNosSubDiretorios: Boolean): TStringList;
    function GetListaArquivos: TStringList;
  end;

  TListaArquivos = class(TInterfacedObject, IListaArquivos)
  private
    FListaArquivos: TStringList;
    function TemAtributo(Attr, Val: Integer): Boolean;
    function PossuiComponente(Arquivo: String): Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IListaArquivos;
    function Carregar(Diretorio: string; PesquisarNosSubDiretorios: Boolean): TStringList;
    function GetListaArquivos: TStringList;
  end;

implementation

{ TListaArquivos }

function TListaArquivos.Carregar(Diretorio: string;  PesquisarNosSubDiretorios: Boolean): TStringList;
var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') And (F.Name <> '..') then
          if PesquisarNosSubDiretorios = True then
          begin
            TempNome := Diretorio+'\' + F.Name;
            Carregar(TempNome, True);
          end;
      end
      else
      begin
        if (ExtractFileExt(f.Name) = '.pas') or (ExtractFileExt(f.Name) = '.dfm') then
          if PossuiComponente(Diretorio + '\' + f.Name) then
          begin
            FListaArquivos.Add(Diretorio + '\' + F.Name);
          end;
      end;
        Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
end;

function TListaArquivos.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

constructor TListaArquivos.Create;
begin
  FListaArquivos := TStringList.Create;
end;

destructor TListaArquivos.Destroy;
begin
  FreeAndNil(FListaArquivos);
  inherited;
end;

class function TListaArquivos.New: IListaArquivos;
begin
  Result := Self.Create;
end;

function TListaArquivos.GetListaArquivos: TStringList;
begin
  Result := FListaArquivos;
end;

function TListaArquivos.PossuiComponente(Arquivo: String): Boolean;
var
  lArquivo: TStringList;
begin
  Result := False;
  lArquivo := TStringList.Create;
  try
    lArquivo.LoadFromFile(Arquivo);
    Result := (Pos(SQLClientDataSetObjName, lArquivo.Text) > 0);
  finally
    FreeAndNil(lArquivo);
  end;
end;

end.
