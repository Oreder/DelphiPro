program DivModCheck;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  A,B: Integer;

begin
  Write('Input A and B: '); ReadLn(A,B);
  Write('Answer: ', A mod B,#32, A div B);
  ReadLn;
end.
 