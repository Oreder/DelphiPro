program variant_1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Q: array[1..257] of Char;
  I, J, N: Integer;
  S: array [1..26] of Integer;

begin
  Write('Input number N (length of array): '); ReadLn(N);
  WriteLn('Input array:');
  for I := 1 to N do
    Read(Q[I]);

  for J := 1 to 26 do
    S[J] := 0;

  for I := 1 to N do
    if (Upcase(Q[I]) >= 'A') and (Upcase(Q[I]) <= 'Z') then
      Inc(S[Ord(Upcase(Q[I]))-64]);


  WriteLn;
  WriteLn('Time appearance of Latin characters in array:');
  WriteLn;
  for J := 1 to 26 do
    WriteLn(' "',Chr(96+J), ',',Chr(64+J), '" : ', S[J]);

  ReadLn; ReadLn;
end.
