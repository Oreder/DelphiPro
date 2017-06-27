unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Grid1: TStringGrid;
    Grid2: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  I, J: Integer;
begin
  Randomize;
  for I := 1 to Grid1.RowCount-1 do
    for J := 1 to Grid1.ColCount-1 do
      Grid1.Cells[I, J] := IntToStr(Random(20)-10);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I, J, Min, Max: Integer;
  MinI, MinJ, MaxI, MaxJ: Integer;
  T: String;
begin
  Min := StrToInt(Grid1.Cells[1, 1]);
  Max := StrToInt(Grid1.Cells[1, 1]);
  for I := 1 to Grid1.RowCount-1 do
    for J := 1 to Grid1.ColCount-1 do
    begin
       if Min >= StrToInt(Grid1.Cells[I, J]) then
       begin
         Min := StrToInt(Grid1.Cells[I, J]);
         MinI := I;
         MinJ := J;
       end;
       if Max <= StrToInt(Grid1.Cells[I, J]) then
       begin
         Max := StrToInt(Grid1.Cells[I, J]);
         MaxI := I;
         MaxJ := J;
       end;
    end;

  for I := 1 to Grid1.RowCount-1 do
    Grid2.Rows[I] := Grid1.Rows[I];

  if MinJ = MaxJ then
  begin
    for I := 1 to Grid2.RowCount-1 do
    begin
      T := Grid2.Cells[MinI, I];
      Grid2.Cells[MinI, I] := Grid2.Cells[MaxI, I];
      Grid2.Cells[MaxI, I] := T;
    end;
  end
  else
  begin
    Grid2.RowCount := Grid2.RowCount + 1;
    Grid2.Rows[Grid2.RowCount] := Grid2.Rows[MinJ];
    Grid2.Rows[MinJ] := Grid2.Rows[MaxJ];
    Grid2.Rows[MaxJ] := Grid2.Rows[Grid2.RowCount];
    Grid2.RowCount := Grid2.RowCount - 1;
  end;

  Label5.Caption := 'Минимальный элемент ' + Grid1.Cells[MinI, MinJ] + #13#10
    + 'расположен на ' + IntTostr(MinJ) + ' строке и ' + IntTostr(MinI) + ' столбце';
  Label6.Caption := 'Максимальный элемент ' + Grid1.Cells[MaxI, MaxJ] + #13#10
    + 'расположен на ' + IntTostr(MaxJ) + ' строке и ' + IntTostr(MaxI) + ' столбце';
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
begin
  if Key = #13 then
  begin
    Grid1.RowCount := StrToInt(Edit1.Text)+1;
    Grid1.ColCount := StrToInt(Edit2.Text)+1;
    Grid2.RowCount := StrToInt(Edit1.Text)+1;
    Grid2.ColCount := StrToInt(Edit2.Text)+1;

    for I := 1 to Grid1.RowCount do
    begin
      Grid1.Cells[0, I] := IntToStr(I);
      Grid2.Cells[0, I] := IntToStr(I);
    end;
    for I := 1 to Grid1.ColCount do
    begin
      Grid1.Cells[I, 0] := IntToStr(I);
      Grid2.Cells[I, 0] := IntToStr(I);
    end;
  end;
end;

end.
