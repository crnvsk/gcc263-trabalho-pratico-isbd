-- MySQL Script generated by MySQL Workbench
-- Fri Dec  1 13:42:24 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trabalho-bd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trabalho-bd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;

-- -----------------------------------------------------
-- Table mydb.Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Usuario (
  id_Usuario INT(10) NOT NULL AUTO_INCREMENT,
  nome_usuario VARCHAR(25) NOT NULL,
  nome_do_meio VARCHAR(25) NOT NULL,
  sobrenome VARCHAR(25) NOT NULL,
  apelido VARCHAR(25) NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(75) NOT NULL,
  data_de_nascimento DATE NOT NULL,
  genero VARCHAR(1) NOT NULL,
  telefone VARCHAR(11) NOT NULL,
  PRIMARY KEY (id_Usuario))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Administrador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Administrador (
  data_admissao DATE NOT NULL,
  id_Usuario INT(10) NOT NULL,
  PRIMARY KEY (id_Usuario),
  CONSTRAINT fk_Administrador_Usuario
    FOREIGN KEY (id_Usuario)
    REFERENCES mydb.Usuario (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Cargo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Cargo (
  id_cargo INT(10) NOT NULL AUTO_INCREMENT,
  nome_cargo VARCHAR(50) NOT NULL,
  descricao_cargo VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_cargo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Pagina
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Pagina (
  id_pagina INT(10) NOT NULL AUTO_INCREMENT,
  url VARCHAR(100) NOT NULL,
  nome_pagina VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  descricao_pagina VARCHAR(100) NOT NULL,
  data_criacao DATE NOT NULL,
  num_seguidores INT NULL DEFAULT 0,
  PRIMARY KEY (id_pagina),
  UNIQUE INDEX url_UNIQUE (url ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Postagem
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Postagem (
  id_postagem INT(10) NOT NULL AUTO_INCREMENT,
  titulo_postagem VARCHAR(250) NULL,
  localizacao VARCHAR(40) NULL,
  data_e_hora DATETIME NOT NULL,
  num_curtidas INT NULL DEFAULT 0,
  id_pagina INT(10) NOT NULL,
  id_Usuario INT(10) NOT NULL,
  PRIMARY KEY (id_postagem),
  INDEX fk_Postagem_Pagina1_idx (id_pagina ASC) VISIBLE,
  INDEX fk_Postagem_Usuario1_idx (id_Usuario ASC) VISIBLE,
  CONSTRAINT fk_Postagem_Pagina1
    FOREIGN KEY (id_pagina)
    REFERENCES mydb.Pagina (id_pagina)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Postagem_Usuario1
    FOREIGN KEY (id_Usuario)
    REFERENCES mydb.Usuario (id_Usuario)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Comentario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Comentario (
  id_comentario INT(10) NOT NULL AUTO_INCREMENT,
  descricao_comentario VARCHAR(300) NOT NULL,
  titulo_mensagem VARCHAR(30) NOT NULL,
  id_postagem INT(10) NOT NULL,
  PRIMARY KEY (id_comentario),
  INDEX fk_Comentario_Postagem1_idx (id_postagem ASC) VISIBLE,
  CONSTRAINT fk_Comentario_Postagem1
    FOREIGN KEY (id_postagem)
    REFERENCES mydb.Postagem (id_postagem)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.pedido_de_amizade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.pedido_de_amizade (
  foi_aceito TINYINT NOT NULL,
  id_Usuario_solicitante INT(10) NOT NULL,
  id_Usuario_solicitado INT(10) NOT NULL,
  PRIMARY KEY (id_Usuario_solicitante, id_Usuario_solicitado),
  INDEX fk_pedido_de_amizade_Usuario2_idx (id_Usuario_solicitado ASC) VISIBLE,
  CONSTRAINT fk_pedido_de_amizade_Usuario1
    FOREIGN KEY (id_Usuario_solicitante)
    REFERENCES mydb.Usuario (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_pedido_de_amizade_Usuario2
    FOREIGN KEY (id_Usuario_solicitado)
    REFERENCES mydb.Usuario (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.gerencia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.gerencia (
  id_Usuario INT(10) NOT NULL,
  id_pagina INT(10) NOT NULL,
  PRIMARY KEY (id_Usuario, id_pagina),
  INDEX fk_Administrador_has_Pagina_Pagina1_idx (id_pagina ASC) VISIBLE,
  INDEX fk_Administrador_has_Pagina_Administrador1_idx (id_Usuario ASC) VISIBLE,
  CONSTRAINT fk_Administrador_has_Pagina_Administrador1
    FOREIGN KEY (id_Usuario)
    REFERENCES mydb.Administrador (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Administrador_has_Pagina_Pagina1
    FOREIGN KEY (id_pagina)
    REFERENCES mydb.Pagina (id_pagina)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.seguidor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.seguidor (
  id_usuario INT(10) NOT NULL,
  id_pagina INT(10) NOT NULL,
  PRIMARY KEY (id_usuario, id_pagina),
  INDEX fk_Usuario_has_Pagina_Pagina1_idx (id_pagina ASC) VISIBLE,
  CONSTRAINT fk_Usuario_has_Pagina_Usuario1
    FOREIGN KEY (id_usuario)
    REFERENCES mydb.Usuario (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Usuario_has_Pagina_Pagina1
    FOREIGN KEY (id_pagina)
    REFERENCES mydb.Pagina (id_pagina)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.curtida
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.curtida (
  id_Usuario INT(10) NOT NULL,
  id_postagem INT(10) NOT NULL,
  PRIMARY KEY (id_Usuario, id_postagem),
  INDEX fk_Usuario_has_Postagem_Postagem1_idx (id_postagem ASC) VISIBLE,
  INDEX fk_Usuario_has_Postagem_Usuario1_idx (id_Usuario ASC) VISIBLE,
  CONSTRAINT fk_Usuario_has_Postagem_Usuario1
    FOREIGN KEY (id_Usuario)
    REFERENCES mydb.Usuario (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Usuario_has_Postagem_Postagem1
    FOREIGN KEY (id_postagem)
    REFERENCES mydb.Postagem (id_postagem)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.permissao
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.permissao (
  id_Usuario INT(10) NOT NULL,
  id_cargo INT(10) NOT NULL,
  PRIMARY KEY (id_Usuario, id_cargo),
  INDEX fk_Administrador_has_Cargo_Cargo1_idx (id_cargo ASC) VISIBLE,
  INDEX fk_Administrador_has_Cargo_Administrador1_idx (id_Usuario ASC) VISIBLE,
  CONSTRAINT fk_Administrador_has_Cargo_Administrador1
    FOREIGN KEY (id_Usuario)
    REFERENCES mydb.Administrador (id_Usuario)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Administrador_has_Cargo_Cargo1
    FOREIGN KEY (id_cargo)
    REFERENCES mydb.Cargo (id_cargo)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;