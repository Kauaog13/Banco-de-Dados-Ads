-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8 ;
USE `vendas` ;

-- -----------------------------------------------------
-- Table `vendas`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`produto` (
  `codigo_produto` INT NOT NULL AUTO_INCREMENT,
  `descricao_produto` VARCHAR(50) NULL,
  `preco_produto` FLOAT NOT NULL,
  PRIMARY KEY (`codigo_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`nota_fiscal` (
  `numero_nf` INT NOT NULL,
  `data_nf` DATE NOT NULL,
  `valor_nf` FLOAT NULL,
  PRIMARY KEY (`numero_nf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`itens` (
  `num_itens` INT NULL,
  `qtde_itens` INT NULL,
  `produto_codigo_produto` INT NOT NULL,
  `nota_fiscal_numero_nf` INT NOT NULL,
  INDEX `fk_itens_produto_idx` (`produto_codigo_produto` ASC) VISIBLE,
  INDEX `fk_itens_nota_fiscal1_idx` (`nota_fiscal_numero_nf` ASC) VISIBLE,
  CONSTRAINT `fk_itens_produto`
    FOREIGN KEY (`produto_codigo_produto`)
    REFERENCES `vendas`.`produto` (`codigo_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_nota_fiscal1`
    FOREIGN KEY (`nota_fiscal_numero_nf`)
    REFERENCES `vendas`.`nota_fiscal` (`numero_nf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- ALTERANDO A COLUNA "DESCRIÇÃO" DA TABELA PRODUTO
ALTER TABLE `vendas`.`produto` 
CHANGE COLUMN `descricao_produto` `descricao_produto` VARCHAR(50) NULL DEFAULT NULL ;

-- ALTERANDO A TABELA "NOTA_FISCAL" E ADICIONAR "ICMS", TIPO FLOAT DEPOIS DO CAMPO "NUMERO_NF"
ALTER TABLE `vendas`.`nota_fiscal` 
ADD COLUMN `icms` FLOAT NOT NULL AFTER `numero_nf`;

-- ALTERANDO A TABELA "PRODUTO" E ADICIONAR O CAMPO "PESO" DO TIPO FLOAT
ALTER TABLE `vendas`.`produto` 
ADD COLUMN `peso_produto` FLOAT NULL AFTER `preco_produto`;

-- APRESENTAR A ESTRUTURA DA TABELA "NOTA_FISCAL"

-- REMOVER O CAMPO "DATA_NF" DA TABELA "NOTA_FISCAL"
ALTER TABLE `vendas`.`nota_fiscal` 
DROP COLUMN `data_nf`;

-- REMOVER A TABELA "ITENS" DO MODELO DE DADOS, NÃO DO BANCO

-- ALTERARNDO O NOME DA TABELA "NOTA_FISCAL" PARA "VENDA"
ALTER TABLE `vendas`.`nota_fiscal` 
RENAME TO  `vendas`.`venda` ;


