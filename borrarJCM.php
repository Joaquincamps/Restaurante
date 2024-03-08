<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Seleccionar plato</h1>
    <form action="boJCM.php" method="post" onclick="return confirm('¿Estás seguro de que quieres eliminarlo')">
    <input type="text" name="id" id="id" placeholder="Introduce el identificador">
    <input type="text" name="nom" id="nom" placeholder="Introduce el nombre">
    <br>
    <button type="submit">Seleccionar</button>
    </form>
</body>
</html>