program Simson;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(X: Real): Real;
  begin
    Result := X*X;
  end;

function Simson(A, B: Real; N: Integer): Real;
  var  X, Z, dX: Real;
       I: Integer;

  begin
     X := A; Z := F(A);
    dX := (B-A)/N;

    for I := 1 to N div 2 do                // NOTE: N div 2
      begin
        X := A + 2*I*dX;
        Z := Z + 2*F(X) + 4*F(X-dX);
      end;

    Simson := (Z - F(B))*dX/3;

  end;


var
  Integ_1, Integ_2, Del: Real;
  Eps, A, B: Real;
  N: Integer;

begin
  WriteLn('INPUT A, B and Epsilon: ');
  ReadLn(A, B, Eps); WriteLn;

  Integ_2 := Simson(A, B, 1);
  Del := Abs(Integ_2);
  N := 1;

  while Abs(Del) > Eps do
    begin
      Integ_1 := Integ_2;
      N := N*2;
      Integ_2 := Simson(A, B, N);
      Del := Integ_2 - Integ_1;
    end;

  WriteLn('EXACT VALUE OF INTEGRAL: ', Integ_2:15:9);
  WriteLn('TIME PROCESSING: ', N);
  ReadLn;

end.
 