Unit view.principal;

Interface

Uses
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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.Mask,
  controller.interfaces,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.UI;

Type
  TFrmPedidos = Class(TForm)
    dsPedidos: TDataSource;
    pnlBotton: TPanel;
    lblTotalGeral: TLabel;
    btnCancelarPed: TButton;
    btnListarPed: TButton;
    pnlTop: TPanel;
    edtCodigoCliente: TLabeledEdit;
    edtNomeCliente: TLabeledEdit;
    edtCodigoProduto: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtValorUnitario: TLabeledEdit;
    btnInserir: TButton;
    cdsPedidos: TClientDataSet;
    cdsPedidosCodigo: TIntegerField;
    cdsPedidosDescricao: TStringField;
    cdsPedidosTotal: TCurrencyField;
    cdsPedidosUnitario: TCurrencyField;
    cdsPedidosquantidade: TIntegerField;
    pnlCenter: TPanel;
    dbgrdPedidos: TDBGrid;
    edtCodigoProdutoDesc: TLabeledEdit;
    btnSeparador2: TButton;
    btnGravarPedido: TButton;
    btnSeparador1: TButton;
    Procedure btnInserirClienteClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure edtCodigoClienteExit(Sender: TObject);
    Procedure btnPesquisarClienteClick(Sender: TObject);
    Procedure cdsPedidosCalcFields(DataSet: TDataSet);
    Procedure cdsPedidosAfterPost(DataSet: TDataSet);
    Procedure btnInserirClick(Sender: TObject);
    Procedure edtCodigoProdutoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdPedidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsPedidosStateChange(Sender: TObject);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnListarPedClick(Sender: TObject);
    procedure btnCancelarPedClick(Sender: TObject);
  Private
    FController:   iController;
    FModoInsercao: Boolean;
    lTotal:        Double;
    lNumeroPedido: Integer;

    Procedure Clear;
    procedure Clear2;
    procedure EditarProduto;
    procedure ConfirmarEdicaoProduto;
    procedure GetNumeroPedido;
  Public
    { Public declarations }
  End;

Var
  FrmPedidos: TFrmPedidos;

Implementation

{$R *.dfm}

Uses
  controller.impl.controller,
  view.cadastrocliente,
  view.listacliente;

Procedure TFrmPedidos.btnPesquisarClienteClick(Sender: TObject);
Begin
  Var
  lPesquisa := TFormClienteLista.Create(Nil);
  Try
    lPesquisa.ShowModal;
    edtCodigoCliente.Text := lPesquisa.Codigo.ToString;
    edtNomeCliente.Text   := lPesquisa.Nome;
  Finally
    lPesquisa.Free;
  End;
End;

Procedure TFrmPedidos.btnInserirClienteClick(Sender: TObject);
Begin
  Var
  lCliente := TFormCliente.Create(Nil);
  Try
    lCliente.ShowModal;
    edtCodigoCliente.Text := lCliente.Codigo.ToString;
    edtNomeCliente.Text   := lCliente.Nome
  Finally
    lCliente.Free;
  End;
End;

procedure TFrmPedidos.GetNumeroPedido;
var
  lNumeroPedidoStr: string;
begin
  repeat
    lNumeroPedidoStr := InputBox('Número do Pedido', 'Digite o número do pedido:', '');
    if TryStrToInt(lNumeroPedidoStr, lNumeroPedido) then
      Break // Saímos do loop se for um número válido
    else
      ShowMessage('Por favor, insira um número válido.');
  until False;
end;

procedure TFrmPedidos.btnListarPedClick(Sender: TObject);
begin
  var
  lDataSource := TDataSource.Create(nil);
  try
    // Solicita ao usuário o número do pedido
    GetNumeroPedido;

    // Verifica se o número do pedido foi inserido
    if lNumeroPedido > 0 then
    begin
      var
      lPedidos := FController.entity.Pedidos.SetNumeroPedido(lNumeroPedido);
      FController.dao(lPedidos).Listar.DataSource(lDataSource);

      edtCodigoCliente.Text := lDataSource.DataSet.FieldByName('CODIGO_CLIENTE').Value;
      edtCodigoClienteExit(edtCodigoCliente);

      var
      lPedidosItens := FController.entity.PedidoItens.SetNumeroPedido(lNumeroPedido);
      FController.dao(lPedidosItens).Listar.DataSource(lDataSource);

      if not lDataSource.DataSet.IsEmpty then
      begin
        cdsPedidos.EmptyDataSet;
        lDataSource.DataSet.Filtered := False;
        lDataSource.DataSet.Filter   := 'NUMERO_PEDIDO=' + IntToStr(lNumeroPedido);
        lDataSource.DataSet.Filtered := True;
      end;

      while not lDataSource.DataSet.eof do
      begin
        cdsPedidos.Append;
        cdsPedidosCodigo.AsInteger     := lDataSource.DataSet.FieldByName('CODIGO_PRODUTO').Value;
        cdsPedidosUnitario.AsCurrency  := lDataSource.DataSet.FieldByName('VALOR_UNITARIO').Value;
        cdsPedidosquantidade.AsInteger := lDataSource.DataSet.FieldByName('QUANTIDADE').Value;
        cdsPedidosTotal.Value          := lDataSource.DataSet.FieldByName('VALOR_TOTAL').Value;

        edtCodigoProduto.Text := lDataSource.DataSet.FieldByName('CODIGO_PRODUTO').Value;
        edtCodigoProdutoExit(edtCodigoProduto);
        cdsPedidosDescricao.Value := edtCodigoProdutoDesc.Text;

        cdsPedidos.Post;

        // Limpa
        edtCodigoProdutoDesc.Text := '';
        edtCodigoProduto.Text     := '';

        lDataSource.DataSet.Next;
      end;

    end
    else
      ShowMessage('Número do pedido não foi informado.');
  finally
    lDataSource.Free;
  end;
