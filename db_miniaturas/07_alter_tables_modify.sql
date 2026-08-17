-- Alterando a tabela miniatura para adicionar a coluna id_escala e criar a chave estrangeira para a tabela escala

ALTER TABLE miniatura
ADD COLUMN id_escala INT NULL;

-- Incluindo a chave estrangeira para a tabela escala
ALTER TABLE miniatura
ADD CONSTRAINT fk_miniatura_escala
	FOREIGN KEY (id_escala)
		REFERENCES escala (id_escala);

-- Alterando a coluna id_escala para não aceitar valores nulos, antes de alterar a coluna, é necessário atualizar os registros existentes na tabela miniatura para que todos tenham um valor válido na coluna id_escala.
ALTER  TABLE miniatura
MODIFY COLUMN id_escala INT NOT NULL;
