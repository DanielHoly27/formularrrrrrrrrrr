<?php

$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "klienti"; 

$conn = new mysqli($servername, $username, $password, $dbname);
// https://www.w3schools.com/php/php_if_else.asp
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['odeslat'])) {
    $jmeno = $conn->real_escape_string($_POST['jmeno']);
    $prijmeni = $conn->real_escape_string($_POST['prijmeni']);
    $email = $conn->real_escape_string($_POST['email']);
    $komentar = $conn->real_escape_string($_POST['komentar']);
// https://stackoverflow.com/questions/23273916/insert-into-statement-with-reserved-word-as-a-column-name
    $sql_insert = "INSERT INTO klienti (jmeno, prijmeni, email, komentar) 
                   VALUES ('$jmeno', '$prijmeni', '$email', '$komentar')";
    $conn->query($sql_insert);
    header("Location: " . $_SERVER['PHP_SELF']);
    exit();
}
?>

<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hodnocení her dejme tomu</title>
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<div class="container">
    <div class="box">
        <h2></h2>
        <form method="post">
            <input type="text" name="jmeno" placeholder="Jméno (Přezdívka) *" required>
            <input type="email" name="email" placeholder="Email *" required>
            <input type="text" name="prijmeni" placeholder="Název hry *" required>
            <textarea name="komentar" placeholder="Text recenze *" rows="3" required></textarea>
            <button type="submit" name="odeslat">Odeslat</button>
        </form>
    </div>

    <h3>Poslední záznamy</h3>

    <?php
    $sql_select = "SELECT * FROM klienti ORDER BY id DESC";
    $result = $conn->query($sql_select);
// https://stackoverflow.com/questions/6538891/php-mysqli-num-rows-always-returns-0
    if ($result && $result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
// https://www.w3schools.com/php/php_echo_print.asp
            echo "<div class='klient-karta'>";
            echo "<strong>" . htmlspecialchars($row["jmeno"]) . " " . htmlspecialchars($row["prijmeni"]) . "</strong>";
            echo "<br><span style='color:#555; font-size:0.9em;'>" . htmlspecialchars($row["email"]) . "</span>";
            echo "<p style='margin: 10px 0;'>" . nl2br(htmlspecialchars($row["komentar"])) . "</p>";
            echo "<div class='meta'>" . date("d.m.Y H:i", strtotime($row["vytvoreno"])) . "</div>";
            echo "</div>";
        }
    } else {
        echo "<p style='text-align:center; color:#888;'>Zatím žádné recenze.</p>";
    }
    $conn->close();
    ?>
</div>

</body>
</html>