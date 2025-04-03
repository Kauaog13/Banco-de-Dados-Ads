create database bd;
use bd;
create table user(
    id serial primary key,
    name varchar(30) not null,
    cpf varchar(20) not null
);
INSERT INTO `bd`.`user` (`id`, `name`, `cpf`)
VALUES (1, 'Kauã', '12332112313'),
    (2, 'Victoria', '32112332113'),
    (3, 'Raissa', '4566544513'),
    (4, 'Felipe', '78998778913'),
    (5, 'Thays', '98778998713'),
    (6, 'Isadora', '76556776513');