program MPone;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  S: array[1..6, 1..8] of Char;

  R: array[1..6] of Integer;
  C: array[1..8] of Integer;

  I, J, M, N: Integer;


begin
  Write('INPUT NUMBER ROWS AND COLUMNS: ');
  ReadLn(M, N); WriteLn;

  WriteLn('INPUT CHARACTERIC MATRIX S ', M ,'x', N, ':');
  WriteLn('---------1---------2---------3---------4---------5--->');

  for I := 1 to M do
    for J := 1 to N do
      Read(S[I,J]);

  WriteLn; WriteLn;
  WriteLn(' MATRIX [input]:'); WriteLn;

  for I := 1 to M do
    begin
      Write(' ':8);
      for J := 1 to N do
        Write(S[I,J]:2);
      WriteLn;
    end;

  for I := 1 to M do
    R[I] := 0;
  for J := 1 to N do
    C[J] := 0;

  for I := 1 to M do
    for J := 1 to N do
      if (S[I,J] >= '0') and (S[I,J] <= '9')then
        begin
          R[I] := 1;
          C[J] := 1;
        end;

  for I := 1 to M do
    for J := 1 to N do
      if (R[I] = 1) or (C[J] = 1) then
        S[I,J] := '.';


  WriteLn; WriteLn;
  WriteLn(' MATRIX [output]:');
  WriteLn;

  for I := 1 to M do
    begin
      Write(' ':8);
      for J := 1 to N do
        Write(S[I,J]:2);
      WriteLn;
    end;

  ReadLn; ReadLn;
end.

