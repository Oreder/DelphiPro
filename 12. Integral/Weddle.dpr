program Weddle;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(X: Real): Real;
  begin
    Result := X*X;
  end;

function Weddle(A, B: Real; N: Integer): Real;
  var  X, Z, dX: Real;
       I: Integer;

  begin
     X := A; Z := 0;
    dX := (B-A)/N/6;

    for I := 1 to N do
      begin
        Z := Z + F(X + 0*dX) + 5*F(X + 1*dX);
        Z := Z + F(X + 2*dX) + 6*F(X + 3*dX);
        Z := Z + F(X + 4*dX) + 5*F(X + 5*dX);
        Z := Z + F(X + 6*dX);

        X := A + 6*I*dX;
      end;

    Weddle := Z*0.3*dX;      // Weddle := Z * 0.05 * (B-A)/N;
  end;


var
  Integ_1, Integ_2, Del: Real;
  Eps, A, B: Real;
  N: Integer;

begin
  WriteLn('INPUT A, B and Epsilon: ');
  ReadLn(A, B, Eps); WriteLn;

  Integ_2 := Weddle(A, B, 1);
  Del := Abs(Integ_2);
  N := 1;

  while Abs(Del) > Eps do
    begin
      Integ_1 := Integ_2;
      N := N*2;
      Integ_2 := Weddle(A, B, N);
      Del := Integ_2 - Integ_1;
    end;

  WriteLn('EXACT VALUE OF INTEGRAL: ', Integ_2:15:9);
  WriteLn('TIME PROCESSING: ', N);
  ReadLn;

end.
