<div class="container">
	<div class="row">
		<form action="" id="contato" method="post" enctype="multipart/form-data">
			<div class="col s12 m12 l12">
				<h3>Contato</h3>
			</div>
			<div class="col s12 m12 l12 input-field">
				<input id="fullname" type="text" class="validate">
      			<label for="fullname">Nome Completo:</label>
			</div>
			<div class="col s12 m12 l12 input-field">
				<input type="email" id="email" class="validate">
				<label for="email">E-mail:</label>
			</div>
			<div class="col s12 m12 l12 input-field">
				<textarea id="mensagem" class="materialize-textarea"></textarea>
				<label for="mensagem">Mensagem:</label>
			</div>
			<div class="col s12 m12 l12" id="feedback"></div>
			<div class="col s12 m12 l12 input-field">
				<input type="submit" name="send" class="btn grey darken-4 waves-effect white-text">
			</div>
		</form>
	</div>
</div>