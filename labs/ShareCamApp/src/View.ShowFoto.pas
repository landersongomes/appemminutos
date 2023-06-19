unit View.ShowFoto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.MediaLibrary.Actions,
  System.Actions, FMX.ActnList, FMX.StdActns;

type
  TfrmShowFoto = class(TForm)
    ToolBarBotoes: TToolBar;
    ButtonAcao: TButton;
    ButtonCam: TButton;
    ImageFoto: TImage;
    ActionList1: TActionList;
    TakePhotoFromCameraAction1: TTakePhotoFromCameraAction;
    ShowShareSheetAction1: TShowShareSheetAction;
    procedure TakePhotoFromCameraAction1DidFinishTaking(Image: TBitmap);
    procedure ShowShareSheetAction1BeforeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowFoto: TfrmShowFoto;

implementation

{$R *.fmx}

uses
{$IFDEF ANDROID}
  Androidapi.Helpers, Androidapi.JNI.OS, Androidapi.JNI.JavaTypes,
{$ENDIF}
  System.Permissions;

procedure TfrmShowFoto.FormCreate(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([
      JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
      JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE),
      JStringToString(TJManifest_permission.JavaClass.CAMERA)],
      nil, nil);
{$ENDIF}
end;

procedure TfrmShowFoto.ShowShareSheetAction1BeforeExecute(Sender: TObject);
begin
  if not ImageFoto.Bitmap.IsEmpty then
    ShowShareSheetAction1.Bitmap.Assign(ImageFoto.Bitmap);
end;

procedure TfrmShowFoto.TakePhotoFromCameraAction1DidFinishTaking(
  Image: TBitmap);
begin
  ImageFoto.Bitmap.Assign(Image);
end;

end.
