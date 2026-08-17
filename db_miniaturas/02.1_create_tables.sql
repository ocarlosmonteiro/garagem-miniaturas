-- Tabela criada para armazenar as escalas das miniaturas
-- Está tabela será referenciada na tabela miniatura, através da chave estrangeira id_escala
-- A mesma foi criada já com o banco de dados db_miniaturas em produção, portanto não é necessário criar o banco de dados novamente.

CREATE TABLE escala(
id_escala INT PRIMARY KEY AUTO_INCREMENT,
escala VARCHAR(4) NOT NULL UNIQUE
);