program SortFromArraies;

{$APPTYPE CONSOLE}

uses
  SysUtils;


const NA = 1000;

type Arr = array[1..NA] of Integer;

procedure OP(Z: Arr; N,S: Integer);
  var I: Integer;
  begin
    Write('Out[',S,']: ');
    for I := 1 to N do Write(Z[I]:3);
    WriteLn; WriteLn;
  end;

var
  X,Y,Z: Arr;
  M,N: Integer;
  I,J,K: Integer;

begin
  Write('Input number elements of 2 arraies: '); ReadLn(M,N); WriteLn;

  X[1] := Random(5);
  for I := 2 to M do X[I] := X[I-1] + Random(5);

  Y[1] := Random(5);
  for J := 2 to N do Y[J] := Y[J-1] + Random(5);

  (* main *)
  I := M; J := N; K := M+N;
  while not (K=0) do
    begin
      if X[I] < Y[J] then
        begin
           Z[K] := Y[J]; Dec(J);
        end
      else
      if X[I] > Y[J] then
        begin
          Z[K] := X[I]; Dec(I);
        end
      else
        begin
          Z[K] := X[I]; Dec(I); Dec(K);
          Z[K] := Y[J]; Dec(J);
        end;

      Dec(K);
    end;

  OP(X,M,1);
  OP(Y,N,2);
  OP(Z,M+N,3);
  ReadLn;

end.
