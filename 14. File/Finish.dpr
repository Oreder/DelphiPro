{Project Language In File}

program Finish;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  Language = record
    Name  : string[20];
    Native: Integer;
    Total : Integer;
    Map   : string[20];
  end;

  World = file of Language;




var
  F,G: World; Fname: string[12];
  United: Language;
  Ans, Choice: Char;
  S: string;
  I,N,Z,T: Integer;
  Key: Boolean;



procedure Menu;
  begin
    WriteLn; WriteLn('   MENU'); WriteLn;
    WriteLn('   1) Input more record into table.');
    WriteLn('   2) Remove record with any input information.');
    WriteLn('   3) Print data of file after changing.');
    WriteLn('   4) Search record, including information.');
    WriteLn('   0) Exit.'); WriteLn;
  end;




  (* procedure inputs data of file *)
procedure Input(var F: World);
  begin
	Write('Input file name: '); ReadLn(Fname);
	AssignFile(F,Fname);
	Rewrite(F);

	I := 1;

	repeat
		WriteLn; WriteLn('Input language [',I,']:');

		With United do
			begin
				Write('Name   : '); ReadLn(Name);
				Write('Native : '); ReadLn(Native);
				Write('Total  : '); ReadLn(Total);
				Write('Country: '); ReadLn(Map);
			end;

		Write(F,United);

		Inc(I);

		Write('Continue (Y/N)? '); ReadLn(Ans);

	until Upcase(Ans) = 'N';

	CloseFile(F);
  end;




  (* procedure prints file *)
procedure Infor(var F: World);
  begin
    WriteLn; WriteLn('-------------------------------------');
    WriteLn(' TABLE OF SOME LANGUAGES IN THE WORLD'); WriteLn;
	  WriteLn('Name':12, 'Native ':12, 'Total  ':12, 'Country ':14);
	  WriteLn(' ':12, 'speakers':12, 'speakers':12, '(example)':14);
	  WriteLn;
    Reset(F);

    while not EOF(F) do
      begin
        Read(F, United);
        With United do
			    WriteLn(Name:12, Native:9, Total:13, Map:16);
      end;

    WriteLn;
    Write(' ':10,'(Native and total speakers are calculated by millions)');
    WriteLn; WriteLn;

    CloseFile(F);
  end;



    (* procedure write more record into file *)
procedure PrintMore(var F: World);
  begin
    repeat
		  WriteLn; WriteLn('Input language:');

		  with United do
			begin
				Write(' Name   : '); ReadLn(Name);
				Write(' Native : '); ReadLn(Native);
				Write(' Total  : '); ReadLn(Total);
				Write(' Country: '); ReadLn(Map);
			end;

      Reset(F);
      Seek(F,FileSize(F));
		  Write(F,United);
      Write(' Continue adding new record (Y/N)? '); ReadLn(Ans);
    until Upcase(Ans) = 'N';

    CloseFile(F);
    Infor(F);
  end;




  (* procedure search words of each record in file *)
procedure WordFound(var F,G: World);
  begin
    AssignFile(G,'word');
    Rewrite(G);

    Reset(F);

    Write(' Input information, contained by record that you want to find: ');
    ReadLn(S);

    while not Eof(F) do
      begin
        Read(F,United);

        Key := False;

        with United do
          if ((N = 1) and (Pos(S, Name) > 0))
          or ((N = 4) and (Pos(S, Map) > 0)) then  Key := True;

        if Key then
          Write(G,United);
      end;

    CloseFile(G);
  end;



   (* procedure search number in records *)
procedure NumberFound(var F,G: World);
  begin
    AssignFile(G,'number');
    Rewrite(G);

    Reset(F);

    Write(' Input Number: ');
    ReadLn(Z, T); WriteLn;

    while not Eof(F) do
      begin
        Read(F,United);

        Key := False;

        with United do
          begin
            if (N=2) and (Native > Z) and (Native < T) then Key := True;
            if (N=3) and (Total  > Z) and (Total  < T) then Key := True;
          end;

  {
    WriteLn(' Search for record, which has value:  (1) Greater  (2) Smaller');
    Write(' Your selection (1/2): '); ReadLn(Choice);

    while not Eof(F) do
      begin
        Read(F, United);

        Key := False;

        with United do
          begin
          if (Choice = '1') then
              if ((N = 2) and (Native > Z)) or
                 ((N = 3) and (Total  > Z)) then Key := True;

          if (Choice = '2') then
              if ((N = 2) and (Native < Z)) or
                 ((N = 3) and (Total  < Z)) then Key := True;
          end;
   }

        if Key then
          Write(G,United);
      end;

    CloseFile(G);
  end;



  (* procedure tranfer data of file *)
