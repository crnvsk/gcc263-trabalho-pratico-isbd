<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <a href="index.php">Voltar para a página principal</a>
    <h2>Lista de Usuários</h2>

    <?php
        include 'db.php';

        $sql = "SELECT * FROM Usuario";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table border='1'>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Nome do meio</th>
                        <th>Sobrenome</th>
                        <th>Apelido</th>
                        <th>Email</th>
                        <th>Senha</th>
                        <th>Data de nascimento</th>
                        <th>Genero</th>
                        <th>Telefone</th>
                    </tr>";

            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                        <td>" . $row["id_Usuario"] . "</td>
                        <td>" . $row["nome_usuario"] . "</td>
                        <td>" . $row["nome_do_meio"] . "</td>
                        <td>" . $row["sobrenome"] . "</td>
                        <td>" . $row["apelido"] . "</td>
                        <td>" . $row["email"] . "</td>
                        <td>" . $row["senha"] . "</td>
                        <td>" . $row["data_de_nascimento"] . "</td>
                        <td>" . $row["genero"] . "</td>
                        <td>" . $row["telefone"] . "</td>
                      </tr>";
            }

            echo "</table>";
        } else {
            echo "Nenhum usuário encontrado.";
        }

        $conn->close();
    ?>
</body>
</html>
