CREATE OR REPLACE VIEW vw_entregas_transparencia AS
SELECT 
    m.nome AS municipio,
    eend.logradouro AS endereco,
    DATE_FORMAT(en.data_entrega, '%d %b %Y') AS data_entrega,
    esp.nome_popular AS especie,
    s.status AS status
FROM entrega en
JOIN item_pedido ip ON en.item_id = ip.id
JOIN pedido p ON ip.pedido_id = p.id
JOIN fornecedor f ON p.fornecedor_id = f.id
JOIN endereco eend ON f.endereco_id = eend.id
JOIN municipio m ON eend.id = m.endereco_id
JOIN especies esp ON esp.id = (
    SELECT l.especie_id 
    FROM lote_pedido lp 
    JOIN lote l ON lp.lote_id = l.id 
    WHERE lp.pedido_id = p.id 
    LIMIT 1
)
JOIN status s ON en.status_id = s.id;
