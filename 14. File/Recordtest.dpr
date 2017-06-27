program Recordtest;

{$APPTYPE CONSOLE}

uses
  SysUtils;

label Lab;

type
  Date = Record
    Day: 1..31;
    Month: 1..12;
    Year: Word;
  end;

  Member = Record
    Name: string[30];
    Birthday: Date;
    Salary: Real;
    Status: Boolean;

  end;



var
    Note: array[1..10] of Member;
    I, Max: Integer;
    Stt: Char;

    St: string;

begin
  WriteLn('INPUT NOTES: ');
  Write('INPUT NUMBER members: ');
  ReadLn(Max);

  for I := 1 to Max do
    begin
      Write('Name    : ');      ReadLn(Note[I].Name);
      Write('Birthday: ');      Read(Note[I].Birthday.Day);
      //GotoXY(11,3);            Read(Note[I].Birthday.Month);

      Write(' ':14);            Read(Note[I].Birthday.Month);
      Write(' ':17);            ReadLn(Note[I].Birthday.Year);

      Write('Salary  : ');      ReadLn(Note[I].Salary);
      Write('Status  : ');      ReadLn(Stt);

      if Upcase(Stt) = 'Y' then
        Note[I].Status := True
      else
        Note[I].Status := False;

    end;



{  Write('INPUT STRING: ');
  ReadLn(St);
  for I := 1 to Length(St) do
    begin
      if St[I] = ' ' then
        goto Lab;
      if St[I] in ['A'..'Z'] then
        St[I] := Chr(Ord(St[I]) + 32)
      else
        St[I] := Upcase(St[I]);

      Lab: ;
    end;
  WriteLn(St);





  {WriteLn('Hello!  ');
  for I := 1 to 255 do
    begin
      if I mod 16 = 0 then
        begin
          WriteLn; WriteLn;
        end;
      Write(Chr(I):4);
    end;
  WriteLn;
  WriteLn('You correctly typed: ', Ord(Ch));}
  ReadLn;


  {Write('Do you want to continue? (Y/N) ');
  ReadLn(Reply);
  until Upcase(Reply) = 'N';                }

end.
