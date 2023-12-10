-- Modificar um Comentário em ‘Comentario’:
UPDATE `mydb`.`Comentario`
SET `descricao_comentario` = 'Nova descrição para o comentário.'
WHERE `id_comentario` = 3;

-- Modificar a Categoria de uma Página em ‘Pagina’:
UPDATE `mydb`.`Pagina`
SET `categoria` = 'Entretenimento'
WHERE `id_pagina` = 2;

-- Modificar o Cargo de um Usuário em ‘Cargo’:
UPDATE `mydb`.`Cargo`
SET `nome_cargo` = 'Analista de Conteúdo'
WHERE `id_cargo` = 2;

-- Modificar a Data de Admissão de um Administrador em ‘Administrador’:
UPDATE `mydb`.`Administrador`
SET `data_admissao` = '2023-04-15'
WHERE `id_Usuario` = 4;

-- Atualização do título da postagem
UPDATE `mydb`.`Postagem`
SET `titulo_postagem` = 'Novo Título da Postagem'
WHERE `id_postagem` = 1;

-- Atualização do nome do usuário correspondente
UPDATE `mydb`.`Usuario`
SET `nome_usuario` = 'Novo Nome'
WHERE `id_Usuario` = (SELECT `id_Usuario` FROM `mydb`.`Postagem` WHERE `id_postagem` = 1);
