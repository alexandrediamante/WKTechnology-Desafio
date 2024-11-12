unit view.cadastrocliente;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  controller.interfaces;

type
  TFormCliente = class(TForm)
    Panel1: TPanel;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FController: iController;
    FCodigo:     Integer;
    FNome:       String;
    FCidade:     String;
    FEstado:     String;

    procedure LimparCampos;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome:   String read FNome write FNome;
  end;

implementation

uses
  Data.DB,
  controller.impl.controller;

{$R *.dfm}

procedure TFormCliente.btnSalvarClick(Sender: TObject);
begin
  var
  lCliente := FController.entity.Cliente.SetNome(edtNome.Text).SetCidade(edtCidade.Text).SetEstado(edtEstado.Text);
  FController.dao(lCliente).Inserir;

  var
  lDataSource := TDataSource.Create(nil);
  try
    FController.dao(lCliente).Listar.DataSource(lDataSource);
    lDataSource.DataSet.Locate('NOME;CIDADE;UF', VarArrayOf([lCliente.GetNome, lCliente.GetCidade, lCliente.GetEstado]), []);
    FCodigo := lDataSource.DataSet.FieldByName('CODIGO').AsInteger;
    FNome   := lDataSource.DataSet.FieldByName('NOME').AsString;

    ShowMessage('Cliente Cadastrado com sucesso!!');
    LimparCampos;
    Self.Close;
  finally
    lDataSource.Free;
  end;
end;

procedure TFormCliente.FormCreate(Sender: TObject);
begin
  FController := TController.New;
end;

procedure TFormCliente.LimparCampos;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtCidade.Clear;
  edtEstado.Clear;
end;

end.
