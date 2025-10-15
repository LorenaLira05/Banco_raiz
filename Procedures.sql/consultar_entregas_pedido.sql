DELIMITER $$

CREATE PROCEDURE consultar_entregas_pedido (
    IN p_pedido_id INT
)
BEGIN
    SELECT e.id AS entrega_id, e.data_entrega, s.status, i.quantidade
    FROM entrega e
    JOIN status s ON e.status_id = s.id
    JOIN item_pedido i ON e.item_id = i.id
    WHERE i.pedido_id = p_pedido_id;
END$$
