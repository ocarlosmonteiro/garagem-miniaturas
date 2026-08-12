# 🚗 Banco de Dados para Controle de Coleção de Miniaturas

Projeto desenvolvido em **MySQL** para gerenciamento e organização da minha coleção de carrinhos em miniatura.

O banco de dados permite cadastrar os **fabricantes** das miniaturas e relacioná-los às respectivas **miniaturas**, armazenando informações como nome, ano de lançamento e código de identificação.

O projeto foi desenvolvido com o objetivo de praticar conceitos fundamentais de **SQL, modelagem de banco de dados, criação de tabelas, chaves primárias, chaves estrangeiras, inserção de dados e consultas**.

---

## 📌 Sobre o projeto

A ideia do projeto surgiu da necessidade de manter um controle organizado da minha coleção de carrinhos em miniatura.

Para isso, foram criadas duas tabelas principais:

* `fabricante` — armazena as marcas/fabricantes das miniaturas.
* `miniatura` — armazena as informações individuais de cada miniatura.

Ao todo, foram inseridos mais de **100 registros**, sendo:

* **fabricantes**;
* **miniaturas**.

A estrutura foi desenvolvida de forma relacional, evitando a necessidade de repetir o nome do fabricante em cada registro de miniatura.

---

## 🗂️ Estrutura do banco de dados

O banco de dados utilizado no projeto é:

```sql
db_miniaturas
```

A estrutura possui duas tabelas:

```text
db_miniaturas
│
├── fabricante
│   ├── id_fabricante
│   └── nome_fabricante
│
└── miniatura
    ├── id_miniatura
    ├── nome_miniatura
    ├── id_fabricante
    ├── ano_lancamento
    └── codigo
```

---

## 🔗 Relacionamento entre as tabelas

Existe um relacionamento de **1:N (um para muitos)** entre `fabricante` e `miniatura`.

Isso significa que:

* Um fabricante pode possuir várias miniaturas cadastradas.
* Cada miniatura está associada a um único fabricante.

O relacionamento é realizado através do campo:

```text
fabricante.id_fabricante
        ↓
miniatura.id_fabricante
```

O campo `id_fabricante` da tabela `miniatura` funciona como **chave estrangeira (`FOREIGN KEY`)**, fazendo referência à chave primária `id_fabricante` da tabela `fabricante`.

### Diagrama simplificado

```text
┌─────────────────────────┐
│       fabricante        │
├─────────────────────────┤
│ PK id_fabricante        │
│    nome_fabricante      │
└────────────┬────────────┘
             │
             │ 1:N
             │
┌────────────▼────────────┐
│        miniatura        │
├─────────────────────────┤
│ PK id_miniatura         │
│    nome_miniatura       │
│ FK id_fabricante        │
│    ano_lancamento       │
│    codigo               │
└─────────────────────────┘
```

---

# 🛠️ Tecnologias utilizadas

* **MySQL**
* **SQL**
* MySQL Workbench ou outro cliente compatível com MySQL
* Git/GitHub para versionamento e documentação

---

# 🗃️ Estrutura das tabelas

## Tabela `fabricante`

A tabela `fabricante` é responsável pelo cadastro das marcas fabricantes das miniaturas.

```sql
CREATE TABLE fabricante (
    id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    nome_fabricante VARCHAR(25) NOT NULL
);
```

### Campos

| Campo             | Tipo          | Descrição                         |
| ----------------- | ------------- | --------------------------------- |
| `id_fabricante`   | `INT`         | Identificador único do fabricante |
| `nome_fabricante` | `VARCHAR(25)` | Nome do fabricante                |

### Restrições

* `PRIMARY KEY`: identifica exclusivamente cada fabricante.
* `AUTO_INCREMENT`: gera automaticamente o ID.
* `NOT NULL`: impede o cadastro de fabricante sem nome.

---

## Tabela `miniatura`

A tabela `miniatura` armazena os dados de cada carrinho da coleção.

```sql
CREATE TABLE miniatura (
    id_miniatura INT AUTO_INCREMENT PRIMARY KEY,
    nome_miniatura VARCHAR(50) NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante)
        REFERENCES fabricante (id_fabricante),
    ano_lancamento YEAR NOT NULL,
    codigo VARCHAR(5)
);
```

### Campos

