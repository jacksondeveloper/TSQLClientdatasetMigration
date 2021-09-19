unit MigrationView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MigrationController, StdCtrls, Configuracoes;

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
  private
    fMigrationController: iMigrationController;
    fConfiguracoes: iConfiguracoes;
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
  fConfiguracoes := TConfiguracoes.New;
  fMigrationController := TMigrationController.New;
  
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

end.
