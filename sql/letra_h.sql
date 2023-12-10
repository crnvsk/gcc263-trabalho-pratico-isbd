CREATE USER 'usuario1'@'%' IDENTIFIED BY 'senha1';
CREATE USER 'usuario2'@'%' IDENTIFIED BY 'senha2';
-- Cria um novo usuário.
-- Especifica o nome do usuário (usuario1 e usuario2) e o host de onde esse usuário pode se conectar 
-- ('%' significa qualquer host, permitindo conexões de qualquer lugar).
-- IDENTIFIED BY 'senha1' e IDENTIFIED BY 'senha2': Define a senha para cada usuário.

GRANT SELECT, INSERT ON mydb.* TO 'usuario1'@'%' WITH GRANT OPTION;
GRANT SELECT ON mydb.* TO 'usuario2'@'%' WITH GRANT OPTION;
-- GRANT SELECT, INSERT ON mydb.*: Concede permissões de SELECT e INSERT no banco de dados chamado mydb.
-- TO 'usuario1'@'%' e TO 'usuario2'@'%': Especifica para qual usuário e host as permissões estão sendo concedidas.
-- WITH GRANT OPTION: Permite que o usuário1, ao qual foi concedida a permissão SELECT e INSERT, também conceda essas permissões a outros usuários.

REVOKE INSERT ON mydb.* FROM 'usuario1'@'%';
REVOKE SELECT ON mydb.* FROM 'usuario2'@'%';
-- REVOKE INSERT ON mydb.*: Revoga a permissão de INSERT no banco de dados mydb.
-- FROM 'usuario1'@'%' e FROM 'usuario2'@'%': Especifica de qual usuário e host as permissões estão sendo revogadas.
