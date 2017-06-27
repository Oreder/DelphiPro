program NumberAnalys;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var K,M,N: Integer;

begin
  Write('Input number N: '); ReadLn(N); WriteLn;
  if N = 1 then begin Write('Answer: (1,1)'); Halt; end;

  WriteLn('Answer:');
  K := 1;

  while K < N+1 do
    begin
      if N mod K = 0 then
        begin
          M := N div K;
          WriteLn(' (',K,',',M,')');
        end;

      Inc(K);
      if N mod 2 = 1 then Inc(K);
    end;
  ReadLn;
end.
