-- a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = código da disciplinas).
SELECT
    MAT
FROM
    Historico
WHERE
    COD_DISC = 'BD' AND ANO = 2015 AND nota < 5;

-- b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015.
SELECT
    MAT,
    AVG(nota) AS media_notas_poo
FROM
    Historico
WHERE
    COD_DISC = 'POO' AND ANO = 2015
GROUP BY
    MAT;

-- c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6.
SELECT
    MAT,
    AVG(nota) AS media_notas_poo
FROM
    Historico
WHERE
    COD_DISC = 'POO' AND ANO = 2015
GROUP BY
    MAT
HAVING
    media_notas_poo > 6;

-- d) Encontre quantos alunos não são de Natal.
SELECT
    COUNT(*) AS quantidade_alunos_nao_natal
FROM
    Alunos
WHERE
    cidade <> 'NATAL';