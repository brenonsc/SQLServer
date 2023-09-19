CREATE DATABASE db_pizzaria_legal;
GO
USE db_pizzaria_legal;
GO

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE tb_pizzas(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    BordaRecheada BIT NOT NULL,
    Preco DECIMAL(4,2) NOT NULL,
    IdCategoria BIGINT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(IdCategoria) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_categorias(Nome, Descricao) 
VALUES
('Salgada', 'Pizzas salgadas'),
('Vegetariana', 'Pizzas vegetarianas'),
('Vegana', 'Pizzas veganas'),
('Doce', 'Pizzas doces'),
('Especial', 'Pizzas especiais');

INSERT INTO tb_pizzas (Nome, Descricao, BordaRecheada, Preco, IdCategoria)
VALUES
    ('Pizza Margherita', 'Molho de tomate, mussarela, manjericão fresco', 0, 39.99, 1),
    ('Pizza Pepperoni', 'Molho de tomate, pepperoni e queijo', 1, 41.50, 1),
    ('Pizza Calabresa', 'Molho de tomate, calabresa e cebola', 0, 65.75, 1),
    ('Pizza Frango com Catupiry', 'Molho de tomate, frango desfiado e catupiry', 1, 65.99, 1),
    ('Pizza Portuguesa', 'Molho de tomate, presunto, mussarela, ovos, cebola e azeitonas', 0, 62.75, 1),
    ('Pizza Quatro Queijos', 'Molho de tomate, mussarela, parmesão, gorgonzola e catupiry', 0, 53.99, 2),
    ('Pizza Vegetariana', 'Molho de tomate, brócolis, cogumelos, pimentão e milho', 0, 39.99, 2),
    ('Pizza Vegana', 'Pizza de abobrinha com creme de batata e queijo de castanhas', 0, 44.99, 3),
    ('Pizza Romeu e Julieta', 'Pizza de goiabada e queijo', 0, 65.25, 4),
    ('Pizza Nutella com Morango', 'Pizza de Nutella com morango', 0, 69.50, 5);

SELECT * FROM tb_pizzas WHERE Preco > 45;

SELECT * FROM tb_pizzas WHERE Preco BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE Nome LIKE '%m%';

SELECT tb_pizzas.Id, tb_pizzas.Nome, tb_pizzas.Descricao, Preco, tb_categorias.Nome AS Categoria FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.IdCategoria = tb_categorias.Id ORDER BY tb_pizzas.Nome ASC;

SELECT tb_pizzas.Id, tb_pizzas.Nome, tb_pizzas.Descricao, Preco, tb_categorias.Nome AS Categoria FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.IdCategoria = tb_categorias.Id WHERE tb_pizzas.IdCategoria = 1 ORDER BY tb_pizzas.Nome ASC;