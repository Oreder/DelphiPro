program Binh_1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  Z: array[1..7,1..7] of Integer;
  S: array[1..30] of Integer;

  I, J, K, L, R: Integer;

begin
  Write('INPUT NUMBER L: ');
  ReadLn(L);

  WriteLn('INPUT MATRIX Z (', L, ',', L, ') :');
  for I := 1 to L do
    for J := 1 to L do
      Read(Z[I,J]);

  K := 2; R := 0;
  for I := 1 to L do
    for J := 1 to L do
      if (I+J <= L+1) then
        begin
          S[K] := Z[I,J];

          if (S[K] > 0) then
            R := R + S[K];

          Inc(K);
        end;

  S[1] := R;

  WriteLn;
  WriteLn('OUTPUT VECTOR S: '); WriteLn;

  if (R>0) then
    begin
      Write(S[1]:3);
      for I := 2 to K-1 do
        if (I mod 4 <> 1) then
          Write(S[I]:3)
        else
          begin
            WriteLn; WriteLn;
            Write(S[I]:3);
          end;
    end
  else
    begin
      for I := 2 to K-1 do
        if (I mod 4 <> 1) then
          Write(S[I]:3)
        else
          begin
            WriteLn; WriteLn;
            Write(S[I]:3);
          end;
      WriteLn;
      WriteLn('VECTOR S HAS NO POSITIVE ELEMENTS.');
    end;

  ReadLn; ReadLn;
end.
