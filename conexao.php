<?php
	$host = "localhost";
	$usuario = "root";
	$senha = "";
	$banco = "bdapp2";
	
	$dbcon = new mysqli("$host","$usuario","$senha","$banco");
	
	if($dbcon->connect_error) {
		echo "conexao_erro";
	}

?>