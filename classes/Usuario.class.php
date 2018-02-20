<?php
	class Usuario extends BD{

		public function loginAction($parameters = array(), $files = array()){
			$pdo = parent::conn();

			$dataquery = $pdo->prepare("SELECT id,fullname FROM usuarios WHERE username = :username AND password = :password");
			$dataquery->bindParam(":username", $parameters['username']);
			$dataquery->bindParam(":password", $parameters['password']);
			$dataquery->execute();
			if($dataquery->rowCount() > 0){
				$fetch = $dataquery->fetchObject();
				$_SESSION['id_user'] = $fetch->id;
				$_SESSION['fullname'] = $fetch->fullname;
				$_SESSION['username'] = $parameters['username'];
				return true;
			}else{
				return false;
			}
		}

	}