procedure Renew(var F,G: World);
  begin
    Rewrite(F);
    Reset(G);

    while not Eof(G) do
      begin
        Read(G,United);
        Write(F,United);
      end;

    CloseFile(F);

    CloseFile(G);
    Erase(G);
  end;



  (* procedure remove words of each record in file *)
procedure WordRemove(var F,G: World);
  begin
    AssignFile(G,'word');
    Rewrite(G);

    Reset(F);

    Write(' Input information, contained by record that you want to remove: ');
    ReadLn(S);

    while not Eof(F) do
      begin
        Read(F,United);

        Key := False;

        with United do
          if ((N = 1) and (Pos(S, Name) > 0))
          or ((N = 4) and (Pos(S, Map) > 0)) then  Key := True;

        if not Key then
          Write(G,United);
      end;

    CloseFile(G);
  end;


  (* remove number from file *)
procedure NumberRemove(var F,G: World);
  begin
    AssignFile(G,'number');
    Rewrite(G);

    Reset(F);

    Write(' Input Number: ');
    ReadLn(Z, T); WriteLn;

    while not Eof(F) do
      begin
        Read(F,United);

        Key := False;

        with United do
          begin
            if (N=2) and (Native > Z) and (Native < T) then Key := True;
            if (N=3) and (Total  > Z) and (Total  < T) then Key := True;
          end;

        if not Key then
          Write(G,United);
      end;

    CloseFile(G);
  end;



  (* procedure remove record *)
procedure Hide(var F,G: World);
  begin
      Infor(F);

      Write(' Enter number of column to search (1-4): ');
      ReadLn(N); WriteLn;

      if (N = 1) or (N = 4) then   WordFound(F,G);
      if (N = 2) or (N = 3) then NumberFound(F,G);
      Infor(G); Renew(F,G);


      Write(' Enter number of column to remove (1-4): ');
      ReadLn(N); WriteLn;

      if (N = 1) or (N = 4) then   WordRemove(F,G);
      if (N = 2) or (N = 3) then NumberRemove(F,G);

      Infor(G); Renew(F,G);
  end;




















  (* procedure full output after searching, adding and removing record *)
procedure Main(var F: World);
  begin
    repeat
      Infor(F);
      Write(' Enter number of column to search (1-4): ');
      ReadLn(N); WriteLn;

      if (N = 1) or (N = 4) then   WordFound(F,G);
      if (N = 2) or (N = 3) then NumberFound(F,G);

      Infor(G); Erase(G);
      Write(' Continue searching (Y/N)? '); ReadLn(Ans);
    until Upcase(Ans) = 'N';

  {
    Write(' Add more record (Y/N)? '); ReadLn(Ans);
    if Upcase(Ans) = 'Y' then PrintMore(G);
  }

    Hide(F,G); //Renew(F,G);

    Infor(F);
  end;




  (* procedure search record, containing information *)
procedure Search(var F: World);
    begin
      repeat
        Write(' Enter number of column to search (1-4): ');
        ReadLn(N); WriteLn;

        if (N = 1) or (N = 4) then   WordFound(F,G);
        if (N = 2) or (N = 3) then NumberFound(F,G);

        Infor(G);// Renew(F,G);
        Write(' Continue searching (Y/N)? '); ReadLn(Ans);
      until Upcase(Ans) = 'N';
    end;



  (* Main program *)
begin
  Input(F);

  repeat
    WriteLn; WriteLn; Infor(F);
    Menu;

    Write(' Let me know your choice? (0 - 4) '); ReadLn(Choice);

    case Choice of
      '1': PrintMore(F);
      '2': Hide(F,G);
      '3': Infor(F);
      '4': Search(F);
      '0': Halt;
    else
      WriteLn(' Error: Invalid choice!');
    end;

    Write(' Back to main menu? (Y/N) '); ReadLn(Ans);
    WriteLn; WriteLn; WriteLn; WriteLn; WriteLn;

  until UpCase(Ans) = 'N';
end.
