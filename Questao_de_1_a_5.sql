-- QUESTÃO 1
SELECT p.nome AS nome_pastel
FROM produtos AS p
JOIN categorias AS c ON p.cod_categoria = c.cod_categoria
JOIN pedidos AS pe ON p.cod_produto = pe.cod_pedido
JOIN clientes AS cl ON pe.cod_cliente = cl.cod_cliente
WHERE c.nome = 'Pasteis Veganos'
AND TIMESTAMPDIFF(YEAR, cl.data_nascimento, CURDATE()) > 18;
 
 -- QUESTÃO 2
 SELECT 
  MONTH(p.dt_pedido) AS mes,
  YEAR(p.dt_pedido) AS ano,
  c.cod_cliente,
  c.nome,
  COUNT(p.cod_pedido) AS total_pedidos
FROM 
  clientes c
JOIN 
  pedidos p ON c.cod_cliente = p.cod_cliente
WHERE 
  p.dt_pedido BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW()
GROUP BY 
  YEAR(p.dt_pedido), MONTH(p.dt_pedido), c.cod_cliente
ORDER BY 
  total_pedidos DESC;
  
 -- QUESTÃO 3
 
SELECT p.nome AS 'Nome do Pastel', i.nome AS 'Ingrediente'
FROM produtos p
JOIN tamanho_de_produtos tp ON p.cod_produto = tp.cod_produto
JOIN ingredientes i ON tp.cod_tamanhos = i.cod_ingrediente
WHERE i.nome LIKE '%Bacon%' OR i.nome LIKE '%Queijo%';

-- QUESTÃO 4 
SELECT
  SUM(tp.preco * p.qtd_estoque) AS valor_total_venda
FROM
  produtos p
JOIN
  tamanho_de_produtos tp ON p.cod_produto = tp.cod_produto;
  
-- QUESTÃO 5

SELECT p.*
FROM pedidos p
JOIN itens_pedido ip ON p.cod_pedido = ip.cod_pedido
JOIN produtos prod ON ip.cod_produto = prod.cod_produto
JOIN categorias cat ON prod.cod_categoria = cat.cod_categoria
WHERE cat.nome = 'Pasteis'
   OR cat.nome = 'Refrigerantes'
   OR cat.nome = 'Sucos';
