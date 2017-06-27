
{CODE PROTECTIOn}

procedure Sort(S: string; var N: Integer);
	var Cout, Trip: Integer;
	begin
		S := ' ' + S + ' ';

		while Pos('  ',S) <> 0 do Delete(S,Pos('  ',S),1);
		while S[1] = ' ' do Delete(S,1,1);

		Trip := Pos(' ',S); N := 0;

		while Pos(' ',S) <> 0 do
			begin
				Cout := Pos(' ',S);
				if S[Cout-1] in [',','.','!','?'] then Dec(Cout);
				if (Cout = Trip) then Inc(N) else
				if (Cout < Trip) then
					begin N := 1; Trip := Cout; end;

				Delete(S,1,Pos(' ',S));
			end;
	end;

procedure SortWord(Para: Ars);
	var I, J: Integer;
	begin
		TextPrinted(Para); WriteLn;

		for I := 1 to 9 do
			begin
				Sort(Para[I],J);
				WriteLn(' Line [', I, '] : ', J);
			end;

    Sort(Para[10],J);
    WriteLn(' Line [10]: ', J);

		ReadLn; ReadLn;
	end;
	
	
