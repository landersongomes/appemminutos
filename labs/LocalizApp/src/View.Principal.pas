unit View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, System.Sensors, FMX.Layouts,
  System.Sensors.Components, FMX.MultiView, FMX.ListBox, FMX.Objects;

type
  TfrmPrincipal = class(TForm)
    ToolBarTopo: TToolBar;
    LabelTitulo: TLabel;
    LocationSensorPosicao: TLocationSensor;
    LayoutGeral: TLayout;
    SwitchAtivar: TSwitch;
    RectangleInfos: TRectangle;
    LabelLat: TLabel;
    LabelLong: TLabel;
    procedure SwitchAtivarSwitch(Sender: TObject);
    procedure LocationSensorPosicaoLocationChanged(Sender: TObject;
      const OldLocation, NewLocation: TLocationCoord2D);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Ativar(AValor : boolean);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}
uses
{$IFDEF ANDROID}
  Androidapi.Helpers, Androidapi.JNI.OS, Androidapi.Jni.JavaTypes,
{$ENDIF}
  System.Permissions;
procedure TfrmPrincipal.Ativar(AValor: boolean);
begin
  LocationSensorPosicao.Active := AValor;
  LabelLat.Visible := AValor;
  LabelLong.Visible := AValor;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([
                                          JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION)],
                                          nil,
                                          nil);
{$ENDIF}
end;

procedure TfrmPrincipal.LocationSensorPosicaoLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
var
  lConfiguracoes : TFormatSettings;
  lSeparadorDecimal : Char;
begin
  lConfiguracoes := FormatSettings;
  lSeparadorDecimal := FormatSettings.DecimalSeparator;
  try
    FormatSettings.DecimalSeparator := '.';
    LabelLat.Text := Format('Lat: %2.6f', [NewLocation.Latitude]);
    LabelLong.Text := Format('Long: %2.6f', [NewLocation.Longitude]);
  finally
    FormatSettings.DecimalSeparator := lSeparadorDecimal;
  end;

end;

procedure TfrmPrincipal.SwitchAtivarSwitch(Sender: TObject);
begin
  Ativar(SwitchAtivar.IsChecked);

end;

end.
