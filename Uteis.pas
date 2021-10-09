unit Uteis;

interface

function PosicaoPrimeiroCaracter(Value: String): Integer;

implementation

function PosicaoPrimeiroCaracter(Value: String): Integer;
var
  Contador: Integer;
begin
  Result := 0;
  for Contador := 0 to Pred(Length(Value)) do
  begin
    if (Value[Contador] <> ' ') and (Value[Contador] <> #0) then
    begin
      Result := Contador;
      Break;
    end;
  end;

end;

end.
