program MultifyPolynomialOut;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const NA = 1000;

var
  A,B,C: array[0..NA] of Integer;
  M,N: Integer;
  I,J: Integer;

begin
  Write('Input degree of 2 polynomials (type 2 numbers): ');
  ReadLn(M,N); WriteLn;

  WriteLn('Input coefficients of polynimial degree ',M,': ');
  for I := M downto 0 do Read(A[I]); WriteLn;

  WriteLn('Input coefficients of polynimial degree ',N,': ');
  for J := N downto 0 do Read(B[J]); WriteLn;

  (* main *)

  for I := 0 to (M+N) do C[I] := 0;

  for I := 0 to M do
    for J := 0 to N do
      C[I+J] := C[I+J] + A[I]*B[J];

  WriteLn; WriteLn('Output coefficients of found polynomial (C[n]..C[0]):');
  for I := (M+N) downto 0 do Write(C[I],#32);

  ReadLn; ReadLn;

end.
 