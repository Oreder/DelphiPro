program Setof_Number_Found;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  N: LongInt;
  S: string;
  Mix: set of '0'..'9';
  I: Integer;
  J: Char;


begin
  Write('INPUT NUMBER N: '); ReadLn(N);
  WriteLn; WriteLn;

  Str(Abs(N),S);          // tranfer number into characters

  Mix := [];              // begining set

  for I := 1 to Length(S) do
    Mix := Mix + [S[I]];

  WriteLn('SET number [output]: ');
  for J := '0' to '9' do
    if J in Mix then Write(J + ' ');
  ReadLn;

end.
