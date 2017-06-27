program Three_eighth;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(X: Real): Real;
  begin
    Result := X*X;
  end;

function Threeth(A, B: Real; N: Integer): Real;
  var  X, Z, dX: Real;
       I: Integer;

  begin
     X := A; Z := F(A);
    dX := (B-A)/N;

    for I := 1 to N-1 do
      begin
        X := A + I*dX;
        Z := Z + 3*F(X);
        if I mod 3 = 0 then Z := Z - F(X);
      end;

    Threeth := (Z + F(B))*3*dX/8;

  end;


var
  Integ_1, Integ_2, Del: Real;
  Eps, A, B: Real;
  N: Integer;

begin
  WriteLn('INPUT A, B and Epsilon: ');
  ReadLn(A, B, Eps); WriteLn;

  Integ_2 := Threeth(A, B, 1);
  Del := Abs(Integ_2);
  N := 1;

  while Abs(Del) > Eps do
    begin
      Integ_1 := Integ_2;
      N := N*2;
      Integ_2 := Threeth(A, B, N);
      Del := Integ_2 - Integ_1;
    end;

  WriteLn('EXACT VALUE OF INTEGRAL: ', Integ_2:15:9);
  WriteLn('TIME PROCESSING: ', N);
  ReadLn;

end.

