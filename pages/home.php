<div class="parallax-container">
    <div class="parallax"><img src="<?= BASE; ?>img/1.jpg"></div>
    <div class="overlay">
    	<h2>SOS Buscas</h2>
    	<p>Ajude-nos a encontrar nossas crianças</p>
    </div>
</div>
<div class="container">
	<div class="row">
		<div class="col s12 m12 l12">
			<h3>Pessoas Desaparecidas</h3>
		</div>
		<div class="col s12 m12 l12">
			<input type="text" name="search" id="search" placeholder="Procure uma pessoa..."/>
		</div>
	</div>
</div>
<div class="container" id="persons">
	<div class="row">
		<?php
			$dataquery = $pdo->prepare("SELECT * FROM pessoas ORDER BY RAND()");
			$dataquery->execute();
			$i = 1;
			while($fetch = $dataquery->fetchObject()){
				if($i == 5){
					echo "</div><div class='row'>";
					$i = 1;
				}
		?>
		<div class="col s12 m3 l3">
			<div class="card">
				<div class="card-image">
					<img src="<?= BASE.'img/uploads/'.$fetch->foto; ?>" title="<?= $fetch->descricao; ?>">
					<a class="btn-floating halfway-fab waves-effect waves-light black view-pessoa" id="<?= $fetch->id; ?>">
						<i class="material-icons">visibility</i>
					</a>
				</div>
				<div class="card-content" style="position:relative;">
					<span class='title-person'>
						<h6><a href="#!"><?= $fetch->nome; ?></a></h6>
						<?php if($fetch->found == 1){ echo "(Encontrado)"; } ?>
					</span>
					<p>
						<?php 
							if(strlen($fetch->descricao) > 60){
								echo substr($fetch->descricao, 0, 60)."...";
							}else{
								echo $fetch->descricao;
							}
						?>
					</p>
				</div>
			</div>
		</div>
		<?php 
			$i++;
			}
		?>
	</div>
</div>