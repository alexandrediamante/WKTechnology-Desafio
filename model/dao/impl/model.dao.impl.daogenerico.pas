Unit model.dao.impl.daogenerico;

Interface

Uses
  System.SysUtils,
  System.Generics.Collections,
  Data.DB,
  model.dao.interfaces,
  model.connection.interfaces;

Type
  TDAO = Class(TInterfacedObject, iDAO)
  Private
    FParent: IInterface;

    FConexao:    iConexao;
    FQuery:      iQuery;
    FDataSet:    TDataSet;
    FDataSource: TDataSource;
    FLista:      TDictionary<String, Variant>;
  Public
    Constructor Create(Parent: IInterface);
    Destructor Destroy; Override;
    Class Function New(Parent: IInterface): iDAO;
    Function Listar: iDAO;
    Function ListarPorId: iDAO;
    Function ListarPor: iDAO;
    Function Excluir: iDAO;
    Function Atualizar: iDAO;
    Function Inserir: iDAO;
    Function DataSource(Value: TDataSource): iDAO;
  End;

Implementation

Uses
  utils.impl.utils,
  model.connection.impl.firedac,
  model.connection.impl.query;

Function TDAO.Atualizar: iDAO;
Begin
  Result := Self;
End;

Constructor TDAO.Create(Parent: IInterface);
Begin
  FParent  := Parent;
  FConexao := TConnectionFiredac.New;
  FQuery   := TQuery.New(FConexao);
  FDataSet := TDataSet.Create(Nil);
  FLista   := TDictionary<String, Variant>.Create;
  TUtils.New(FParent).query.FieldParameter(FLista);
End;

Function TDAO.DataSource(Value: TDataSource): iDAO;
Begin
  Result              := Self;
  FDataSource         := Value;
  FDataSource.DataSet := FDataSet;
End;

Destructor TDAO.Destroy;
Begin

  Inherited;
End;

Function TDAO.Excluir: iDAO;
Begin
  Result := Self;

  // Try
  // TQuery.New(FConexao).StartTransaction;
  //
  // Var
  // lQuery := TUtils.New(FParent).query.Delete;
  // FQuery.query(lQuery, FLista);
  //
  // TQuery.New(FConexao).CommitTransaction;
  //
  // except
  // on E: Exception do
  // begin
  // raise Exception.Create('Pedido não pode ser realizado sem um cliente vinculado');
  // TQuery.New(FConexao).RollbackTransaction;
  // end;
  // end;

End;

Function TDAO.Inserir: iDAO;
Begin
  Result := Self;
  Try
    TQuery.New(FConexao).StartTransaction;

    Var
    lQuery := TUtils.New(FParent).query.Insert;
    FQuery.query(lQuery, FLista);

    TQuery.New(FConexao).CommitTransaction;

  except
    on E: Exception do
    begin
      raise Exception.Create('Pedido não pode ser realizado sem um cliente vinculado');
      TQuery.New(FConexao).RollbackTransaction;
    end;
  end;

End;

Function TDAO.Listar: iDAO;
Begin
  Result := Self;
  Var
  lQuery   := TUtils.New(FParent).query.SelectWithWhere(false);
  FDataSet := FQuery.OneAll(lQuery, []);
End;

Function TDAO.ListarPor: iDAO;
Begin
  Result := Self;
  Var
  lQuery   := TUtils.New(FParent).query.SelectWithWhere(True);
  FDataSet := FQuery.OneAll(lQuery, FLista);
End;

Function TDAO.ListarPorId: iDAO;
Begin
  Result := Self;
  Var
  lQuery   := TUtils.New(FParent).query.SelectWithWhere(True);
  FDataSet := FQuery.OneAll(lQuery, FLista);
End;

Class Function TDAO.New(Parent: IInterface): iDAO;
Begin
  Result := Self.Create(Parent);
End;

End.
