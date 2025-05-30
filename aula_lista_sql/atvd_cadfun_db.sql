					-- READ --
SELECT * FROM cadfun.cadfun;
SELECT Nome, Funcao FROM cadfun.cadfun;
SELECT Nome, Funcao, Depto FROM cadfun.cadfun WHERE Depto = 2;
SELECT Nome, Funcao, Depto FROM cadfun.cadfun WHERE Nome = 'Aparecida Silva';
SELECT Nome, Funcao, Depto FROM cadfun WHERE Nome LIKE 'Wilson%';
SELECT Nome, Salario FROM cadfun.cadfun ORDER BY Nome ASC;
SELECT Nome, Salario FROM cadfun.cadfun ORDER BY Nome DESC;
SELECT Nome, Salario FROM cadfun.cadfun ORDER BY Nome, Depto DESC;

					-- CREATE --
INSERT INTO `cadfun`.`cadfun` (`Nome`, `Depto`, `Funcao`, `Salario`) VALUES ('Agusto Souza', '3', 'Programador', '1050,00');

					-- UPDATE --
UPDATE `cadfun`.`cadfun` SET `Depto` = '4' WHERE (`CodFun` = '3');
UPDATE `cadfun` SET `Salario` = Salario * 1.10;

					-- ROOT --
SET sql_safe_updates = 0;
