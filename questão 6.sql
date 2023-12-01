SELECT
  p.cod_produto,
  p.nome AS nome_pastel,
  SUM(ip.quantidade) AS total_vendas
FROM
  produtos p
JOIN
  itens_pedido ip ON p.cod_produto = ip.cod_produto
GROUP BY
  p.cod_produto, p.nome
ORDER BY
  total_vendas DESC;
