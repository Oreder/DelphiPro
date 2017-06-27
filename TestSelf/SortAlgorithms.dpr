program SortAlgorithms;

{$APPTYPE CONSOLE}

uses
  SysUtils;

{ ------------------------------------------ }
{
var Z: Char;

begin
  repeat
    Write('Input key: '); ReadLn(Z);
    WriteLn('OUT: ', Upcase(Z), #32, LowerCase(Z));
  until False;
end.
}

{ ------------------------------------------ }
{
procedure NumString(N: Integer; var S: string);
  var
    V: Integer;
  begin
    V := Abs(N);
    S := '';
    repeat
      S := Chr(V mod 10 + Ord('0')) + S;
      V := V div 10;
    until V = 0;
    if N < 0 then S := '-' + S;
  end;

var
  S: string; N: Integer;

begin
  Write('Input N: '); ReadLn(N);

  NumString(N,S);
  WriteLn('N: ', N, #32, 'S: ', S); ReadLn;
end.
}
{ ------------------------------------------ }

type Zap = array[1..20] of Integer;

procedure IA(var Z: Zap; var NZ: Integer);
  var I: Integer;
  begin
    Write('Input NZ: '); ReadLn(NZ);
    Write('Now let input ', NZ, ' members: ');
    for I := 1 to NZ do
      Read(Z[I]);
  end;

procedure OA(Z: Zap; NZ: Integer);
  var I: Integer;
  begin
    WriteLn; Write('OUTPUT SORT: ');
    for I := 1 to NZ do Write(Z[I],#32);
    ReadLn; ReadLn;
  end;


procedure MinSwap(var A,B: Integer);
  begin
    if A < B then
      begin
        B := A - B;
        A := A - B;
        B := A + B;
      end;
  end;


procedure BubbleSort(NZ: Integer; var Z: Zap);
  var I,J: Integer;
  begin
    for I := 2 to NZ do
      for J := NZ downto I do
        MinSwap(Z[J],Z[J-1]);
  end;


procedure InsertionSort(NZ: Integer; var Z: Zap);
  var I,J: Integer; Key: Integer;
  begin
    for I := 2 to NZ do
      begin
        Key := Z[I];
        J := I - 1;

        while (J>0) and (Key<Z[J]) do
          begin
            Z[J+1] := Z[J];
            Dec(J);
          end;
        Z[J+1] := Key;
      end;
  end;


{
procedure MergeSort(NZ: Integer; var Z: Zap);
  begin

  end;
}




procedure QuickSort(L,H: Integer; var Z: Zap);
  var I,J: Integer;
      Pivot: Integer;

  begin
    if L >= H then Exit;
    Pivot := Z[Random(H-L+1)+L];
    I := L; J := H;

    repeat
      while Z[I] < Pivot do Inc(I);
      while Z[J] > Pivot do Dec(J);
      if I <= J then
        begin
          if I < J then MinSwap(Z[I],Z[J]);
          Inc(I); Dec(J);
        end;
    until I > J;
    QuickSort(L,J,Z); QuickSort(I,H,Z);
  end;





var
  Z: Zap; NZ: Integer;

begin
  IA(Z,NZ);
  //BubbleSort(NZ,Z);
  //InsertionSort(NZ,Z);
  //QuickSort(NZ,Z);

  QuickSort(1,NZ,Z);


  OA(Z,NZ);
end.
