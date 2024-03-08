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
            $id= $_POST['id']; 
            $nom=$_POST['nom'];
            $sentenciaSelect="SELECT nombre,ingredientes,precio FROM plato WHERE id ='$id' or nombre='$nom'";
            $resultado = $conexion->query($sentenciaSelect);
            $fila = $resultado-> fetchObject()

            ?>
            <form action="acJCM.php" method="post">
        <label for="nom">Nombre del Plato</label>
        <input type="text" name="nom" id="nom" readonly value="<?=$fila->nombre?>">
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
        <textarea name="ing" id="ing" cols="30" rows="10"></textarea>
        <br>
        <label for="pr">Precio</label>
        <input type="text" name="pr" id="pr">
        <br>
        <button type="submit">Seleccionar</button>
        </form>
            <?php
        }catch(PDOException $excp){

            die("Fallo en la conexion". $excp->getMessage());

           
        }
        ?>
        
</body>
</html>
