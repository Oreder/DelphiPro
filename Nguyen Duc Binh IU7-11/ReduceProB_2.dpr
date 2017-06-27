program ReduceProB_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  M = 20;

type
  Mat = array[1..M,1..M] of Integer;
  Sum = array[1-M..M-1]   of Integer;

procedure PrintSum(Z: Mat; N: Integer; var S: Sum);
  var  I, J: Integer;
  begin
    for I := 1-N to N-1 do
      S[I] := 0;

    for I := 1 to N do
      for J := 1 to N do
        S[J-I] := S[J-I] + Z[I,J];

    for I := 1-N to N-1 do
        Write(S[I]:3);
  end;

var
  P: Mat;
  Q: Sum;
  I, J, N: Integer;


begin
  Write('INPUT N: '); ReadLn(N); WriteLn;

  for I := 1 to N do
    begin
      for J := 1 to N do
        begin
          P[I,J] := Random(5);
          Write(P[I,J]:4);
        end;
      WriteLn; WriteLn;
    end;

  Write('OUTPUT: ');
  PrintSum(P,N,Q);

  ReadLn;

end.
