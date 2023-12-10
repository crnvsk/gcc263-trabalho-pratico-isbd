-- Excluir um usuário com um ID específico:
DELETE FROM mydb.Usuario WHERE id_Usuario = 1;

-- Excluir um administrador junto com o usuário associado:
DELETE FROM mydb.Administrador WHERE id_Usuario = 2;

-- Excluir uma função específica pelo seu ID:
DELETE FROM mydb.Cargo WHERE id_cargo = 2;

-- Excluir uma página pelo seu ID:
DELETE FROM mydb.Pagina WHERE id_pagina = 5;

-- Excluir uma postagem específica pelo seu ID:
DELETE FROM mydb.Postagem WHERE id_postagem = 7;

-- Exclusão Aninhada
SET @usuarioID = (SELECT `id_Usuario` FROM `mydb`.`Usuario` WHERE `nome_usuario` = 'Carlos');

DELETE FROM `mydb`.`Postagem` WHERE `id_Usuario` = @usuarioID;

DELETE FROM `mydb`.`Usuario` WHERE `id_Usuario` = @usuarioID;
