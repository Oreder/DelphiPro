program Matrix;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	G: array[1..10,1..12] of Integer;
	Max, S, SumLeft, SumRight: Integer;
	I, J, JMax, M, N: Integer;
	
begin
  Write('INPUT numbers rows and columns: ');
  ReadLn(M, N);
  WriteLn('INPUT MATRIX G (', M, 'x', N, '): ');
  for I := 1 to M do
    for J := 1 to N do
      Read(G[I,J]);

  WriteLn('****************************');
  WriteLn('MATRIX [input]:'); WriteLn;
  for I := 1 to M do
    begin
      for J := 1 to N do
      Write(G[I, J]:3);
      WriteLn; WriteLn;
    end;

  WriteLn; WriteLn;
  WriteLn('OUTPUT:');
  WriteLn;

  for I := 1 to M do
    begin
      Max := G[I,1]; Jmax := 1;

      for J := 1 to N do
        if G[I,J] > Max then
          begin
            Max := G[I,J];
            Jmax := J;
          end;

      if Jmax = 1 then
        SumLeft := 0
      else
        begin
          SumLeft := 0; S := 0;
	        for J := 1 to Jmax-1 do
            S := S + G[I,J];
          SumLeft := S;
        end;

      if Jmax = N then
        SumRight := 0
      else
        begin
          SumRight := 0; S := 0;
          for J := N downto Jmax+1 do
            S := S + G[I,J];
          SumRight := S;
        end;

      for J := 1 to N do
        Write(G[I, J]:3);
      WriteLn(Jmax :6, SumLeft :4, SumRight :3);
      WriteLn;
    end;

  ReadLn; ReadLn;

end.

