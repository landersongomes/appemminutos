unit View.ShowFoto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects;

type
  TfrmShowFoto = class(TForm)
    ToolBarBotoes: TToolBar;
    ButtonAcao: TButton;
    ButtonCam: TButton;
    ImageFoto: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowFoto: TfrmShowFoto;

implementation

{$R *.fmx}

end.
