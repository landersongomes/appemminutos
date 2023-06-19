unit View.TelaPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, REST.Types,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.DBScope, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation;

type
  TTelaPrincipal = class(TForm)
    RESTClientAPILayer: TRESTClient;
    RESTRequestNumVerify: TRESTRequest;
    RESTResponseNumVerify: TRESTResponse;
    RESTResponseDataSetAdapterNumVerify: TRESTResponseDataSetAdapter;
    FDMemTableNumVerify: TFDMemTable;
    ToolBarTopo: TToolBar;
    EditNumeroTelefone: TEdit;
    ButtonExecutar: TButton;
    LabelLocalizacao: TLabel;
    LabelTipoLinha: TLabel;
    LabelInternational: TLabel;
    LabelPais: TLabel;
    LabelOperadora: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    LinkPropertyToFieldText5: TLinkPropertyToField;
    procedure ButtonExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TelaPrincipal: TTelaPrincipal;

implementation

{$R *.fmx}

procedure TTelaPrincipal.ButtonExecutarClick(Sender: TObject);
begin
  RESTRequestNumVerify.Params.ParameterByName('access_key').Value := 'd4e9e19384ca5b0d2a27822da6c0127f'; //'eab35b419007872fd1962fc78332e4ef';
  RESTRequestNumVerify.Params.ParameterByName('number').Value := EditNumeroTelefone.Text;
  RESTRequestNumVerify.Execute;
end;

end.
