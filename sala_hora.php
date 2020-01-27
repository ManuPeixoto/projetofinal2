<?php

	$codsala=@$_POST['codsala'];
	$disponivel=@$_POST['disponivel'];
	$codhora=@$_POST['codhora'];
	
	/*$codsala=3;
	$codhora=2;
	$disponivel="nao";*/
	
	$con = mysqli_connect("localhost","root","","bdapp2");
	mysqli_set_charset($con,'utf8');
	
	$sql = "update sala
	set
	disponivel = '$disponivel',
	codhora = '$codhora'
	where codsala = '$codsala'
	";
	
	$result = mysqli_query($con,$sql) or die(mysqli_error()."<hr/>Line: "._LINE_."<br/>$sql");
	
	if($result===true){
		echo "OK_UPDATE";
	}
	
	mysqli_close($con);
?>