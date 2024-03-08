<?php

  try{
    $conexion = new PDO("mysql:host=localhost;dbname=restaurante;charset=utf8", "root","");
    $nom=$_POST['nom'];
    $cat=$_POST['cat'];
    $ing=$_POST['ing'];
    $pr=$_POST['pr'];

    $sentenciaSelect = "SELECT * FROM plato WHERE nombre = '$nom'";
    $resultado = $conexion->query($sentenciaSelect);
    if ($resultado ->rowCount() ==0){
      echo "Elemento no registrado";
    }else{
      $sentenciaSelect="SELECT id FROM categoria where nombre='$cat'";
      $resultado = $conexion->query($sentenciaSelect);
      $fila = $resultado-> fetchObject();
      $idc =$fila->id;


      $sentenciaInsert="INSERT INTO plato (nombre,categoria_id,ingredientes,precio) VALUES (?,?,?,?)";
      $stmt=$conexion->prepare($sentenciaInsert);
      $stmt->execute(array($nom,$idc,$ing,$pr));
      echo "<script>alert('Plato insertado')</script>";
      header("Location: indexJCM.php");
    }


 
  }catch(PDOException $excp){

      die("Fallo en la conexion". $excp->getMessage());

     
  }
  
?>