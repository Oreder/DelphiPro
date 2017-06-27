program NumberOutDigit;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var Base,N,K: Integer;

begin
  Write('Input number N: '); ReadLn(N); WriteLn;

  Base := 1;
  while Base*10 <= N do Base := Base * 10;

  Write('Output[1]: ');
  K := N;
  while Base > 1 do
    begin
      Write(K div Base);
      K := K mod Base;
      Base := Base div 10;
    end;
  WriteLn(K);


  Write('Output[2]: ');
  K := N;
  while K <> 0 do
    begin
      Write(K mod 10);
      K := K div 10;
    end;

  ReadLn;

end.
