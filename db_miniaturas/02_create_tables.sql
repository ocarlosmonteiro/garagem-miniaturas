CREATE TABLE fabricante(
    id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    nome_fabricante VARCHAR(25) NOT NULL
);

CREATE TABLE miniatura(
    id_miniatura INT AUTO_INCREMENT PRIMARY KEY,
    nome_miniatura VARCHAR(50) NOT NULL,
    id_fabricante INT NOT NULL,
        FOREIGN KEY (id_fabricante)
            REFERENCES fabricante(id_fabricante),
    ano_lancamento YEAR NOT NULL,
    codigo VARCHAR(5)    
);