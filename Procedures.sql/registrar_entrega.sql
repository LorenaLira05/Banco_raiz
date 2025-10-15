DELIMITER $$

CREATE PROCEDURE registrar_entrega (
    IN p_item_id INT,
    IN p_status_id INT,
    IN p_data DATE
)
BEGIN
IF p_data > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: data de entrega não pode ser futura.';
    END IF;
    
    INSERT INTO entrega (item_id, data_entrega, status_id)
    VALUES (p_item_id, p_data, p_status_id);
END$$
