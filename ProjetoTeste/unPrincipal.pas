unit unPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmPrincipal = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrincipal: TfmPrincipal;

implementation

uses
  unCadastro;

{$R *.dfm}



procedure TfmPrincipal.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TfmCadastro, fmCadastro);
  try
    fmCadastro.ShowModal;
  finally
    FreeAndNil(fmCadastro);
  end;
end;

end.
