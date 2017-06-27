program MinSameAB;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  A,B: Integer;

begin
  Write('Input A and B: '); ReadLn(A,B);

  while not (A = B) do         // while A <> B
    if A < B then B := B - A
             else A := A - B;

  WriteLn; WriteLn('Answer: ',A); ReadLn;
end.
