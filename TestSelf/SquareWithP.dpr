program SquareWithP;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var K,N: Integer;
    KS: LongInt;

begin
  Write('Input number N: '); ReadLn(N); WriteLn;
  WriteLn('K =   0   KS =    0');
  KS := 0; K := 0;

  while not (K+1 = N) do
    begin
      KS := KS + K;
      Inc(K);
      KS := KS + K;
      WriteLn('K = ',K:3,#32#32#32'KS = ',KS:4);
    end;
  ReadLn;

end.        {print square with only sign '+'}
 