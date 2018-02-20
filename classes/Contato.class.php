<?php
	class Contato extends BD{

		public function insertAction($parameters = array(), $files = array()){
			$pdo = parent::conn();

			$dataquery = $pdo->prepare("INSERT INTO contato(fullname, email, mensagem, created_at) VALUES(:fullname, :email, :mensagem, NOW())");
			$dataquery->bindParam(":fullname", $parameters['fullname']);
			$dataquery->bindParam(":email", $parameters['email']);
			$dataquery->bindParam(":mensagem", $parameters['mensagem']);
			if($dataquery->execute()){
				return true;
			}else{
				return false;
			}
		}

	}