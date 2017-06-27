program Graphic;

	{$APPTYPE CONSOLE}

uses
  SysUtils;

const
	M = 60;

var
	X, Xt, Xf, Step: Real;      {  X : parameter        }
                              {  Xt: first value of X }
                              {  Xf: final value of X }
                              {  Step: Step value     }

  Y, Y1, Y2: Real;            {  Y : value R(X)       }
                              {  Y1: value R(X) in first function  }
                              {  Y2: value R(X) in second function }

	Min, Max, Delta: Real;      {  Min: minimum value of R1(X)  }
                              {  Max: maximum value of R1(X)  }
                              {  Delta: result of Max - Min   }

	H, K, Z: Integer;           {  H: distance from R(X) to Min }
                              {  K: distance from Min  to axis}
                              {  Z: distance from R(X) to axis}

	Pn, N, Sat: Integer;        {  Pn: position of axis OR      }
                              {  N, Sat: counting variable    }

begin
   (* INPUT PROGRAM *)
	Write('Input first and final value of X: ');
	ReadLn(Xt, Xf);
	Write('Input step: ');
	ReadLn(Step);
  WriteLn;

   (* Columns of table need printing *)
  WriteLn('N':4, 'X':9, 'R1':13, 'R2':13);
  WriteLn;

   (* Beginning data *)
	N := 1; X := Xt; Sat := 0;
	Min := X * X - Cos(X * Pi);
	Max := Min;

   (* Using loop to print value in table and find value of Min, Max *)
	repeat
		begin
			Y1 := X*X - Cos(X*Pi);                        // first  function R1
			Y2 := X * (X * (X - 14.5) + 60.69) - 70.9;    // second function R2
			Write(N:5, '  ', X:8:2, '   ');

			if (Abs(Y1) < 1E6) then
				Write(Y1:11:4, '   ')
			else
				Write(Y1:11, '   ');                        // condition R1 4-7

			if (Abs(Y2) < 1E7) then
				WriteLn(Y2:12:4)
			else
				WriteLn(Y2:12);                             // condition R2 4-7

			if Y1 < Min then
				Min := Y1;
			if Y1 > Max then
				Max := Y1;

			if (0.4 <= Y1) and (Y1 <= 0.6) then           // identify number
				Inc(Sat);                                   // satisfied value (R1)

			N := N + 1;       // increasing value of N after each circle
			X := X + Step;    // increasing value of X in period
		end;
	until (X > Xf + Step/5);   // condition of loop

   (* Using loop to print value Y1, which is satisfied conditions *)
  WriteLn;
	if (Sat = 0) then
		WriteLn('There is NO value of R1, which satisfies 0.4 <= R1 <= 0.6')
	else
		begin
			WriteLn('LIST SATISFIED VALUE of R1 (0.4 <= R1 <= 0.6):'); WriteLn;
			WriteLn('X':5, 'Y':10);
			X := Xt;
			repeat
				begin
					Y := X*X - Cos(X*Pi);
					if (0.4 <= Y) and (Y <= 0.6) then
						Write(X:8:2, '  ', Y:5:4);
					X := X + Step;
				end;
			until (X > Xf + Step/5);
		end;

   (* Command to print graph of function *)
	WriteLn;
  WriteLn(' Press ENTER to watch graphic...');
  ReadLn;
  WriteLn('  Graphic of function R1(X) = X*X - cos(Pi*X)');
  WriteLn;

	Delta := Max - Min;
	X := Xt; N := 1;      // beginning data
  K := Abs(Round(-Min * M / Delta));

    (* Searching case for condition of Min, Max to print graph correctly *)
    (*              In each case we use loop to print graph              *)

  if (Max * Min < 0) then        { the first case }
		repeat
			begin
				Y := X * X - Cos(X * Pi);
        H := Round((Y - Min) * M / Delta);
				Z := Abs(K - H);
        Pn := 12 + K;
          { condition of printing X }
				if (N mod 2 = 0) then
					Write('           ')
				else
					Write(X:10:2, ' ');

          { condition for printing '*' as a point denotion of R(X) }
        if (Y = 0) or (H = 0) then
						WriteLn('*':K)
        else
          if (Y < 0) and (X <>0) then
					  WriteLn('*':H, #179:Z)
					else
						WriteLn(#179:K,'*':Z);

				X := X + Step;
				N := N + 1;
			end;
		until (X > Xf + Step/5);

	if (Min = 0) then              { the second case }
		repeat
			begin
        Y := X * X - Cos(X *Pi);
        H := Round((Y - Min) * M / Delta);
        Pn := 12;

				if (N mod 2 = 0) then
					Write('           ')
				else
					Write(X:10:2, ' ');

				if (Y = 0) then
					WriteLn('*')
				else
					WriteLn(#179, '*':H);

				X := X + Step;
				N := N + 1;
			end;
		until (X > Xf + Step/5);

	if (Max = 0) then               { the third case }
		repeat
			begin
				Y := X * X - Cos(X *Pi);
        H := Round((Y - Min) * M / Delta);
        Pn := 12 + M;

				if (N mod 2 = 0) then
					Write('           ')
				else
					Write(X:10:2, ' ');

				if (Y = 0) then
					WriteLn('*':M)
				else
					WriteLn('*':H, #179:(M-H));

				X := X + Step;
				N := N + 1;
			end;
		until (X > Xf + Step/5);

	if (Min > 0) then               { the fourth case }
		repeat
			begin
				Y := X * X - Cos(X *Pi);
        H := Round(Y * M / Max);  //     condition of distance between
                                  //     a point denotion and axis OR
        Pn := 12;

				if (N mod 2 = 0) then
					Write('           ')
				else
					Write(X:10:2, ' ');

				WriteLn(#179, '*':H);

				X := X + Step;
				N := N + 1;
			end;
		until (X > Xf + Step/5);

	if (Max < 0) then               { the final case }
		repeat
			begin
				Y := X * X - Cos(X *Pi);
        H := Round(Y * M / Min);  //     condition of distance between
                                  //     a point denotion and axis OR
        Pn := 12 + M;

				if (N mod 2 = 0) then
					Write('           ')
				else
					Write(X:9:2, ' ');

				WriteLn('*':H, #179:(M-H));

				X := X + Step;
				N := N + 1;
			end;
		until (X > Xf + Step/5);

   (* Process to finishing graphic, using characters ASCII *)
  if (Abs(Xf) <= 10) and (Abs(Xt) <= 10) then
    begin
      WriteLn(#179:(Pn-1));
      WriteLn(#25:(Pn-1), ' R1');
    end
  else
    begin
      WriteLn(#179:Pn);
      WriteLn(#25:Pn, ' R1');
    end;

	ReadLn; ReadLn;

end.                   // Program Graphic
