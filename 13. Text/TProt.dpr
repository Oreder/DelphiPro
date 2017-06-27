program TProt ;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Mx = 10;

type
  Ars = array[1..Mx] of string;



var
    Sen: Ars;
    Para: Ars = (
      'A language is a system  of  sounds,  gestures  or',
      'characters. Many deaf people use sign  languages.',
      'All languages have rules for  forming  words  and',
      'for ordering those words in meaningful sentences.',
      'There are several major language families in  the',
      'world. Where did come from the word  "TOMATO"  in',
      'English? It was borrowed from Nahuatl. There  are',
      'about 150 American Indian languages spoken today!',
      'Languages are always changing,  but  they  change',
      'slowly.' );





procedure TextPrinted(Para: Ars);
  var I: Integer;
  begin
    WriteLn; WriteLn(' ':5,'LANGUAGE'); WriteLn;
    for I := 1 to 10 do WriteLn('   ', Para[I]);
  end;

function PoSign(S: string): Integer;
  var Sign: set of Char; I: Integer;
  begin
    Sign := ['.', '?', '!']; PoSign := 0;
    for I := 1 to Length(S) do
      if S[I] in Sign then
        begin PoSign := I; break; end;
  end;

procedure GetSen(Para: Ars; var Sen: Ars);
  var S, R: string; I, J: Integer;
  begin
    I := 1; J := 1; S := '';

    repeat
    S := S + Para[I] + ' ';
    if PoSign(S) <> 0 then
      begin
        R := Copy(S,1,PoSign(S));
        Delete(S,1,Length(R));
        Sen[J] := R; Inc(J);
      end;
    Inc(I);
    until I = 11;
  end;

procedure Fragment(S: string);
  var R: string;
  begin
    if Length(S) > 60 then
      begin
      R := Copy(S,1,60);
      while R[Length(R)] <> ' ' do R := Copy(S,1,Length(R)-1);
      WriteLn(R); Delete(S,1,Length(R)); WriteLn(' ':5,S);
      end
    else
      WriteLn(S);
  end;

procedure SentencePrinted(Sen: Ars);
  var I: Integer;
  begin
    WriteLn('Text is printed by sentences:'); WriteLn;
    for I := 1 to 8 do
      begin
        Write('  ', I, ')');
        Fragment(Sen[I]);
      end;
  end;



procedure Sort(Sen: Ars);
  var S: string; I, M, M0, N: Integer;      
  begin
    for I := 1 to 8 do
      begin
	S := ' ' + Sen[I] + ' ';
	while Pos('  ',S) <> 0 do Delete(S,Pos('  ',S),1);
	while S[1] = ' ' do Delete(S,1,1);

	M0 := Pos(' ',S); N := 0;

	while Pos(' ',S) <> 0 do
	  begin
	    M := Pos(' ',S);

	    if S[M-1] in [',','.','?','!'] then Dec(M);
	    
	    if M = M0 then Inc(N);
	    if M < M0 then
	      begin M0 := M; N := 1; end;

	    Delete(S,1,Pos(' ',S));
	  end;

	if (I < 10) then
 	  WriteLn('  Sentence [',I,'] : ',N)
	else
	  WriteLn('  Sentence [10]: ',N);
      end;
  end;


	

begin
  TextPrinted(Para);
  WriteLn;

  GetSen(Para,Sen);
  SentencePrinted(Sen);
  WriteLn;

  WriteLn('Welcome to program, identifying numbers of most sort word in text...');
  WriteLn('Press ENTER to continue...');
  ReadLn;

  Sort(Sen);
  ReadLn; ReadLn;
end.
 
