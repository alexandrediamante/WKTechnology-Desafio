unit utils.impl.utils;

interface

uses
  utils.interfaces;

type
  TUtils = class(TInterfacedObject, iUtils)
  private
    FParent: IInterface;
    FQuery: iQuery;
  public
    constructor Create(Parent: IInterface);
    destructor Destroy; override;
    class function New(Parent: IInterface): iUtils;
    function Query: iQuery;
  end;

implementation

uses
  utils.impl.query;

{ TMyClass }

constructor TUtils.Create(Parent: IInterface);
begin
  FParent:= Parent;
end;

destructor TUtils.Destroy;
begin

  inherited;
end;

class function TUtils.New(Parent: IInterface): iUtils;
begin
  Result := Self.Create(Parent);
end;

function TUtils.Query: iQuery;
begin
  if not Assigned(FQuery) then
    FQuery := TQuery.New(FParent);
  Result := FQuery;
end;

end.
