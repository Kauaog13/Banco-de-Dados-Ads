-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS empresa;

-- Seleciona o banco de dados para uso
USE empresa;

-- Criação da Tabela
CREATE TABLE IF NOT EXISTS vendas (
    ID_NF INT NOT NULL,
    ID_ITEM INT NOT NULL,
    COD_PROD INT,
    VALOR_UNIT DECIMAL(10, 2),
    QUANTIDADE INT,
    DESCONTO_PERCENTUAL DECIMAL(5, 2),
    PRIMARY KEY (ID_NF, ID_ITEM)
);

-- Inserção dos dados na tabela pedido
INSERT INTO vendas (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO_PERCENTUAL) VALUES
(1, 1, 1, 25.00, 10, 5.00),
(1, 2, 2, 13.50, 3, NULL),
(1, 3, 3, 15.00, 2, NULL),
(1, 4, 4, 10.00, 1, NULL),
(1, 5, 5, 30.00, 1, NULL),
(2, 1, 3, 15.00, 4, NULL),
(2, 2, 4, 10.00, 5, NULL),
(2, 3, 5, 30.00, 7, NULL),
(3, 1, 1, 25.00, 5, NULL),
(3, 2, 4, 10.00, 4, NULL),
(3, 3, 5, 30.00, 5, NULL),
(4, 1, 2, 13.50, 7, NULL),
(4, 2, 5, 30.00, 10, 15.00),
(4, 3, 4, 10.00, 12, 5.00),
(4, 4, 1, 25.00, 13, 5.00),
(4, 5, 2, 13.50, 15, 5.00),
(5, 1, 3, 15.00, 3, NULL),
(5, 2, 5, 30.00, 6, NULL),
(6, 1, 1, 25.00, 22, 15.00),
(6, 2, 3, 15.00, 25, 20.00),
(7, 1, 1, 25.00, 10, 3.00),
(7, 2, 2, 13.50, 10, 4.00),
(7, 3, 3, 15.00, 10, 4.00),
(7, 4, 5, 30.00, 10, 1.00);