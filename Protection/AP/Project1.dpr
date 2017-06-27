program ProjectAP;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Z: array[1..26] of Real;
  W: Real;
  I, M, I_W: Integer;

begin
  Write('INPUT NUMBER ELEMENTS: ');
  ReadLn(M);
  WriteLn('INPUT ARRAY:');
  for I := 1 to M do
    Read(Z[I]);

  WriteLn;
  Write('INPUT W: ');
  ReadLn(W);

  if W >= Z[1] then
	  I_w := 1
  else
    if W <= Z[M] then
      I_w := M+1
  else
    for I := 1 to M-1 do
      if (Z[I] >= W) and (Z[I+1] <=  W) then
        begin
          I_w := I+1;
          break;
        end;

  if I_w = M+1 then
    Z[I_w] := W
  else
    begin
      for I := M+1 downto I_w + 1 do
        Z[I] := Z[I-1];
      Z[I_w] := W;
    end;

  WriteLn('ARRAY OUTPUT:');
  for I := 1 to M+1 do
    Write(Z[I]:4:2, ' ');

  ReadLn; ReadLn;

end.
