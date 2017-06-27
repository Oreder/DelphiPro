unit TemperatureScales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
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
  var
    Celsius: Real;
    Fahrenheit: Real;
    Reaumur: Real;
    Lb: string;

  procedure Fill(var S: string);
    var I: Integer;
    begin
      if Length(S) < 30 then
        for I := 1 to 30 - Length(S) do S := ' ' + S; S := S+' ';
    end;

  begin
    Celsius := StrToFloat(Edit1.Text);

    if Celsius <= -273.15 then
      ShowMessage('ERROR: Temperature '+Edit1.Text+' degrees NOT EXIST in scale Celsius')
    else
      begin
        Fahrenheit := 1.8 * Celsius + 32;
        Lb := FloatToStr(Fahrenheit); Fill(Lb);
        Label4.Caption := Lb;

        Reaumur := 4/5*Celsius;
        Lb := FloatToStr(Reaumur); Fill(Lb);
        Label6.Caption := Lb;
      end;
  end;

end.
