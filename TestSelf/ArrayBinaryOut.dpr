program ArrayBinaryOut;

{$APPTYPE CONSOLE}

uses
  SysUtils;


const NA = 100;

var
  Z: array[1..NA] of 0..1;
  I,J,N: Integer;

begin
  Write('Input number N: '); ReadLn(N); WriteLn;

  J := 0;
  while N > 0 do
    begin
      Inc(J);
      Z[J] := N mod 2;
      N := N div 2;
    end;

  Write('Output: ');
  for I := J downto 1 do Write(Z[I]);
  ReadLn;

end.
