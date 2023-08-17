# Comandos para operações CRUD no Banco de dados

## Resumo

- C -> CREATE (inserir dados usando comando `INSERT`)
- R -> READ (ler dados usando comando `SELECT`)
- U -> UPDATE (atualizar dados usando comando `UPTADE`)
- D -> DELETE (excluir dados usando comando `DELETE`)

## INSERT

### Fabricantes

```sql
INSERT INTO fabricantes (nome) VALUES('Asus');
INSERT INTO fabricantes (nome) VALUES('Apple');
INSERT INTO fabricantes (nome) VALUES('Motorola');

INSERT INTO fabricantes (nome) 
VALUES('LG'), ('Samsung'), ('Lenovo');
INSERT INTO fabricantes (nome) 
VALUES('Positivo'), ('Xiaomi');
```


```sql
INSERT INTO produtos(
    nome, preco, descricao, quantidade, fabricante_id)
VALUES(
    'UltraBook',
    3500,
    'Equipamento de última geração chei de recursos, com processador Intel Core i9 do balacobaco', 
    7,
    2 -- id do fabricante Apple
); 

INSERT INTO produtos(
    nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Tablet Android',
    'Tablet com a versão 14 do sistema operacional Android, 
    possui tela de 10 polegadas, armazenamento de 128 GB e 64 de RAM.',
    1500.99,
    5,
    5
);

INSERT INTO produtos(
    nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Geladeira',
    'Geladeira branca de 3 portas',
    5000,
    12,
    1
), (
    'Micro-ondas',
    'Pessimo micro-ondas',
    7000,
    15,
    7
), (
    'Freezer',
    'Gela até a porta',
    8005.66,
    3,
    3
);


INSERT INTO produtos(
    nome, descricao, preco, quantidade, fabricante_id)
VALUES(
    'Máquina de cortar cabelo',
    'corta cabelo de carecas',
    3000,
    20,
    4
), (
    'Carregador de automovel',
    'Só carrega carros a combustivel',
    2000,
    14,
    6
), (
    'Oculos sem lente',
    'Serve para os que não enxergam',
    1005.65,
    3,
    8
);
```

```SQL
INSERT INTO produtos(
    nome, descricao, preco, quantidade, fabricante_id
) VALUES (
    'Xbox Series S',
    'Velocidade e desempenho de última geração.',
    1997,
    5,
    8
), (
    'Notebook Motion',
    'Intel Dual Core 4GB de RAM, 128GB SSD e Tela 14,1 polegadas',
    1213.65,
    8,
    7
);
```

---


## SELECT

```sql
SELECT * FROM produtos;

SELECT nome, preco FROM produtos;
SELECT preco, nome FROM produtos;

SELECT nome, preco, quantidade FROM produtos WHERE preco < 5000;

-- Mostre nome e descrição somente dos PRodutos da Apple

SELECT nome, descricao FROM produtos WHERE fabricante_id = 2;
```

### Operadores Lógicos: E, OU, NÃO

#### Operador E

```sql
SELECT nome, preco FROM produtos WHERE preco >= 2000 AND preco <= 6000;

-- A query abaixo não retorna registros
-- já que as condições não foram totalmente atendidas.
SELECT nome, preco FROM produtos WHERE preco > 5000 AND preco <= 6000;
```

####  Operador OU

```sql
SELECT nome, preco FROM produtos WHERE preco > 5000 OR preco <= 6000;

-- Exiba nome e preço somente dos produtos da Apple e da Samsung
SELECT nome, preco FROM produtos WHERE fabricante_id = 2 OR fabricante_id = 5;

-- Versão usando a função IN()
SELECT nome, preco FROM produtos WHERE fabricante_id IN(3, 5);


SELECT nome, preco FROM produtos WHERE fabricante_id NOT IN(3, 5);
```

#### Operador NÃO

```sql
SELECT nome, descricao, preco FROM produtos WHERE NOT fabricante_id = 8;

-- Versão usando operador relacional "diferença/diferente"
SELECT nome, descricao, preco FROM produtos WHERE fabricante_id != 8;
```

### UPDATE

```sql
UPDATE fabricantes SET nome 'Asus o Brasil'
WHERE id = 1; -- ☠️ PERIGO! NÃO SE ESQUEÇA DA CONDIÇÃO (WHERE NESSE CASO) ☠️

UPDATE produtos SET preco = 6549.74
WHERE id = 1;

-- Altere a quantidade dos produtos da Apple e da Samsung 
-- para 20.
 
UPDATE produtos SET quantidade = 20 WHERE fabricante_id = 2 OR fabricante_id = 5;
```

### DELETE

```sql
-- ☠️ PERIGO! NÃO SE ESQUEÇA DA CONDIÇÃO (WHERE NESSE CASO) ☠️
DELETE FROM fabricantes WHERE id = 6; 

-- A query abaixo NÃO FUNCIONA, devido à restrição
-- de chave estrangeira/relacionamento, ou seja,
-- existem produtos associados ao fabricante 3 (Apple)
-- DELETE FROM fabricantes WHERE id = 3;
```

--- 


## SELECT: outras formas de uso

### Classificando

```sql
SELECT nome, preco FROM produtos ORDER BY nome;
SELECT nome, preco FROM produtos ORDER BY preco;
SELECT nome, preco FROM produtos ORDER BY preco DESC;

-- DESC: Classificação em ordem decrescente
-- ASC (padrão): classificação em ordem crescente

SELECT nome, preco FROM produtos
WHERE quantidade = 20 ORDER BY nome;
```

### Busca de dados

```sql
SELECT nome, descricao FROM produtos WHERE descricao LIKE '%tela%' OR nome LIKE '%tela%';

-- Usamos o operador LIKE e o caractere coringa %
-- para permitir uma busca da palavra indicada em 
-- qualquer posição dentro do texto. Neste contexto,
-- o % significa 'qualquer texto' antes da palavra ou
-- depois da palavra.
```

### Operações e funções de agregação

```sql
SELECT SUM(preco) FROM produtos; -- soma
SELECT SUM(preco) as Total FROM produtos; -- alias/apelido

-- Exemplo de alias/apelido para outras colunas.
SELECT nome as Produto, preco as "Preço" FROM produtos; 
SELECT nome Produto, preco "Preço" FROM produtos; 

-- MÉDIA e ARREDONDAMENTO
SELECT AVG(preco) as "Média dos Preços" FROM produtos; 
SELECT ROUND(AVG(preco), 2) as "Média dos Preços" FROM produtos;

-- CONTAGEM
SELECT COUNT(id) as "Qtd de Produtos" FROM produtos;


SELECT COUNT(DISTINCT fabricante_id) as "Qtd de Fabricantes com Produtos" FROM produtos;

-- DISTINCT é uma cláusula/flag que evita a duplicidade
-- na contagem de registros.
```

### Operações matemáticas

```sql
SELECT nome, preco, quantidade, (preco * quantidade) as Total
FROM produtos; 
```

### Segmentação/Agrupamento de resultados

```sql
SELECT fabricante_id, SUM(preco) FROM produtos GROUP BY fabricante_id;
```