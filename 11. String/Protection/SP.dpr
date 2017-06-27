program SP;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  S: string;
  Leng, LengMax, I, Imax, L0: Integer;

begin
  WriteLn('INPUT STRING:'); ReadLn(S);
  WriteLn;

  for I := 1 to Length(S) do
    begin
      if (S[I] = ' ') and (S[I+1] <> ' ') then
	      L0 := I;
      if (S[I] <> ' ') and (S[I+1] = ' ') or (I = Length(S)) then
	      begin
	        Leng := I - L0;
	        if Leng > LengMax then
	          begin
	            LengMax := Leng; Imax := L0+1;
	          end;
        end;
    end;

  Delete(S, Imax, LengMax);
  WriteLn('STRING AFTER DELETE: ');
  WriteLn(S); WriteLn;


  if (S[1] >= 'A') and (S[1] <= 'Z') then
    S[1] := Chr(Ord(S[1]) + 32);
  for I := 2 to Length(S) do
    if (S[I] <> ' ') and (S[I-1] = ' ') and
       (S[I] >= 'A') and (S[I] <= 'Z') then
	        begin
	          S[I] := Chr(Ord(S[I]) + 32);
	        end;
  WriteLn('STRING AFTER CHANGE THE MAIN CHARACTERs INTO SMALL CHARACTERs:');
  WriteLn(S);
  ReadLn;
end.

