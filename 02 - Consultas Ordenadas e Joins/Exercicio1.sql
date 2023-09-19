CREATE DATABASE db_generation_game_online;
GO
USE db_generation_game_online;
GO

CREATE TABLE tb_classes(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE tb_personagens(
    Id BIGINT IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    PoderAtaque INT NOT NULL,
    PoderDefesa INT NOT NULL,
    Raca VARCHAR(50) NOT NULL,
    IdClasse BIGINT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(IdClasse) REFERENCES tb_classes(Id)
);

INSERT INTO tb_classes(Nome, Descricao)
VALUES
('Guerreiro', 'Classe de combate corpo a corpo'),
('Mago', 'Classe de combate a distância'),
('Arqueiro', 'Classe de combate a distância'),
('Ladino', 'Classe de combate corpo a corpo'),
('Paladino', 'Classe de suporte');

INSERT INTO tb_personagens(Nome, PoderAtaque, PoderDefesa, Raca, IdClasse)
VALUES
('Aragorn', 2000, 1600, 'Humano', 1),
('Gandalf', 2500, 800, 'Humano', 2),
('Legolas', 800, 800, 'Elfo', 3),
('Frodo', 1100, 800, 'Halfling', 4),
('Gimli', 2100, 1800, 'Anão', 1),
('Bareris', 2300, 1500, 'Gnomo', 5),
('Samwise', 1000, 800, 'Halfling', 4),
('Boromir', 1800, 1600, 'Humano', 1);

SELECT * FROM tb_personagens WHERE PoderAtaque > 2000;

SELECT * FROM tb_personagens WHERE PoderDefesa > 1000 AND PoderDefesa < 2000;

SELECT * FROM tb_personagens WHERE Nome LIKE '%c%';

SELECT tb_personagens.Id, tb_personagens.Nome, PoderAtaque, PoderDefesa, Raca, tb_classes.Nome AS Classe, Descricao FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.IdClasse = tb_classes.Id ORDER BY tb_personagens.Nome ASC;

SELECT tb_personagens.Id, tb_personagens.Nome, PoderAtaque, PoderDefesa, Raca, tb_classes.Nome AS Classe, Descricao FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.IdClasse = tb_classes.Id WHERE IdClasse = 1 ORDER BY tb_personagens.Nome ASC;