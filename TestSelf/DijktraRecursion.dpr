program DijktraRecursion;

{$APPTYPE CONSOLE}

uses
  SysUtils;

function F(N: Integer): Integer;
  begin
    if N = 1 then
      F := 1
    else
      begin
        if N mod 2 = 0 then
          F := F(N div 2)
        else
          F := F(N div 2) + F(N div 2 + 1);
      end;
  end;


var N: Integer;

begin
  Write('Input number N: '); ReadLn(N);
  WriteLn('Output: ', F(N)); ReadLn;
end.
 