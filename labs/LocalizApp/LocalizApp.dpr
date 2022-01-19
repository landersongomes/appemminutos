program LocalizApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Principal in 'src\View.Principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