| Campo            | Tipo          | Descrição                            |
| ---------------- | ------------- | ------------------------------------ |
| `id_miniatura`   | `INT`         | Identificador único da miniatura     |
| `nome_miniatura` | `VARCHAR(50)` | Nome/modelo da miniatura             |
| `id_fabricante`  | `INT`         | Fabricante relacionado à miniatura   |
| `ano_lancamento` | `YEAR`        | Ano de lançamento da miniatura       |
| `codigo`         | `VARCHAR(5)`  | Código de identificação da miniatura |

### Restrições

* `PRIMARY KEY`: identifica exclusivamente cada miniatura.
* `AUTO_INCREMENT`: gera automaticamente o ID.
* `NOT NULL`: exige nome, fabricante e ano de lançamento.
* `FOREIGN KEY`: garante que o fabricante informado exista na tabela `fabricante`.

---

# ▶️ Como executar o projeto

## 1. Pré-requisitos

Para executar o projeto, é necessário ter instalado:

* MySQL Server
* MySQL Workbench ou outro cliente SQL

Também é possível executar o projeto utilizando outras ferramentas compatíveis com MySQL.

---

## 2. Clonar o repositório

No terminal, execute:

```bash
git clone github.com/ocarlosmonteiro/garagem-miniaturas.git
```

Depois, entre na pasta do projeto:

```bash
cd nome-do-repositorio
```

> Substitua `github.com/ocarlosmonteiro/garagem-miniaturas.git` pelo endereço do seu repositório no GitHub.

---

## 3. Abrir o script SQL

Abra o arquivo `.sql` do projeto no **MySQL Workbench** ou na ferramenta de sua preferência.

O script começa criando o banco de dados:

```sql
CREATE DATABASE db_miniaturas;
USE db_miniaturas;
```

---

## 4. Criar as tabelas

Execute o script responsável pela criação das tabelas:

```sql
CREATE TABLE fabricante (
    id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    nome_fabricante VARCHAR(25) NOT NULL
);

CREATE TABLE miniatura (
    id_miniatura INT AUTO_INCREMENT PRIMARY KEY,
    nome_miniatura VARCHAR(50) NOT NULL,
    id_fabricante INT NOT NULL,
    FOREIGN KEY (id_fabricante)
        REFERENCES fabricante (id_fabricante),
    ano_lancamento YEAR NOT NULL,
    codigo VARCHAR(5)
);
```

Após a execução, o banco `db_miniaturas` estará criado com suas duas tabelas.

---

## 5. Inserir os dados

Depois de criar as tabelas, execute os comandos `INSERT` presentes no projeto.

É importante inserir primeiro os fabricantes e depois as miniaturas, pois a tabela `miniatura` possui uma chave estrangeira relacionada à tabela `fabricante`.

A sequência deve ser:

```text
1. Criar banco
       ↓
2. Criar tabela fabricante
       ↓
3. Criar tabela miniatura
       ↓
4. Inserir fabricantes
       ↓
5. Inserir miniaturas
       ↓
6. Executar as consultas
```

Essa ordem evita problemas relacionados à restrição de chave estrangeira.

---

# 🔎 Consultas desenvolvidas

Durante o desenvolvimento do projeto foram realizadas consultas para visualizar e relacionar os dados cadastrados.

## 1. Visualizar os fabricantes

```sql
SELECT nome_fabricante 
FROM fabricante;
```

Essa consulta retorna o nome de todos os fabricantes cadastrados.

---

## 2. Visualizar as miniaturas

```sql
SELECT
    id_miniatura,
    id_fabricante,
    nome_miniatura,
    ano_lancamento,
    codigo
FROM miniatura;
```

Essa consulta apresenta os dados cadastrados na tabela `miniatura`.

O campo `id_fabricante` apresenta o identificador do fabricante relacionado à miniatura.

---

# 🔗 Consulta utilizando INNER JOIN

Uma das principais consultas desenvolvidas no projeto utiliza `INNER JOIN` para combinar informações das duas tabelas.

```sql
SELECT
    m.id_miniatura AS `ID Miniatura`,
    m.nome_miniatura AS `Nome Miniatura`,
    f.nome_fabricante AS Fabricante,
    m.ano_lancamento AS Lançamento,
    m.codigo AS Código
FROM miniatura AS m
INNER JOIN fabricante AS f
    ON m.id_fabricante = f.id_fabricante;
```

## Como funciona?

A consulta utiliza dois apelidos (`aliases`):

```sql
miniatura AS m
fabricante AS f
```

Assim, podemos referenciar as tabelas de maneira mais simples.

Por exemplo:

```sql
m.nome_miniatura
```

