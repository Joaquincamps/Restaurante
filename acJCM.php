<?php
try{
$conexion = new PDO("mysql:host=localhost;dbname=restaurante;charset=utf8", "root","");
$nom=$_POST['nom'];
$ing=$_POST['ing'];
$pr=$_POST['pr'];

$sentenciaSelect = "SELECT * FROM plato WHERE nombre = '$nom'  ";
$resultado = $conexion->query($sentenciaSelect);
if ($resultado ->rowCount() == 0){
  echo "Elemento no registrado";
}else {
 
    $sentenciaUpdate="UPDATE plato SET ingredientes=?,precio=? where nombre=?";
    $stmt=$conexion->prepare($sentenciaUpdate);
    $stmt->execute(array($ing,$pr,$nom));
    echo "<script>alert('Plato actualizado')</script>";
    header("Location: indexJCM.php");
}

}
catch(PDOException $excp){

    die("Fallo en la conexion". $excp->getMessage());

   
}
?>