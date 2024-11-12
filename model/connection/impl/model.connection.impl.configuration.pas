unit model.connection.impl.configuration;

interface

uses
  System.SysUtils,
  IniFiles,
  model.connection.interfaces;

type
  TConfiguration = class(TInterfacedObject, iConfiguracao)
  const
    SECTION    = 'CONFIG';
    CAMINHO    = 'CAMINHO';
    PORTA      = 'PORTA';
    SERVIDOR   = 'SERVIDOR';
    DATABASE   = 'DATABASE';
    USUARIO    = 'USERNAME';
    SENHA      = 'PASSWORD';
    DRIVERNAME = 'DRIVERNAME';
  private
    FArq: TIniFile;

    constructor Create(FileName: String);
    destructor Destroy; override;
  public
    class function New(FileName: String): iConfiguracao;
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

constructor TConfiguration.Create(FileName: String);
begin
  FArq := TIniFile.Create(FileName);
end;

destructor TConfiguration.Destroy;
begin
  FArq.Free;
  inherited;
end;

function TConfiguration.GetCaminho: String;
begin
  Result := FArq.ReadString(SECTION, CAMINHO, '');
end;

function TConfiguration.GetDriverName: String;
begin
  Result := FArq.ReadString(SECTION, DRIVERNAME, '');
end;

function TConfiguration.GetPorta: Integer;
begin
  Result := FArq.ReadInteger(SECTION, PORTA, 0);
end;

function TConfiguration.GetProtocolo: String;
begin
  Result := 'LOCAL';
  if not(FArq.ReadString(SECTION, SERVIDOR, '').Equals('LOCALHOST') or FArq.ReadString(SECTION, SERVIDOR, '').Equals('127.0.0.1')) then
    Result := 'TCP';
end;

function TConfiguration.GetSenha: String;
begin
  Result := FArq.ReadString(SECTION, SENHA, '');
end;

function TConfiguration.GetServidor: String;
begin
  Result := FArq.ReadString(SECTION, SERVIDOR, '');
end;

function TConfiguration.GetDatabase: String;
begin
  Result := FArq.ReadString(SECTION, DATABASE, '');
end;

function TConfiguration.GetUsuario: String;
begin
  Result := FArq.ReadString(SECTION, USUARIO, '');
end;

class function TConfiguration.New(FileName: String): iConfiguracao;
begin
  Result := Self.Create(FileName);
end;

function TConfiguration.SetCaminho(const Value: String): iConfiguracao;
begin
  Result := Self;
  FArq.WriteString(SECTION, CAMINHO, Value);
end;

function TConfiguration.SetDriverName(const Value: String): iConfiguracao;
begin
  Result := Self;
  FArq.WriteString(SECTION, DRIVERNAME, Value);
end;

function TConfiguration.SetPorta(const Value: Integer): iConfiguracao;
begin
  Result := Self;
  FArq.WriteInteger(SECTION, PORTA, Value);
end;

function TConfiguration.SetSenha(const Value: String): iConfiguracao;
begin
  Result := Self;
  FArq.WriteString(SECTION, SENHA, Value);
end;

function TConfiguration.SetServidor(const Value: String): iConfiguracao;
begin
  Result := Self;
  FArq.WriteString(SECTION, SERVIDOR, Value);
end;

function TConfiguration.SetDatabase(const Value: String): iConfiguracao;
begin
  Result := Self;
  FArq.WriteString(SECTION, DATABASE, Value);
end;

function TConfiguration.SetUsuario(const Value: String): iConfiguracao;
begin
  Result := Self;
  FArq.WriteString(SECTION, USUARIO, Value);
end;

end.
