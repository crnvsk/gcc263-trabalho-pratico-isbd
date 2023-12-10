<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h3>Deletar usuario</h3>
    <a href="./index.php">Voltar para a página principal</a>
    <br>
</body>
</html>

<?php
    include 'db.php';

    if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET["id"])) {
        $idUsuario = $_GET["id"];

        $sql = "DELETE FROM Usuario WHERE id_Usuario = $idUsuario";

        if ($conn->query($sql) === TRUE) {
            echo "Usuário deletado com sucesso!";
        } else {
            echo "Erro ao deletar usuário: " . $conn->error;
        }
    }

    $conn->close();
?>


