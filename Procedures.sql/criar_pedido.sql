DELIMITER $$

CREATE PROCEDURE criar_pedido (
    IN p_usuario_id INT,
	IN p_data DATE,
    IN p_status_id INT
)
BEGIN
    -- Insere um novo pedido
    INSERT INTO pedido (usuario_id, status_id, data_criacao)
    VALUES (p_usuario_id, p_status_id, p_data);

    -- Retorna o ID do pedido recém-criado
    SELECT LAST_INSERT_ID() AS novo_pedido_id;
END$$
