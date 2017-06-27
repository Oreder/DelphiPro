program OUTMAX;
	{$APPTYPE CONSOLE}

uses
  SysUtils;

const
	M = 100;

var
	R: array[1..M] of Integer;
	I, N, J, S, Max: Integer;

begin
	Write('PLEASE INPUT NUMBER ELEMENTS OF ARRAY: ');
	ReadLn(N);
	WriteLn('NOW LET INPUT ARRAY: ');
	for I := 1 to N do
		Read(R[I]);
	WriteLn;
	Write('ARRAY  INPUT: ');
	for I := 1 to N do
		Write(R[I], ' ');
	WriteLn;

	Max := R[1]; S := 0;
	for I := 1 to N do
		if R[I] > Max then
			begin
        Max := R[I];
				S := 1;
			end
    else
      if R[I] = Max then
        S := S + 1;

	for I := 1 to N-S do
		if R[I] = Max then
			for J := I+1 to N do
				if R[J] <> Max then
					begin
						R[I] := R[J];
						R[J] := Max;
						break;
					end;
  Write('ARRAY OUTPUT: ');
	for I := 1 to N-S do
		Write(R[I], ' ');

	ReadLn; ReadLn;
end.



