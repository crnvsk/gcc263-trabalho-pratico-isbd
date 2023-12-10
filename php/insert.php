<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <a href="index.php">Voltar para a página principal</a>
    <h2>Inserir Usuário</h2>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="name">Nome:</label>
        <input type="text" id="name" name="name">
        <br>

        <label for="middle_name">Nome do meio:</label>
        <input type="text" id="middle_name" name="middle_name">
        <br>

        <label for="last_name">Sobrenome:</label>
        <input type="text" id="last_name" name="last_name">
        <br>

        <label for="nickname">Apelido:</label>
        <input type="text" id="nickname" name="nickname">
        <br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email">
        <br>

        <label for="password1">Senha:</label>
        <input type="text" id="password1" name="password1">
        <br>

        <label for="birth_date">Data de nascimento ("yyyy/MM/dd"):</label>
        <input type="text" id="birth_date" name="birth_date">
        <br>

        <label for="gender">Genero (M ou F):</label>
        <input type="text" id="gender" name="gender">
        <br>

        <label for="phone">Telefone(11 números):</label>
        <input type="text" id="phone" name="phone">
        <br>

        <input type="submit" value="Enviar">
    </form>
    <br>

    <?php
        include 'db.php';

        if($_SERVER["REQUEST_METHOD"] == "POST"){
            $name = $_POST["name"];
            $middleName = $_POST["middle_name"];
            $lastName = $_POST["last_name"];
            $nickname = $_POST["nickname"];
            $email = $_POST["email"];
            $password1 = $_POST["password1"];
            $birthDate = $_POST["birth_date"];
            $gender = $_POST["gender"];
            $phone = $_POST["phone"];

            $sql = "INSERT INTO `mydb`.`Usuario` (`nome_usuario`, `nome_do_meio`, `sobrenome`, `apelido`, `email`, `senha`, `data_de_nascimento`, `genero`, `telefone`) VALUES 
            ('$name', '$middleName', '$lastName', '$nickname', '$email', '$password1', '$birthDate', '$gender', '$phone')";

            if ($conn->query($sql) === TRUE) {
                echo "Usuário inserido com sucesso!";
            } else {
                echo "Erro ao inserir usuário: " . $conn->error;
            }
        }
    ?>
</body>
</html>

