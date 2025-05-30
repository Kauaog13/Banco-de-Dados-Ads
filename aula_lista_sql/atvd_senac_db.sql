-- ATIVIDADES:
-- CRIE DATABASE 'SENAC';
-- CRIE A TABELA ALUNO;
-- COM AS SEGUINTES COLUNAS: nome, matricula, telefone, cpd, data de nascimento, endereco, sexo, renda, curriculo, PK ID;
-- Realizar 10 Inserts
-- Selects - por nome e matricula
-- Por order by asc
-- Por order by desc
-- Por renda


-- CRIANDO DB SENAC
CREATE DATABASE senac;

-- SELECIONA O DB SENAC
USE senac;

-- CRIANDO TABELA ALUNOS
CREATE TABLE `alunos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `matricula` INT NOT NULL,
  `telefone` VARCHAR(15) NULL,
  `cpf` CHAR(11) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereco` VARCHAR(255) NULL,
  `sexo` ENUM('Masculino', 'Feminino', 'Outro') NULL,
  `renda` DECIMAL(10,2) NOT NULL,
  `foto` BLOB NULL,
  `curriculo` VARCHAR(300) NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`)
);

-- INSERT 10 ALUNOS 
INSERT INTO `alunos` (`nome`, `matricula`, `telefone`, `cpf`, `data_nascimento`, `endereco`, `sexo`, `renda`, `foto`, `curriculo`) VALUES
('Alice Oliveira', 2001, '11999998888', '12345678901', '1998-05-12', 'Rua A, 123', 'Feminino', 2500.00, NULL, 'Currículo de Alice'),
('Bruno Santos', 2002, '21988887777', '23456789012', '1995-08-22', 'Rua B, 456', 'Masculino', 3100.50, NULL, 'Currículo de Bruno'),
('Carla Mendes', 2003, '31977776666', '34567890123', '1999-11-05', 'Av. C, 789', 'Feminino', 1800.75, NULL, 'Currículo de Carla'),
('Diego Almeida', 2004, '41966665555', '45678901234', '1994-01-10', 'Rua D, 321', 'Masculino', 4100.00, NULL, 'Currículo de Diego'),
('Eduarda Lima', 2005, '51955554444', '56789012345', '2000-08-22', 'Av. E, 654', 'Feminino', 1500.00, NULL, 'Currículo de Eduarda'),
('Felipe Rocha', 2006, '61944443333', '67890123456', '1989-12-30', 'Rua F, 987', 'Masculino', 5000.00, NULL, 'Currículo de Felipe'),
('Gabriela Torres', 2007, '71933332222', '78901234567', '1997-07-19', 'Rua G, 147', 'Feminino', 2200.00, NULL, 'Currículo de Gabriela'),
('Henrique Costa', 2008, '81922221111', '89012345678', '1996-04-25', 'Av. H, 258', 'Masculino', 3600.00, NULL, 'Currículo de Henrique'),
('Isabela Martins', 2009, '91911110000', '90123456789', '1993-09-12', 'Rua I, 369', 'Feminino', 2750.80, NULL, 'Currículo de Isabela'),
('João Pedro', 2010, '11900009999', '01234567890', '1992-02-18', 'Av. J, 741', 'Masculino', 3100.00, NULL, 'Currículo de João');

-- SELECT POR NOME E MATRICULA
SELECT matricula, nome FROM alunos;

-- SELECT ORDER BY ASC
SELECT * FROM alunos ORDER BY nome ASC;

-- SELECT ORDER BY DESC
SELECT * FROM alunos ORDER BY nome DESC;

-- SELECT POR RENDA
SELECT id, renda FROM alunos;