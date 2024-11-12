CREATE SCHEMA WKTECHNOLOGY DEFAULT CHARACTER SET utf8;
USE WKTECHNOLOGY;
SET SESSION sql_mode = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE CLIENTES(
    CODIGO INTEGER PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    CIDADE VARCHAR(50) NOT NULL,
    UF CHAR(2) NOT NULL
);

CREATE INDEX IDX_CIDADE ON CLIENTES (CIDADE);
CREATE INDEX IDX_UF ON CLIENTES (UF);

-- Comentários
ALTER TABLE CLIENTES COMMENT = 'Tabela para armazenar dados dos clientes, incluindo identificação única, nome, cidade e estado.';
ALTER TABLE CLIENTES CHANGE COLUMN CODIGO CODIGO INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Código único e identificador principal do cliente.' ;
ALTER TABLE CLIENTES MODIFY COLUMN NOME VARCHAR(50) COMMENT 'Nome completo do cliente.';
ALTER TABLE CLIENTES MODIFY COLUMN CIDADE VARCHAR(50) COMMENT 'Cidade onde o cliente reside.';
ALTER TABLE CLIENTES MODIFY COLUMN UF CHAR(2) COMMENT 'Estado (UF) onde o cliente reside.';

-- Inserindo Clientes 1 para cada UF e Capital
INSERT INTO CLIENTES (NOME, CIDADE, UF) VALUES
('Ana Oliveira', 'Rio Branco', 'AC'),
('Bruno Santos', 'Maceió', 'AL'),
('Carlos Almeida', 'Macapá', 'AP'),
('Daniela Fernandes', 'Manaus', 'AM'),
('Eduardo Pereira', 'Salvador', 'BA'),
('Fernanda Silva', 'Fortaleza', 'CE'),
('Gabriel Costa', 'Brasília', 'DF'),
('Helena Castro', 'Vitória', 'ES'),
('Igor Mendes', 'Goiânia', 'GO'),
('Juliana Ribeiro', 'São Luís', 'MA'),
('Lucas Martins', 'Cuiabá', 'MT'),
('Mariana Carvalho', 'Campo Grande', 'MS'),
('Nicolas Rocha', 'Belo Horizonte', 'MG'),
('Olivia Lima', 'Belém', 'PA'),
('Paulo Andrade', 'João Pessoa', 'PB'),
('Quintino Nogueira', 'Curitiba', 'PR'),
('Renata Teixeira', 'Recife', 'PE'),
('Samuel Barbosa', 'Teresina', 'PI'),
('Tatiana Moreira', 'Rio de Janeiro', 'RJ'),
('Ulysses Ferreira', 'Natal', 'RN'),
('Vanessa Cardoso', 'Porto Alegre', 'RS'),
('Wesley Souza', 'Porto Velho', 'RO'),
('Xavier Campos', 'Boa Vista', 'RR'),
('Yara Oliveira', 'Florianópolis', 'SC'),
('Zilda Freitas', 'São Paulo', 'SP'),
('Arthur Vieira', 'Aracaju', 'SE'),
('Beatriz Azevedo', 'Palmas', 'TO');

CREATE TABLE PRODUTOS(
    CODIGO INTEGER PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(100) NOT NULL,
    PRECO DECIMAL(10, 2) NOT NULL
);
CREATE INDEX IDX_PRECO ON PRODUTOS (PRECO);

-- Comentários
ALTER TABLE PRODUTOS COMMENT = 'Tabela para armazenar informações dos produtos, incluindo descrição e preço.';
ALTER TABLE PRODUTOS CHANGE COLUMN CODIGO CODIGO INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Código único e identificador principal do produto.';
ALTER TABLE PRODUTOS MODIFY COLUMN DESCRICAO VARCHAR(100) COMMENT 'Descrição detalhada do produto.';
ALTER TABLE PRODUTOS MODIFY COLUMN PRECO DECIMAL(10, 2) COMMENT 'Preço do produto, armazenado com duas casas decimais.';

