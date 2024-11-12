unit controller.impl.controller;

interface

uses
  controller.interfaces,
  model.entity.interfaces,
  model.dao.interfaces;

type
  TController = class(TInterfacedObject, iController)
  private
    FEntity: iEntity;
    FDao: iDAO;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;
    function entity: iEntity;
    function dao(Value: IInterface): iDAO;
  end;

implementation

uses
  model.entity.impl.entity,
  model.dao.impl.daogenerico;

{ TMyClass }

constructor TController.Create;
begin

end;

function TController.dao(Value: IInterface): iDAO;
begin
  Result := TDao.New(Value);
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.entity: iEntity;
begin
  if not Assigned(FEntity) then
    FEntity := TEntity.New;
  Result := FEntity;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

end.
