DELIMITER //
-- Obter informações do Cliente por email
CREATE PROCEDURE ObterClientePorEmail(IN email_param VARCHAR(45))
BEGIN
    SELECT * FROM clientes WHERE email = email_param;
END //

DELIMITER ;

-- Realizar um novo pedido

DELIMITER //

CREATE PROCEDURE RealizarPedido(IN id_cliente INT, IN id_produto INT, IN quantidade INT, IN id_endereco INT, IN id_tipo_pagamento INT)
BEGIN
    DECLARE preco_total DOUBLE;

    -- Calcular o preço total com base no preço do produto e na quantidade
    SELECT preco * quantidade INTO preco_total FROM produtos WHERE cod_produto = id_produto;

    -- Inserir detalhes do pedido na tabela 'pedidos'
    INSERT INTO pedidos(dt_pedido, valor_total, cod_endereco, cod_cliente, cod_sts_pedido)
    VALUES(NOW(), preco_total, id_endereco, id_cliente, 1);

    -- Obter o ID do pedido recém-criado
    SET @id_pedido = LAST_INSERT_ID();

    -- Inserir itens do pedido na tabela 'itens_pedido'
    INSERT INTO itens_pedido(cod_pedido, cod_produto, quantidade)
    VALUES(@id_pedido, id_produto, quantidade);

    -- Inserir detalhes do pagamento na tabela 'pagamento_pedido'
    INSERT INTO pagamento_pedido(cod_pedido, cod_tp_pagamento, vl_pedido)
    VALUES(@id_pedido, id_tipo_pagamento, preco_total);
END //

DELIMITER ;


-- Atualizar Preço do Produto por Categoria
DELIMITER //

CREATE PROCEDURE AtualizarPrecoProdutoPorCategoria(IN id_categoria INT, IN multiplicador_preco FLOAT)
BEGIN
    -- Atualizar os preços dos produtos na tabela 'produtos' com base na categoria
    UPDATE produtos
    SET preco = preco * multiplicador_preco
    WHERE cod_categoria = id_categoria;
END //

DELIMITER ;
