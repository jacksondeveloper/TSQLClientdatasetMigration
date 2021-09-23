program SQLMigration;

uses
  Forms,
  MigrationView in 'MigrationView.pas' {frMigrationView},
  MigrationController in 'MigrationController.pas',
  Configuracoes in 'Configuracoes.pas',
  ListaArquivos in 'ListaArquivos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrMigrationView, frMigrationView);
  Application.Run;
end.
