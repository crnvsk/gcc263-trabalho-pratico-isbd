-- 1
-- Este procedimento verifica se existem paginas populares, ou seja, com mais de 100 seguidores.
DELIMITER //

CREATE PROCEDURE VerificarPaginasPopulares()
BEGIN
    DECLARE num_paginas_populares INT;

    SELECT COUNT(*) INTO num_paginas_populares
    FROM Pagina
    WHERE num_seguidores > 100;

    IF num_paginas_populares > 0 THEN
        SELECT 'Existem páginas populares.' AS Mensagem;
    ELSE
        SELECT 'Não há páginas populares.' AS Mensagem;
    END IF;
END //

DELIMITER ;

CALL VerificarPaginasPopulares();


-- 2
-- Este procedimento retorna o nome do cargo de um usuário com base no ID do usuário fornecido.

DELIMITER //

CREATE PROCEDURE ObterNomeCargoUsuario(IN usuario_id INT, OUT nome_cargo VARCHAR(50))
BEGIN
    SELECT 
        CASE
            WHEN C.nome_cargo IS NOT NULL THEN C.nome_cargo
            ELSE 'Cargo não encontrado'
        END INTO nome_cargo
    FROM Usuario U
    LEFT JOIN Administrador A ON U.id_Usuario = A.id_Usuario
    LEFT JOIN permissao P ON U.id_Usuario = P.id_Usuario
    LEFT JOIN Cargo C ON P.id_cargo = C.id_cargo
    WHERE U.id_Usuario = usuario_id;
END //

DELIMITER ;

SET @nome_cargo_resultado := '';
CALL ObterNomeCargoUsuario(1, @nome_cargo_resultado);
SELECT @nome_cargo_resultado AS NomeCargoUsuario;

-- 3
-- Este exemplo é um procedimento que atualiza o número de seguidores de todas as páginas, aumentando-os em 10%.

DELIMITER //

CREATE PROCEDURE AtualizarSeguidores()
BEGIN
    DECLARE pagina_id INT;
    DECLARE num_seguidores_atual INT;
    DECLARE num_seguidores_novo INT;

    -- Cursor para obter todas as páginas
    DECLARE cur CURSOR FOR SELECT id_pagina, num_seguidores FROM Pagina;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET pagina_id = NULL;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO pagina_id, num_seguidores_atual;
        IF pagina_id IS NULL THEN
            LEAVE read_loop;
        END IF;

        -- Lógica de atualização
        SET num_seguidores_novo = ROUND(num_seguidores_atual * 1.1);
        UPDATE Pagina SET num_seguidores = num_seguidores_novo WHERE id_pagina = pagina_id;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL AtualizarSeguidores();

-- apagar
DROP PROCEDURE IF EXISTS VerificarPaginasPopulares;
DROP PROCEDURE IF EXISTS ObterNomeCargoUsuario;
DROP PROCEDURE IF EXISTS AtualizarSeguidores;

