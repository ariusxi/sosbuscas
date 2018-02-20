<!DOCTYPE html>
<html>
	<head>
		<title>Login - Admin SOS Buscas</title>
		<meta name="viewport" content="width=device-width, user-scalable=no">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/materialize.min.css">
		<link rel="stylesheet" type="text/css" href="<?= BASE; ?>css/style.css">
		<style type="text/css">
			body{
				display: flex;
				min-height: 100vh;
				flex-direction: column;
			}
			main{
				flex: 1 0 auto;
			}
			input{
				color: #fff;
			}
		</style>
	</head>
	<body class='grey darken-4'>
		<div class="section"></div>
		<main>
			<center>
				<form action="" id="login" method="POST" enctype="multipart/form-data">
					<div class="section"></div>
					<h4 class="white-text">Por favor entre com seu login e senha</h4>
					<div class="section"></div>
					<div class="container">
						<div class="z-depth-1 grey-lighten-4 row" style="display:inline-block; padding: 32px 48px 0px 48px; border:1px solid #EEE;">
							<form class="col s12" method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="input-field col s12">
										<input type="text" name="username" id="username" class="validate">
										<label for="username">Digite seu login</label>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s12">
										<input type="password" name="password" id="password" class="validate">
										<label for="password">Digite sua senha</label>
									</div>
								</div>
								<div class="row">
									<div class="col s12" id="feedback"></div>
								</div>
								<br />
								<center>
									<div class="row">
										<button type="submit" name="btn_login" class="col s12 btn-large waves-effect grey">Login</button>
									</div>
								</center>
							</form>
						</div>
					</div>
				</form>
			</center>
			<div class="section"></div>
    		<div class="section"></div>
		</main>

		<script type="text/javascript" src="<?= BASE; ?>js/jquery.min.js"></script>
		<script type="text/javascript" src="<?= BASE; ?>js/materialize.js"></script>
		<script type="text/javascript" src="<?= BASE; ?>js/functions.js"></script>
		<script type="text/javascript" src="<?= BASE; ?>js/script.js"></script>
	</body>
</html>