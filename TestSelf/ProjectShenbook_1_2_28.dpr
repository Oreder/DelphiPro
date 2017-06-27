program ProjectShenbook_1_2_28;

{$APPTYPE CONSOLE}

{
Problem (square matrix)
	Make a comparison between:
		1) Maximum value of min elements of each rows
		2) Minimum value of max elements of each columns
}

uses
  SysUtils,Math;


const NA = 100;

type
  Vector = array[1..NA] of Integer;
  Matrix = array[1..NA,1..NA] of Integer;


procedure InMat(var M,N: Integer; var A: Matrix);
  var I,J: Integer;
  begin
    Write('Input number rows and columns: '); ReadLn(M,N); WriteLn;

    //Randomize;
    WriteLn('Data input:'); WriteLn;
    for I := 1 to M do
      begin
        for J := 1 to N do
          begin
            A[I,J] := Random(10);//RandomRange(-5,10);
            Write(#32,A[I,J]:2);
          end;
        WriteLn; WriteLn;
      end;
  end;


procedure Find(M,N: Integer; A: Matrix);
  var I,J: Integer;
      Min,Max: Vector;
      P,Q: Integer;

  begin
    Write(' Min Rows: ');
    for I := 1 to M do
      begin
        Min[I] := A[I,1];
        for J := 2 to N do
          if A[I,J] < Min[I] then Min[I] := A[I,J];
        Write(Min[I]:4);

        if I = 1 then P := Min[I] else
          if Min[I] > P then P := Min[I];
      end;
    WriteLn; WriteLn(' Max of MinRows: ',P);
    WriteLn;

    Write(' Max Cols: ');
    for J := 1 to N do
      begin
        Max[J] := A[1,J];
        for I := 2 to M do
          if A[I,J] > Max[J] then Max[J] := A[I,J];
        Write(Max[J]:4);

        if J = 1 then Q := Min[J] else
          if Max[J] > Q then Q := Max[J];
      end;
    WriteLn; WriteLn(' Min of MaxCols: ',Q);
    WriteLn; Write('[OUT] Comparison: ');

    if P > Q then Write('MinRows is bigger than MaxCols!')
             else Write('MaxCols is bigger than MinRows!');

  end;



var
  A: Matrix;
  M,N: Integer;

begin
  InMat(M,N,A);
  Find(M,N,A);
  ReadLn;

end.
