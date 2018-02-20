<?php
	require_once "../config.php";
	if(!isset($_SESSION['username'])){
		include "logar.php";
		exit;
	}else{
		$pega_logado = $pdo->prepare("SELECT * FROM usuarios WHERE username = ?");
		$pega_logado->execute(array($_SESSION['username']));
		$logado = $pega_logado->fetchObject();

		if(isset($_GET['sair'])){
			unset($_SESSION['username']);
			session_destroy();
			echo "<script>location.href='".BASE."';</script>";
		}
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<title>SOS Buscas - Administrativo</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/materialize.min.css">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/jquery.dataTables.min.css">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/jcrop.css"/>
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/style.css"/>
	</head>
	<body>
		<nav class='grey darken-4'>
			<a href="#!" class='brand-logo'>SOS Buscas</a>
			<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
			<ul class='right hide-on-med-and-down'>
				<li><a class="modal-trigger" href="#cadastro">Cadastrar Pessoa</a></li>
				<li><a href="?sair">Logout</a></li>
			</ul>
			<ul class="side-nav" id="mobile-demo">
        		<li><a class="modal-trigger" href="#cadastro">Cadastrar Pessoa</a></li>
        		<li><a href="?sair">Logout</a></li>
     		</ul>
		</nav>
		<div id="cadastro" class="modal">
	   		<div class="modal-content">
		      	<h4>Cadastro de pessoas</h4>
		      	<form action="" method="post" enctype="multipart/form-data" id="pessoa">
			      	<div class="row">
			      		<div class="col s12 m12 l12">
			      			<div class="file-field input-field">
	      						<div class="btn grey darken-4">
	        						<span>Imagem</span>
	        						<input type="file" name="imagem" id="imagem">
	      						</div>
	      						<div class="file-path-wrapper">
	        						<input class="file-path validate" placeholder="Escolha uma imagem" type="text">
	      						</div>
	    					</div>
			      		</div>
			      		<div class="col s12 m12 l12 input-field">
			      			<label for="fullname">Nome Completo</label>
			      			<input type="text" name="fullname" id="fullname">
			      		</div>
			      		<div class="col s12 m12 l12 input-field">
			      			<label for="descricao">Descrição</label>
			      			<textarea name="descricao" id="description" class="materialize-textarea"></textarea>
			      		</div>
			      		<div class="col s12 m12 l12 input-field">
			      			<input type="submit" id="register" value="Cadastrar" class='btn grey darken-4 waves-effect'>
			      		</div>
			      	</div>
			    </form>
			    <div id="imagem_crop" style="display:none;">
			    	<div class="img_crop">
			    		<!--<img src="" id="target">-->
			    	</div>
			    	<form action="" method="post" id="corte" enctype="multipart/form-data">
			    		<input type="hidden" id="x" name="x" value="0" class="coord"/>
						<input type="hidden" id="y" name="y" value="0" class="coord"/>
						<input type="hidden" id="w" name="w" value="160" class="coord" />
						<input type="hidden" id="h" name="h" value="160" class="coord"/>
						<input type="hidden" name="img" value=""/>
						<input type="submit" name="crop" value="Cortar Imagem" class="btn grey darken-4 waves-effect" />
			    	</form>
			    </div>
			    <div class="col s12 m12 l12" id="feedback"></div>
		    </div>
	 	</div>