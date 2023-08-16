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

1,2,3,5,7
