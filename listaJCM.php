<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Insertar nuevo plato</h1>

        <?php
        try{
            $conexion = new PDO("mysql:host=localhost;dbname=restaurante;charset=utf8", "root","");
            $sentenciaSelect="SELECT nombre,ingredientes,precio FROM plato ORDER BY precio desc";
            $resultado = $conexion->query($sentenciaSelect);
            echo "<h2>Numero de entradas: ". $resultado->rowCount() . "</h2>";
            while($fila = $resultado-> fetchObject()){
                ?>
                <form action="#" method="post">
            <label for="nom">Nombre del Plato</label>
            <input type="text" name="nom" id="nom" value="<?=$fila->nombre?>" readonly>
            <label for="cat">Categoria</label>
            
            <br>
            <label for="ing">Ingredientes</label>
            <textarea name="ing" id="ing" cols="30" rows="10"><?=$fila->ingredientes?></textarea>
            <br>
            <label for="pr">Precio</label>
            <input type="text" name="pr" id="pr" value="<?=$fila->precio?>">
            <br>
            <button type="submit">Borrar</button>
            <button type="submit">Editar</button>
            </form>
            <?php
             }
        }catch(PDOException $excp){

            die("Fallo en la conexion". $excp->getMessage());

           
        }
        ?>
        
</body>
</html>
