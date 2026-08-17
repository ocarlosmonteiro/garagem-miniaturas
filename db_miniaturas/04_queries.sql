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


-- Consulta as miniaturas da Ferrari
SELECT
	m.id_miniatura AS `ID Miniatura`,
    m.nome_miniatura AS `Nome miniatura`,
    f.nome_fabricante AS Fabricante,
    m.ano_lancamento AS Ano,
    m.codigo AS Codigo
FROM miniatura AS m
INNER JOIN fabricante AS f
	ON m.id_fabricante = f.id_fabricante
WHERE m.nome_miniatura LIKE '%Ferrari%';

-- Consulta as miniaturas da Formula 1
SELECT
	m.id_miniatura AS `ID Miniatura`,
    m.nome_miniatura AS `Nome miniatura`,
    f.nome_fabricante AS Fabricante,
    m.ano_lancamento AS Ano,
    m.codigo AS Codigo
FROM miniatura AS m
INNER JOIN fabricante AS f
	ON m.id_fabricante = f.id_fabricante
WHERE m.nome_miniatura LIKE '%Formula 1%';

-- Consulta as miniaturas com a coluna escala, que foi adicionada na tabela miniatura através da chave estrangeira id_escala, que referencia a tabela escala.
SELECT
	m.id_miniatura AS `ID miniatura`,
    m.nome_miniatura AS `Nome miniatura`,
    e.escala AS `Escala`,
    f.nome_fabricante AS `Fabricante`,
    m.ano_lancamento AS `Ano de lançamento`
FROM miniatura AS m
INNER JOIN escala AS e
	ON m.id_escala = e.id_escala
INNER JOIN fabricante AS f
	ON m.id_fabricante = f.id_fabricante;