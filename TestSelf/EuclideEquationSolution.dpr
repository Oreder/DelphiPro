program EuclideEquationSolution;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	A,B,Q,R: Integer;
	X0,Y0,X1,Y1, X,Y: Integer;
begin
	Write('Input A and B: '); ReadLn(A,B);
	X0 := 1; X1 := 0;
	Y0 := 0; Y1 := 1;

	while B > 0 do
		begin
			Q := A div B;
			R := A mod B;
			A := B; B := R;			// {Euclide} gcd(a,b);

			X := X0 - Q * X1;		// (x,y) = (X0,Y0) mod (X1,Y1);
			Y := Y0 - Q * Y1;

			X0 := X1; Y0 := Y1;		// (X0,Y0) = (X1,Y1);

			X1 := X; Y1 := Y;		// (X1,Y1) = (X,Y);
		end;

	Write('X = ',X0,#32,'Y = ',Y0); ReadLn;

end.             {solution Ax + By = D, where D = (A,B)}
