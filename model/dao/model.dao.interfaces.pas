unit model.dao.interfaces;

interface

uses
  Data.DB;

type
  iDAO = interface
    function Listar: iDAO;
    function ListarPorId: iDAO;
    function ListarPor: iDAO;
    function Excluir: iDAO;
    function Atualizar: iDAO;
    function Inserir: iDAO;
    function DataSource(Value: TDataSource): iDAO;
  end;

implementation

end.

