<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Mostrar uno</h1>

        <?php
        try{
            $conexion = new PDO("mysql:host=localhost;dbname=restaurante;charset=utf8", "root","");
            $id= $_POST['id']; 
            $nom=$_POST['nom'];
            $sentenciaSelect="SELECT id,nombre,ingredientes,precio FROM plato WHERE id ='$id' or nombre='$nom'";
            $resultado = $conexion->query($sentenciaSelect);
            $fila = $resultado-> fetchObject();
            $ingredientes=$fila->ingredientes;
            $precio=$fila->precio;
       echo "<a href='indexJCM.php?id=" .$fila->id ."'>Volver inicio</a>";
           echo "<br>";
           echo "<a href='actualizarJCM.php?id=" .$fila->id ."'>Editar</a>";

            ?>
            <form action="#" method="post">
        <label for="nom">Nombre del Plato</label>
        <input type="text" name="nom" id="nom" value="<?=$fila->nombre?>" readonly>
        <label for="cat">Categoria</label>
        <select name="cat" id="cat">
            <?php
        $sentenciaSelect="SELECT nombre FROM categoria where id='$id'";
            $resultado = $conexion->query($sentenciaSelect);
            $fila = $resultado-> fetchObject() 
            ?>
            <option><?=$fila->nombre?></option>
        </select>
        <br>
        <label for="ing">Ingredientes</label>
        <textarea name="ing" id="ing" cols="30" rows="10"><?=$ingredientes?></textarea>
        <br>
        <label for="pr">Precio</label>
        <input type="text" name="pr" id="pr" value="<?=$precio?>">
        <br>
        
        <button type="submit">Borrar</button>
        <button type="submit">Editar</button>
        </form>
            <?php
        }catch(PDOException $excp){

            die("Fallo en la conexion". $excp->getMessage());

           
        }
        ?>
        
</body>
</html>
