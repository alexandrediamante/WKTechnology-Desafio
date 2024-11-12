unit model.entity.impl.pedidos;

interface

uses
  System.SysUtils,
  utils.impl.atributos,
  model.entity.interfaces;

type

  [Tabela('PEDIDOS')]
  TPedidos = class(TInterfacedObject, iPedidos)
  private
    [Campo('NUMERO_PEDIDO'), PK]
    FNumeroPedido: Integer;
    [Campo('DATA_EMISSAO')]
    FDataEmissao: TDateTime;
    [Campo('CODIGO_CLIENTE'), FK]
    FCodigoCliente: Integer;
    [Campo('VALOR_TOTAL')]
    FValorTotal: Currency;
  public
    class function New: iPedidos;
    function SetNumeroPedido(const Value: Integer): iPedidos;
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function SetDataEmissao(const Value: TDateTime): iPedidos;
    function SetCodigoCliente(const Value: Integer): iPedidos;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidos;
    function GetValorTotal: Currency;
  end;

implementation

function TPedidos.GetCodigoCliente: Integer;
begin
  Result := FCodigoCliente;
end;

function TPedidos.GetDataEmissao: TDateTime;
begin
  FDataEmissao := Now;
  Result       := FDataEmissao;
end;

function TPedidos.GetNumeroPedido: Integer;
begin
  Result := FNumeroPedido;
end;

function TPedidos.GetValorTotal: Currency;
begin
  Result := FValorTotal;
end;

class function TPedidos.New: iPedidos;
begin
  Result := Self.Create;
end;

function TPedidos.SetCodigoCliente(const Value: Integer): iPedidos;
begin
  Result := Self;

  if not(Value > 0) then
    raise Exception.Create('Pedido não pode ser realizado sem um cliente vinculado');

  FCodigoCliente := Value;
end;

function TPedidos.SetDataEmissao(const Value: TDateTime): iPedidos;
begin
  Result       := Self;
  FDataEmissao := Value;
end;

function TPedidos.SetNumeroPedido(const Value: Integer): iPedidos;
begin
  Result        := Self;
  FNumeroPedido := Value;
end;

function TPedidos.SetValorTotal(const Value: Currency): iPedidos;
begin
  Result      := Self;
  FValorTotal := Value;
end;

end.
