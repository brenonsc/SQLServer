CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionario (
    Id BIGINT IDENTITY(1,1),
    Nome VARCHAR(255) NOT NULL,
    Cargo VARCHAR(30) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    DataAdmissao DATE NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PRIMARY KEY (Id)
);

INSERT INTO tb_funcionario 
(Nome, Cargo, Salario, DataAdmissao, Email)
VALUES
('João', 'Gerente', 10000.00, '2020-01-01', 'joao@corp.com'),
('Maria', 'Estagiário', 1400.00, '2021-03-10', 'maria@corp.com'),
('José', 'Analista', 5000.00, '2018-09-20', 'jose@corp.com'),
('Ana', 'Desenvolvedor', 7000.00, '2019-11-15', 'ana@corp.com'),
('Pedro', 'Atendente', 1800.00, '2017-05-05', 'pedro@corp.com');

SELECT * FROM tb_funcionario WHERE Salario > 2000.00;

SELECT * FROM tb_funcionario WHERE Salario < 2000.00;

UPDATE tb_funcionario SET Cargo = 'Desenvolvedor Pleno', Salario = 9000.00 WHERE Id = 4;
