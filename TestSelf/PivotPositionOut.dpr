program PivotPositionOut;

{$APPTYPE CONSOLE}

uses
  SysUtils;


const NA = 1000;

type Arr = array[1..NA] of Integer;

var
  Z: Arr;
  N,B: Integer;
  I,L,R,M: Integer;

begin
  Write('Input number elements: '); ReadLn(N);
  Write('Input pivot number: '); ReadLn(B); WriteLn;

  Write('Begin: ');
  for I := 1 to N do
    begin
      Z[I] := Random(10);
      Write(Z[I],#32);
    end;
  Write('[',B,']');


  L := 1; R := N;
  while L-1<>R do
    begin
      if Z[L] <= B then Inc(L) else
      if Z[R] > B then Dec(R) else
        begin
          { swap values Z[left] and Z[right] }
          M := Z[R]; Z[R] := Z[L]; Z[L] := M;
          Inc(L); Dec(R);
        end;
    end;


  WriteLn;
  Write(' Need: ');
  for I := 1 to N do
    begin
      if I = L then Write('[',B,'] ');
      Write(Z[I],#32);
    end;

  WriteLn; Write('Position pivot: ',R,'-', L);
  ReadLn;

end.
