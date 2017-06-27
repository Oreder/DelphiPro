program Languages;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Mx = 10;

type
  Ars = array[1..Mx] of string;


procedure Menu;
  begin
    WriteLn;
    WriteLn('    MENU: '); WriteLn;
    WriteLn('      (1) Print full text.');
    WriteLn('      (2) Print text by sentences.');
    WriteLn('      (3) Find sentence with maximum number of words.');
    WriteLn('      (4) Delete word in the text.');
    WriteLn('      (5) Find vowels in the text.');
    WriteLn('      (0) Exit.');
    WriteLn;
  end;




  (* procedure print full text *)
procedure TextPrinted(Para: Ars);
  var I: Integer;
  begin
    WriteLn; WriteLn(' ':5,'LANGUAGE'); WriteLn;
    for I := 1 to 10 do WriteLn('   ', Para[I]);
  end;



procedure Left(var S: string);      // code TrimLeft(var S: string);
  begin
    while S[1] = ' ' do Delete(S,1,1);
  end;


procedure Right(var S: string);     // code TrimRight(var S: string);
  begin
    while S[Length(S)] = ' ' do S := Copy(S,1,Length(S)-1);
  end;


  (* procedure makes sort of string *)
procedure Optimize(var S: string);
  begin
    S := ' ' + S + ' ';
    while Pos('  ',S) <> 0 do Delete(S,Pos('  ',S),1);
    Left(S);
  end;




  (* function find location of signs, end of each sentences of text *)
function PoSign(S: string): Integer;
  var Sign: set of Char; I: Integer;
  begin
    Sign := ['.', '?', '!']; PoSign := 0;
    for I := 1 to Length(S) do
      if S[I] in Sign then
        begin PoSign := I; break; end;
  end;




  (* procedure divive sentence into parts with its satisfied length *)
procedure Fragment(S: string);
  var R: string;
  begin
    Optimize(S);
    if Length(S) > 60 then
      begin
      R := Copy(S,1,60);
      while R[Length(R)] <> ' ' do R := Copy(S,1,Length(R)-1);
      WriteLn(R); Delete(S,1,Length(R)); WriteLn(' ':5,S);
      end
    else
      WriteLn(S);
  end;



  (* procedure receive sentences of text *)
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

  (* procedure print text by sentences *)
procedure SentencePrinted(Para, Sen: Ars);
  var I: Integer;
  begin
    TextPrinted(Para); WriteLn;

    WriteLn('Text is printed by sentences:'); WriteLn;
    for I := 1 to 8 do
      begin
        Write('  ', I, ') ');
        Fragment(Sen[I]);
      end;
  end;




  (* function identify number of words in string *)
function CountWord(S: string): Integer;
  var N: Integer;
  begin
    Optimize(S); N := 0;
    while Pos(' ',S) <> 0 do
      begin Inc(N); Delete(S,Pos(' ',S),1); end;
    CountWord := N;
  end;


  (* procedure find max number of words in phrases of text *)
procedure FindMaxPhrase(Sen: Ars);
  var X: array[1..10] of Integer;
      I, J, Max: Integer;
  begin
    J := 0; Max := CountWord(Sen[1]);
    for I := 1 to 8 do
      if CountWord(Sen[I]) > Max then
        begin
        Max := CountWord(Sen[I]);
        J := 1; X[J] := I;
        end
      else
        if CountWord(Sen[I]) = Max then
          begin Inc(J); X[J] := I; end;

    WriteLn;
    WriteLn('Maximum number of words in all sentences of text: ', Max);

    if J > 1 then
      WriteLn(' === Total ', J, ' sentences, which have a maximum number ' +
              'of words:')
    else
      WriteLn(' === Total 1 sentence of text, which has a maximum number ' +
              'of words:');
    WriteLn;

    for I := 1 to J do
      begin
        Write(' ', I, ') '); Fragment(Sen[X[I]]);
      end; WriteLn;
  end;




  (* procedure delete input word from text *)
procedure DelWord(Para: Ars);
  var I, J, K, N: Integer; S: Ars; P, Space: string;
  begin
    WriteLn; Write('Input word: '); ReadLn(P);
    TextPrinted(Para); WriteLn;

    P := LowerCase(P); Space := '';
    for I := 1 to Length(P) do Space := Space + ' ';

    Left(P); Right(P);

    S[1] := ' ' + P + ' '; S[2] := ' ' + P + '.';
    S[3] := ' ' + P + '!'; S[4] := ' ' + P + '?';
    S[5] := ' ' + P + ','; N := 0;

    for I := 1 to 10 do
      for J := 1 to 5 do
        while Pos(S[J], LowerCase(Para[I])) <> 0 do
        begin
          K := Pos(S[J], LowerCase(Para[I]));
          Delete(Para[I],K,Length(S[J])-1);
          Insert(Space,Para[I],K);
          Inc(N);
        end;

    WriteLn; WriteLn('[OUTPUT] '); WriteLn;

    TextPrinted(Para);

    WriteLn;
    WriteLn(' === Total words are deleted: ', N);
    WriteLn;
  end;



  (* procedure check the number of words, which started by vowels *)
procedure VowelChecker(S: string; var Cout: Integer);
  var NA: set of Char; I: Integer;
  begin
  Cout := 0;

  NA := ['A','E','I','Y','O','U'];

  if S[1] in NA then Cout := 1;

  for I := 2 to Length(S) do
    if (Upcase(S[I]) in NA) and (S[I-1] = ' ') then
      Inc(Cout);
  end;


  (* procedure find number words, which is started by vowers *)
procedure VowelCase(Para, Sen: Ars);
  var Ans, Key: Char; I, S, All: Integer;
  begin
    WriteLn;
    TextPrinted(Para); WriteLn;

    for I := 1 to 10 do
      begin
        Write('  Sentence [', I, ']: ');
        VowelChecker(Para[I],S);
        WriteLn(S, ' words'); WriteLn;
      end;
    end;


var
    Sen: Ars;
    Para: Ars = (
      'A language is a system  of  sounds,  gestures  or',
      'characters. Many deaf people use sign  languages.',
      'All languages have rules for  forming  words  and',
      'for ordering those words in meaningful sentences.',
      'There are several major language families in  the',
      'world. Where did come from the word " TOMATO " in',
      'English? It was borrowed from Nahuatl. There  are',
      'about 150 American Indian languages spoken today!',
      'Languages are always changing,  but  they  change',
      'slowly.' );

  Choice, Answer: Char;

begin
  GetSen(Para, Sen);
  repeat
    Menu;
    Write(' Let me know your choice (0 - 5): '); ReadLn(Choice);

    case Choice of
      '1': TextPrinted(Para);
      '2': SentencePrinted(Para,Sen);
      '3': FindMaxPhrase(Sen);
      '4': DelWord(Para);
      '5': VowelCase(Para, Sen);
      '0': Halt;

    end;

    WriteLn; Write(' Back to main menu? (Y/N) '); ReadLn(Answer);
    if UpCase(Answer) = 'Y' then continue else break;

  until Choice = '0';
end.                             // program Languages;

