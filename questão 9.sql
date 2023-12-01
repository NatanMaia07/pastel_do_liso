-- Gatilho para atualizar o estoque ao adicionar itens ao pedido
DELIMITER //
CREATE TRIGGER atualizar_estoque_inserir
AFTER INSERT
ON itens_pedido FOR EACH ROW
BEGIN
    UPDATE produtos
    SET qtd_estoque = qtd_estoque - NEW.quantidade
    WHERE cod_produto = NEW.cod_produto;
END;
//
DELIMITER ;

-- Gatilho para atualizar o estoque ao remover itens do pedido
DELIMITER //
CREATE TRIGGER atualizar_estoque_deletar
BEFORE DELETE
ON itens_pedido FOR EACH ROW
BEGIN
    UPDATE produtos
    SET qtd_estoque = qtd_estoque + OLD.quantidade
    WHERE cod_produto = OLD.cod_produto;
END;
//
DELIMITER ;

-- Gatilho para atualizar o estoque ao atualizar a quantidade de itens no pedido
DELIMITER //
CREATE TRIGGER atualizar_estoque_atualizar
AFTER UPDATE
ON itens_pedido FOR EACH ROW
BEGIN
    UPDATE produtos
    SET qtd_estoque = qtd_estoque + OLD.quantidade - NEW.quantidade
    WHERE cod_produto = NEW.cod_produto;
END;
//
DELIMITER ;

-- Gatilho para verificar se há estoque disponível antes de adicionar itens ao pedido
DELIMITER //
CREATE TRIGGER verificar_estoque
BEFORE INSERT
ON itens_pedido FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    SELECT qtd_estoque INTO estoque_atual
    FROM produtos
    WHERE cod_produto = NEW.cod_produto;

    IF NEW.quantidade > estoque_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantidade solicitada maior que o estoque disponível';
    END IF;
END;
//
DELIMITER ;

-- Gatilho para atualizar a data de cadastro do cliente ao realizar um pedido
DELIMITER //
CREATE TRIGGER atualizar_data_cadastro_pedido
BEFORE INSERT
ON pedidos FOR EACH ROW
BEGIN
    UPDATE clientes
    SET data_cadastro = NOW()
    WHERE cod_cliente = NEW.cod_cliente;
END;
//
DELIMITER ;
