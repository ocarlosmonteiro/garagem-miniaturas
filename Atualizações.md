# Atualização do Banco de Dados — Escala das Miniaturas

## Descrição

Foi realizada uma atualização no banco de dados para melhorar a organização e a normalização das informações referentes à **escala das miniaturas**.

A atualização envolveu:

* Criação da tabela `escala`;
* Inclusão do campo `id_escala` na tabela `miniatura`;
* Criação do relacionamento entre `miniatura` e `escala` por meio de uma chave estrangeira;
* Inclusão das escalas utilizadas pelas miniaturas;
* Adequação das consultas para utilizar o relacionamento entre as tabelas.

## 1. Criação da tabela `escala`

Foi criada uma nova tabela para armazenar as escalas disponíveis para as miniaturas.

```sql
CREATE TABLE escala(
    id_escala INT AUTO_INCREMENT PRIMARY KEY,
    escala VARCHAR(10) NOT NULL UNIQUE
);
```

A tabela possui dois campos:

| Campo       | Tipo          | Descrição                                              |
| ----------- | ------------- | ------------------------------------------------------ |
| `id_escala` | `INT`         | Identificador único da escala                          |
| `escala`    | `VARCHAR(4)` | Valor da escala, como `1:18`, `1:24`, `1:43` ou `1:64` |

O campo `id_escala` é a chave primária da tabela e é incrementado automaticamente.

O campo `escala` possui a restrição `UNIQUE`, evitando o cadastro duplicado de uma mesma escala.

## 2. Alteração da tabela `miniatura`

A tabela `miniatura` foi modificada para receber o identificador da escala.

Foi adicionado o campo:

```sql
ALTER TABLE miniatura
ADD COLUMN id_escala INT NULL;
```

Em seguida, foi criada a chave estrangeira:

```sql
ALTER TABLE miniatura
ADD CONSTRAINT fk_miniatura_escala
FOREIGN KEY (id_escala)
REFERENCES escala(id_escala);
```

Com essa alteração, a tabela `miniatura` passa a armazenar o identificador da escala em vez de armazenar diretamente o texto da escala.

Após o preenchimento das escalas nas miniaturas existentes, o campo pode ser definido como obrigatório:

```sql
ALTER TABLE miniatura
MODIFY COLUMN id_escala INT NOT NULL;
```

## 3. Inclusão das escalas

Foram incluídas as escalas utilizadas no cadastro das miniaturas.

```sql
INSERT INTO escala (escala)
VALUES
('1:64'),
('1:43'),
('1:32'),
('1:24'),
('1:18');
```

A tabela `escala` passa a centralizar os valores disponíveis, permitindo que várias miniaturas utilizem a mesma escala.

Exemplo:

| `id_escala` | `escala` |
| ----------: | -------- |
|           1 | 1:64     |
|           2 | 1:43     |
|           3 | 1:32     |
|           4 | 1:24     |
|           5 | 1:18     |

## 4. Relacionamento entre as tabelas

O relacionamento estabelecido é:

```text
escala (1) ─────────── (N) miniatura
```

Isso significa que uma mesma escala pode estar associada a várias miniaturas.

A relação é realizada por meio de:

```text
escala.id_escala
        ↑
        │
miniatura.id_escala
```

Dessa forma, a tabela `miniatura` armazena apenas o `id_escala`, enquanto a descrição da escala permanece na tabela `escala`.

## 5. Consulta atualizada

Com a alteração do relacionamento, as consultas que apresentam as informações das miniaturas devem utilizar `id_escala` para realizar o `JOIN`.

```sql
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
```

## 6. Benefícios da atualização

A criação da tabela `escala` e o relacionamento com `miniatura` proporcionam:

* Melhor organização dos dados;
* Redução da duplicação de informações;
* Padronização das escalas cadastradas;
* Facilidade para adicionar novas escalas;
* Integridade referencial por meio da chave estrangeira;
* Maior facilidade para realizar consultas e alterações futuras.

### Estrutura final

```text
fabricante
    │
    │ id_fabricante
    ▼
miniatura
    │
    │ id_escala
    ▼
escala
```

A alteração torna o banco de dados mais organizado e segue o princípio de normalização, mantendo as informações de escala em uma tabela própria e estabelecendo o relacionamento por meio de chaves.
