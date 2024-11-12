unit model.connection.impl.query;

interface

uses
  System.Generics.Collections,
  Data.DB,
  model.connection.interfaces,
  FireDAC.Comp.Client;

type
  TQuery = class(TInterfacedObject, iQuery)
  private
    FQuery: TFDQuery;

    procedure PreencheQuery(Value: String);
    procedure PreencheParams(Value: Array of Variant);

    constructor Create(Conn: iConexao);
    destructor Destroy; override;
  public
    class function New(Conn: iConexao): iQuery;
    procedure Query(const Statement: String; const Params: Array of Variant); overload;
    function OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet; overload;
    procedure Query(const Statement: String; const Params: TDictionary<String, Variant>); overload;
    function OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet; overload;

   // Novos métodos de transação
    procedure StartTransaction;overload;
    procedure CommitTransaction;overload;
    procedure RollbackTransaction;overload;
  end;

implementation

constructor TQuery.Create(Conn: iConexao);
begin
  FQuery:= TFDQuery.Create(nil);
  FQuery.Connection := TFDConnection(Conn.Connection);
end;

destructor TQuery.Destroy;
begin
  FQuery.Free;
  inherited;
end;

class function TQuery.New(Conn: iConexao): iQuery;
begin
  Result := Self.Create(Conn);
end;

function TQuery.OneAll(const Statement: String;
  const Params: TDictionary<String, Variant>): TDataSet;
begin
  FQuery.SQL.Add(Statement);
  for var I in Params.Keys do
    if not (FQuery.Params.FindParam(I) = nil) then
      FQuery.ParamByName(I).Value := Params.Items[I];

  FQuery.Open();
  Result := FQuery;
end;

procedure TQuery.PreencheParams(Value: array of Variant);
begin
  for var I := Low(Value) to High(Value) do
  begin
    FQuery.Params.Add;
    FQuery.Params[I].Value := Value[I];
  end;
end;

procedure TQuery.PreencheQuery(Value: String);
begin
  FQuery.Close;
  FQuery.SQL.Clear;
  FQuery.SQL.Add(Value);
end;

procedure TQuery.Query(const Statement: String;
  const Params: TDictionary<String, Variant>);
begin
  FQuery.SQL.Add(Statement);
  for var I in Params.Keys do
    if not (FQuery.Params.FindParam(I) = nil) then
      FQuery.ParamByName(I).Value := Params.Items[I];

  FQuery.ExecSQL;
end;

function TQuery.OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet;
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FQuery.Open;
  Result := FQuery;
end;

procedure TQuery.Query(const Statement: String; const Params: Array of Variant);
begin
  PreencheQuery(Statement);
  PreencheParams(Params);

  FQuery.ExecSQL;
end;

procedure TQuery.StartTransaction;
begin
  if not FQuery.Connection.InTransaction then
    FQuery.Connection.StartTransaction;
end;

procedure TQuery.CommitTransaction;
begin
  if FQuery.Connection.InTransaction then
    FQuery.Connection.Commit;
end;

procedure TQuery.RollbackTransaction;
begin
  if FQuery.Connection.InTransaction then
    FQuery.Connection.Rollback;
end;

end.
