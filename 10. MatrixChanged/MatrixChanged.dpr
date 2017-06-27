program MatrixChanged;

	{$APPTYPE CONSOLE}

uses
  SysUtils;

var
	D, Z: array[1..12, 1..8] of Integer;              { D, Z: matrixes input }

	KOL: array[1..12] of Integer;                     { KOL: counting array  }

  RD, CD, RZ, CZ: Integer;       { RD, RZ: number rows of matrixes D and Z }
                                 { CD, CZ: number columns of matrixes D, Z }

  Sum, Max, I, J: Integer;       { Sum: sum elements of each row in mat. Z }
                                 { Max: maximum element of array KOL       }
                                 { I, J: counting numbers                  }

begin
   (* Input data process *)
	Write('INPUT number ROWS and COLUMNS of MATRIX D: ');
	ReadLn(RD, CD);

	WriteLn('INPUT MATRIX D (', RD, 'x', CD, '):');
	for I := 1 to RD do
		for J := 1 to CD do
      Read(D[I,J]);
      // D[I,J] := Random(10);
	WriteLn;

	WriteLn('And now let INPUT number ROWS and COLUMNS of MATRIX Z: ');
	WriteLn('   ( NOTICE that: 2 matrixes D and Z have a SAME number ROWs! )');
	ReadLn(RZ, CZ);

	WriteLn('INPUT MATRIX Z (', RZ, 'x', CZ, '):');
	for I := 1 to RZ do
		for J := 1 to CZ do
			Read(Z[I,J]);
      //Z[I,J] := Random(6);

   (* Output data process *)
	WriteLn;
	WriteLn('******************************************');
	WriteLn;


   (* Print beginning matrix D *)
	WriteLn(' MATRIX D (', RD, 'x', CD, ') [input]:');
  WriteLn;
	for I := 1 to RD do
		begin
			for J := 1 to CD do
				Write(D[I, J]:5);
			WriteLn; WriteLn;
		end;
	WriteLn;

   (* Print beginning matrix Z *)
  WriteLn(' MATRIX Z (', RZ, 'x', CZ, ') [input]:');
  WriteLn;
	for I := 1 to RZ do
		begin
			for J := 1 to CZ do
				Write(Z[I, J]:5);
			WriteLn; WriteLn;
		end;
	WriteLn; WriteLn;

   (* Print sum elements in rows *)
  WriteLn(' [OUTPUT 1] SUM of elements in each row of matrix Z: ');
  WriteLn;

   (* Set beginning counting number *)
	I := 1;

   (* MAIN: use loop to identify Sum, Max and array KOL *)
	repeat
		begin
			Sum := 0;                 // reset value in each loop
			for J := 1 to CZ do
				Sum := Sum + Z[I, J];   // calculating Sum

      WriteLn(' ROW Z(', I, '): ', Sum:4); WriteLn;
                                // print results of [output 1]

			KOL[I] := 0;              // reset beginning data of KOL each loop
			for J := 1 to CD do
				if D[I, J] > Sum then
					Inc(KOL[I]);          // identify element of KOL

			if (I = 1) then
        Max := KOL[I]           // set up beginning value
      else
        if KOL[I] > Max then
					Max := KOL[I];        // find maximum value of array KOL

			Inc(I);                   // increase step
		end;
	until (I = RD+1);             // condition aim at finishing loops


   (* Use loop(2x) to change matrix *)
	for I := 1 to RD do
		for J := 1 to CD do
			D[I, J] := D[I, J] * Max;

   (* Print OUTPUT 01: array KOL *)
  WriteLn; WriteLn;
	WriteLn(' [OUTPUT 02] ARRAY KOL: where each element is an amount of elements' +
          ' in matrix D,');
  WriteLn(' which have greater value than sum of elements in' +
          ' corresponding row of matrix Z.');
  Write('             ARRAY KOL(', RD, '): ');
	for I := 1 to RD do
		Write(KOL[I]:3);

   (* Print OUTPUT 02: Max *)
	WriteLn; WriteLn; WriteLn;
	WriteLn(' [OUTPUT 03] MAXIMUM VALUE OF KOL[', RD, ']: ', Max);
	WriteLn; WriteLn;

   (* Print OUTPUT 03: changed matrix *)
	WriteLn(' [OUTPUT 04] MATRIX D (', RD, 'x', CD, ') after multiplication to' +
                        ' maximum value of array KOL: ');
  WriteLn;
	for I := 1 to RD do
		begin
			for J := 1 to CD do
				Write(D[I, J]:5);
			WriteLn; WriteLn;
		end;
	WriteLn;

	ReadLn; ReadLn;
end.                     // program MatrixChanged
