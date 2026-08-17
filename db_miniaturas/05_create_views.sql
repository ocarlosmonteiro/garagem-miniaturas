-- CREATE VIEW vw_miniatura
CREATE VIEW vw_miniatura AS
SELECT
	id_miniatura,
    nome_miniatura,
    ano_lancamento
FROM miniatura;

-- CREATE VIEW vw_miniaturas_v2
CREATE VIEW vw_miniaturas_v2 AS
SELECT
	m.id_miniatura AS ID,
    m.nome_miniatura AS Miniatura,
    f.nome_fabricante AS Fabricante,
    m.ano_lancamento AS Lançamento
FROM miniatura AS m
INNER JOIN fabricante AS f
	ON m.id_fabricante = f.id_fabricante;

-- CREATE VIEW vw_miniaturas_v3
-- View com as colunas id_miniatura, nome_miniatura, escala, nome_fabricante e ano_lancamento
CREATE VIEW vw_miniaturas_v3 AS
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