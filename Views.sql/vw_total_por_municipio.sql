CREATE OR REPLACE VIEW vw_total_por_municipio AS
SELECT 
    m.nome AS municipio,
    SUM(it.quantidade) AS total_distribuido
FROM entrega en
JOIN item_pedido it ON it.id = en.item_id
JOIN pedido pd ON pd.id = it.pedido_id
JOIN usuario u ON u.id = pd.usuario_id
JOIN endereco e ON e.id = u.endereco_id
JOIN municipio m ON m.id = e.municipio_id
GROUP BY m.nome;
