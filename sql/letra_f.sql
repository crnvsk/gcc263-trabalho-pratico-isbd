-- Consulta Simples:
-- Esta consulta recupera os nomes de usuários e seus e-mails da tabela Usuario.

SELECT nome_usuario, email
FROM Usuario;

-- Consulta com WHERE:
-- Recupera todas as postagens que têm mais de 70 curtidas.

SELECT *
FROM Postagem
WHERE num_curtidas > 70;

-- Consulta com JOIN:
-- Recupera o título da postagem e o nome do usuário correspondente usando a cláusula JOIN.

SELECT Postagem.titulo_postagem, Usuario.nome_usuario
FROM Postagem
INNER JOIN Usuario ON Postagem.id_Usuario = Usuario.id_Usuario;

-- Consulta com GROUP BY e HAVING:
-- Retorna o número total de postagens por página, apenas para aquelas que têm 2 ou mais postagens.

SELECT id_pagina, COUNT(id_postagem) AS total_postagens
FROM Postagem
GROUP BY id_pagina
HAVING total_postagens >= 2;

-- Consulta com ORDER BY:
-- Recupera todas as postagens ordenadas pela data e hora em ordem decrescente.

SELECT *
FROM Postagem
ORDER BY data_e_hora DESC;

-- Consulta com LIKE:
-- Recupera usuários cujos nomes começam com "Jo".

SELECT *
FROM Usuario
WHERE nome_usuario LIKE 'Jo%';

-- Consulta com IN:
-- Recupera postagens feitas pelos usuários com IDs 11, 12 ou 13.

SELECT *
FROM Postagem
WHERE id_Usuario IN (11, 12, 13);

-- Consulta com NOT:
-- Recupera usuários que não têm o gênero masculino.

SELECT *
FROM Usuario
WHERE genero NOT LIKE 'M';

-- Consulta com EXISTS:
-- Recupera usuários que têm pelo menos um amigo.

SELECT *
FROM Usuario u
WHERE EXISTS (
    SELECT 1
    FROM pedido_de_amizade a
    WHERE a.id_Usuario_solicitante = u.id_Usuario
);

-- Consulta com UNION:
-- Retorna os nomes dos usuarios que começam com "Jo" ou com "Ca"

SELECT nome_usuario
FROM Usuario
WHERE nome_usuario LIKE 'Jo%'

UNION

SELECT nome_usuario
FROM Usuario
WHERE nome_usuario LIKE "Ca%";

-- Consulta com Subconsulta:
-- Recupera os nomes de usuários que tiveram pedidos de amizade aceitos.

SELECT nome_usuario
FROM Usuario
WHERE id_Usuario IN (
    SELECT id_Usuario_solicitante
    FROM pedido_de_amizade
    WHERE foi_aceito = 1
);

-- Consulta com JOIN e ORDER BY:
-- Recupera o nome do usuário e o total de postagens feitas por cada usuário, ordenados pelo número de postagens em ordem decrescente.

SELECT Usuario.nome_usuario, COUNT(Postagem.id_postagem) AS total_postagens
FROM Usuario
LEFT JOIN Postagem ON Usuario.id_Usuario = Postagem.id_Usuario
GROUP BY Usuario.nome_usuario
ORDER BY total_postagens DESC;

-- Consulta com AND e OR:
-- Recupera postagens com menos de 70 curtidas e localização definida OU postagens com título nulo.

SELECT *
FROM Postagem
WHERE (num_curtidas < 70 AND localizacao IS NOT NULL)
   OR titulo_postagem IS NULL;

-- Consulta com BETWEEN:
-- Recupera postagens feitas entre duas datas específicas.

SELECT *
FROM Postagem
WHERE data_e_hora BETWEEN '2023-01-01' AND '2023-12-31';

-- Consulta com IS NULL:
-- Recupera páginas sem descrição definida.

SELECT *
FROM Pagina
WHERE descricao_pagina IS NULL;

-- Consulta com ANY/SOME:
-- Recupera postagens com mais curtidas do que a postagem com o ID 1.

SELECT *
FROM Postagem
WHERE num_curtidas > ANY (SELECT num_curtidas FROM Postagem WHERE id_postagem = 1);

-- Consulta com ALL:
-- Recupera a postagem com o maior número de curtidas.

SELECT *
FROM Postagem
WHERE num_curtidas >= ALL (
    SELECT num_curtidas
    FROM Postagem
    WHERE num_curtidas IS NOT NULL
);

-- Consulta com EXISTS e Subconsulta:
-- Recupera usuários que têm pelo menos um cargo associado.

SELECT *
FROM Usuario u
WHERE EXISTS (
    SELECT 1
    FROM permissao p
    WHERE p.id_Usuario = u.id_Usuario
);

-- Consulta com JOIN, ORDER BY e LIMIT:
-- Recupera os nomes dos usuários e a contagem de postagens que eles fizeram, ordenados pela contagem em ordem decrescente e limitados a 5 resultados.

SELECT Usuario.nome_usuario, COUNT(Postagem.id_postagem) AS total_postagens
FROM Usuario
LEFT JOIN Postagem ON Usuario.id_Usuario = Postagem.id_Usuario
GROUP BY Usuario.nome_usuario
ORDER BY total_postagens DESC
LIMIT 5;

