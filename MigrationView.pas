unit MigrationView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MigrationController, StdCtrls;

type
  TfrMigrationView = class(TForm)
    edDiretorio: TEdit;
    Label1: TLabel;
    btAbrirPasta: TButton;
    mmLog: TMemo;
    Label2: TLabel;
    btProcessar: TButton;
    procedure FormCreate(Sender: TObject);
  private
    fMigrationController: iMigrationController;
  public
  end;

var
  frMigrationView: TfrMigrationView;

implementation

{$R *.dfm}

procedure TfrMigrationView.FormCreate(Sender: TObject);
begin
  fMigrationController := TMigrationController.New;
end;

end.
