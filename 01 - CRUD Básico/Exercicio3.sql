CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_aluno (
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    DataNascimento DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Media DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO tb_aluno(Nome, DataNascimento, Email, Media)
VALUES
('João', '2000-01-01', 'joao@school.com', 8.00),
('Maria', '2000-02-02', 'maria@school.com', 9.00),
('José', '2000-03-03', 'jose@school.com', 7.00),
('Ana', '2000-04-04', 'ana@school.com', 10.00),
('Pedro', '2000-05-05', 'pedro@school.com', 6.00),
('Paulo', '2000-06-06', 'paulo@school.com', 5.00),
('Carlos', '2000-07-07', 'carlos@school.com', 4.00),
('Mariana', '2000-08-08', 'mariana@school.com', 3.00);

SELECT * FROM tb_aluno WHERE Media > 7.00;

SELECT * FROM tb_aluno WHERE Media < 7.00;

UPDATE tb_aluno SET Media = 7.00 WHERE Id = 8;