unit MigrationView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MigrationController, StdCtrls, Configuracoes, ListaArquivos, Conversor;

type
  TfrMigrationView = class(TForm)
    edDiretorio: TEdit;
    Label1: TLabel;
    btAbrirPasta: TButton;
    mmLog: TMemo;
    Label2: TLabel;
    btProcessar: TButton;
    edConexao: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btProcessarClick(Sender: TObject);
  private
    FMigrationController: iMigrationController;
    FConfiguracoes: iConfiguracoes;
    FListaArquivos: IListaArquivos;
    FConversor: IConversor;
  public
    procedure DoLog(Value: String);
    procedure LerConfiguracoes;
    procedure SalvarConfiguracoes;
  end;

var
  frMigrationView: TfrMigrationView;

implementation

{$R *.dfm}

procedure TfrMigrationView.FormCreate(Sender: TObject);
begin
  FConfiguracoes       := TConfiguracoes.New;
  FMigrationController := TMigrationController.New;
  FListaArquivos       := TListaArquivos.New;
  FConversor           := TConversor.New(DoLog);

  LerConfiguracoes;
end;

procedure TfrMigrationView.LerConfiguracoes;
begin
  edDiretorio.Text := fConfiguracoes.GetDiretorio;
  edConexao.Text := FConfiguracoes.GetConexao;
end;

procedure TfrMigrationView.SalvarConfiguracoes;
begin
  fConfiguracoes.SetDiretorio(edDiretorio.Text);
  FConfiguracoes.SetConexao(edConexao.Text);
  fConfiguracoes.SalvarConfiguracoes;
end;

procedure TfrMigrationView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarConfiguracoes;
end;

procedure TfrMigrationView.btProcessarClick(Sender: TObject);
begin
  btProcessar.Enabled := False;
  try

    FListaArquivos.Carregar(edDiretorio.Text, True);
    DoLog('Total de arquivos PAS e DFM: ' + IntToStr(FListaArquivos.GetListaArquivos.Count));

    FConversor.Substituir(FListaArquivos.GetListaArquivos, edConexao.Text);

  finally
    btProcessar.Enabled := True;
  end;
end;

procedure TfrMigrationView.DoLog(Value: String);
begin
  mmLog.Lines.Add(Value)
end;

end.
