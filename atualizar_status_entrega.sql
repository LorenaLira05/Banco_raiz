DELIMITER $$

CREATE PROCEDURE atualizar_status_entrega (
    IN p_entrega_id INT,
    IN p_novo_status_id INT
)
BEGIN
    DECLARE v_count INT;

    -- Verifica se a entrega existe
    SELECT COUNT(*) INTO v_count FROM entrega WHERE id = p_entrega_id;
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: entrega não encontrada.';
    END IF;

    -- Verifica se o status existe
    SELECT COUNT(*) INTO v_count FROM status WHERE id = p_novo_status_id;
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro: status não encontrado.';
    END IF;

    -- Atualiza status
    UPDATE entrega SET status_id = p_novo_status_id
    WHERE id = p_entrega_id;
END$$

DELIMITER ;
