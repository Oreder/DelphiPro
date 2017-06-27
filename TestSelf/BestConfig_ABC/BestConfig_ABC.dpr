program BestConfig_ABC;

{$APPTYPE CONSOLE}

uses
  SysUtils;


const
  InputFile = 'ABC.INP';
  OutputFile = 'ABC.OUT';
  Max = 100;

var
  N, MinC: Integer;
  X, Best: array[1..Max] of 'A'..'C';
  T: array[0..Max] of Integer;
  F: TextFile;
  S: string;


function Same(I,K: Integer): Boolean;
  var J, M: Integer;
  begin
    J := I - K;

    for M := 0 to K-1 do
      if X[I-M] <> X[J - M] then
        begin
          Same := False; Exit;
        end;
    Same := True;
  end;


function Check(I: Integer): Boolean;
  var K: Integer;
  begin
    for K := 1 to I div 2 do
      if Same (I,K) then
        begin
          Check := False; Exit;
        end;
    Check := True;
  end;


procedure KeepResult;
  begin
    MinC := T[N];
    Best := X;
  end;


procedure Again(I: Integer);
  var J: 'A'..'C';
  begin
    for J := 'A' to 'C' do
      begin
        X[I] := J;
        if Check(I) then
          begin
            if J = 'C' then T[I] := T[I-1] + 1
                       else T[I] := T[I-1];

            if T[I] + (N-I) div 4 < MinC then
              if I = N then KeepResult
                       else Again(I+1);
          end;
      end;
  end;


procedure PrintResult;
  var I: Integer;
  begin
    for I := 1 to N do Write(F,Best[I]);
    WriteLn(F);
    WriteLn(F, '"C" Letter Count: ', MinC);
  end;


begin
  Write('Input N: '); ReadLn(N);

  AssignFile(F, InputFile);
  Rewrite(F);
  Write(F,N);
  CloseFile(F);


  Reset(F);
  ReadLn(F,N);
  CloseFile(F);

  AssignFile(F, OutputFile);
  Rewrite(F);

  T[0] := 0;
  MinC := N;

  Again(1);

  PrintResult;

  CloseFile(F);

end.
