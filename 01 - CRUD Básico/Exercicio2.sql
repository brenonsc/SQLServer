CREATE DATABASE db_eCommerce;

USE db_eCommerce;

CREATE TABLE tb_produto (
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Tipo VARCHAR(30) NOT NULL,
    Quantidade INT NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO tb_produto(Nome, Descricao, Tipo, Quantidade, Preco)
VALUES
('Camiseta', 'Camiseta de algodão', 'Vestuário', 10, 50.00),
('Calça', 'Calça jeans', 'Vestuário', 5, 100.00),
('Tênis', 'Tênis esportivo', 'Vestuário', 2, 200.00),
('Celular', 'iPhone 14 Pro', 'Eletrônico', 3, 6000.00),
('Notebook', 'Notebook Dell', 'Eletrônico', 1, 5000.00);

SELECT * FROM tb_produto WHERE Preco > 500.00;

SELECT * FROM tb_produto WHERE Preco < 500.00;

UPDATE tb_produto SET Preco = 55.00 WHERE Id = 1;