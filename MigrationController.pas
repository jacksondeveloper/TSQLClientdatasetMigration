unit MigrationController;

interface

type

  iMigrationController = interface
    ['{F3A2E76A-F9C6-470B-BB97-B44C0A81E000}']
  end;

  TMigrationController = class(TInterfacedObject, iMigrationController)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iMigrationController;
  end;

implementation

{ TMigrationController }

constructor TMigrationController.Create;
begin

end;

destructor TMigrationController.Destroy;
begin

  inherited;
end;

class function TMigrationController.New: iMigrationController;
begin
  Result := Self.Create;
end;

end.
