program ArrayMirrorOut;

{$APPTYPE CONSOLE}

uses
  SysUtils,Math;

const NA = 1000;

type Xray = array[1..NA] of Integer;


procedure OA(X: Xray; N: Integer);
  var I: Integer;
  begin
    for I := 1 to N do
      Write(X[I]:3);
  end;



var I,N,Z: Integer;
    X: Xray;

begin
  Write('Input number elements of array: '); ReadLn(N);

{
  I := 1;
  while not I > N do
    begin
      X[I] := 0;
      Inc(I);
    end;

  Write('Output: DONE!'); ReadLn;
}


  Randomize;
  for I := 1 to N do
    X[I] := RandomRange(-5,10);

  WriteLn; Write(' Input: '); OA(X,N); WriteLn;

  for I := 1 to N div 2 do
    begin
      Z := X[I]; X[I] := X[N+1-I]; X[N+1-I] := Z;
    end;

  WriteLn; Write('Output: '); OA(X,N); ReadLn;

end.
