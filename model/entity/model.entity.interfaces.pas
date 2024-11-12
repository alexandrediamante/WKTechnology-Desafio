unit model.entity.interfaces;

interface

type
  iCliente = interface
    function SetCodigo(const Value: Integer): iCliente;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iCliente;
    function GetNome: String;
    function SetCidade(const Value: String): iCliente;
    function GetCidade: String;
    function SetEstado(const Value: String): iCliente;
    function GetEstado: String;
  end;

  iProdutos = interface
    function SetCodigo(const Value: Integer): iProdutos;
    function GetCodigo: Integer;
    function SetDescricao(const Value: String): iProdutos;
    function GetDescricao: String;
    function SetPrecoVenda(const Value: Currency): iProdutos;
    function GetPrecoVenda: Currency;
  end;

  iPedidos = interface
    function SetNumeroPedido(const Value: Integer): iPedidos;
    function GetNumeroPedido: Integer;
    function GetDataEmissao: TDateTime;
    function SetDataEmissao(const Value: TDateTime): iPedidos;
    function SetCodigoCliente(const Value: Integer): iPedidos;
    function GetCodigoCliente: Integer;
    function SetValorTotal(const Value: Currency): iPedidos;
    function GetValorTotal: Currency;
  end;

  iPedidoItens = interface
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

  iEntity = interface
    function Cliente: iCliente;
    function Produtos: iProdutos;
    function Pedidos: iPedidos;
    function PedidoItens: iPedidoItens;
  end;

implementation

end.



