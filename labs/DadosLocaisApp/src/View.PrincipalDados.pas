unit View.PrincipalDados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBLiteDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FMX.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FMX.Controls.Presentation, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Controls,
  FMX.Objects, FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Edit;

type
  TFormPrincipal = class(TForm)
    ToolBarTopo: TToolBar;
    LabelTitulo: TLabel;
    Ebook_pontosturisticosConnection: TFDConnection;
    PontosturisticosTable: TFDQuery;
    PontosturisticosTableID_PONTOTURISTICO: TIntegerField;
    PontosturisticosTableNOME_PONTOTURISTICO: TStringField;
    PontosturisticosTableFOTO_PONTOTURISTICO: TBlobField;
    ButtonConectar: TButton;
    Edit1: TEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    NavigatorBindSourceDB1: TBindNavigator;
    ImageFoto: TImage;
    LinkControlToField2: TLinkControlToField;
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

procedure TFormPrincipal.ButtonConectarClick(Sender: TObject);
begin
  if not PontosturisticosTable.Active then
    PontosturisticosTable.Active := True ;

end;

end.
