<?php

	include_once 'conexao.php';
	
	$con = mysqli_connect("localhost","root","","bdapp2");
	mysqli_set_charset($con,'utf8');
	
	$codturma=($_POST['codturma']);
	$codhora=($_POST['codhora']);
	
	$query = "SELECT codreserva FROM reserva where codturma='$codturma' AND codhora='$codhora'" or die(mysql_error());
	$resultado = mysqli_query($con,$query);
	$linha = mysqli_fetch_array($resultado);
	$codreserva=$linha['codreserva'];
	echo $codreserva;

	mysqli_close($con);
	
?>