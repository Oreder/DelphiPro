program NEW_SortArray_v2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const NA = 100;

var
  Z: array[1..NA] of Integer;
  I,J,N,Key,Save: Integer;

begin
  Write('Input number elements: '); ReadLn(N); WriteLn;
  Write(' Input: ');
  for I := 1 to N do
    begin
      Z[I] := 100 + Random(900);
      Write(Z[I],#32#32);
    end;
  WriteLn; WriteLn;

  (* Insertion SOrt *)
  for I := 2 to N do
    begin
      Save := Z[I];
      Key  := Z[I] div 10 mod 10;
      J := I-1;

      while (J>0) and (Z[J] div 10 mod 10 > Key) do
        begin
          Z[J+1] := Z[J];
          Dec(J);
        end;

      Z[J+1] := Save;
    end;

  Write('Output: ');
  for I := 1 to N do
    Write(Z[I],#32#32);
  ReadLn;

end.
