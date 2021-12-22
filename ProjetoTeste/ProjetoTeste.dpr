program ProjetoTeste;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {fmPrincipal},
  dmPrincipal in 'dmPrincipal.pas' {dtmPrincipal: TDataModule},
  unCadastroBase in 'unCadastroBase.pas' {fmCadastroBase},
  unCadastro in 'unCadastro.pas' {fmCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.CreateForm(TfmCadastro, fmCadastro);
  Application.Run;
end.
