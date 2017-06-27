program SameOfArraies;

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
  M,N,P: Integer;
  I,J,K: Integer;
  Re: Boolean;

begin
  Write('Input number elements of 3 arraies: '); ReadLn(M,N,P); WriteLn;

  X[1] := Random(5);
  for I := 2 to M do X[I] := X[I-1] + Random(5);

  Y[1] := Random(5);
  for J := 2 to N do Y[J] := Y[J-1] + Random(5);

  Z[1] := Random(5);
  for I := 2 to P do Z[I] := Z[I-1] + Random(5);

  OP(X,M,1);
  OP(Y,N,2);
  OP(Z,P,3);


  (* -------- main -------- *)
  I := 1; J := 1; K := 1; Re := False;
  while not ((I>M) or (J>N) or (K>P)) do
    begin
      if X[I] < Y[J] then Inc(I) else
      if X[I] > Y[J] then Inc(J) else
        begin
          if Z[K] < X[I] then Inc(K) else
          if Z[K] = X[I] then
            begin Re := True; break; end
          else
            begin Inc(I); Inc(J); end;
        end;
    end;

  if Re then Write(' FOUND: ',Z[K])
        else Write(' NOT Found!');

  ReadLn;

end.
 