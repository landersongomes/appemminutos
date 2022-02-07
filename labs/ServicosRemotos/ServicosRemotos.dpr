program ServicosRemotos;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.TelaPrincipal in 'src\View.TelaPrincipal.pas' {TelaPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTelaPrincipal, TelaPrincipal);
  Application.Run;
end.
