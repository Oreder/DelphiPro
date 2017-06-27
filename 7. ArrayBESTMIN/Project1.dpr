program ARR_MINVALUE;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Max = 100;                     { maximum number elements of array     }

var
  B, C: array[1..Max]of Real;    { B, C: array in Real                  }
  I, N, Im: Integer;             { I: counting variable
                                   N: number elements of array B        }
                                 { Im: index minimum element of array B }

begin
    (* Enter initial data of array *)
  Write('InPUT the number elements of ARRAY: N = ');
  ReadLn(N);
  Write('Please type data of Array B[', N,']: ');
  for I := 1 to N do
    Read(B[I]);
  WriteLn; WriteLn;
    (* Printing input array *)
  Write('ARRAY  INPUT: ');
  for I := 1 to N do
    Write(B[I]:5:2, ' ');
  WriteLn; WriteLn;

    (* Main loop to search Bmin *)
  Im := 1;
  for I := 2 to N do
    if B[I] < B[Im] then
      Im := I;
    (* Conditions to contribute output array *)
  if B[Im] > 0 then
    begin
      Write('ARRAY OUTPUT: ');
      for I := 1 to N do
        begin
          C[I] := B[I] / Sqrt(B[Im]);
          Write(C[I]:5:2,' ');     // Printing array
        end;
      WriteLn; WriteLn;
      Write('WITH MINIMUM ACTIVE VALUE FOUND: B[', Im, '] = ', B[Im]:5:2);
    end
  else
    begin
      Write('OOPS: PROCESS COULD NOT BE DONE BECAUSE OF ERROR: ');
      WriteLn('B_min = ', B[Im]:-3:0, ' NOT SATISFIED');
    end;
  ReadLn; ReadLn;
end.             // Program ARR_MINVALUE
