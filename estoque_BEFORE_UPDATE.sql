CREATE DEFINER = CURRENT_USER TRIGGER `mydb`.`estoque_BEFORE_UPDATE` BEFORE UPDATE ON `estoque` FOR EACH ROW
BEGIN
IF NEW.quantidade_disponivel < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: saldo de estoque não pode ser negativo';
    END IF;
END
