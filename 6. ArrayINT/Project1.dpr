program ArraySearching;

  {$APPTYPE CONSOLE}

uses
  SysUtils;

const
  Max = 7;

var
  MZ, N: array[1..Max]of Integer;   { MZ: Array INPUT
                                     N: Array OUTPUT         }
  I, J: Integer;                  { I, J: Counting variables }
  K: Integer;                      // K : number elements array

begin
    (* Enter initial array *)
  Write('INPUT NUMBER ELEMENT OF ARRAY MZ: '); ReadLn(K);
  Write('InPUT ARRAY (please type ', K, ' numbers) : ');
  for I := 1 to K do
    Read(MZ[I]);
    (* Printing array MZ *)
  WriteLn; Write('ARRAY INPUT  MZ[', K, ']: ');
  for I := 1 to K do
    Write(MZ[I], ' ');
  WriteLn; WriteLn;

  J := 0;       // setting initial value J = 0;

    (* Main loop *)
  for I := 1 to K do
      (* Condition to build array N *)
    if MZ[I] mod 5 = 0 then
      begin
        J := J + 1;
        N[J] := MZ[I];
      end;
    (* Printing array output with condition *)
  if J > 0 then
    begin
      Write('ARRAY OUTPUT N[', J, '] : ');
      for I := 1 to J do
        Write(N[I], ' ');
    end
  else
    Write('OPPS: ARRAY OUTPUT Z has NO elements. ');

  ReadLn; ReadLn;
end.                  // Program ArraySearching
