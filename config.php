<?php
	session_start();
	define("BASE", "http://sosbuscas.local/");
	$pdo = new PDO('mysql:host=localhost;dbname=sos','root','toor');
	$pdo->exec('set names utf8');
?>