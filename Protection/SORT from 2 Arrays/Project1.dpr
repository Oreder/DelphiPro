program ArrayProtect;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Max = 27;

var
	I, J, Jmin, M, N, A: Integer;
	X, Y, Z: array[1..Max] of Integer;

begin
  Write('INPUT NUMBER ELEMENTS of ARRAY X: ');
  ReadLn(N);
  Write('INPUT ARRAY X[', N, ']: ');
  for I := 1 to N do
    Read(X[I]);
  WriteLn;

  Write('INPUT NUMBER ELEMENTS of ARRAY Y: ');
  ReadLn(M);
  Write('INPUT ARRAY Y[', M, ']: ');
  for I:=1 to M do
    Read(Y[I]);
  WriteLn;

  Write(' ARRAY X: ');
  for I := 1 to N do
	  Write(X[I], ' ');
  WriteLn;

  Write(' ARRAY Y: ');
  for I := 1 to M do
	  Write(Y[I], ' ');
  WriteLn; WriteLn;

  for I := 1 to N do
	  Z[I] := X[I];
  for I := N+1 to M+N do
	  Z[I] := Y[I-N];

  I := 1;
  repeat
    begin
      Jmin := I;
	    for J := I+1 to (M+N) do
		  if Z[J] < Z[Jmin] then
			  Jmin := J;
	    if Jmin <> I then
		    begin
			    A := Z[I];
			    Z[I] := Z[Jmin];
			    Z[Jmin] := A;
		    end;

      Inc(I);
    end;
  until (I = M+N);

  Write(' ARRAY Z: ');
  for I := 1 to M+N do
    Write(Z[I], ' ');

  ReadLn;  ReadLn;
end.
