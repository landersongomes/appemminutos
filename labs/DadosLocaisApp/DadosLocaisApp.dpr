program DadosLocaisApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.PrincipalDados in 'src\View.PrincipalDados.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
