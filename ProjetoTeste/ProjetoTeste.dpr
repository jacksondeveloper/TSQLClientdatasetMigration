program ProjetoTeste;

uses
  Forms,
  unPrincipal in 'unPrincipal.pas' {fmPrincipal},
  dmPrincipal in 'dmPrincipal.pas' {dtmPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfmPrincipal, fmPrincipal);
  Application.Run;
end.
