program IntegInTwoMethods;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(X: Real): Real;         // calculate given function
  begin
    F := X*X;
    //F := Ln(X + Sqrt(X*X+4));
  end;

function G(X: Real): Real;         // absolute function of integral
  begin
    G := X*X*X/3;
    //G := -Sqrt(X*X+4) + X*Ln(X + Sqrt(X*X+4));
  end;


(* Code identifies integral by method PARABOL *)
function IPa(A, B: Real; N: Integer): Real;
  var dX, X, Y: Real; I: Integer;
  begin
    dX := (B-A)/N;
    Y := F(A);
    for I := 1 to N div 2 do
      begin
        X := A + 2*I*dX;
        Y := Y + 2*F(X) + 4*F(X-dX);
      end;
    IPa := (Y - F(B)) * dX/3;
  end;


(* CODE identifies integral by method TRAPEZOID *)
function ITr(A, B: Real; N: Integer): Real;
  var dX, X, Y: Real; I: Integer;
  begin
    dX := (B-A)/N;
    Y := (F(A) + F(B))/2;
    for I := 1 to N-1 do
      begin
        X := A + I*dX;
        Y := Y + F(X);
      end;
    ITr := Y * dX;
  end;



var
  A, B, Integ_1, Integ_2, IG: Real;  { A, B: first and last point of integral }
                                     { Integ_1: value of integral, devided N1 }
                                     { Integ_1: value of integral, devided N2 }
                                     { IG: absolute value of integral         }

  N1, N2, I: Integer;                { N1, N2: periods, I: calculating Time   }

  Eps: Real;                         { Epsilon }
  Delta: Real;                       { Paramater checking error }


begin
   (* INPUT processing *)
  Write('INPUT FIRST point and LAST point of Integral (A and B): ');
  ReadLn(A, B);
  Write('INPUT PERIODS (N1 and N2): '); ReadLn(N1, N2);
  WriteLn; WriteLn;

   (* Print table values of integral calculated by 2 methods *)
  WriteLn('METHOD':7, 'N1':12, 'N2':15); WriteLn;
  Write('PARABOL':8);          // method parabol

  Integ_1 := IPa(A, B, N1);
  Integ_2 := IPa(A, B, N2);

  WriteLn(Integ_1:16:9, Integ_2:15:9);

  Write('TRAPEZOID');          // method trapezoid
  Integ_1 := ITr(A, B, N1);
  Integ_2 := ITr(A, B, N2);

  WriteLn(Integ_1:15:9, Integ_2:15:9);

  WriteLn;

  IG := G(B) - G(A);          // absolute value of integral
  WriteLn('ABSOLUTE VALUE OF INTEGRAL: ', IG:15:9);

  (* ---------------------------------------- *)
  WriteLn; WriteLn;
  Write('INPUT Epsilon: '); ReadLn(Eps);    // input Epsilon

  I := 1;
  Integ_2 := ITr(A,B,1);      // calculate I1 - begining value of integral
  Delta := Abs(Integ_2);      // identify absolute value error

  while Abs(Delta)>Eps do     // process identify absolute value of integral
    begin                     // using Epsilon and loop
      Integ_1 := Integ_2;
      I := I*2;               // double time unless breaking condition
      Integ_2 := ITr(A,B,I);
      Delta := Integ_1 - Integ_2;
    end;

   (* OUTPUT PROCESS *)
  WriteLn('ABSOLUTE VALUE OF INTEGRAL: ', Integ_2:15:9);
  WriteLn('TIME PROCESSING: ', I);

  ReadLn; ReadLn;
end.
