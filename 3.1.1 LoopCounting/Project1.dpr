program LoopCounting;

	{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	X, Y0, Y, Eps: Real; { X : initial value
                         Y0: comparable variable of loop
                         Y : sum of range
                         Eps: standard value              }

	N, C, Step, Max: Integer;
                       { N : variable counter of loop
                         C : number of times printing
                         Step: times printing
                         Max: maximum times need printing }

begin
   (* CODE enter necessary values *)
	WriteLn('$ Program LoopCounting_NDBinh $'); WriteLn;
	WriteLn('[SUM]:  Y = 1 + X/1! + (X^2)/2! + ... + (X^N)/N!');
	WriteLn;
	WriteLn('Input the value of X and number of Step need to print:');
	ReadLn(X, Step);
	WriteLn('Input the value of Epsilon:');
	ReadLn(Eps);
	WriteLn('How many loops [SUM] need to break? (please type MAX number): ');
	ReadLn(Max);
	WriteLn;

   // Building main row of table
  WriteLn('       Y        N   ');

   // Setting initial values
	Y := 1; Y0 := X; N := 1; C := 1;

   (* Using loop to count sum of range *)
	while (Y0 > Eps) do   // Main loop's condition
		begin
			Y := Y + Y0;
			if (N = Max + 1) then
				break;
			if (N = C) then
				begin
					WriteLn(Y:10:5, '      ', N);   // Printing rows
					C := C * Step;                  // Setting up next row's value
				end;
      Inc(N);           // N = N + 1;
			Y0 := Y0 * X / N;
		end;

	WriteLn;
    (* Condition of printing result *)
	if (N > Max) then
    begin
			WriteLn('Program is not broken IN ', Max, ' loops.');
			WriteLn('  ANSWER: Y = ', Y:-9:5 {'  STEP: ', N-1} );
		end
  else
 		Write('Program is broken BEFORE ', Max, ' loops, TIME broken: N = ', N);

	ReadLn;
end.                    // Program LoopCounting

