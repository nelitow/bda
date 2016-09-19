CREATE SCHEMA IF NOT EXISTS `dba` DEFAULT CHARACTER SET utf8 ;
USE `dba` ;

CREATE TABLE IF NOT EXISTS `dba`.`campus` (
  `nome` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`nome`));

CREATE TABLE IF NOT EXISTS `dba`.`curso` (
  `campus` VARCHAR(128) NULL,
  `numero` CHAR(10) NOT NULL,
  `CHmin` INT NULL,
  `CHmax` INT NULL,
  `nome` VARCHAR(128) NOT NULL,
  `campus_nome` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`numero`, `campus_nome`),
  INDEX `fk_curso_campus1_idx` (`campus_nome` ASC),
  CONSTRAINT `fk_curso_campus1`
    FOREIGN KEY (`campus_nome`)
    REFERENCES `dba`.`campus` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `dba`.`matricula` (
  `aluno` CHAR(11) NULL,
  `curso` CHAR(10) NULL,
  `numero` CHAR(10) NOT NULL,
  `curso_numero` CHAR(10) NOT NULL,
  PRIMARY KEY (`numero`, `curso_numero`),
  INDEX `fk_matricula_curso1_idx` (`curso_numero` ASC),
  CONSTRAINT `fk_matricula_curso1`
    FOREIGN KEY (`curso_numero`)
    REFERENCES `dba`.`curso` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `dba`.`aluno` (
  `nome` VARCHAR(128) NOT NULL,
  `documento` CHAR(11) NOT NULL,
  `telefone` BIGINT NULL,
  `email` VARCHAR(128) NULL,
  `matricula_numero` CHAR(10) NOT NULL,
  PRIMARY KEY (`documento`, `matricula_numero`),
  INDEX `fk_aluno_matricula_idx` (`matricula_numero` ASC),
  CONSTRAINT `fk_aluno_matricula`
    FOREIGN KEY (`matricula_numero`)
    REFERENCES `dba`.`matricula` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

