<?php
    header("Content-Type: text/html; charset=UTF-8", true);
?>
<html>
<head lang="pt-br">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css" />
    <title>Rede Social</title>
</head>
<body>
    <h1 class="titulo">Rede Social</h1>

    <button><a href="./viewAllUser.php">Ver todos os Usuários</a></button>
    <br>

    <button><a href="./searchs/searchByName.php">Buscar Usuário por nome</a></button>
    <br>

    <button><a href="./searchs/searchByEmail.php">Buscar Usuário por email</a></button>
    <br>

    <button><a href="./searchs/searchByNickname.php">Buscar Usuário por apelido</a></button>
    <br>

    <button><a href="./searchs/searchByGender.php">Buscar Usuários por gênero</a></button>
    <br>

    <button><a href="./insert.php">Inserir Usuário</a></button>
    <br>

    <button><a href="view.php">Editar ou Deletar Usuário</a></button>
    <br>

    <footer>
        <div>Autores: Augusto, Jean, João, Paulo e Vitor</div>
    </footer>


</body>
</html>