-- Inserindo 50 registros na tabela PRODUTOS
INSERT INTO PRODUTOS (DESCRICAO, PRECO) VALUES
('Caderno Universitário', 12.50),
('Bloco de Desenho', 8.00),
('Canetinha', 4.00),
('Marcador Permanente', 5.50),
('Estojo', 15.00),
('Borracha Branca', 1.00),
('Apontador com Depósito', 2.50),
('Pasta A4', 3.00),
('Grampeador de Mesa', 20.00),
('Fita Corretiva', 6.00),
('Caneta Esferográfica', 2.00),
('Caderno de Notas', 10.00),
('Lápis Preto', 1.50),
('Tesoura Escolar', 7.50),
('Regua Plástica', 2.80),
('Caderno de Desenho', 14.00),
('Fita Adesiva', 4.50),
('Carimbo Personalizado', 8.50),
('Post-it', 5.00),
('Agulha de Costura', 0.80),
('Papel Sulfite', 15.00),
('Tinta para Carimbo', 3.50),
('Caneta Marca Texto', 3.00),
('Envelope Para Documentos', 2.20),
('Carpete para Escritório', 35.00),
('Papel Vegetal', 6.00),
('Etiquetas Adesivas', 7.00),
('Borracha Colorida', 1.20),
('Pasta de Arquivo', 9.00),
('Papel Cartão', 5.80),
('Clips para Papel', 1.30),
('Caixa Organizadora', 13.50),
('Porta Lápis', 4.00),
('Bloco de Notas Personalizado', 10.50),
('Calendário de Mesa', 7.20),
('Saca Rolhas', 8.80),
('Fita Métrica', 9.90),
('Caneta Roller', 2.40),
('Papel Crepom', 3.60),
('Pasta Suspensa', 11.00),
('Caderno Espiral', 6.70),
('Calendário Perpétuo', 6.90),
('Carpete de Borracha', 25.00),
('Caixa de Papelão', 2.30),
('Papel Vegetal A4', 12.00),
('Tinta Acrílica', 9.50),
('Bolsa de Couro', 75.00),
('Agenda de Couro', 20.00),
('Papel Reciclado', 7.50),
('Marcador de Quadro Branco', 4.20),
('Borracha em Pó', 1.80),
('Bloco de Anotações', 3.40),
('Luminária LED', 18.00),
('Régua de Acrílico', 4.80);

--
CREATE TABLE PEDIDOS(
    NUMERO_PEDIDO INTEGER PRIMARY KEY AUTO_INCREMENT,
    DATA_EMISSAO DATETIME NOT NULL,
    CODIGO_CLIENTE INTEGER NOT NULL,
    VALOR_TOTAL DECIMAL(16, 2) NOT NULL,
    FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO) ON DELETE CASCADE
);

CREATE INDEX IDX_DATA_EMISSAO ON PEDIDOS (DATA_EMISSAO);

-- Comentários
ALTER TABLE PEDIDOS COMMENT = 'Tabela para armazenar dados dos pedidos realizados, incluindo data de emissão, cliente e valor total.';
ALTER TABLE PEDIDOS CHANGE COLUMN NUMERO_PEDIDO NUMERO_PEDIDO INT NOT NULL AUTO_INCREMENT COMMENT 'Número único do pedido, usado como identificador principal.';
ALTER TABLE PEDIDOS MODIFY COLUMN DATA_EMISSAO DATETIME COMMENT 'Data e hora em que o pedido foi emitido.';
ALTER TABLE PEDIDOS MODIFY COLUMN CODIGO_CLIENTE INTEGER COMMENT 'Código do cliente que realizou o pedido, referenciado na tabela CLIENTES.';
ALTER TABLE PEDIDOS MODIFY COLUMN VALOR_TOTAL DECIMAL(16, 2) COMMENT 'Valor total do pedido em reais, com duas casas decimais.';

CREATE TABLE PEDIDOS_PRODUTOS(
    CODIGO INTEGER PRIMARY KEY AUTO_INCREMENT,
    NUMERO_PEDIDO INTEGER NOT NULL,
    CODIGO_PRODUTO INTEGER NOT NULL,
    QUANTIDADE INTEGER NOT NULL,
    VALOR_UNITARIO DECIMAL(16, 2) NOT NULL,
    VALOR_TOTAL DECIMAL(16, 2) NOT NULL,
    FOREIGN KEY (NUMERO_PEDIDO) REFERENCES PEDIDOS(NUMERO_PEDIDO),
    FOREIGN KEY (CODIGO_PRODUTO) REFERENCES PRODUTOS(CODIGO)
);

CREATE INDEX IDX_PEDIDO_PRODUTO ON PEDIDOS_PRODUTOS (NUMERO_PEDIDO, CODIGO_PRODUTO);

-- Comentários
ALTER TABLE PEDIDOS_PRODUTOS COMMENT = 'Tabela de itens dos pedidos, associando produtos aos pedidos com quantidade e valores unitário e total.';
ALTER TABLE PEDIDOS_PRODUTOS CHANGE COLUMN CODIGO CODIGO INTEGER NOT NULL AUTO_INCREMENT COMMENT 'Código único e identificador principal da entrada na tabela de itens do pedido.';
ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN NUMERO_PEDIDO INTEGER COMMENT 'Número do pedido ao qual este item pertence, referenciado na tabela PEDIDOS.';
ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN CODIGO_PRODUTO INTEGER COMMENT 'Código do produto neste pedido, referenciado na tabela PRODUTOS.';
ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN QUANTIDADE INTEGER COMMENT 'Quantidade do produto solicitada neste pedido.';
ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN VALOR_UNITARIO DECIMAL(16, 4) COMMENT 'Valor unitário do produto no pedido, armazenado com quatro casas decimais.';
ALTER TABLE PEDIDOS_PRODUTOS MODIFY COLUMN VALOR_TOTAL DECIMAL(16, 2) COMMENT 'Valor total do item (quantidade x valor unitário) no pedido, com duas casas decimais.';

-- Concedendo privilégios ao usuário
GRANT ALL PRIVILEGES ON wktechnology.* TO 'root'@'localhost';
FLUSH PRIVILEGES;