-- 1
-- Criação da View
CREATE VIEW vw_Usuarios_Postagens AS
SELECT Usuario.nome_usuario, Postagem.titulo_postagem
FROM Usuario
INNER JOIN Postagem ON Usuario.id_Usuario = Postagem.id_Usuario;

-- Utilização da View
-- Retorna os usuários e títulos de suas postagens
SELECT * FROM vw_Usuarios_Postagens;

-- 2
-- Criação da View
CREATE VIEW vw_Postagens_Mais_Curtidas AS
SELECT id_postagem, titulo_postagem, num_curtidas
FROM Postagem
ORDER BY num_curtidas DESC;

-- Utilização da View
-- Retorna as postagens com mais curtidas
SELECT * FROM vw_Postagens_Mais_Curtidas;

-- 3
-- Criação da View
CREATE VIEW vw_Amigos_Usuario AS
SELECT u.nome_usuario AS usuario, a.nome_usuario AS amigo
FROM Usuario u
JOIN pedido_de_amizade p ON u.id_Usuario = p.id_Usuario_solicitante
JOIN Usuario a ON p.id_Usuario_solicitado = a.id_Usuario
WHERE p.foi_aceito = 1;

-- Utilização da View
-- Retorna os amigos de um usuário específico
SELECT * FROM vw_Amigos_Usuario WHERE usuario = 'Carlos';


-- apagar as views
DROP VIEW IF EXISTS vw_Usuarios_Postagens;
DROP VIEW IF EXISTS vw_Postagens_Mais_Curtidas;
DROP VIEW IF EXISTS vw_Amigos_Usuario;

