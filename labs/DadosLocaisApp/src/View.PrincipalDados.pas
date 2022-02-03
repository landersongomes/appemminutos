unit View.PrincipalDados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Controls.Presentation, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Controls,
  FMX.Objects, FMX.Layouts, FMX.Edit, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.Components,
  Data.Bind.DBScope, Fmx.Bind.Navigator;

type
  TFormPrincipal = class(TForm)
    ToolBarTopo: TToolBar;
    LabelTitulo: TLabel;
    ButtonConectar: TButton;
    EditPontoTuristico: TEdit;
    ImageFoto: TImage;
    Ebook_pontosturisticosConexao: TFDConnection;
    PontosTuristicosTabela: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure Ebook_pontosturisticosConexaoBeforeConnect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonConectarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.fmx}
uses
{$IFDEF ANDROID}
  Androidapi.Helpers, Androidapi.JNI.OS, Androidapi.JNI.JavaTypes,
{$ENDIF}
  System.Permissions, System.IOUtils;

procedure TFormPrincipal.ButtonConectarClick(Sender: TObject);
begin
  Ebook_pontosturisticosConexao.Open;
  PontosTuristicosTabela.Open('select * from pontosturisticos');

end;

procedure TFormPrincipal.Ebook_pontosturisticosConexaoBeforeConnect(
  Sender: TObject);
begin
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
    Ebook_pontosturisticosConexao.Params.Values['Database'] :=
        TPath.Combine(TPath.GetDocumentsPath, 'PONTOSTURISTICOS.sqlite3');
  {$ENDIF}
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
{$IFDEF ANDROID}
  PermissionsService.RequestPermissions([
      JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE),
      JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE)],
      nil, nil);
{$ENDIF}
end;

end.