representa o campo `nome_miniatura` da tabela `miniatura`.

Enquanto:

```sql
f.nome_fabricante
```

representa o campo `nome_fabricante` da tabela `fabricante`.

O relacionamento entre as tabelas é estabelecido através de:

```sql
ON m.id_fabricante = f.id_fabricante;
```

Dessa maneira, o banco consegue identificar qual fabricante pertence a cada miniatura.

---

# 📊 Resultado esperado

A consulta com `INNER JOIN` permite apresentar os dados de maneira mais amigável.

Em vez de apresentar somente o ID do fabricante:

```text
ID | Miniatura     | ID Fabricante | Ano  | Código
1  | Mustang GT    | 2             | 2020 | A01
```

é possível apresentar diretamente o nome do fabricante:

```text
ID Miniatura | Nome Miniatura | Fabricante | Lançamento | Código
1            | Mustang GT     | Hot Wheels | 2020        | A01
```

Isso facilita a visualização e a interpretação dos dados.

---

# 🧠 Conceitos de SQL praticados

O projeto foi desenvolvido com o objetivo de praticar conceitos fundamentais de bancos de dados relacionais.

Entre eles:

### Banco de dados

```sql
CREATE DATABASE
```

Criação do banco de dados responsável por armazenar as informações da coleção.

### Seleção de banco

```sql
USE
```

Define qual banco será utilizado durante a execução dos comandos.

### Criação de tabelas

```sql
CREATE TABLE
```

Utilizado para definir a estrutura das tabelas.

### Chave primária

```sql
PRIMARY KEY
```

Utilizada para identificar unicamente cada registro.

### Auto incremento

```sql
AUTO_INCREMENT
```

Responsável pela geração automática dos identificadores.

### Chave estrangeira

```sql
FOREIGN KEY
REFERENCES
```

Utilizada para estabelecer o relacionamento entre fabricantes e miniaturas.

### Consulta de dados

```sql
SELECT
```

Utilizado para consultar informações armazenadas no banco.

### Alias

```sql
AS
```

Utilizado para criar nomes alternativos para tabelas e colunas, facilitando a leitura das consultas.

### INNER JOIN

```sql
INNER JOIN
```

Utilizado para combinar registros relacionados entre as tabelas.

---

# 📁 Sugestão de organização do repositório

Uma estrutura simples para o GitHub pode ser:

```text
db-miniaturas/
│
├── README.md
│
├── sql/
│   ├── 01_criacao_banco.sql
│   ├── 02_criacao_tabelas.sql
│   ├── 03_insercao_dados.sql
│   └── 04_consultas.sql
│
└── imagens/
    └── resultado-consulta.png
```

---

# 🚀 Possíveis melhorias futuras

O projeto pode ser expandido futuramente com novas informações e funcionalidades.

Algumas possibilidades são:

* adicionar cor da miniatura;
* adicionar escala;
* cadastrar coleções ou séries;
* registrar data de aquisição;
* registrar valor pago;
* registrar valor estimado;
* informar estado de conservação;
* adicionar quantidade;
* criar uma tabela para categorias;
* criar uma tabela para coleções;
* adicionar informações sobre edições especiais;
* criar consultas para estatísticas da coleção;
* utilizar `GROUP BY`, `HAVING` e funções de agregação;
* criar `VIEWs` para facilitar consultas frequentes.

Uma possível evolução da estrutura seria:

```text
fabricante
     │
     │
     ▼
miniatura ───────► coleção
     │
     ├────────────► categoria
     │
     └────────────► aquisição
```

Isso permitiria transformar o projeto em um sistema mais completo de gerenciamento de coleções.

---

# 🎯 Objetivo de aprendizado

Este projeto foi desenvolvido como uma forma prática de aplicar conhecimentos de **SQL e banco de dados relacionais**, utilizando uma situação real como contexto.

A partir de uma coleção de miniaturas, foi possível praticar:

* criação de banco de dados;
* criação e estruturação de tabelas;
* definição de chaves primárias;
* utilização de chaves estrangeiras;
* relacionamento entre tabelas;
* inserção de dados;
* consultas SQL;
* utilização de `INNER JOIN`;
* utilização de aliases;
* organização e documentação de um projeto.

---

# 👨‍💻 Autor

Projeto desenvolvido por **Carlos Monteiro** como projeto de estudo e prática de **SQL e Banco de Dados**.

---

## 📄 Licença

Este projeto foi desenvolvido para fins de estudo e aprendizado.