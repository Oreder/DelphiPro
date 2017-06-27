program ArrayMaxLengthOut;

{$APPTYPE CONSOLE}

uses
  SysUtils;


const NA = 1000;

var
  Z: array[1..NA] of Integer;
  I,N,J,Cout,Cmax,St,En: Integer;

begin
  Write('Input number elements N: '); ReadLn(N); WriteLn;
  Write('Input array: '); for I := 1 to N do Read(Z[I]);
  WriteLn; WriteLn;

  Cmax := 0;
  I := 1;

  while I <= N do
    begin
      Cout := 1; J := I;

      while (Z[J] <= Z[J+1]) and (J <= N) do
        begin
          Inc(Cout);
          Inc(J);
        end;

      if Cout > Cmax then
        begin
          Cmax := Cout; St := I; En := J;
        end;

      I := J+1;
    end;

  Write('Output: ');
  for I := St to En do Write(Z[I],#32);
  ReadLn; ReadLn;

end.      // output increasing array, which has max length,
          // existed in the inputed array.
