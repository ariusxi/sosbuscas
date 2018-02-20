<?php require_once "config.php"; ?>
<!DOCTYPE html>
<html>
	<head>
		<title>SOS Buscas - Ajude-nos a encontrar nossas crianças</title>
		<meta charset="utf-8">
		<meta title="author" description="Alef Felix de Farias"/>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/materialize.min.css">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/style.css">
		<style type="text/css">
			.card .card-content{
				height:200px;
			}
		</style>
	</head>
	<body>
		<div class="modal-back">
			<div class="person-content">
				<a href="#!" class="close"><i class="material-icons">close</i></a>
				<div class="person-details">
					<h5></h5>
					<p>
						
					</p>
				</div>
				<div class="person-image">
				</div>
			</div>
			<div class="fixed-bottom">
				<p>
					<a href="#!" class='view-comment'>Você viu essa pessoa?</a><br>
					<div id="form-comment" style='display:none;'>
						<div class="row">
							<div class="col s12 m4 l4 input-field">
								<label for="fullname">Nome Completo</label>
								<input type="text" name="fullname" id="fullname">
							</div>
							<div class="col s12 m4 l4 input-field">
								<label for="email">E-mail</label>
								<input type="text" name="email" id="email">
							</div>
							<div class="col s12 m4 l4 input-field">
								<label for="telephone">Telefone para Contato</label>
								<input type="text" name="telephone" id="telephone">
							</div>
							<div class="col s12 m12 l12 input-field">
								<label for="comment">Comentário</label>
								<input type="text" name="comment" id="comment">
							</div>
							<div class="col s12 m12 l12">
								<input type="hidden" name="pessoa" id="pessoa">
								<input type="submit" class="btn grey darken-4 waves effect send-comment">
							</div>
						</div>
					</div>
					<div class="col s12 m12 l12" id="feedback"></div>
					<input type="hidden" name="c" id="c"/>
					<div id="comments"></div>
				</p>
			</div>
		</div>
		<nav class='grey darken-4'>
			<div class="nav-wrapper">
				<a href="#!" class="brand-logo">SOS Buscas</a>
				<a href="#" data-activates="mobile-demo" class="button-collapse">
					<i class="material-icons">menu</i>
				</a>
				<ul class="right hide-on-med-and-down">
					<li><a href="<?= BASE; ?>home">Home</a></li>
					<li><a href="<?= BASE; ?>contato">Contato</a></li>
					<li><a href="<?= BASE; ?>quemsomos">Quem Somos</a></li>
				</ul>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="<?= BASE; ?>home">Home</a></li>
					<li><a href="<?= BASE; ?>contato">Contato</a></li>
					<li><a href="<?= BASE; ?>quemsomos">Quem Somos</a></li>
				</ul>
			</div>
		</nav>
		<div id="visualiza-pessoa" class="modal bottom-sheet">
			<div class="modal-content">
			</div>
		</div>
		
