program Boole;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(X: Real): Real;
  begin
    F := X*X; // F := 6*X*X*X*X*X;
  end;


  // method applying for polynimial with degree's lower than 6 (tested)
function Boole(A,B: Real; N: Integer): Real;
  var dX, X, Z, E: Real; I: Integer;
  begin
    dX := (B-A)/4/N;
    X := A - 4*dX; E := 0;

    for I := 1 to N do
      begin
        X := X + 4*dX;
        Z := 7*F(X) + 32*F(X+dX) + 12*F(X+2*dX) + 32*F(X+3*dX) + 7*F(X+4*dX);
        E := E + Z*2*dX/45;
      end;

    Boole := E;
  end;



var
  Integ_1, Integ_2, Del: Real;
  Eps, A, B: Real;
  N: Integer;

begin
  WriteLn('INPUT A, B and Epsilon: ');
  ReadLn(A, B, Eps); WriteLn;

  Integ_2 := Boole(A, B, 1);
  Del := Abs(Integ_2);
  N := 1;

  while Abs(Del) > Eps do
    begin
      Integ_1 := Integ_2;
      N := N*2;
      Integ_2 := Boole(A, B, N);
      Del := Integ_2 - Integ_1;
    end;

  WriteLn('EXACT VALUE OF INTEGRAL: ', Integ_2:15:9);
  WriteLn('TIME PROCESSING: ', N);
  ReadLn;

end.
