program GP;

	{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	X, A, B, Step, Y1, Y2: Real;
	N: Integer;

begin
	Write('INPUT NUMBER a and b: ');
	ReadLn(A, B);
	Write('INPUT STEP: ');
	ReadLn(Step);

	WriteLn;
	WriteLn('N':5, 'X':6,'Y1':9, 'Y2':10);
	WriteLn;

	X := A; N := 1;
	repeat
		begin
			Y1 := Sin(X);
			Y2 := Cos(X);
			WriteLn(N:5, '  ', X:6:2, '  ', Y1:7:4, '   ', Y2:7:4);
			N := N + 1;
			X := X + Step;
		end;
	until(X >= B + Step/3);

	ReadLn; ReadLn;
end.
