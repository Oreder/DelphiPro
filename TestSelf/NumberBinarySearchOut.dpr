program NumberBinarySearchOut;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const NA = 1000;

var
  Z: array[1..NA] of Integer;
  A,I,N: Integer;
  PS,PM,PE: Integer;  // counting bit
                      // S,E: starting and ending keys
                      // M: middle key
  Check: Boolean;


begin
  {Input array, number elements}
  Write('Input number elements: '); ReadLn(N);
  Write('Input searching number: '); ReadLn(A); WriteLn;

  Z[1] := Random(5);
  for I := 2 to N do Z[I] := Z[I-1] + Random(5);

  PS := 1; PE := N; Check := False;

  while PS+1 <> PE do
    begin
      PM := (PS+PE) div 2;
      if Z[PM] <= A then PS := PM else PE := PM;

      if Z[PM] = A then Check := True;
    end;

  {
  while PS < PE do
    begin
      PM := (PS+PE) div 2;
      if Z[PM] < A then PS := PM+1 else
      if Z[PM] > A then PE := PM-1 else
        begin
          Check := True;
          PS := PM; Break;
        end;
    end;
  }


  Write('Array out: ');
  for I := 1 to N do Write(Z[I],#32); WriteLn; WriteLn;

  if Check then Write('Result: FOUND! Position: ',PM)
           else Write('Result: A = ',A, ' - NOT FOUND!');

  ReadLn;
end.
