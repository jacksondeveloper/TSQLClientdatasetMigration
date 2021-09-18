unit MigrationView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MigrationController;

type
  TfrMigrationView = class(TForm)
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
