<?php
	class Comentario extends BD{

		public function insertAction($parameters = array(), $files = array()){
			$pdo = parent::conn();
			$arr = array("status" => "ok", "results" => array());

			$dataquery = $pdo->prepare("INSERT INTO comentarios(id_pessoa, nome, email, telefone, comentario, created_at) VALUES(:id_pessoa, :nome, :email, :telefone, :comentario, NOW())");
			$dataquery->bindParam(":id_pessoa", $parameters['pessoa']);
			$dataquery->bindParam(":nome", $parameters['fullname']);
			$dataquery->bindParam(":email", $parameters['email']);
			$dataquery->bindParam(":telefone", $parameters['telephone']);
			$dataquery->bindParam(":comentario", $parameters['comment']);
			if($dataquery->execute()){
				$select = $pdo->prepare("SELECT id,created_at FROM comentarios WHERE id_pessoa = ? AND nome = ? AND comentario = ?");
				$select->execute(array($parameters['pessoa'], $parameters['fullname'], $parameters['comment']));
				$fetch = $select->fetchObject();
				$arr["results"] = array(
					"id" => $fetch->id,
					"created_at" => date("d/m/Y H:i:s", strtotime($fetch->created_at))
				);
			}else{
				$arr["status"] = "no";
			}

			return $arr;
		}

		public function deleteAction($parameters = array(), $files = array()){
			$pdo = parent::conn();

			$dataquery = $pdo->prepare("DELETE FROM comentarios WHERE id = :id");
			$dataquery->bindParam(":id", $parameters['id']);
			if($dataquery->execute()){
				return true;
			}else{
				return false;
			}
		}

		public function allowAction($parameters = array(), $files = array()){
			$pdo = parent::conn();

			$dataquery = $pdo->prepare("UPDATE comentarios SET status = 1 WHERE id = :id");
			$dataquery->bindParam(":id", $parameters['id']);
			if($dataquery->execute()){
				return true;
			}else{
				return false;
			}
		}

		public function selectAction($parameters = array(), $files = array()){
			$pdo = parent::conn();
			$arr = array("status" => "ok", "results" => array());

			$dataquery = $pdo->prepare("SELECT * FROM comentarios WHERE id_pessoa = :id_pessoa AND status = 1");
			$dataquery->bindParam(":id_pessoa", $parameters['pessoa']);
			$dataquery->execute();
			if($dataquery->rowCount() > 0){
				while($fetch = $dataquery->fetchObject()){
					$arr["results"][] = array(
						"id" => $fetch->id,
						"nome" => $fetch->nome,
						"email" => $fetch->email,
						"telefone" => $fetch->telefone,
						"comentario" => $fetch->comentario,
						"created_at" => date("d/m/Y H:i:s", strtotime($fetch->created_at))
					);
				}
			}else{
				$arr["status"] = "no";
			}

			return $arr;
		}

	}