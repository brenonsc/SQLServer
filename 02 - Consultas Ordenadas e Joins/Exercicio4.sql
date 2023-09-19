CREATE DATABASE db_cidade_das_carnes;
GO
USE db_cidade_das_carnes;
GO

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Estoque INT NOT NULL,
    dataValidade DATE NOT NULL,
    Preco DECIMAL(5,2) NOT NULL,
    IdCategoria BIGINT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(IdCategoria) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_categorias(Nome, Descricao)
VALUES
('Bovina', 'Carne provinda do boi'),
('Suína', 'Carne provinda do porco'),
('Frango', 'Carne provinda do frango'),
('Peixe', 'Carne provinda do peixe'),
('Ovina', 'Carne provinda do cordeiro');

INSERT INTO tb_produtos (Nome, Estoque, dataValidade, Preco, IdCategoria)
VALUES
('Picanha', 50, '2023-09-29', 90.00, 1),
('Alcatra', 50, '2023-09-29', 60.00, 1),
('Contra Filé', 50, '2023-09-29', 45.00, 1),
('Linguiça', 50, '2023-09-29', 30.00, 2),
('Costela', 50, '2023-09-29', 40.00, 2),
('Drumet', 50, '2023-09-29', 35.00, 3),
('Coração', 50, '2023-09-29', 25.00, 3),
('Filé de Tilápia', 50, '2023-09-29', 50.00, 4),
('Filé de Pescada', 50, '2023-09-29', 38.00, 4),
('Carne moída', 50, '2023-09-29', 18.00, 5);

SELECT * FROM tb_produtos WHERE Preco > 50;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 50 AND 150;

SELECT * FROM tb_produtos WHERE Nome LIKE '%c%';

SELECT tb_produtos.Id, tb_produtos.Nome, Estoque, dataValidade, Preco, tb_categorias.Nome AS Categoria, tb_categorias.Descricao FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id;

SELECT tb_produtos.Id, tb_produtos.Nome, Estoque, dataValidade, Preco, tb_categorias.Nome AS Categoria FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id WHERE tb_categorias.Id = 1;