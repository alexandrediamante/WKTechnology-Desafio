unit model.entity.impl.cliente;

interface

uses
  utils.impl.atributos,
  model.entity.interfaces;

type
  [Tabela('CLIENTES')]
  TCliente = class(TInterfacedObject, iCliente)
  private
    [Campo('CODIGO'), PK]
    FCodigo: Integer;
    [Campo('NOME')]
    FNome: String;
    [Campo('CIDADE')]
    FCidade: String;
    [Campo('UF')]
    FEstado: String;
  public
    class function New: iCliente;
    function SetCodigo(const Value: Integer): iCliente;
    function GetCodigo: Integer;
    function SetNome(const Value: String): iCliente;
    function GetNome: String;
    function SetCidade(const Value: String): iCliente;
    function GetCidade: String;
    function SetEstado(const Value: String): iCliente;
    function GetEstado: String;
  end;

implementation

function TCliente.GetCidade: String;
begin
  Result := FCidade;
end;

function TCliente.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TCliente.GetEstado: String;
begin
  Result := FEstado;
end;

function TCliente.GetNome: String;
begin
  Result := FNome;
end;

class function TCliente.New: iCliente;
begin
  Result := Self.Create;
end;

function TCliente.SetCidade(const Value: String): iCliente;
begin
  Result := Self;
  FCidade := Value;
end;

function TCliente.SetCodigo(const Value: Integer): iCliente;
begin
  Result := Self;
  FCodigo := Value;
end;

function TCliente.SetEstado(const Value: String): iCliente;
begin
  Result := Self;
  FEstado := Value;
end;

function TCliente.SetNome(const Value: String): iCliente;
begin
  Result := Self;
  FNome := Value;
end;

end.
