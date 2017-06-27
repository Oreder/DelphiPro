program TScales;

uses
  Forms,
  TemperatureScales in 'TemperatureScales.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
