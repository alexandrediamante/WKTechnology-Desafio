unit controller.interfaces;

interface

uses
  model.entity.interfaces,
  model.dao.interfaces;

type
  iController = interface
    function entity: iEntity;
    function dao(Value: IInterface): iDao;
  end;

implementation

end.
