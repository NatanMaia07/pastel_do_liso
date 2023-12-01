-- Criando um novo banco de dados e utilizando-o
CREATE DATABASE pastel_do_liso;
USE pastel_do_liso;

-- Criando uma tabela para categorias de produtos
CREATE TABLE categorias (
    cod_categoria INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sts_produto CHAR(1) NOT NULL DEFAULT 'A'
);

-- Criando uma tabela para produtos
CREATE TABLE produtos (
    cod_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco FLOAT NOT NULL,
    qtd_estoque INT(11) NOT NULL,
    cod_categoria INT(11) NOT NULL,
    sts_produto CHAR(1) NOT NULL DEFAULT 'A',
    FOREIGN KEY (cod_categoria) REFERENCES categorias (cod_categoria)
);

-- Adicionando uma coluna para a data de validade do produto na tabela de produtos
ALTER TABLE produtos 
ADD COLUMN validade_produto DATE NOT NULL AFTER nome;

-- Criando uma tabela para clientes
CREATE TABLE clientes (
    cod_cliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(45) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cpf CHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro TIMESTAMP NOT NULL
);

-- Adicionando colunas para sobrenome e apelido na tabela de clientes
ALTER TABLE clientes 
ADD COLUMN sobrenome VARCHAR(100) NOT NULL AFTER nome;

ALTER TABLE clientes 
ADD COLUMN apelido VARCHAR(30) NOT NULL AFTER sobrenome;

-- Excluindo um cliente com critérios específicos
DELETE FROM clientes
WHERE cod_cliente = 2 AND nome = "Carlos" AND sobrenome = "Santos Silva" AND apelido = "Carlinhos";

-- Exibindo a lista atualizada de clientes
SELECT * FROM clientes;

-- Criando uma tabela para endereços
CREATE TABLE enderecos (
    cod_endereco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bairro VARCHAR(50) NOT NULL,
    logradouro VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    cep VARCHAR(8) NULL,
    municipio VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    cod_cliente INT NOT NULL,
    INDEX (cod_cliente),
    FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente)
);

-- Criando uma tabela para tipos de pagamento
CREATE TABLE tp_pagamento (
    cod_tp_pagamento INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sts_tp_pagamento CHAR(1) NOT NULL DEFAULT 'A'
);

-- Criando uma tabela para status de pedidos
CREATE TABLE sts_pedido (
    cod_sts_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    sts_pedido CHAR(1) NOT NULL DEFAULT 'A'
);

-- Criando uma tabela para tamanhos
CREATE TABLE tamanhos (
    cod_tamanhos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tamanhos VARCHAR(20) NOT NULL
); 

-- Adicionando uma coluna para preços de tamanho na tabela de tamanhos
ALTER TABLE tamanhos 
ADD COLUMN preco FLOAT NOT NULL AFTER tamanhos;

-- Inserindo 4 tamanhos fictícios
INSERT INTO tamanhos (tamanhos, preco) VALUES
  ('Pequeno', 5.0),
  ('Médio', 8.0),
  ('Grande', 12.0),
  ('Família', 15.0);

-- Exibindo a lista de tamanhos
SELECT * FROM tamanhos;

-- Criando uma tabela para ingredientes
CREATE TABLE ingredientes (
    cod_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Criando uma tabela para associar produtos a tamanhos
CREATE TABLE tamanho_de_produtos (
    cod_produto INT NOT NULL,
    cod_tamanhos INT NOT NULL,
    preco DOUBLE NOT NULL,
    FOREIGN KEY (cod_produto) REFERENCES produtos (cod_produto),
    FOREIGN KEY (cod_tamanhos) REFERENCES tamanhos (cod_tamanhos)
);

-- Criando uma tabela para pedidos
CREATE TABLE pedidos (
    cod_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATETIME NOT NULL DEFAULT NOW(),
    tp_entrega CHAR(1) NOT NULL,
    cod_cliente INT NOT NULL,
    cod_endereco INT,
    valor_total DOUBLE NOT NULL,
    cod_sts_pedido INT NOT NULL,
    obs VARCHAR(100),
    FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente),
    FOREIGN KEY (cod_sts_pedido) REFERENCES sts_pedido (cod_sts_pedido)
);

-- Criando uma tabela para itens de pedido
CREATE TABLE itens_pedido (
    cod_item_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cod_pedido INT NOT NULL,
    cod_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (cod_pedido) REFERENCES pedidos (cod_pedido)
);

-- Criando uma tabela para pagamentos de pedidos
CREATE TABLE pagamento_pedido (
    cod_pgto_pedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cod_pedido INT NOT NULL,
    cod_tp_pagamento INT NOT NULL,
    vl_pedido FLOAT NOT NULL,
    desconto FLOAT,
    FOREIGN KEY (cod_tp_pagamento) REFERENCES tp_pagamento (cod_tp_pagamento),
    FOREIGN KEY (cod_pedido) REFERENCES pedidos (cod_pedido)
);

-- Atualizando a idade dos clientes existentes
UPDATE clientes
SET data_nascimento = '2000-01-01'
WHERE cod_cliente IN (1, 3, 4, 5, 6, 7, 8);

-- Exibindo as informações atualizadas dos clientes
SELECT * FROM clientes;

-- Exibindo a lista atualizada de pedidos
SELECT * FROM pedidos;

-- Exibindo as informações de pagamento
SELECT * FROM pagamento_pedido;
