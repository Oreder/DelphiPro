program example1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  NN = 15;

var
  F: TextFile;
  Vector: array[1..NN] of Integer;
  FileName: string[20];
  I, J: Integer;


begin
  Write('INPUT NAME FILE: ');
  ReadLn(FileName);

  AssignFile(F, FileName);
  Reset(F);

  I := 0;
  while not SeekEOF(F) do
    begin
      Inc(I);
      Read(F, Vector[I]);
    end;

  CloseFile(F);

  for J := 1 to I do
    Write(Vector[J]:4);
  WriteLn;
  ReadLn;

end.
