Unit model.connection.impl.firedac;

Interface

Uses
  System.SysUtils,
  Data.DB,
  Datasnap.DBClient,
  firedac.Stan.Intf,
  firedac.Stan.Option,
  firedac.Stan.Error,
  firedac.UI.Intf,
  firedac.Phys.Intf,
  firedac.Stan.Def,
  firedac.Stan.Pool,
  firedac.Stan.Async,
  firedac.Phys,
  firedac.VCLUI.Wait,
  firedac.Stan.Param,
  firedac.DatS,
  firedac.DApt.Intf,
  firedac.DApt,
  firedac.Comp.DataSet,
  firedac.Comp.Client,
  firedac.Phys.MySQL,
  firedac.Phys.MySQLDef,
  firedac.Stan.ExprFuncs,
  firedac.Phys.SQLiteWrapper.Stat,
  firedac.Comp.UI,
  model.connection.interfaces;

Type
  TConnectionFiredac = Class(TInterfacedObject, iConexao)
  Private
    FConn:       TFDConnection;
    FConf:       iConfiguracao;
    FDriverLink: TFDPhysMySQLDriverLink;

    Constructor Create;
    Destructor Destroy; Override;
  Public
    Class Function New: iConexao;
    Function connection: TCustomConnection;
  End;

Implementation

Uses
  model.connection.impl.configuration;

Function TConnectionFiredac.connection: TCustomConnection;
Begin
  Result := FConn;
End;

Constructor TConnectionFiredac.Create;
Begin
  FConn := TFDConnection.Create(Nil);
  FConf := TConfiguration.New(ExtractFilePath(ParamStr(0)) + 'conf.ini');
  Try
    FConn.Params.Clear;
    FDriverLink           := TFDPhysMySQLDriverLink.Create(Nil);
    FDriverLink.DriverID  := 'Mysql';
    FDriverLink.VendorLib := FConf.GetCaminho;

    FConn.Params.DriverID := FConf.GetDriverName;
    FConn.DriverName      := FConf.GetDriverName;
    FConn.Params.Database := FConf.GetDatabase;
    FConn.Params.UserName := FConf.GetUsuario;
    FConn.Params.Password := FConf.GetSenha;

    FConn.LoginPrompt          := false;
    FConn.TxOptions.AutoCommit := true;

    If FConf.GetDriverName.Equals('MySQL') Then
    Begin
      FConn.Params.Values['Server'] := FConf.GetServidor;
      FConn.Params.Values['Port']   := FConf.GetPorta.ToString;
    End;

  Except
    On E: Exception Do
      Raise Exception.Create('Error ao tentar conectar com a base de dados, favor entrar em contato com o suporte' + E.Message);
  End;
End;

Destructor TConnectionFiredac.Destroy;
Begin
  FConn.Free;
  FDriverLink.Free;
  Inherited;
End;

Class Function TConnectionFiredac.New: iConexao;
Begin
  Result := Self.Create;
End;

End.
