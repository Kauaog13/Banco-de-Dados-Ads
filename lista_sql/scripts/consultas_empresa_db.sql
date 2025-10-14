-- Consulta a): Pesquise os itens que foram vendidos sem desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.
SELECT
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT
FROM
    vendas
WHERE
    DESCONTO_PERCENTUAL IS NULL;

-- Consulta b): Pesquise os itens que foram vendidos com desconto. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
SELECT
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
    (VALOR_UNIT - (VALOR_UNIT * (DESCONTO_PERCENTUAL / 100))) AS VALOR_VENDIDO
FROM
    vendas
WHERE
    DESCONTO_PERCENTUAL IS NOT NULL AND DESCONTO_PERCENTUAL > 0;

-- Script c): Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.
	UPDATE vendas 
SET 
    DESCONTO_PERCENTUAL = 0
WHERE
    DESCONTO_PERCENTUAL IS NULL;

-- Consulta d): Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
SELECT
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
    (QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL,
    DESCONTO_PERCENTUAL AS DESCONTO,
    (QUANTIDADE * (VALOR_UNIT - (VALOR_UNIT * COALESCE(DESCONTO_PERCENTUAL, 0) / 100))) AS VALOR_VENDIDO
FROM
    vendas;

-- Consulta e): Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
SELECT
    ID_NF,
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM
    vendas
GROUP BY
    ID_NF
ORDER BY
    VALOR_TOTAL DESC;

-- Consulta f): Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe o resultado da consulta por ID_NF.
SELECT
    ID_NF,
    SUM(QUANTIDADE * (VALOR_UNIT - (VALOR_UNIT * COALESCE(DESCONTO_PERCENTUAL, 0) / 100))) AS VALOR_VENDIDO
FROM
    vendas
GROUP BY
    ID_NF
ORDER BY
    VALOR_VENDIDO DESC;

-- Consulta g): Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por COD_PROD.
SELECT
    COD_PROD,
    SUM(QUANTIDADE) AS QUANTIDADE
FROM
    vendas
GROUP BY
    COD_PROD
ORDER BY
    QUANTIDADE DESC
LIMIT 1;

-- Consulta h): Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto. As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por ID_NF, COD_PROD.
SELECT
    ID_NF,
    COD_PROD,
    QUANTIDADE
FROM
    vendas
WHERE
    QUANTIDADE > 10;

-- Consulta i): Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o resultado do maior valor para o menor. As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
SELECT
    ID_NF,
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT
FROM
    vendas
GROUP BY
    ID_NF
HAVING
    VALOR_TOT > 500
ORDER BY
    VALOR_TOT DESC;

-- Consulta j): Qual o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por COD_PROD.
SELECT
    COD_PROD,
    AVG(COALESCE(DESCONTO_PERCENTUAL, 0)) AS MEDIA
FROM
    vendas
GROUP BY
    COD_PROD;

-- Consulta k): Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe o resultado da consulta por COD_PROD.
SELECT
    COD_PROD,
    MIN(COALESCE(DESCONTO_PERCENTUAL, 0)) AS MENOR,
    MAX(COALESCE(DESCONTO_PERCENTUAL, 0)) AS MAIOR,
    AVG(COALESCE(DESCONTO_PERCENTUAL, 0)) AS MEDIA
FROM
    vendas
GROUP BY
    COD_PROD;

-- Consulta l): Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o resultado da consulta por ID_NF.
SELECT
    ID_NF,
    COUNT(ID_ITEM) AS QTD_ITENS
FROM
    vendas
GROUP BY
    ID_NF
HAVING
    QTD_ITENS > 3;