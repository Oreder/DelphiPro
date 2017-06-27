program SquareWithPM;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var K,N: Integer;
    KS: LongInt;

begin
  Write('Input number N: '); ReadLn(N); WriteLn;
  K := 0; KS := 1;

  while not (K = N) do
    begin
      KS := KS + K + K - 1;
      WriteLn('K = ',K:4,#32#32#32,'KS = ',KS);
      Inc(K);
    end;
  ReadLn;
end.        {print square with signs '+' and '-'}
 