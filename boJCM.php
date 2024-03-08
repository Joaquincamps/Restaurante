<?php
try{
$conexion = new PDO("mysql:host=localhost;dbname=restaurante;charset=utf8", "root","");
$id= $_POST['id'];
$nom=$_POST['nom'];

$sentenciaSelect = "SELECT * FROM plato WHERE nombre = '$nom' or id='$id' ";
$resultado = $conexion->query($sentenciaSelect);
if ($resultado ->rowCount() == 0){
  echo "Elemento no registrado";
}else {
    $sentenciaDelete="DELETE FROM plato where nombre=? or id=?";
    $stmt=$conexion->prepare($sentenciaDelete);
    $stmt->execute(array($nom,$id));
    echo "Plato borrado". "<br>";
    header("Location: indexJCM.php");
}

}
catch(PDOException $excp){

    die("Fallo en la conexion". $excp->getMessage());

   
}
?>