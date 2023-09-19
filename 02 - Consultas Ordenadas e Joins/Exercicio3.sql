CREATE DATABASE db_farmacia_bem_estar;
GO
USE db_farmacia_bem_estar;
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
    Descricao VARCHAR(100) NOT NULL,
    Estoque INT NOT NULL,
    Preco DECIMAL(5,2) NOT NULL,
    IdCategoria BIGINT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(IdCategoria) REFERENCES tb_categorias(Id)
);

INSERT INTO tb_categorias(Nome, Descricao)
VALUES
('Medicamentos', 'Medicamentos'),
('Higiene', 'Produtos de higiene'),
('Perfumaria', 'Perfumes'),
('Maquiagem', 'Produtos para beleza'),
('Cabelos', 'Produtos para cabelos');

INSERT INTO tb_produtos (Nome, Descricao, Estoque, Preco, IdCategoria)
VALUES
('Paracetamol', 'Tratamento de febre e dores leves', 10, 6.00, 1),
('Omeprazol', 'Tratamento para muita produção de ácido no estômago', 25, 15.00, 1),
('Sabonete líquido', 'Sabonete Dove líquido', 40, 20.00,2),
('Natura K', 'Perfume aromático intenso', 10, 210.00, 3),
('Malbec', 'Perfume da família olfativa amadeirado', 15, 180.00, 3),
('Batom', 'Batom vermelho', 20, 30.00, 4),
('Shampoo', 'Shampoo para cabelos oleosos', 30, 25.00, 5),
('Condicionador', 'Condicionador para cabelos oleosos', 30, 28.00, 5);

SELECT * FROM tb_produtos WHERE Preco > 50;

SELECT * FROM tb_produtos WHERE Preco BETWEEN 5 AND 60;

SELECT * FROM tb_produtos WHERE Nome LIKE '%c%';

SELECT tb_produtos.Id, tb_produtos.Nome, tb_produtos.Descricao, Estoque, Preco, tb_categorias.Nome AS Categoria, tb_categorias.Descricao AS DescricaoCategoria FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id;

SELECT tb_produtos.Id, tb_produtos.Nome, tb_produtos.Descricao, Estoque, Preco, tb_categorias.Nome AS Categoria FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.IdCategoria = tb_categorias.Id WHERE tb_categorias.Id = 1;