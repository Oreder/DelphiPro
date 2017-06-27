program Great_String;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  S: string;
  Key: Boolean;
  I: Integer;

begin
  WriteLn('INPUT STRING: '); ReadLn(S);
  WriteLn; WriteLn;

  if S[1] in ['A'..'Z', 'a'..'z'] then
    begin
      I := 2;
      Key := True;
      while (I<Length(S)) and Key do
        if S[I] in ['A'..'Z', 'a'..'z',' ','0'..'9'] then Inc(I)
          else Key := False;

      if Key then WriteLn('STRING "', S, '" - GREAT STRING.')
      else WriteLn('STRING "', S, '" HAS BREAKING SYMBOL!');
    end
  else
    WriteLn('STRING "', S, '" HAS AN ERROR OF BEGINING.');
  ReadLn;

end.
 