<?php

	include_once 'conexao.php';
	
	$con = mysqli_connect("localhost","root","","bdapp2");
	mysqli_set_charset($con,'utf8');
	
	$codhora = ($_POST['codhora']);
	$horario=($_POST['horario']);
	
	$query = "SELECT codhora FROM tempo where horario='$horario'" or die(mysql_error());
	$resultado = mysqli_query($con,$query);
	$linha = mysqli_fetch_array($resultado);
	$codhora=$linha['codhora'];
	echo $codhora;

	mysqli_close($con);

?>