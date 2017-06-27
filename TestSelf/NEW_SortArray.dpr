program NEW_SortArray;

{$APPTYPE CONSOLE}

{
  Input array of integer which has all elements in range 100 - 999.
  Change array into new array in increasing elements of tens digit.

  For example,
    -  Input:   423 915 555 327 601
    - Output:   601 915 327 423 555

}

uses
  SysUtils;


const NA = 1000;

procedure Swap(var A,B: Integer);
  begin
    B := A - B;
    A := A - B;
    B := A + B;
  end;


var
  Z: array[1..NA] of Integer;
  I,J,N,D1,D2: Integer;

begin
  Write('Input number elements: '); ReadLn(N); WriteLn;
  Write(' Input: ');
  for I := 1 to N do
    begin
      Z[I] := 100 + Random(900);
      Write(Z[I],#32#32);
    end;
  WriteLn; WriteLn;

  for J := 2 to N do
    for I := N downto J do
      begin
        D1 := Z[I-1] div 10 mod 10;           // mod 100 div 10;
        D2 :=  Z[I]  div 10 mod 10;

        if (D1 > D2) or ((D1 = D2) and (Z[I-1] > Z[I]))
          then Swap(Z[I-1],Z[I]);
      end;

  Write('Output: ');
  for I := 1 to N do Write(Z[I],#32#32);
  ReadLn;

end.            // Done! 18.01.15
