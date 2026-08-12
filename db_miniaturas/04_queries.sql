-- Visualizar os fabricantes 
SELECT nome_fabricante 
FROM fabricante;

-- Visualizar as miniaturas
SELECT
    id_miniatura,
    id_fabricante,
    nome_miniatura,
    ano_lancamento,
    codigo
FROM miniatura;

-- Consulta utilizando INNER JOIN
SELECT
    m.id_miniatura AS `ID Miniatura`,
    m.nome_miniatura AS `Nome Miniatura`,
    f.nome_fabricante AS Fabricante,
    m.ano_lancamento AS Lançamento,
    m.codigo AS Código
FROM miniatura AS m
INNER JOIN fabricante AS f
    ON m.id_fabricante = f.id_fabricante;