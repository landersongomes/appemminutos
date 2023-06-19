program ShareCamApp;



uses
  System.StartUpCopy,
  FMX.Forms,
  View.ShowFoto in 'src\View.ShowFoto.pas' {frmShowFoto};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmShowFoto, frmShowFoto);
  Application.Run;
end.
