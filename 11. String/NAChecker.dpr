program NAChecker;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  S: string;
  NA: set of Char;
  I, J: Integer;


begin
  WriteLn('INPUT STRING: '); ReadLn(S);
  WriteLn;

  J := 0;

  NA := ['A','E','I','Y','O','U'];

  if S[1] in NA then J := 1;

  for I := 1 to Length(S) do
    if (Upcase(S[I]) in NA) and (S[I-1] = ' ') then
      Inc(J);

  WriteLn('OUTPUT: ', J);
  ReadLn;

end.
