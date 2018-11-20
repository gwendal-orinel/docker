<?php
$bdd_host=getenv('BDD_HOST');
$bdd_username=getenv('BDD_USER');
$bdd_password=getenv('BDD_PASS');

try{
	$connexion=new PDO("mysql:host=".$bdd_host.";dbname=CTF",$bdd_username,$bdd_password);
	$connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$connexion -> exec("SET CHARACTER SET utf8");
}
catch(Exception $e)
     {
	    echo '-- Error: Connection database lost or incorrect settings --';
     }
?>
