unit model.connection.interfaces;

interface

uses
  System.Generics.Collections,
  Data.DB;

type
  iConexao = interface
    function connection: TCustomConnection;
  end;

  iQuery = interface
    procedure Query(const Statement: String; const Params: Array of Variant); overload;
    function OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet; overload;
    procedure Query(const Statement: String; const Params: TDictionary<String, Variant>); overload;
    function OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet; overload;
    procedure StartTransaction;overload;
    procedure CommitTransaction;overload;
    procedure RollbackTransaction;overload;
  end;

  iConfiguracao = interface
    function GetProtocolo: String;
    function SetServidor(const Value: String): iConfiguracao;
    function GetServidor: String;
    function SetDatabase(const Value: String): iConfiguracao;
    function GetDatabase: String;
    function SetPorta(const Value: Integer): iConfiguracao;
    function GetPorta: Integer;
    function SetUsuario(const Value: String): iConfiguracao;
    function GetUsuario: String;
    function SetSenha(const Value: String): iConfiguracao;
    function GetSenha: String;
    function SetCaminho(const Value: String): iConfiguracao;
    function GetCaminho: String;
    function SetDriverName(const Value: String): iConfiguracao;
    function GetDriverName: String;
  end;

implementation

end.
