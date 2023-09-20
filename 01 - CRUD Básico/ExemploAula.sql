CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos(
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Quantidade INT,
    DataValidade DATE,
    Preco DECIMAL (6,2)NOT NULL,
    PRIMARY KEY(Id)
);

INSERT INTO tb_produtos
(Nome, Quantidade, DataValidade, Preco)
VALUES
('Laranja', 20, '2023-09-25', 8.00),
('Maçã', 10, '2023-09-25', 5.25),
('Couve', 35, '2023-09-25', 6.00),
('Banana', 25, '2023-09-25', 16.00);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE Id = 1;
SELECT * FROM tb_produtos WHERE Nome = 'Maçã';

SELECT Nome, Quantidade, Preco FROM tb_produtos WHERE Nome = 'Banana';

SELECT * FROM tb_produtos WHERE Id = 1 OR Id = 2 OR Id = 3;

SELECT * FROM tb_produtos WHERE Preco > 4 AND Preco < 7;

--ALTER TABLE tb_produtos ALTER COLUMN Precos DECIMAL(6,2);

INSERT INTO tb_produtos
(Nome, Quantidade, DataValidade, Preco)
VALUES
('Abacaxi', 10, '2023-09-25', 10.25);

ALTER TABLE tb_produtos ADD Descricao VARCHAR(255);

UPDATE tb_produtos SET Descricao = 'Abacaxi Natural' WHERE Id = 5;

DELETE tb_produtos WHERE Id = 5;

SELECT Nome as 'Nome do Produto', Descricao as 'Descrição do Produto' FROM tb_produtos;