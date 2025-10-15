CREATE TRIGGER entrega_AFTER_INSERT
AFTER INSERT ON entrega
FOR EACH ROW
BEGIN
   UPDATE estoque
   SET quantidade = quantidade - NEW.quantidade
   WHERE id = NEW.estoque_id;
END;
