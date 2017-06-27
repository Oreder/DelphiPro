program SameElementCount;

{$APPTYPE CONSOLE}

uses
  SysUtils;


const NA = 1000;

type Arr = array[1..NA] of Integer;

procedure OP(Z: Arr; N,S: Integer);
  var I: Integer;
  begin
    Write('Out[',S,']: ');
    for I := 1 to N do Write(Z[I]:3);
    WriteLn; WriteLn;
  end;


var
  A,B: Arr;
  M,N: Integer;
  I,J,Cout,S: Integer;


begin
  Write('Input number elements of 2 arraies: '); ReadLn(M,N); WriteLn;

  A[1] := Random(5);
  for I := 2 to M do A[I] := A[I-1] + Random(5);

  B[1] := Random(5);
  for J := 2 to N do B[J] := B[J-1] + Random(5);

  (* main *)
  Cout := 0; I := 1; J := 1;
  while not ((I>M) or (J>N)) do
    begin

      if A[I] < B[J] then Inc(I) else
      if A[I] > B[J] then Inc(J) else
      if A[I] = B[J]  then
        begin
          Inc(I); Inc(J); Inc(Cout);
          if Cout = 1 then S := A[I-1];
          if (Cout > 1) then
            begin
              S := A[I-1] - S;
              if S = 0 then Dec(Cout);
              S := A[I-1];
            end;
        end;
    end;

  OP(A,M,1);
  OP(B,N,2);

  Write('Answer: ',Cout:3); ReadLn;

end.
