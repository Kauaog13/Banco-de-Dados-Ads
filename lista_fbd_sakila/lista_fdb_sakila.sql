-- ALuno: Kauã Oliveira Gonçalves
-- Turma: ADS | 2 semestre | matutino

-- 1. Gere o diagrama E. R. da base Sakila

-- 2. Listar o primeiro e o último nome dos atores em ordem de último nome, seguido de nome
SELECT first_name, last_name 
FROM actor 
ORDER BY last_name, first_name;

-- 3. Listar apenas o primeiro nome e último nome dos clientes inativos
SELECT first_name, last_name 
FROM customer;

-- 4. Listar o título dos filmes com duração do filme entre 60 e 80 minutos
SELECT title 
FROM film 
WHERE 60< length <80;

-- 5. listar o título dos filmes com preço de locação abaixo de 1 dólar, ordenar pelo título.
SELECT title, rental_rate  
FROM film 
WHERE rental_rate <1
ORDER BY title;

-- 6. Listar título, preço da locação e custo de substituição dos filmes com custo de substituição acima de 20 dólares,
-- mas que tenham preço de locação abaixo de 3 dólares. Ordene pelo custo de substituição seguido pelo preço de locação
SELECT title, rental_rate, replacement_cost 
FROM film
WHERE replacement_cost >20
AND rental_rate <3
ORDER BY replacement_cost, rental_rate;

-- 7. Qual o filme com custo de substituição mais caro?
SET sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
SELECT title, MAX(replacement_cost)
FROM film;

-- 8. Qual a média do preço de locação?
SELECT title, 
AVG(replacement_cost)
FROM film;

-- 9. Quantos filmes tem duração de 120 minutos ou mais?
SELECT COUNT(title)
FROM film
WHERE length >=120;

-- 10. Qual a menor duração de locação?
SELECT MIN(rental_duration)
FROM film;

-- 11. Liste o título dos filmes com preço da locação acima da média
SELECT title
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

-- 12. Liste o título dos filmes com maior duração da locação
SELECT title, rental_duration
FROM film
WHERE rental_duration = (SELECT MAX(rental_duration) FROM film);

-- 13. Liste o título dos filmes com menor custo de substituição
SELECT title, replacement_cost
FROM film
WHERE replacement_cost = (SELECT MIN(replacement_cost) FROM film);

-- 14. Quais cidades do 'Brasil' estão cadastradas no sistema?
SELECT DISTINCT c.city
FROM city c
JOIN country co ON c.country_id = co.country_id
WHERE co.country = 'Brazil';

-- 15. Liste o nome dos clientes, a cidade e o país onde moram.
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS nome_cliente,
    ci.city AS cidade,
    co.country AS pais
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 16. Liste o título do filme e sua(s) respectiva(s) categoria(s)
SELECT f.title AS titulo_filme, c.name AS categoria
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

-- 17. Quais atores trabalharam no filme 'ADAPTATION HOLES'?
SELECT a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'ADAPTATION HOLES';

-- 18. Quais filmes o ator 'ED CHASE' trabalhou?
SELECT f.title AS titulo_filme
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE a.first_name = 'ED' AND a.last_name = 'CHASE';
