# COMANDOS SQL - Referências

## Modelagem Física com comandos DDL

### Criar banco de dados

CREATE DATABASE vendas CHARACTER SET utf8mb4;

### Criar tabela de fabricantes

```sql
CREATE TABLE fabricantes(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL 
);
```

### Visualizar detalhes estruturais da tabela

```sql
DESC fabricantes;
```

### Criar tabela de produtos

```sql
CREATE TABLE produtos(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    descricao TEXT(500) NULL,
    preco DECIMAL(6,2) NOT NULL,
    fabricante_id INT NOT NULL
);
```

```sql
DESC produtos;
```

### Criação do relacionamento entre as tabelas (chave estrangeira)

```sql 
ALTER TABLE produtos
    -- CONSTRAINT é uma restrição com o nome do relacionamento
    ADD CONSTRAINT fk_produtos_fabricantes

    -- Criando a chave estrangeira (fabricante_id) que
    -- aponta para a chave-primária (id) de outra tabela (fabricantes)
    FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id); 
```

### Exemplos de alterações estruturais na tabela

### Renomear tabela

```sql
ALTER TABLE fabricantes RENAME TO fornecedores;
ALTER TABLE fornecedores RENAME TO fabricantes;
```

### Modificar colunas

```sql
ALTER TABLE produtos
    MODIFY COLUMN preco INT NULL;

ALTER TABLE produtos
    MODIFY COLUMN preco DECIMAL(6,2) NOT NULL;
```

### Renomear colunas

```sql

ALTER TABLE fabricantes
    CHANGE nome nome_do_fabricante VARCHAR(20) NOT NULL;

ALTER TABLE fabricantes
    CHANGE nome_do_fabricante nome VARCHAR(20) NOT NULL;
```

### Adicionar coluna

```sql
ALTER TABLE produtos
    ADD quantidade INT NULL AFTER preco;
```


<!-- EXERCÍCIO -->

```sql
CREATE DATABASE exericios CHARACTER SET utf8mb4;

CREATE TABLE generos(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL 
);

CREATE TABLE filmes(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    ano YEAR(4) NOT NULL,
);

ALTER TABLE filmes ADD generos_id INT NULL;

ALTER TABLE filmes
	ADD CONSTRAINT fk_filmes_generos
    
    FOREIGN KEY (generos_id) REFERENCES generos(id);
```