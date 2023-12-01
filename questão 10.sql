CREATE VIEW view_mulheres AS
SELECT * FROM clientes
WHERE nome LIKE '%Maria%' OR nome LIKE '%Ana%' OR nome LIKE '%Amanda%' OR nome LIKE '%Daiana%' OR nome LIKE '%Silvana%';


CREATE VIEW view_homens AS
SELECT * FROM clientes
WHERE nome LIKE '%Carlos%' OR nome LIKE '%José%' OR nome LIKE '%Arnaldo%';


CREATE VIEW view_inicia_m AS
SELECT * FROM clientes
WHERE nome LIKE 'M%';


CREATE VIEW view_inicia_j AS
SELECT * FROM clientes
WHERE nome LIKE 'J%';


CREATE VIEW view_maiores_20 AS
SELECT * FROM clientes
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) > 20;


CREATE VIEW view_menores_18 AS
SELECT * FROM clientes
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 18;


CREATE VIEW view_mes_aniversario AS
SELECT nome, MONTH(data_nascimento) AS mes_aniversario FROM clientes;


CREATE VIEW view_pasteis_veganos AS
SELECT * FROM produtos
WHERE cod_categoria = 2;

CREATE VIEW view_pedidos_especiais AS
SELECT * FROM pedidos
WHERE obs IS NOT NULL AND obs <> '';

CREATE VIEW view_pedidos_desconto AS
SELECT * FROM pagamento_pedido
WHERE desconto IS NOT NULL;


