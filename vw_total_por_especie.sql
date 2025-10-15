CREATE VIEW vw_total_por_especie AS
SELECT e.nome_popular AS especie,
       SUM(it.quantidade) AS total_distribuido
FROM item_pedido it
JOIN pedido pd ON pd.id = it.pedido_id
JOIN estoque es ON es.id = pd.id
JOIN especies e ON e.id = es.especie_id
GROUP BY e.nome_popular;
