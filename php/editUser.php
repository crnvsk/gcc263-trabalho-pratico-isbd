<?php
    include 'db.php';

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_GET["id"])) {
        $idUsuario = $_GET["id"];
        $nome = $_POST["name"];
        $nomeDoMeio = $_POST["middle_name"];
        $sobrenome = $_POST["last_name"];
        $apelido = $_POST["nickname"];
        $email = $_POST["email"];
        $senha = $_POST["password1"];
        $dataNascimento = $_POST["birth_date"];
        $genero = $_POST["gender"];
        $telefone = $_POST["phone"];
    
        // Query para atualizar os dados do usuário
        $sql = "UPDATE Usuario 
                SET nome_usuario = '$nome', 
                    nome_do_meio = '$nomeDoMeio', 
                    sobrenome = '$sobrenome', 
                    apelido = '$apelido', 
                    email = '$email', 
                    senha = '$senha', 
                    data_de_nascimento = '$dataNascimento', 
                    genero = '$genero', 
                    telefone = '$telefone'
                WHERE id_Usuario = $idUsuario";
    
        if ($conn->query($sql) === TRUE) {
            echo "Usuário atualizado com sucesso!";
        } else {
            echo "Erro ao atualizar usuário: " . $conn->error;
        }
    }

    if (isset($_GET["id"])) {
        $userId = $_GET["id"];

        $sql = "SELECT * FROM Usuario WHERE id_Usuario = $userId";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
        } else {
            echo "Usuário não encontrado.";
        }
    } else {
        echo "ID de usuário não fornecido.";
    }

    $conn->close();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <a href="index.php">Voltar para a página principal</a>
    <h2>Editar Usuário</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"] . "?id=" . $userId); ?>" method="post">
        <label for="name">Nome:</label>
        <input type="text" id="name" name="name" value="<?php echo $user['nome_usuario']; ?>">
        <br>

        <label for="middle_name">Nome do meio:</label>
        <input type="text" id="middle_name" name="middle_name" value="<?php echo $user['nome_do_meio']; ?>">
        <br>

        <label for="last_name">Sobrenome:</label>
        <input type="text" id="last_name" name="last_name" value="<?php echo $user['sobrenome']; ?>">
        <br>

        <label for="nickname">Apelido:</label>
        <input type="text" id="nickname" name="nickname" value="<?php echo $user['apelido']; ?>">
        <br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<?php echo $user['email']; ?>">
        <br>

        <label for="password1">Senha:</label>
        <input type="text" id="password1" name="password1" value="<?php echo $user['senha']; ?>">
        <br>

        <label for="birth_date">Data de nascimento ("yyyy/MM/dd"):</label>
        <input type="text" id="birth_date" name="birth_date" value="<?php echo $user['data_de_nascimento']; ?>">
        <br>

        <label for="gender">Genero (M ou F):</label>
        <input type="text" id="gender" name="gender" value="<?php echo $user['genero']; ?>">
        <br>

        <label for="phone">Telefone(11 números):</label>
        <input type="text" id="phone" name="phone" value="<?php echo $user['telefone']; ?>">
        <br>

        <input type="submit" value="Enviar">
    </form>
    <br>
</body>
</html>
