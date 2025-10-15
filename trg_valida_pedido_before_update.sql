CREATE TRIGGER trg_valida_pedido_before_update
BEFORE UPDATE ON pedido
FOR EACH ROW
BEGIN
   IF NEW.status = 'Finalizado' THEN
      IF (SELECT COUNT(*) FROM item_pedido WHERE pedido_id = NEW.id) = 0 THEN
         SIGNAL SQLSTATE '45000'
         SET MESSAGE_TEXT = 'Não é possível finalizar um pedido sem itens.';
      END IF;
   END IF;
END;
