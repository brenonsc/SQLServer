CREATE DATABASE db_curso_da_minha_vida;
GO
USE db_curso_da_minha_vida;
GO

CREATE TABLE tb_categorias(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE tb_cursos(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    EmpresaInstrutora VARCHAR(50) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Preco DECIMAL(5,2) NOT NULL,
    IdCategoria BIGINT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(IdCategoria) REFERENCES tb_categorias(Id)
);


INSERT INTO tb_categorias(Nome, Descricao)
VALUES
('Computação', 'Cursos relacionados a programação'),
('Mídia', 'Cursos relacionados a edição de foto e vídeo'),
('Fotografia e vídeo', 'Cursos relacionados a gravação e fotografia'),
('Culinária', 'Cursos relacionados a cozinha'),
('Mente e Equilíbrio', 'Cursos relacionados a psicologia e meditação');

INSERT INTO tb_cursos(Nome, EmpresaInstrutora, Descricao, Preco, IdCategoria)
VALUES
('.NET Bootcamp', 'Generation Brasil', 'Curso de programação em .NET, utilizando C#', 0.00, 1),
('Java Bootcamp', 'Generation Brasil', 'Curso de programação em Java e Spring', 0.00, 1),
('Adobe Photoshop', 'Udemy', 'Curso avançado de Photoshop', 300.00, 2),
('Adobe Premiere', 'Udemy', 'Curso avançado de Premiere', 650.00, 2),
('Filmagem com câmeras DSLR', 'Coursera', 'Curso avançado de filmagem com câmeras profissionais', 900.00, 3),
('Confeitaria', 'EduK', 'Curso ensinando as principais receitas e práticas para uma confeitaria', 990.00, 4),
('Psicologia de Kant', 'Coursera', 'Curso ensinando os fundamentos propagados por Kant', 200.00, 5),
('Meditação prática', 'EduK', 'Curso dedicado a meditação no dia a dia', 100.00, 5);

SELECT * FROM tb_cursos WHERE Preco > 500;

SELECT * FROM tb_cursos WHERE Preco BETWEEN 600 AND 1000;

SELECT * FROM tb_cursos WHERE Nome LIKE '%j%';

SELECT tb_cursos.Id, tb_cursos.Nome, EmpresaInstrutora, tb_cursos.Descricao, Preco, tb_categorias.Nome AS Categoria, tb_categorias.Descricao FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.IdCategoria = tb_categorias.Id;

SELECT tb_cursos.Id, tb_cursos.Nome, EmpresaInstrutora, tb_cursos.Descricao, Preco, tb_categorias.Nome AS Categoria, tb_categorias.Descricao FROM tb_cursos INNER JOIN tb_categorias
ON tb_cursos.IdCategoria = tb_categorias.Id WHERE tb_categorias.Id = 1;