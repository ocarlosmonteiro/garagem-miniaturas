-- Atualiza a escala de uma miniatura específica
-- id_escala: o novo valor da escala
-- id_miniatura: o ID da miniatura que será atualizada

--Em caso de todas as as miniaturas possuírem a mesma escala, é possível atualizar todas as miniaturas de uma vez, sem a necessidade de informar o id_miniatura.

-- ID | Escala
-- 1  |	1:64
-- 2  |	1:43
-- 3  |	1:32
-- 4  |	1:24
-- 5  |	1:18

UPDATE miniatura
SET id_escala = ?
WHERE id_miniatura = ?;