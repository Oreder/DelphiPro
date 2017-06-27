program IntegPro;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(X: Real): Real;
  begin
    F := X*X;
  end;



function IRe(A, B: Real; N: Integer): Real;
  var dX, X, Y: Real; I: Integer;
  begin
    dX := (B-A)/N;
    Y := 0; X := A;
    for I := 0 to N do
      begin
        X := A + I*dX;
        Y := Y + F(X);
      end;
    IRe := Y*dX;
  end;

var
  A, B, Eps, I1, I2, Delta: Real;
  J: Integer;

begin
  Write('INPUT A, B and Epsilon: ');
  ReadLn(A, B, Eps);
  WriteLn; WriteLn;

  J := 1;
  I2 := IRe(A,B,J);
  Delta := Abs(I2);

  while Abs(Delta)>Eps do
    begin
      I1 := I2;
      J := J*2;
      I2 := IRe(A,B,J);
      Delta := I1 - I2;
    end;

  WriteLn('ABSOLUTE VALUE OF INTEGRAL: ', I2:15:9);
  WriteLn('TIME PROCESSING: ', J);

  ReadLn; ReadLn;
end.
