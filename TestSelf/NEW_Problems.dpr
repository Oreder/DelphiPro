program NEW_Problems;

{$APPTYPE CONSOLE}

{

Problem:
  Let array a[1],    a[2],      a[3],      a[4], a[5], .. a[n-1],  a[n]
  Change into new array with form:
            a[1], a[1]*a[3], a[2]*a[4], a[3]*a[5], .. a[n-2]*a[n], a[n]
 NOTICE: Mustn't use another array!!

}


uses
  SysUtils;


const NA = 1000;

var
  Z: array[1..NA] of Integer;
  I,K: Integer;
  M,N: Integer;

begin
  //  SetLength(Z,10);
  //  for I := Low(Z) to High(Z) do
  Write('Input number elements: '); ReadLn(K);
  Write(' Input array: ');
  for I := 1 to K do Read(Z[I]);
  WriteLn;
  WriteLn('-------------------------------------');
  WriteLn;
  Write(' [Input]: '); for I := 1 to K do Write(Z[I]:4);
  WriteLn; WriteLn;


  I := 1; N := Z[1];
  while I < K do
    begin
      M := Z[I+1];
      Inc(I);
      Z[I] := N*Z[I+1];
      N := M;
    end;
  Z[K] := N;


  Write('[Output]: '); for I := 1 to K do Write(Z[I]:4);
  ReadLn; ReadLn;

end.           // Solved 10.01.2015
