CREATE DATABASE db_construindo_vidas;
GO
USE db_construindo_vidas;
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
    Fornecedor VARCHAR(50) NOT NULL,
    Preco DECIMAL(5,2) NOT NULL,
    IdCategoria BIGINT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(IdCategoria) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_categorias(Nome, Descricao)
VALUES
('Cimento', 'Cimento para construção'),
('Tijolo', 'Tijolo para construção'),
('Argamassa', 'Argamassa para construção'),
('Telha', 'Telha para construção'),
('Tinta', 'Tinta para construção');

INSERT INTO tb_produtos (Nome, Estoque, Fornecedor, Preco, IdCategoria)
VALUES
('Cimento duBom', 50, 'Cimento S.A', 130.00, 1),
('Cimento PisaForte', 50, 'Cimento S.A', 110.00, 1),
('Tijolos CobreCasa', 50, 'Tijolo S.A', 65.00, 2),
('Argamassa Forte', 50, 'Argamassa S.A', 80.00, 3),
('Telhas Verstappen', 50, 'Telha S.A', 30.00, 4),
('Telhas SuperMax', 50, 'Telha S.A', 35.00, 4),
('Tinta Suvinil', 50, 'Tinta S.A', 230.00, 5),
('Tinta Coral', 50, 'Tinta S.A', 210.00, 5);

SELECT * FROM tb_produtos WHERE Preco > 100;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 70 AND 150;

SELECT * FROM tb_produtos WHERE Nome LIKE '%c%';

SELECT tb_produtos.Id, tb_produtos.Nome, Estoque, Fornecedor, Preco, tb_categorias.Nome AS Categoria, tb_categorias.Descricao FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id;

SELECT tb_produtos.Id, tb_produtos.Nome, Estoque, Fornecedor, Preco, tb_categorias.Nome AS Categoria FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id WHERE tb_categorias.Id = 4;