<?php

	include_once 'conexao.php';
	
	$con = mysqli_connect("localhost","root","","bdapp2");
	mysqli_set_charset($con,'utf8');
	
	$codprof=($_POST['codprof']);
	
	$query = "SELECT nome FROM professor where codprof='$codprof'" or die(mysql_error());
	$resultado = mysqli_query($con,$query);
	$linha = mysqli_fetch_array($resultado);
	$nome=$linha['nome'];
	echo $nome;

	mysqli_close($con);

?>