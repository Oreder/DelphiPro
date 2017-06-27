program DMX01;

	{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	Y: array of array of Real;            {     Y: Dynamic matric       }

  X, B, Z: array of Real;               {  X, B: Dynamic array input  }
                                        {     Z: Dynamic array output }

  Min, Max: Real;                       { Min: Minimum value of matrix Y  }
                                        { Max: Maximum value of matrix Y  }

	M, N, I, J, Imin, IMAX: Integer;      {     M: Height of array X        }
                                        {     N: Height of array B        }
                                        {  I, J: Count variables          }
                                        {  Imin: Numeral position of Min  }
                                        {  IMAX: Numeral position of MAX  }

begin
	Write('INPUT NUMBER ELEMENTS of ARRAY X: ');
	ReadLn(M);

   (* Set length of array X *)
  SetLength(X, M);

  WriteLn('INPUT ARRAY X[', M, ']:');
  for I := 0 to High(X) do
    Read(X[I]);

  WriteLn;
  Write('INPUT NUMBER ELEMENTS of ARRAY B: ');
	ReadLn(N);

   (* Set length of array B *)
  SetLength(B, N);

   (* Using loop to calculate each element of array B *)
  B[0] := 0;
  for J := 1 to High(B) do
    begin
      B[J] := B[J-1] + Pi/12;
    end;

   (* Print matrix Y *)
  WriteLn;
  WriteLn(' MATRIX Y (', M, 'x', N, '):');
  WriteLn;

   (* Set length of matrix Y *)
	SetLength(Y, M, N);

   (* Using loop to identify elements of matrix and print it *)
  for I := 0 to High(X) do
    begin
      for J := 0 to High(B) do
        begin
          Y[I, J] := Exp(X[I]) + Cos(B[J]);
          Write(Y[I, J]:10:2);
        end;
      WriteLn; WriteLn;
    end;

   (* Setting up beginning value of Min and MAX *)
	Min := Y[0, 0];    Imin := 0;
	Max := Min;	       IMAX := 0;

   (* Using loop to find value of Min, Max and their positions *)
	for I := 0 to High(Y) do
		for J := 0 to High(Y[I]) do
			begin
				if Y[I, J] < Min then
					begin
						Min := Y[I, J]; Imin := I;
					end;

				if Y[I, J] > Max then
					begin
						Max := Y[I, J]; IMAX := I;
					end;
			end;

   (* Set length of vector Z *)
	SetLength(Z, 2*N);

   (* Identify elements of vector Z *)
	for I := 0 to High(Z) do
		begin
			if (I < N) then
				Z[I] := Y[IMAX, I mod N]
			else
				Z[I] := Y[Imin, I mod N];
		end;

   (* Preparing for vector output *)
  WriteLn;
	WriteLn(' VECTOR Z[', High(Z)+1, '] OUTPUT: ');
  WriteLn;

   (* Print output vector Z *)
	for I := 0 to High(Z) do
		begin
			if I = N then
				WriteLn;
			Write(Z[I]:10:2);
		end;

	ReadLn; ReadLn;
end.                        // program DMX01
