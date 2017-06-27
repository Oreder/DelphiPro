program NEW_ExamTrial;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Windows;

{
� ������� X(L,M) L<=10, M<=11 ������ ������� ����������� ����� ������
�� ���� �����: � ������ ������ ���� real, �� ������ string[8].

������� ������ � �������� ���������.
�������� ��������� ����� ��������� �������.
�������� �������, ������� ������� ������������ ������������� ����� ���� ��������� �������, ���� ������� ��� - ������ ��������� � �������� ���������� � ������ ���������.
�������� ������� ������ �������� � ����� �������� �������.
�������� ��������� ������ � ��������� ���� ���������� �����������.

���������� ���������� � ������������� �� ������������.
}

const
  LM = 10;
  MM = 11;

type
  Element = record
    Num: Real;
    Let: String[8];
  end;

  Mat = array[1..LM,1..MM] of Element;


var
  X: Mat;
  L,M: Integer;

procedure Input(var X: Mat; var L,M: Integer);
  var I,J: Integer;
  begin
    Write('Input number rows and columns: ');
    ReadLn(L,M); WriteLn;

    WriteLn('Input matrix:');
    for I := 1 to L do
      for J := 1 to M do
        with X[I,J] do
          Read(Num, Let);
    WriteLn(' *  *  *  *  *  *  *  Input Done! *  *  *');
  end;


{�������� �������, ������� ������� ������������ ������������� �����
���� ��������� �������, ���� ������� ��� - ������ ��������� �
�������� ���������� � ������ ���������.}

function Product(X: Mat; L,M: Integer): string;
var
  I,J,Error: Integer;
  P: Real;
  B: Boolean;
  S: string;
  begin
    P := 1;

    for I := 1 to L do
      for J := 1 to M do
        begin
          if X[I,J].Num < 0 then
          begin
            P := P * X[I,J].Num;
            B := True;
          end;
        end;
    if not B then
    begin
        Product := ' ������������� ����� ���';
    end
    else
        begin
          Str(P,S);
          Product := S;
        end;
  end;

{
function Product(X: Mat; L,M: Integer): Real;
var
  I,J: Integer;
  B: Boolean;
  begin
    Result := 1;
    B := True;
    for I := 1 to L do
      for J := 1 to M do
        begin
          if X[I,J].Num < 0 then
          begin
            Result := Result * X[I,J].Num;
            B := False;
          end;
        end;
    if B then
    begin
        WriteLn('������������� ����� ���');
        Result := 0;
    end;
  end;
 }


{�������� ������� ������ �������� � ����� �������� �������.}

function Short(X: Mat; L,M: Integer): string;
var
  I, J, II, JJ: Integer;
begin
  II := 1; JJ := 1;
  for I := 1 to L do
    for J := 1 to M do
       if Length(X[II, JJ].Let) > Length(X[I, J].Let) then
       begin
         II := I; JJ := J;
       end;

  Result := X[II, JJ].Let;
end;


{�������� ��������� ������ � ��������� ���� ���������� �����������.}

procedure FileOut(X: Mat; L,M: Integer);
var
    F: TextFile;
begin
    AssignFile(F,'data.txt');
    Rewrite(F);

    WriteLn(F, Product(X,L,M));
    WriteLn(F, Short(X,L,M));

    CloseFile(F);
end;

begin
  //SetConsoleCP(1251);
  //SetConsoleOutputCP(1251);
  Input(X, L, M);
  FileOut(X, L, M);
end.
