<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <a href="../index.php">Voltar para a página principal</a>
    <h2>Buscar Usuário por email</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="get">
        <label for="email">Email:</label>
        <input type="text" id="email" name="email">

        <input type="submit" value="Enviar">
    </form>
    <br>

    <?php
        include '../db.php';

        if($_SERVER["REQUEST_METHOD"] == "GET"){
            if(isset($_GET["email"])){

                $email = $_GET["email"];
                
                $sql = "SELECT * FROM Usuario WHERE email = '$email'";

                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "ID: " . $row["id_Usuario"] . " - Nome: " . $row["nome_usuario"] . " - Nome do meio: " . $row["nome_do_meio"] . " - Sobrenome: " . $row["sobrenome"] . " - Apelido: " . $row["apelido"] . " - Email: " . $row["email"] . " - Senha: " . $row["senha"] . " - Data de nascimento: " . $row["data_de_nascimento"] . " - Genero: " . $row["genero"] . " - Telefone: ". $row["telefone"] . "<br>";
                    }
                } else {
                    echo "Nenhum usuário encontrado com o email '" . $email . "'.";
                }
            }
        }
    ?>
</body>
</html>
