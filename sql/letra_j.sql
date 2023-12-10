DELIMITER //
CREATE TRIGGER update_num_seguidores
AFTER INSERT ON mydb.seguidor
FOR EACH ROW
BEGIN
    UPDATE mydb.Pagina
    SET num_seguidores = COALESCE(num_seguidores + 1, 1)
    WHERE id_pagina = NEW.id_pagina;
END;
//
DELIMITER //;
-- DELIMITER //: Define um novo delimitador para os comandos SQL. 
-- Isso é necessário quando você está escrevendo scripts que incluem o uso de ;
-- dentro de blocos, como triggers e stored procedures.

-- CREATE TRIGGER update_num_seguidores: Inicia a definição de um novo trigger chamado update_num_seguidores.
-- AFTER INSERT ON mydb.seguidor: Esse trigger será acionado automaticamente 
-- após a inserção de novas linhas na tabela mydb.seguidor.

-- FOR EACH ROW: Indica que o corpo do trigger será executado uma vez para 
-- cada linha afetada pela instrução que acionou o trigger.

-- BEGIN ... END;: Define o bloco de código a ser executado quando o trigger é acionado.
-- UPDATE mydb.Pagina: Inicia uma instrução de atualização na tabela mydb.Pagina.
-- SET num_seguidores = COALESCE(num_seguidores + 1, 1): Atualiza o valor da coluna num_seguidores na tabela mydb.Pagina. 
-- A função COALESCE é usada para tratar casos em que num_seguidores é nulo, somando 1 se não for nulo ou atribuindo 1 se for nulo.
-- WHERE id_pagina = NEW.id_pagina;: Restringe a atualização às linhas onde o
-- id_pagina na tabela mydb.Pagina é igual ao id_pagina recém-inserido na tabela mydb.seguidor.

-- DELIMITER //: Restaura o delimitador padrão.


DELIMITER //
CREATE TRIGGER delete_num_seguidores
AFTER DELETE ON mydb.seguidor
FOR EACH ROW
BEGIN
    UPDATE mydb.Pagina
    SET num_seguidores = COALESCE(num_seguidores - 1, 0)
    WHERE id_pagina = OLD.id_pagina;
END;
//
DELIMITER //;
-- Similar ao primeiro trigger, mas é acionado após uma operação de DELETE na tabela mydb.seguidor.

-- SET num_seguidores = COALESCE(num_seguidores - 1, 0): Atualiza a coluna num_seguidores 
-- subtraindo 1, com um valor mínimo de 0.

-- WHERE id_pagina = OLD.id_pagina;: Restringe a atualização às linhas onde 
-- o id_pagina na tabela mydb.Pagina é igual ao id_pagina que foi removido (OLD.id_pagina) da tabela mydb.seguidor.

DELIMITER //
CREATE TRIGGER before_insert_usuario
BEFORE INSERT ON mydb.Usuario
FOR EACH ROW
BEGIN
    SET NEW.senha = MD5(NEW.senha);
END;
//
DELIMITER //;
-- Trigger que criptografa a senha antes de ser inserida no banco de dados

-- Ativa trigger update_num_seguidores
INSERT INTO mydb.seguidor (id_usuario, id_pagina) VALUES(1, 30);

-- Ativa trigger delete_num_seguidores
DELETE FROM mydb.seguidor WHERE id_usuario=1 AND id_pagina=30;

-- Ativa trigger before_insert_usuario
INSERT INTO mydb.Usuario (nome_usuario, nome_do_meio, sobrenome, apelido, email, senha, data_de_nascimento, genero, telefone)
VALUES 
   ('Francisca', 'Isabelly Priscila', 'Figueiredo', 'Fran', 'francisca_isabelly_figueiredo@milimoveis.com.br', 'nCsIKm6kB3', '1992-04-05', 'F', '65926323113');