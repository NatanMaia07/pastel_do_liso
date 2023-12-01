-- Inserir produtos na tabela 'produtos'
INSERT INTO produtos (nome, validade_produto, preco, qtd_estoque, cod_categoria)
VALUES
  ('Pastel Nordestino', '2025-03-22', 40.0, 1, 1),
  ('Pastel Tradicional', '2025-03-21', 20.0, 20, 2),
  ('Pastel Vegano', '2025-03-30', 10.0, 5, 3),
  ('Pastel Vegetariano', '2025-03-23', 6.0, 4, 1),
  ('Pastel Sem Lactose', '2025-03-17', 10.0, 5, 2),
  ('Coca-Cola 1L', '2025-03-21', 6.5, 50, 3),
  ('Suco de Morango', '2025-03-21', 12.0, 40, 4);
  
  INSERT INTO categorias(nome)
 VALUES("Pasteis"),
 ("Pasteis Veganos"),
 ("Refrigerantes"),
 ("Sucos");
 
 INSERT  INTO clientes (nome,sobrenome,apelido,email,telefone,cpf,data_nascimento,data_cadastro)
values("Carlos","Santos Silva","Carlinhos","carlos@gmail.com","75977879998","12345678912",'1999-12-30',NOW()),
("José","Lima Silva","Zé","ze8@gmail.com","759773611998","98745678912",'2001-12-30',NOW());

INSERT INTO clientes (nome, sobrenome, apelido, email, telefone, cpf, data_nascimento, data_cadastro)
VALUES
  ("Andre", "Santos Silva", "Naldo Dede", "andre@gmail.com", "75977879988", "12345678992", '1969-12-30', NOW()),
  ("José Aldo", "Lima Santos", "Zé", "ze88@gmail.com", "759773611328", "98745678142", '2000-02-26', NOW()),
  ("Amanda", "Dos Santos", "Nanda", "nandafsa@gmail.com", "759883611328", "98046781423", '1996-06-28', NOW()),
  ("Ana", "Reis Carneiro", "Aninha", "aninhafsa@gmail.com", "759993611528", "98709678142", '1990-09-26', NOW()),
  ("Maria Valentina", "Bravanel", "Mar", "mar2@gmail.com", "759813611328", "08045978142", '2008-02-28', NOW()),
  ("Daiana", "Lima Santos", "Dai", "daiana9@gmail.com", "759833611308", "07445679142", '2010-010-08', NOW()),
  ("Silvana", "Lima Santos", "Vana", "vana8@gmail.com", "759822011328", "98745678089", '2000-01-23', NOW()),
  ("Arnaldo", "Santos Silva", "Naldo", "naldo@gmail.com", "759883021328", "90145978142", '2007-03-15', NOW());
  
  INSERT INTO enderecos (bairro, logradouro, numero, cep, municipio, uf, cod_cliente)
VALUES
  ('Centro', 'Rua A', '123', '12345-678', 'Cidade A', 'UF', 1),
  ('Bela Vista', 'Avenida B', '456', '54321-876', 'Cidade B', 'UF', 2),
  ('Jardim América', 'Rua C', '789', '98765-432', 'Cidade C', 'UF', 3),
  ('Vila Nova', 'Avenida D', '101', '10101-010', 'Cidade D', 'UF', 4),
  ('Santa Fé', 'Rua E', '222', '22222-222', 'Cidade E', 'UF', 5),
  ('Campo Grande', 'Avenida F', '333', '33333-333', 'Cidade F', 'UF', 6),
  ('Floresta Azul', 'Rua G', '444', '44444-444', 'Cidade G', 'UF', 7),
  ('Monte Verde', 'Avenida H', '555', '55555-555', 'Cidade H', 'UF', 8),
  ('São Pedro', 'Rua I', '666', '66666-666', 'Cidade I', 'UF', 9),
  ('Praia do Sol', 'Avenida J', '777', '77777-777', 'Cidade J', 'UF', 10);

INSERT INTO tp_pagamento(nome)
 VALUES("CARTÃO CREDITO"),
 ("CARTÃO DEBITO"),
 ("PIX"),
 ("DINHEIRO");
 
 -- Inserir registros na tabela 'sts_pedido'
INSERT INTO sts_pedido (nome, sts_pedido) VALUES
  ('Em processamento', 'P'), -- Status ativo
  ('Enviado', 'E'),
  ('Entregue', 'A'),
  ('Cancelado', 'I'); -- Status inativo
  
  -- Inserir 15 itens de pedido fictícios
INSERT INTO itens_pedido (cod_pedido, cod_produto, quantidade) VALUES
  (1, 1, 2),
  (1, 3, 1),
  (1, 5, 3),

  (2, 2, 1),
  (2, 4, 2),

  (3, 1, 1),
  (3, 3, 4),
  (3, 5, 2),

  (4, 2, 3),
  (4, 4, 1),

  (5, 1, 2),
  (5, 3, 2),
  (5, 5, 1),

  (6, 1, 1),
  (6, 2, 1),
  (6, 3, 1),
  (6, 4, 1),
  (6, 5, 1);
  
  -- Inserir 4 tamanhos fictícios
INSERT INTO tamanhos (tamanhos, preco) VALUES
  ('Pequeno', 5.0),
  ('Médio', 8.0),
  ('Grande', 12.0),
  ('Família', 15.0);
  
  INSERT INTO ingredientes( nome)
VALUES
('Carne seca com banana e queijo'),
('Frango com queijo e bacom'),
('cogumelo com shoyu e queijo'),
('abobrinha frita com alho'),
('Camarão no alho e bancom');


  