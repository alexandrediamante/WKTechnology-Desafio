unit view.listacliente;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  controller.interfaces;

type
  TFormClienteLista = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtPesquisa: TEdit;
    pnlLupa: TPanel;
    ImageLupa: TImage;
    btnLupa: TSpeedButton;
    DBGrid1: TDBGrid;
    dsGrid: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnLupaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    FController: iController;

    FNome:   String;
    FCodigo: Integer;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome:   String read FNome write FNome;
  end;

implementation

uses
  controller.impl.controller;

{$R *.dfm}

procedure TFormClienteLista.btnLupaClick(Sender: TObject);
begin
  if not dsGrid.DataSet.Locate('NOME', edtPesquisa.Text, [loCaseInsensitive, loPartialKey]) then
    ShowMessage('Usuário não encontrado');
end;

procedure TFormClienteLista.DBGrid1DblClick(Sender: TObject);
begin
  FCodigo := dsGrid.DataSet.FieldByName('CODIGO').AsInteger;
  FNome   := dsGrid.DataSet.FieldByName('NOME').AsString;
  Self.Close;
end;

procedure TFormClienteLista.edtPesquisaChange(Sender: TObject);
begin
  dsGrid.DataSet.Filtered := False;
  dsGrid.DataSet.Filter   := 'NOME LIKE ' + QuotedStr(edtPesquisa.Text);
  dsGrid.DataSet.Filtered := True;
end;

procedure TFormClienteLista.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.dao(FController.entity.Cliente).Listar.DataSource(dsGrid);
end;

end.
