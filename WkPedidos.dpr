program WkPedidos;

uses
  Vcl.Forms,
  view.principal in 'view\view.principal.pas' {FrmPedidos},
  model.entity.interfaces in 'model\entity\model.entity.interfaces.pas',
  model.entity.impl.cliente in 'model\entity\impl\model.entity.impl.cliente.pas',
  model.entity.impl.produtos in 'model\entity\impl\model.entity.impl.produtos.pas',
  model.entity.impl.pedidos in 'model\entity\impl\model.entity.impl.pedidos.pas',
  model.entity.impl.pedidoitens in 'model\entity\impl\model.entity.impl.pedidoitens.pas',
  model.entity.impl.entity in 'model\entity\impl\model.entity.impl.entity.pas',
  model.connection.interfaces in 'model\connection\model.connection.interfaces.pas',
  model.connection.impl.firedac in 'model\connection\impl\model.connection.impl.firedac.pas',
  model.connection.impl.query in 'model\connection\impl\model.connection.impl.query.pas',
  model.connection.impl.configuration in 'model\connection\impl\model.connection.impl.configuration.pas',
  model.dao.interfaces in 'model\dao\model.dao.interfaces.pas',
  model.dao.impl.daogenerico in 'model\dao\impl\model.dao.impl.daogenerico.pas',
  utils.interfaces in 'utils\utils.interfaces.pas',
  utils.impl.query in 'utils\impl\utils.impl.query.pas',
  utils.impl.rtthelper in 'utils\impl\utils.impl.rtthelper.pas',
  utils.impl.atributos in 'utils\impl\utils.impl.atributos.pas',
  utils.impl.utils in 'utils\impl\utils.impl.utils.pas',
  controller.interfaces in 'controller\controller.interfaces.pas',
  controller.impl.controller in 'controller\impl\controller.impl.controller.pas',
  view.cadastrocliente in 'view\view.cadastrocliente.pas' {FormCliente},
  view.listacliente in 'view\view.listacliente.pas' {FormClienteLista};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedidos, FrmPedidos);
  Application.Run;
end.
