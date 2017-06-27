program BreakExam;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function Value(X,Eps: Real): Real;
  var S,P: Real; K: Integer;

  begin
    S := X; P := 0; K := 0;

    while Abs(S) < Eps do // error!!!:  Abs(S) > Eps
      begin
        P := P + S;
        Inc(K);
        S := S * Sqr(X/(2*K+3)) * (1/(2*K+2) - 1);
      end;

    Value := P;
  end;

var X,Eps: Real;

begin
  Write('Input X, Eps: '); ReadLn(X,Eps);
  Write(Value(X,Eps):10:5); ReadLn;
end.
