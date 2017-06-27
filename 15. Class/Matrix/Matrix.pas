unit Matrix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Math, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  var I,J: Integer; M,N: Integer;
      Z, SA, SN: Integer;

  begin
    M := StrToInt(Edit1.Text);
    N := StrToInt(Edit2.Text);

    with StringGrid1 do
      begin
        ColCount := M+1;
        RowCount := N+1;

        Cells[0,0] := 'N';

        for I := 1 to ColCount do Cells[I,0] := IntToStr(I);
        for J := 1 to RowCount do Cells[0,J] := IntToStr(J);
      end;

    with StringGrid2 do
      begin
        ColCount := 4;
        RowCount := N+1;

        Cells[0,0] := ' Row';
        Cells[1,0] := ' Active sum';
        Cells[2,0] := ' Negative sum';
        Cells[3,0] := ' Sign';

        for J := 1 to RowCount do Cells[0,J] := '   '+IntToStr(J);
      end;

	  Randomize;
    with StringGrid1 do
      for J := 1 to N do
        for I := 1 to M do
          Cells[I,J] := IntToStr(RandomRange(-10,10));

    with StringGrid2 do
      for J := 1 to N do
        begin
          SA := 0; SN := 0;

          for I := 1 to M do
            begin
              Z := StrToInt(StringGrid1.Cells[I,J]);

              if Z > 0 then SA := SA + Z else SN := SN + Abs(Z);
            end;

          Cells[1,J] := '       '     + IntToStr(SA);
          Cells[2,J] := '           ' + IntToStr(SN);

          if SA = SN then Cells[3,J] := '    0'
                     else Cells[3,J] := '   +1';
          if SA < SN then Cells[3,J] := '   -1';
        end;
  end;

end.