end;

procedure TFrmPedidos.btnCancelarPedClick(Sender: TObject);
begin
  var
  lDataSource := TDataSource.Create(nil);
  try
    // Solicita ao usuário o número do pedido
    GetNumeroPedido;

    // Verifica se o número do pedido foi inserido
    if lNumeroPedido > 0 then
    begin
      var
      lPedidosItens := FController.entity.PedidoItens.SetNumeroPedido(lNumeroPedido);
      FController.dao(lPedidosItens).Excluir;

    end;
  finally
    lDataSource.Free;
    Clear2;
    edtCodigoCliente.SetFocus;
  end;
end;

procedure TFrmPedidos.btnGravarPedidoClick(Sender: TObject);
begin
  var
  lDataSource := TDataSource.Create(Nil);
  try
    var
    lPedido := FController.entity.Pedidos.SetCodigoCliente(StrToInt(edtCodigoCliente.Text)).SetValorTotal(lTotal).SetDataEmissao(Now);

    FController.dao(lPedido).Inserir.Listar.DataSource(lDataSource);
    lDataSource.DataSet.Last; // pegar ultimo inserido.
    lNumeroPedido := lDataSource.DataSet.FieldByName('NUMERO_PEDIDO').Value;

    cdsPedidos.First;
    while not cdsPedidos.eof do
    begin
      var
      lPedidoItens := FController.entity.PedidoItens.SetNumeroPedido(lNumeroPedido).//
        SetCodigoProduto(cdsPedidosCodigo.Value).                                   //
        SetQuantidade(cdsPedidosquantidade.Value).                                  //
        SetValorUnitario(cdsPedidosUnitario.Value).                                 //
        SetValorTotal(lTotal);

      FController.dao(lPedidoItens).Inserir;

      cdsPedidos.Next;
    end;
    ShowMessage(Format('Pedido %s cadastrado com sucesso!', [IntToStr(lNumeroPedido)]));

  Finally
    lTotal        := 0;
    FModoInsercao := True;
    Clear2;
    lDataSource.Free;
  End;
end;

Procedure TFrmPedidos.btnInserirClick(Sender: TObject);
Begin
  ConfirmarEdicaoProduto;
End;

Procedure TFrmPedidos.ConfirmarEdicaoProduto;
Begin
  Var
  lDataSource := TDataSource.Create(Nil);
  FController.dao(FController.entity.Produtos.SetCodigo(StrToInt(edtCodigoProduto.Text))).ListarPorId.DataSource(lDataSource);
  Try
    if FModoInsercao then
      cdsPedidos.Append
    else
      cdsPedidos.Edit;

    cdsPedidosCodigo.AsInteger     := StrToInt(edtCodigoProduto.Text);
    cdsPedidosDescricao.AsString   := lDataSource.DataSet.Fields[1].AsString;
    cdsPedidosUnitario.AsCurrency  := StrToFloat(edtValorUnitario.Text); // lDataSource.DataSet.Fields[2].AsCurrency;
    cdsPedidosquantidade.AsInteger := StrToInt(edtQuantidade.Text);
    cdsPedidos.Post;

    Clear;
    edtCodigoProduto.SetFocus;
  Finally
    lDataSource.Free;
  End;
End;

procedure TFrmPedidos.EditarProduto;
begin
  var
  lDataSource := TDataSource.Create(Nil);
  FController.dao(FController.entity.Produtos.SetCodigo(cdsPedidosCodigo.Value)).ListarPorId.DataSource(lDataSource);
  try
    // Iniciar edição do dataset
    cdsPedidos.Edit;
    edtCodigoProduto.Text     := cdsPedidosCodigo.AsString;
    edtCodigoProdutoDesc.Text := lDataSource.DataSet.Fields[1].AsString;
    edtQuantidade.Text        := cdsPedidosquantidade.AsString;
    edtValorUnitario.Text     := FormatCurr('0.00', cdsPedidosUnitario.AsCurrency);
    edtQuantidade.SetFocus;

  Finally
    lDataSource.Free;
  End;
