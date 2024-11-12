unit model.entity.impl.pedidoitens;

interface

uses
  utils.impl.atributos,
  model.entity.interfaces;

type
  [Tabela('PEDIDOS_PRODUTOS')]
  TPedidoItens = class(TInterfacedObject, iPedidoItens)
  private
    [Campo('CODIGO'), PK]
    FId: Integer;
    [Campo('NUMERO_PEDIDO'), FK]
    FNumeroPedido: Integer;
    [Campo('CODIGO_PRODUTO'), FK]
    FCodigoProduto: Integer;
    [Campo('QUANTIDADE')]
    FQuantidade: Integer;
    [Campo('VALOR_UNITARIO')]
    FValorUnitario: Currency;
    [Campo('VALOR_TOTAL')]
    FValorTotal: Currency;
  public
    class function New: iPedidoItens;
    function SetId(const Value: Integer): iPedidoItens;
    function GetId: Integer;
    function SetNumeroPedido(const Value: Integer): iPedidoItens;
    function GetNumeroPedido: Integer;
    function SetCodigoProduto(const Value: Integer): iPedidoItens;
    function GetCodigoProduto: Integer;
    function SetQuantidade(const Value: Integer): iPedidoItens;
    function GetQuantidade: Integer;
    function SetValorUnitario(const Value: Currency): iPedidoItens;
    function GetValorUnitario: Currency;
    function SetValorTotal(const Value: Currency): iPedidoItens;
    function GetValorTotal: Currency;
  end;

implementation

function TPedidoItens.GetCodigoProduto: Integer;
begin
  Result := FCodigoProduto;
end;

function TPedidoItens.GetId: Integer;
begin
  Result := FId;
end;

function TPedidoItens.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidoItens.GetQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TPedidoItens.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

function TPedidoItens.GetValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

class function TPedidoItens.New: iPedidoItens;
begin
  Result := Self.Create;
end;

function TPedidoItens.SetCodigoProduto(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FCodigoProduto := Value;
end;

function TPedidoItens.SetId(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FId := Value;
end;

function TPedidoItens.SetNumeroPedido(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FNumeroPedido := Value;
end;

function TPedidoItens.SetQuantidade(const Value: Integer): iPedidoItens;
begin
  Result := Self;
  FQuantidade := Value;
end;

function TPedidoItens.SetValorTotal(const Value: Currency): iPedidoItens;
begin
  Result := Self;
  FValorTotal := Value;
end;

function TPedidoItens.SetValorUnitario(const Value: Currency): iPedidoItens;
begin
  Result := Self;
  FValorUnitario := Value;
end;

end.
