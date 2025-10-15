CREATE OR REPLACE VIEW vw_fornecedores_entregas AS
SELECT 
    f.nome AS fornecedor,
    m.nome AS municipio,
    COUNT(en.id) AS entregas_realizadas,
    SUM(ip.quantidade) AS total_quantidade
FROM entrega en
JOIN item_pedido ip ON en.item_id = ip.id
JOIN pedido p ON ip.pedido_id = p.id
JOIN fornecedor f ON p.fornecedor_id = f.id
JOIN endereco eend ON f.endereco_id = eend.id
JOIN municipio m ON eend.id = m.endereco_id
GROUP BY f.nome, m.nome;
