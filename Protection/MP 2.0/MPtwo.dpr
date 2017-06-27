program MPtwo;

  {$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MM = 30; NM = 30;

var
  Z: array[1..MM, 1..NM] of Char;
  I, J, M, N, R, C: Integer;

begin
  Write('INPUT NUMBER ROWS and COLUMNS: ');
  ReadLn(M, N);

  Write('INPUT POSITION OF POINT F: ');
  ReadLn(R, C);
  WriteLn; WriteLn;

  for I := 1 to M do
    for J := 1 to N do
      if (I = R) or (J = C) or (I - R = J - C) or (I - R = C - J) then
        Z[I,J] := '0'
      else
        Z[I,J] := '.';

  for I := 1 to M do
    begin
      Write('        ');
      for J := 1 to N do
        Write(Z[I,J]:2);
      WriteLn;
    end;

  ReadLn; ReadLn;

end.
