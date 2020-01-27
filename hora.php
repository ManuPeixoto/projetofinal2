<?php

	include_once 'conexao.php';
	
	$con = mysqli_connect("localhost","root","","bdapp2");
	mysqli_set_charset($con,'utf8');
	
	$codhora=($_POST['codhora']);
	
	$query = "SELECT horario FROM tempo where codhora='$codhora'" or die(mysql_error());
	$resultado = mysqli_query($con,$query);
	$linha = mysqli_fetch_array($resultado);
	$horario=$linha['horario'];
	echo $horario;

	mysqli_close($con);
	
?>