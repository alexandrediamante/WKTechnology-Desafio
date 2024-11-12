# Teste Técnico - Tela de Pedidos de Venda

Este repositório contém o desenvolvimento de um teste técnico para avaliação de conhecimentos em desenvolvimento de software, com ênfase em POO, arquitetura MVC, Clean Code e uso do banco de dados MySQL. A aplicação implementa uma tela de pedidos de venda com funcionalidade completa para gerenciamento de clientes, produtos e pedidos, conforme os requisitos definidos abaixo.

## Descrição do Projeto

### Funcionalidades Principais

#### Tela de Pedidos de Venda

- O operador informa o cliente e os produtos para o pedido.
- Entrada de produtos permite a inclusão de quantidade e valor unitário.
- Os produtos são exibidos em um grid que permite navegação e edição.

#### Cadastro e Gerenciamento de Dados

- Tabelas para clientes e produtos são criadas e alimentadas com dados iniciais.
- Integração com banco de dados via FireDAC, utilizando um arquivo `.ini` para conexão dinâmica.

#### Ações no Grid de Produtos

- Inclusão de produtos com botão de inserir.
- Navegação e edição direta no grid com as teclas de seta e Enter.
- Exclusão de produtos com confirmação de exclusão.

#### Rodapé e Gravação de Pedidos

- Exibição do valor total do pedido.
- Gravação de pedidos em duas tabelas: dados gerais e produtos do pedido.
- Implementação de transações para garantir integridade dos dados.

#### Carregar e Cancelar Pedidos Existentes

- Carregar pedidos já gravados e cancelar pedidos através de botões específicos.

### Conectividade e Banco de Dados

- Conexão com banco de dados configurada via arquivo `.ini`.
- Dump do banco de dados disponível no diretório raiz.


## Requisitos Técnicos

### Banco de Dados MySQL

- Dump do banco de dados incluído para facilitar a configuração inicial.
- Estrutura das tabelas de clientes, produtos e pedidos com PKs, FKs e índices necessários.

### FireDAC para Acesso ao Banco

- Conexão configurada para utilizar o FireDAC, facilitada pelo arquivo `.ini`.

### Programação Orientada a Objetos (POO)

- Utilização de classes para modelar as entidades de cliente, produto e pedido.
- Adoção de boas práticas de Clean Code e organização do código.

### Critérios de Formatação e Organização

- Código bem-formatado e organizado para facilitar a leitura e avaliação.
- Arquivo `.ini` e bibliotecas do banco incluídos para facilitar a execução.

## Como Executar

### Pré-requisitos

- MySQL instalado.
- IDE compatível com FireDAC (por exemplo, Delphi).

### Configuração do Banco de Dados

1. Importe o dump de banco de dados (`dump-wktechnology-202411120018.sql`) para o MySQL.
2. Atualize o arquivo `Exe/conf.ini` com as configurações do seu ambiente.

### Execução da Aplicação

1. Abra o projeto na IDE e configure o caminho para o arquivo `.ini`.
2. Compile e execute a aplicação para acessar a tela de pedidos de venda.
