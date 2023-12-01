DELIMITER //
-- Calcular Valor Total do Pedido
CREATE FUNCTION CalcularValorTotalPedido(pedido_id INT)
RETURNS DOUBLE
BEGIN
    DECLARE total_pedido DOUBLE;
    SELECT SUM(produtos.preco * itens_pedido.quantidade) INTO total_pedido
    FROM itens_pedido
    JOIN produtos ON itens_pedido.cod_produto = produtos.cod_produto
    WHERE itens_pedido.cod_pedido = pedido_id;
    RETURN total_pedido;
END //

DELIMITER ;

SELECT CalcularValorTotalPedido(1) AS ValorTotalPedido1;


DELIMITER //
-- Verificar Disponibilidade de Estoque
CREATE FUNCTION VerificarDisponibilidadeEstoque(produto_id INT, quantidade_pedida INT)
RETURNS BOOLEAN
BEGIN
    DECLARE estoque_disponivel INT;
    SELECT qtd_estoque INTO estoque_disponivel
    FROM produtos
    WHERE cod_produto = produto_id;

    IF estoque_disponivel >= quantidade_pedida THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;

SELECT VerificarDisponibilidadeEstoque(1, 3) AS EstoqueSuficiente;


DELIMITER //
-- Calcular Desconto Total do Pedido
CREATE FUNCTION CalcularDescontoTotalPedido(pedido_id INT)
RETURNS DOUBLE
BEGIN
    DECLARE desconto_total DOUBLE;
    SELECT IFNULL(SUM(desconto), 0) INTO desconto_total
    FROM pagamento_pedido
    WHERE cod_pedido = pedido_id;
    RETURN desconto_total;
END //

DELIMITER ;

SELECT CalcularDescontoTotalPedido(1) AS DescontoTotalPedido1;
