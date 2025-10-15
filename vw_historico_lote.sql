CREATE OR REPLACE VIEW vw_historico_lote AS
SELECT l.id AS lote_id,
       e.nome_popular AS especie,
       'ENTRADA' AS tipo,
       l.quantidade,
       NULL AS municipio,
       NULL AS data_evento
FROM lote l
JOIN especies e ON e.id = l.especie_id

UNION ALL

SELECT l.id AS lote_id,
       e.nome_popular AS especie,
       'SAIDA' AS tipo,
       it.quantidade,
       m.nome AS municipio,
       pd.data_criacao AS data_evento
FROM lote l
JOIN especies e ON e.id = l.especie_id
JOIN pedido pd ON p.lote_id = l.Id
JOIN item_pedido it ON it.id = p.item_id
JOIN municipio m ON m.id = pd.usuario_id;
