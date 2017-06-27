program PolynomialValueOut;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const NA = 1000;

var
  A: array[0..NA] of Integer;
  I,N: Integer;
  X,F: Real;

begin
  Write('Input degree of polynomial: '); ReadLn(N);
  Write('Input coefficients (A[n]..A[0]): ');
  for I := N downto 0 do Read(A[I]);

  WriteLn; Write('Input value of X: '); ReadLn(X);

  I := 1; F := A[N];
  while not (I>N) do          // Note: not (I>N) : (I>N) = False
                              // error: not I>N <> not (I>N)
    begin                     // another way: while I <= N
      F := F*X + A[N-I];
      Inc(I);
    end;

  Write('Answer: F(',X:2:1,') = ',F:-10:5);
  ReadLn;

end.
 