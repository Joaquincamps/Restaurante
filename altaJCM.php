<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Insertar nuevo plato</h1>
    <form action="alJCM.php" method="post">
        <label for="nom">Nombre del Plato</label>
        <input type="text" name="nom" id="nom">
        <label for="cat">Categoria</label>
        <select name="cat" id="cat">
        <?php
        try{
            $conexion = new PDO("mysql:host=localhost;dbname=restaurante;charset=utf8", "root","");
            $sentenciaSelect="SELECT id,nombre FROM categoria";
            $resultado = $conexion->query($sentenciaSelect);
            while ($fila = $resultado-> fetchObject()){ 
            ?>
            <option><?=$fila->nombre?></option>
            <?php
            }
        

        }catch(PDOException $excp){

            die("Fallo en la conexion". $excp->getMessage());

           
        }
        ?>
        </select>
        <br>
        <label for="ing">Ingredientes</label>
        <textarea name="ing" id="ing" cols="30" rows="10"></textarea>
        <br>
        <label for="pr">Precio</label>
        <input type="text" name="pr" id="pr">
        <br>
        <button type="reset">Limpiar</button>
        <button type="submit">Guardar</button>
    </form>
</body>
</html>
