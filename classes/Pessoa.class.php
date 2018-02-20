<?php
	class Pessoa extends BD{

		public function cutAction($parameters = array(), $files = array()){
			$pdo = parent::conn();

			if(isset($_SESSION['temp_img']) && $_SESSION['temp_img'] != ""){
				unlink('../img/uploads/'.$_SESSION['temp_img']);
				unset($_SESSION['temp_img']);
			}

			include_once "../inc/lib/WideImage.php";
			$tamanhos = getimagesize($files['imagem']['tmp_name']);
			$code = uniqid(rand(), true);
			/*if($tamanhos[0] < 500){
				return 'size';
			}else{*/
			$wide = WideImage::load($files['imagem']['tmp_name']);
			$resized = $wide->resize(500);
			$resize = $resized->saveToFile("../img/uploads/temp_".$code.".jpg");
			if(is_object($resized)){
				$_SESSION['temp_img'] = 'temp_'.$code.".jpg";

				return $_SESSION['temp_img'];
			}else{
				return false;
			}
			/*}*/
		}

		public function insertAction($parameters = array(), $files = array()){
			$pdo = parent::conn();
			$arr = array("status" => "ok", "results" => array());

			include_once "../lib/crop.php";

			$x = (int)$parameters['x'];
			$y = (int)$parameters['y'];
			$w = (int)$parameters['w'];
			$h = (int)$parameters['h'];
			$img = $parameters['img'];
			$parameters['descricao'] = str_replace(":",": ", $parameters['descricao']);

			$crop = crop($img, $x, $y, $w, $h);
			if($crop){
				$dataquery = $pdo->prepare("INSERT INTO pessoas(found, foto, nome, descricao, created_at) VALUES(0, :foto, :nome, :descricao, NOW())");
				$dataquery->bindParam(":foto", $crop);
				$dataquery->bindParam(":nome", $parameters['fullname']);
				$dataquery->bindParam(":descricao", $parameters['descricao']);
				if($dataquery->execute()){
					$select = $pdo->prepare("SELECT id,created_at FROM pessoas WHERE nome = ? AND descricao = ? AND foto = ?");
					$select->execute(array($parameters['fullname'], $parameters['descricao'], $crop));
					$fetch = $select->fetchObject();
					$arr["results"] = array(
						"id" => $fetch->id,
						"created_at" => date("d/m/Y H:i:s", strtotime($fetch->created_at))
					);
					unset($_SESSION['temp_img']);
				}else{
					$arr['status'] = false;
				}
			}else{
				$arr['status'] = 'crop';
			}

			return $arr;
		}

		public function editAction($parameters = array(), $files = array()){
		    $pdo = parent::conn();

		    $dataquery = $pdo->prepare("UPDATE pessoas SET ".$parameters['type']." = :".$parameters['type']." WHERE id = :id");
		    $dataquery->bindParam(":".$parameters['type']."", $parameters['value']);
		    $dataquery->bindParam(":id", $parameters['pessoa']);
		    if($dataquery->execute()){
		        return true;
            }else{
		        return false;
            }
        }

		public function selectAction($parameters = array(), $files = array()){
			$pdo = parent::conn();
			$arr = array("status" => "ok", "results" => array());

			$dataquery = $pdo->prepare("SELECT * FROM pessoas");
			$dataquery->execute();
			if($dataquery->rowCount() > 0){
				while($fetch = $dataquery->fetchObject()){
					$arr["results"][] = array(
						"id" => $fetch->id,
						"found" => $fetch->found,
						"nome" => $fetch->nome,
						"created_at" => date("d/m/Y H:i:s", strtotime($fetch->created_at))
					);
				}
			}else{
				$arr["status"] = "no";
			}

			return $arr;
		}

		public function detailsAction($parameters = array(), $files = array()){
			$pdo = parent::conn();
			$arr = array("status" => "ok", "results" => array());

			$dataquery = $pdo->prepare("SELECT * FROM pessoas WHERE id = :id");
			$dataquery->bindParam(":id", $parameters['id']);
			$dataquery->execute();
			if($dataquery->rowCount() > 0){
				$i = 0;
				while($fetch = $dataquery->fetchObject()){
					$arr["results"][$i] = array(
						"id" => $fetch->id,
						"found" => $fetch->found,
						"foto" => $fetch->foto,
						"nome" => $fetch->nome,
						"descricao" => $fetch->descricao,
						"comentarios" => array(),
						"created_at" => date("d/m/Y H:i:s", strtotime($fetch->created_at))
					);
					$select = $pdo->prepare("SELECT * FROM comentarios WHERE id_pessoa = ?");
					$select->execute(array($fetch->id));
					while($comentario = $select->fetchObject()){
						$arr["results"][$i]["comentarios"][] = array(
							"id" => $comentario->id,
							"status" => $comentario->status,
							"nome" => $comentario->nome,
							"email" => $comentario->email,
							"telefone" => $comentario->telefone,
							"comentario" => $comentario->comentario,
							"created_at" => $comentario->created_at
						);
					}
					$i++;
				}
			}else{
				$arr['status'] = 'no';
			}

			return $arr;
		}

		public function viewAction($parameters = array(), $files = array()){
			$pdo = parent::conn();
			$arr = array("status" => "ok", "results" => array());

			$dataquery = $pdo->prepare("SELECT * FROM pessoas WHERE id = :id");
			$dataquery->bindParam(":id", $parameters['id']);
			$dataquery->execute();
			if($dataquery->rowCount() > 0){
				while($fetch = $dataquery->fetchObject()){
					$arr["results"][] = array(
						"id" => $fetch->id,
						"found" => $fetch->found,
						"foto" => $fetch->foto,
						"nome" => $fetch->nome,
						"descricao" => $fetch->descricao
					);
				}
			}else{
				$arr["status"] = "no";
			}

			return $arr;
		}

		public function foundAction($parameters = array(), $files = array()){
			$pdo = parent::conn();

			$dataquery = $pdo->prepare("UPDATE pessoas SET found = 1 WHERE id = :id");
			$dataquery->bindParam(":id", $parameters['pessoa']);
			if($dataquery->execute()){
				return true;
			}else{
				return false;
			}
		}

	}