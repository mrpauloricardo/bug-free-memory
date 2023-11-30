-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rede_social
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rede_social
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rede_social` DEFAULT CHARACTER SET utf8 ;
USE `rede_social` ;

-- -----------------------------------------------------
-- Table `rede_social`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rede_social`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NULL,
  `data_nascimento` DATE NULL,
  `email` VARCHAR(100) NULL,
  `senha` VARCHAR(30) NULL,
  `foto` TEXT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rede_social`.`postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rede_social`.`postagem` (
  `postagem_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NULL,
  `texto_postagem` TEXT NULL,
  `data_hora_postagem` DATETIME NULL,
  PRIMARY KEY (`postagem_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `postagen_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rede_social`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rede_social`.`comentario` (
  `comentario_id` INT NOT NULL AUTO_INCREMENT,
  `postagem_id` INT NULL,
  `usuario_id` INT NULL,
  `texto_comentario` TEXT NULL,
  `data_hora_comentario` DATETIME NULL,
  PRIMARY KEY (`comentario_id`),
  INDEX `postagem_id_idx` (`postagem_id` ASC) VISIBLE,
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `comentario_postagem_id`
    FOREIGN KEY (`postagem_id`)
    REFERENCES `rede_social`.`postagem` (`postagem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comentario_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rede_social`.`curtida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rede_social`.`curtida` (
  `curtida_id` INT NOT NULL AUTO_INCREMENT,
  `postagem_id` INT NULL,
  `usuario_id` INT NULL,
  `data_hora_curtida` DATETIME NULL,
  PRIMARY KEY (`curtida_id`),
  INDEX `postagem_id_idx` (`postagem_id` ASC) VISIBLE,
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `curtida_postagem_id`
    FOREIGN KEY (`postagem_id`)
    REFERENCES `rede_social`.`postagem` (`postagem_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `curtida_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rede_social`.`conexao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rede_social`.`conexao` (
  `conexao_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NULL,
  `amigo_id` INT NULL,
  `data_conexao` DATE NULL,
  PRIMARY KEY (`conexao_id`),
  INDEX `conexao_usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `conexao_amigo_id_idx` (`amigo_id` ASC) VISIBLE,
  CONSTRAINT `conexao_usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `conexao_amigo_id`
    FOREIGN KEY (`amigo_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rede_social`.`chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rede_social`.`chat` (
  `chat_id` INT NOT NULL AUTO_INCREMENT,
  `remetente_id` INT NULL,
  `destinatario_id` INT NULL,
  `texto_chat` TEXT NULL,
  `data_hora_chat` DATETIME NULL,
  PRIMARY KEY (`chat_id`),
  INDEX `chat_remetente_id_idx` (`remetente_id` ASC) VISIBLE,
  INDEX `chat_destinatario_id_idx` (`destinatario_id` ASC) VISIBLE,
  CONSTRAINT `chat_remetente_id`
    FOREIGN KEY (`remetente_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `chat_destinatario_id`
    FOREIGN KEY (`destinatario_id`)
    REFERENCES `rede_social`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
