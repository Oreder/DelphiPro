program Mirror;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  S: string;
  I: Integer;
  Z: Char;

begin
  WriteLn('INPUT STRING:');
  ReadLn(S); WriteLn;

  S :=  TrimLeft(S);
  S := TrimRight(S);

  for I := 1 to (Length(S)+1) div 2 do
    begin
      Z := S[Length(S)-I+1];
      S[Length(S)-I+1] := S[I];
      S[I] := Z;
    end;

  WriteLn('OUTPUT:');
  WriteLn(S); ReadLn;

end.
