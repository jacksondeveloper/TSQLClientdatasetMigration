unit MigrationView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MigrationController, StdCtrls, Configuracoes, ListaArquivos;

type
  TfrMigrationView = class(TForm)
    edDiretorio: TEdit;
    Label1: TLabel;
    btAbrirPasta: TButton;
    mmLog: TMemo;
    Label2: TLabel;
    btProcessar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btProcessarClick(Sender: TObject);
  private
    FMigrationController: iMigrationController;
    FConfiguracoes: iConfiguracoes;
    FListaArquivos: IListaArquivos;
  public
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
  FListaArquivos       := TListaArquivos.Create;

  LerConfiguracoes;
end;

procedure TfrMigrationView.LerConfiguracoes;
begin
  edDiretorio.Text := fConfiguracoes.GetDiretorio;
end;

procedure TfrMigrationView.SalvarConfiguracoes;
begin
  fConfiguracoes.SetDiretorio(edDiretorio.Text);
  fConfiguracoes.SalvarConfiguracoes;
end;

procedure TfrMigrationView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvarConfiguracoes;
end;

procedure TfrMigrationView.btProcessarClick(Sender: TObject);
begin
  FListaArquivos.Carregar(edDiretorio.Text, True);
  mmLog.Lines.Add('Total de arquivos PAS e DFM: ' + IntToStr(FListaArquivos.GetListaArquivos.Count))
end;

end.
