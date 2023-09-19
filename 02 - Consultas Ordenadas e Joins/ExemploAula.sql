USE db_quitanda;

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos ORDER BY Nome ASC;

SELECT * FROM tb_produtos ORDER BY Nome DESC;

SELECT * FROM tb_produtos WHERE NOT Id = 1;

SELECT * FROM tb_produtos WHERE Preco IN(5, 6, 16) ORDER BY Nome ASC;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 5 AND 16;

SELECT * FROM tb_produtos WHERE Nome LIKE 'B%';

SELECT COUNT (*) AS 'Número de registros' FROM tb_produtos; -- Conta quantos registros existem na tabela

SELECT SUM(Preco) AS 'Soma dos preços' FROM tb_produtos; -- Soma os valores da coluna Preco

SELECT AVG(Preco) AS 'Média dos preços' FROM tb_produtos; -- Calcula a média dos valores da coluna Preco

SELECT MIN(Preco) AS 'Menor preço' FROM tb_produtos; -- Retorna o menor valor da coluna Preco

-- RELACIONAMENTOS ENTRE TABELAS

CREATE TABLE tb_categorias (
    Id BIGINT IDENTITY(1,1),
    Descricao VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO tb_categorias(Descricao)
VALUES
('Frutas'),
('Verduras'),
('Legumes'),
('Temperos'),
('Ovos'),
('Outros');

DROP TABLE tb_produtos;

CREATE TABLE tb_produtos (
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Quantidade INT,
    DataValidade DATE,
    Preco DECIMAL(6,2) NOT NULL,
    IdCategoria BIGINT NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (IdCategoria) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_produtos(Nome, Quantidade, DataValidade, Preco, IdCategoria)
VALUES
('Banana', 10, '2023-09-19', 5.00, 1),
('Maçã', 10, '2023-09-19', 6.00, 1),
('Abacaxi', 10, '2023-09-19', 16.00, 1),
('Alface', 10, '2023-09-19', 2.00, 2),
('Couve', 10, '2023-09-19', 3.00, 2),
('Espinafre', 10, '2023-09-19', 4.00, 2),
('Cenoura', 10, '2023-09-19', 2.00, 3),
('Beterraba', 10, '2023-09-19', 3.00, 3),
('Batata', 10, '2023-09-19', 4.00, 3),
('Sal', 10, '2023-09-19', 1.00, 4),
('Pimenta', 10, '2023-09-19', 2.00, 4),
('Ovo', 10, '2023-09-19', 5.00, 5),
('Farinha', 10, '2023-09-19', 6.00, 6),
('Arroz', 10, '2023-09-19', 7.00, 6),
('Feijão', 10, '2023-09-19', 8.00, 6),
('Macarrão', 10, '2023-09-19', 9.00, 6),
('Açúcar', 10, '2023-09-19', 10.00, 6),
('Café', 10, '2023-09-19', 11.00, 6),
('Leite', 10, '2023-09-19', 12.00, 6),
('Manteiga', 10, '2023-09-19', 13.00, 6),
('Queijo', 10, '2023-09-19', 14.00, 6),
('Presunto', 10, '2023-09-19', 17.00, 6);

SELECT tb_produtos.Id, Nome, Quantidade, DataValidade, Preco, Descricao as Categoria FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.IdCategoria = tb_categorias.Id; -- Retorna todos os registros da tabela tb_produtos que possuem correspondência na tabela tb_categorias

SELECT tb_produtos.Id, Nome, Quantidade, DataValidade, Preco, Descricao as Categoria FROM tb_produtos LEFT JOIN tb_categorias 
ON tb_produtos.IdCategoria = tb_categorias.Id; -- Retorna todos os registros da tabela tb_produtos, mesmo que não haja correspondência na tabela tb_categorias

SELECT tb_produtos.Id, Nome, Quantidade, DataValidade, Preco, Descricao as Categoria FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id
WHERE Nome LIKE '%n%' ORDER BY tb_categorias.Id ASC; -- Retorna todos os registros da tabela tb_categorias, mesmo que não haja correspondência na tabela tb_produtos