program FP;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Windows;

type
  Stu = record
    Fam : string;
    Name: string;
    Year: Integer;
  end;



var
  F1,F2: TextFile;
  Ans: Char;
  Z: Stu;
  Z1, Z2: Integer;

begin
  SetConsoleCP(1251);

  AssignFile(F1,'data.txt');
  Rewrite(F1);

  repeat
    with Z do
      begin
        Write('фамилия: '); ReadLn(Fam); WriteLn(F1,Z.Fam);
        Write('  Имя  : '); ReadLn(Name);WriteLn(F1,Z.Name);
        Write('  Год  : '); ReadLn(Year);WriteLn(F1,Z.Year);
      end;

    Write('Продожить? (Д/Н) '); ReadLn(Ans);

  until Upcase(Ans) = 'N';

  CloseFile(F1);

  WriteLn; Write('Вводить 2 числа: '); ReadLn(Z1,Z2);

  AssignFile(F2,'FileOut.txt');
  Rewrite(F2);

  Reset(F1);

  while not Eof(F1) do
    begin
      ReadLn(F1,Z.Fam); ReadLn(F1,Z.Name); ReadLn(F1,Z.Year);
      if (Z.Year > Z1) and (Z.Year < Z2) then
        WriteLn(F2,Z.Fam:10,Z.Name:10, Z.Year:7);
    end;

  CloseFile(F1);
  CloseFile(F2);

  SetConsoleOutputCP(1251);
  ReadLn;

end.

