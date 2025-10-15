CREATE OR REPLACE VIEW vw_status_entregas AS
SELECT 
    s.status,
    COUNT(en.id) AS total
FROM entrega en
JOIN status s ON en.status_id = s.id
GROUP BY s.status;