end;

Procedure TFrmPedidos.Clear;
Begin
  edtCodigoProduto.Clear;
  edtCodigoProdutoDesc.Clear;
  edtQuantidade.Clear;
  edtValorUnitario.Clear;
End;

procedure TFrmPedidos.Clear2;
begin
  Clear;
  lNumeroPedido := 0;
  cdsPedidos.EmptyDataSet;
  edtCodigoCliente.Clear;
  edtNomeCliente.Clear;


  btnSeparador1.Visible  := edtCodigoCliente.Text = '';
  btnCancelarPed.Visible := edtCodigoCliente.Text = '';
  btnSeparador2.Visible  := edtCodigoCliente.Text = '';
  btnListarPed.Visible   := edtCodigoCliente.Text = '';
end;

procedure TFrmPedidos.dbgrdPedidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key           := 0; // Remove o som de beep
    FModoInsercao := False;
    EditarProduto;
  end
  else if Key = VK_DELETE then
  begin
    Key           := 0; // Remove o som de beep
    FModoInsercao := False;
    if Application.MessageBox('Deseja realmente excluir o registro?', 'Aviso', MB_YESNO + MB_ICONWARNING) = IDYES then
    begin
      cdsPedidos.Delete;
    end;
  end;
end;

procedure TFrmPedidos.dsPedidosStateChange(Sender: TObject);
begin
  btnSeparador1.Visible  := edtCodigoCliente.Text = '';
  btnCancelarPed.Visible := edtCodigoCliente.Text = '';
  btnSeparador2.Visible  := edtCodigoCliente.Text = '';
  btnListarPed.Visible   := edtCodigoCliente.Text = '';
end;

Procedure TFrmPedidos.cdsPedidosAfterPost(DataSet: TDataSet);
Begin
  lTotal                := StrToCurrDef(String(lblTotalGeral.Caption).Replace('R$', ''), 0) + cdsPedidosTotal.AsCurrency;
  lblTotalGeral.Caption := FormatCurr('"R$ ",0.00', lTotal);
End;

Procedure TFrmPedidos.cdsPedidosCalcFields(DataSet: TDataSet);
Begin
  cdsPedidosTotal.AsCurrency := (cdsPedidosUnitario.AsCurrency * cdsPedidosquantidade.AsInteger);
End;

Procedure TFrmPedidos.edtCodigoClienteExit(Sender: TObject);
Begin
  If Not(edtCodigoCliente.Text = '') Then
  Begin
    Var
    lDataSource := TDataSource.Create(Nil);
    Try
      FController.dao(FController.entity.Cliente.SetCodigo(StrToInt(edtCodigoCliente.Text))).ListarPorId.DataSource(lDataSource);

      If lDataSource.DataSet.IsEmpty Then
      begin
        edtNomeCliente.SetFocus;
        Raise Exception.Create('Cliente não encontrado');
      end;

      edtNomeCliente.Text := lDataSource.DataSet.FieldByName('NOME').AsString;
      FModoInsercao       := True;
      lTotal              := 0;
    Finally
      lDataSource.Free;
    End;
  End
  else
  begin
    edtNomeCliente.Text := '';
    Clear;
    Clear2;
  end;

  btnSeparador1.Visible  := edtCodigoCliente.Text = '';
  btnCancelarPed.Visible := edtCodigoCliente.Text = '';
  btnSeparador2.Visible  := edtCodigoCliente.Text = '';
  btnListarPed.Visible   := edtCodigoCliente.Text = '';
End;

Procedure TFrmPedidos.edtCodigoProdutoExit(Sender: TObject);
Begin
  If Not(edtCodigoProduto.Text = '') Then
  Begin
    Var
    lEntity := FController.entity.Produtos.SetCodigo(StrToInt(edtCodigoProduto.Text));
    Var
    lDataSource := TDataSource.Create(Nil);
    FController.dao(lEntity).ListarPorId.DataSource(lDataSource);
    Try
      If Not lDataSource.DataSet.IsEmpty Then
      Begin
        edtCodigoProdutoDesc.Text := lDataSource.DataSet.Fields[1].AsString;
        edtQuantidade.SetFocus;
        edtValorUnitario.Text := FormatCurr('0.00', lDataSource.DataSet.Fields[2].AsCurrency);
        exit;
      End;
      Raise Exception.Create('Produto não encontrado');
    Finally
      lDataSource.Free;
    End;
  End;
End;

Procedure TFrmPedidos.FormCreate(Sender: TObject);
Begin
  FController := TController.New;
End;

procedure TFrmPedidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Enter key
  begin
    Key := #0;                             // Remove o som de beep padrão
    SelectNext(ActiveControl, True, True); // Move para o próximo controle
  end;
end;

End.
