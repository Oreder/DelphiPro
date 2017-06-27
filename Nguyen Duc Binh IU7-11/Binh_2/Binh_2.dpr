program Binh_2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  MAT = array[1..7,1..7] of Integer;
  VEC = array[1..14] of Integer;

var
  R, M: MAT;
  S1, S2: VEC;
  I, J, T, N: Integer;

procedure PrintOUT(var A:MAT; var S:VEC; var N:Integer);
  var I, J, R, K, P: Integer;

  begin
	  P := 1;
    for K := N-1 downto 1-N do
	    begin
      R := 0;
      for I := 1 to N do
		    for J := 1 to N do
			    if (I-J=K) then
				    R := R + A[I,J];
      S[P] := R;
	    Inc(P);
  	  end;
	
    for I := 1 to P-1 do
		  Write(S[I]:3);
	  WriteLn;
  end;


begin
	Write('INPUT NUNBER ELEMENTS of FIRST SQUARE MATRIX M: ');
	ReadLn(N);
	WriteLn('INPUT SQUARE MATRIX M(', N, ',', N, ') :');
	for I := 1 to N do
  		for J := 1 to N do
    			Read(M[I,J]);

  WriteLn;
  Write('INPUT NUNBER ELEMENTS of SECOND SQUARE MATRIX R: ');
	ReadLn(T);
	WriteLn('INPUT SQUARE MATRIX R(', T, ',', T, ') :');
	for I := 1 to T do
  		for J := 1 to T do
    			Read(R[I,J]);

	
  WriteLn('OUTPUT VECTOR CORESPONDING : '); WriteLn;
  Write('Vector S1 of matrix M: ');
  PrintOUT(M,S1,N);
  Write('Vector S2 of matrix R: ');
  PrintOUT(R,S2,T);
  ReadLn; ReadLn;

end.
