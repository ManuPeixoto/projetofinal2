<?php

	include_once 'conexao.php';
	
	$con = mysqli_connect("localhost","root","","bdapp2");
	mysqli_set_charset($con,'utf8');
	
	$codreserva=($_POST['codreserva']);
	
	$query = "SELECT codsala FROM reserva where codreserva='$codreserva'" or die(mysql_error());
	$resultado = mysqli_query($con,$query);
	$linha = mysqli_fetch_array($resultado);
	$codsala=$linha['codsala'];
	echo $codsala;

	mysqli_close($con);
	
?>