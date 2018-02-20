$(function(){

	var base = 'http://sosbuscas.local/';
	var pessoa = 0;
	var comment = false;
	var description_pessoa = "";

	$('.button-collapse').sideNav();
	$('.parallax').parallax();
	$('.modal').modal();

	$("#search").on("keyup", function(e){
		var value = $(this).val().toLowerCase();
		$("#persons .card").filter(function(){
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > - 1);
			if($(this).css('display') === 'block'){
				$(this).parent().css("display", "block");
			}else{
				$(this).parent().css("display", "none");
			}
		});
	});

	$("#contato").on("submit", function(e){
		e.preventDefault();

		var fullname = $("#fullname").val();
		var email = $("#email").val();
		var mensagem = $("#mensagem").val();

		if(fullname == "" || email == "" || mensagem == ""){
			$("#feedback").html("<div style='color:red;'>Você deve preencher todos os campos</div>");
			hidemessage("#feedback");
			return false;
		}

		$.ajax({
			type: 'POST',
			url: base+'sys/Contato/insert',
			dataType: 'json',
			data: {
				fullname: fullname,
				email: email,
				mensagem: mensagem
			}, success: function(retorno){
				if(retorno == true){
					$("#feedback").html("<div style='color:green;'>Mensagem enviada com sucesso</div>");
					hidemessage("#feedback");
				}else{
					$("#feedback").html("<div style='color:red;'>Ocorreu um erro, tente novamente mais tarde</div>");
					hidemessage("#feedback");
				}
			}, error: function(e){
				console.log(e);
			}
		})

		return false;
	});

	$("#login").on("submit", function(e){
		e.preventDefault();

		var username = $("#username").val();
		var password = $("#password").val();

		if(username == "" || password == ""){
			$("#feedback").html("<div style='color:red;'>Você deve informar login e senha</div>");
			hidemessage("#feedback");
			return false;
		}

		$.ajax({
			type: 'POST',
			url: base+'sys/Usuario/login',
			dataType: 'json',
			data: {
				username: username,
				password: password
			}, success: function(retorno){
				if(retorno == true){
					location.href = base+'admin';
				}else{
					$("#feedback").html('<div style="color:red;">Login ou Senha Incorretos</div>');
					hidemessage("#feedback");
				}
			}, error: function(e){
				console.log(e);
			}
		})

		return false;
	});

	$("#register").click(function(e){
		e.preventDefault();

		var imagem = $("#imagem").val();
		var fullname = $("#fullname").val();
		var descricao = $("#description").val();

		if(imagem == "" || fullname == "" || descricao == ""){
			$("#feedback").html("<div style='color:red;'>Você deve preencher todos os campos</div>");
			hidemessage("#feedback");
			return false;
		}

		$("#pessoa").ajaxForm({
			uploadProgress: function(event, position, total, percentComplete){
				var tam_total = total/1000000;

				if(tam_total <= 50){
					console.log(percentComplete);
				}else{
					alert('enviou');
				}
			}, success: function(response){
				if(response == 'size'){
					$("#feedback").html("<div style='color:red;'>A imagem deve ter mais de 500px de largura</div>");
					hidemessage("#feedback");
				}else if(response == false){
					$("#feedback").html("<div style='color:red;'>Ocorreu um erro, tente novamente mais tarde</div>");
					hidemessage("#feedback");
				}else{
					$(".img_crop").html('<img src="" id="target">');
					$("#target").attr("src", base+"img/uploads/"+response);
					$("input[name=img]").val(base+"img/uploads/"+response);

					$('#target').Jcrop({
						aspectRatio: 1,
						minSize: [160,160],
						setSelect: [0,0,160,160],
						onChange: showCoords,
						onSelect: showCoords
					});

					$("#pessoa").hide();
					$("#imagem_crop").fadeIn();
				}
			}, error: function(e){
				console.log(e);
			},
			dataType: 'json',
			url: base+'sys/Pessoa/cut'
		}).submit();

		return false;
	});

	$("input[name=crop]").click(function(e){
		e.preventDefault();

		var fullname = $("#fullname").val();
		var descricao = $("#description").val();
		var x = $("#x").val();
		var y = $("#y").val();
		var w = $("#w").val();
		var h = $("#h").val();
		var img = $("input[name=img]").val();

		$.ajax({
			type: 'POST',
			url: base+'sys/Pessoa/insert',
			dataType: 'json',
			data: {
				fullname: fullname,
				descricao: descricao,
				x: x,
				y: y,
				w: w,
				h: h,
				img: img
			}, success: function(response){
				if(response.status == 'ok'){
					response = response['results'];
					var n = parseInt($("input[name=p]").val());
					if(n == 0){
						var html = "<table class='striped'>";
						html += "<thead><tr><th>#</th><th>Nome</th><th>Data de Criação</th><th>Ações</th></tr></thead><tbody>";
						html += "<tr><td>"+(n+1)+"</td><td>"+fullname+"</td><td>"+response.created_at+"</td><td><a href='' class='view' id='"+response.id+"'><i class='material-icons'>visibility</i></a></td></tr>";
						html += "</tbody></table>";
					}else{
						$("#lista-pessoas table tbody").append("<tr><td>"+(n+1)+"</td><td>"+fullname+"</td><td>"+response.created_at+"</td><td><a href='' class='view' id='"+response.id+"'><i class='material-icons'>visibility</i></a></td></tr>");
					}
					n++;
					$("input[name=p]").val(n);
					$("#cadastro").modal('close');
					$("#pessoa").show();
					$("#imagem_crop").hide();
					$("#fullname").val('');
					$("#description").val('');
					$("input[name=img]").val('');
				}else if(response.status == 'crop'){
					$("#feedback").html("<div style='color:red;'>Não foi possível fazer crop</div>");
					hidemessage("#feedback");
				}else{
					$("#feedback").html("<div style='color:red;'>Ocorreu um erro, tente novamente mais tarde</div>");
					hidemessage("#feedback");
				}
			}, error: function(e){
				console.log(e);
			}
		});

		return false;
	});

	$("#lista-pessoas").ready(function(){

		$.ajax({
			type: 'POST',
			url: base+'sys/Pessoa/select',
			dataType: 'json',
			success: function(retorno){
				if(retorno.status == 'ok'){
					var n = 0;
					var html = "<table class='striped'>";
					html += "<thead><tr><th>#</th><th>Nome</th><th>Data de Criação</th><th>Ações</th></tr></thead><tbody>";
					$.each(retorno.results, function(i, value){
						html += "<tr><td>"+(i+1)+"</td><td>"+value.nome+"</td><td>"+value.created_at+"</td><td><a href='' class='view' id='"+value.id+"'><i class='material-icons'>visibility</i></a></td></tr>";
						n++;
					});
					html += "</tbody></table>";
					$("input[name=p]").val(n);
					$("#lista-pessoas").html(html);
					$("#lista-pessoas table").dataTable();
				}else{
					$("#lista-pessoas").html("<center><h3>Nenhuma pessoa cadastrada</h3></center>");
				}
			}, error: function(e){
				console.log(e);
			}
		});

	});

	$(document).on("click", ".view", function(e){
		e.preventDefault();

		var id = $(this).attr("id");

		if(pessoa == id){
			return false;
		}

		$("#view-pessoa").html('<center><div class="preloader-wrapper active"><div class="spinner-layer spinner-red-only"><div class="circle-clipper left"><div class="circle"></div></div><div class="gap-patch"><div class="circle"></div></div><div class="circle-clipper right"><div class="circle"></div></div></div></div></center>');

		$.ajax({
			type: 'POST',
			url: base+'sys/Pessoa/details',
			dataType: 'json',
			data: {
				id: id
			}, success: function(retorno){
				if(retorno.status == 'ok'){
					var html = "";
					$.each(retorno.results, function(i, value){
						html += "<div class='row'>";
						html += "<div class='col s4 m4 l4'>";
						html += "<img src='"+base+"img/uploads/"+value.foto+"' alt='' class='circle' width='100'>";
						html += "</div>";
						html += "<div class='col s8 m8 m8'>";
						html += "<ul class='collection no-border'>";
						html += "<li class='collection-item no-border'>";
                        html += "<h3 class='description_person text_nome' id='nome'>"+value.nome+"</h3>";
                        html += "<a href='#!' class='secondary-content edit edit_nome' id='nome'><i class='material-icons'>edit</i></a>";
						html += "</li>";
						html += "</ul>";
						html += "<label>Cadastrado em "+value.created_at+"</label>";
						html += "</div>"
						html += "<div class='col s12 m12 l12'>";
						html += "</br>";
						if(value.found == 0){
							html += "<button class='btn grey darken-4 waves-effect found'>Essa pessoa foi encontrada?</button>";
						}else{
							html += "<button class='btn grey darken-4 waves-effect found' disabled>Pessoa encontrada</button>";
						}
						html += "</br></br>";
						html += "<ul class='collection no-border'>";
						html += "<li class='collection-item no-border'>";
						html += "<p class='description_person text_descricao' id='descricao'>"+value.descricao+"</p>";
						html += "<a href='#!' class='secondary-content edit edit_descricao' id='descricao'><i class='material-icons'>edit</i></a>";
						html += "</li>";
						html += "</ul>";
						html += "</div>";
						html += "</div>";
						if(value.comentarios.length > 0){
							html += "<ul class='collection'>";
							$.each(value.comentarios, function(n, comentario){
								console.log(comentario);
								html += "<li class='collection-item avatar' id='comentario_"+comentario.id+"'>";
								html += "<i class='material-icons circle black'>person</i>";
								html += "<span class='title'>"+comentario.nome+"</span>";
								html += "<h6 class='grey-text'>"+comentario.email+"</h6>";
								html += "<h6 class='grey-text'>"+comentario.telefone+"</h6>";
								html += "<p>"+comentario.comentario+"</p>";
								html += "<label>Comentado em "+comentario.created_at+"</label><br/>";
								if(comentario.status == 0){
									html += "<a href='#!' class='allow' id='"+comentario.id+"'>Aprovar comentário</a>";
								}
								html += "<a href='#!' class='secondary-content delete' id='"+comentario.id+"'><i class='material-icons'>delete</i></a>";
								html += "</li>";
							});
							html += "</ul>";
						}
					});
					$("#view-pessoa").html(html);
					pessoa = id;
				}else{
					window.alert('Ocorreu um erro, a página será atualizada');
					location.reload();
				}
			}, error: function(e){
				window.alert('Falha ao conectar com o servidor, a página será atualizada');
				location.reload();
			}
		})

		return false;
	});

	$(document).on("click", ".edit", function(e){
		e.preventDefault();

		var type = $(this).attr('id');
		var descricao = $("#"+type+"").text();
		description_pessoa = descricao;

		$(".text_"+type+"").html("<textarea class='materialize-textarea'>"+descricao+"</textarea><div id='feedback_e'></div><button class='save btn btn-flat waves-effect grey darken-4 white-text' id='"+type+"'>Salvar</button>&nbsp;<button class='cancel btn btn-flat waves-effect grey darken-4 white-text' id='"+type+"'>Cancelar</button>");
		$(".edit_"+type+"").hide();

		return false;
	});

	$(document).on("click", ".cancel", function(e){
	    e.preventDefault();

	    var type = $(this).attr('id');
	    $(".text_"+type+"").html(description_pessoa);
	    $(".edit_"+type+"").show();

	    return false;
    });

	$(document).on("click", ".save", function(){

        var value = $(".description_person textarea").val();
        var type = $(this).attr('id');

        if(descricao == ""){
            $("#feedback_e").html("<div style='color:red;'>Você deve preencher a descrição</div>");
            return false;
        }

        $.ajax({
            type: 'POST',
            url: base+'sys/Pessoa/edit',
            dataType: 'json',
            data: {
                value: value,
                pessoa: pessoa,
                type: type
            }, success: function(response){
                if(response == true){
                    $(".text_"+type+"").html(value);
                    $(".edit_"+type+"").show();
                }else{
                    window.alert('Ocorreu um erro, a página será atualizada');
                    location.reload();
                }
            }, error: function(e){
                console.log(e);
            }
        })

    });

	$(document).on("click", ".allow", function(){

		var id = $(this).attr('id');
		var $this = $(this);

		if(confirm("Tem certeza que deseja aprovar este comentário?") == false){
			return false;
		}

		$.ajax({
			type: 'POST',
			url: base+'sys/Comentario/allow',
			dataType: 'json',
			data: {
				id: id
			}, success: function(response){
				if(response == true){
					$this.fadeOut();
				}else{
					window.alert('Ocorreu um erro, a página será atualizada');
					location.reload();
				}
			}
		});

	});

	$(document).on("click", ".found", function(){

		var $this = $(this);
 
		if(confirm("Tem certeza que deseja marcar essa pessoa como encontrada?") == false){
			return false;
		}

		$.ajax({
			type: 'POST',
			url: base+'sys/Pessoa/found',
			dataType: 'json',
			data: {
				pessoa: pessoa
			}, success: function(response){
				if(response == true){
					$this.removeClass('found');
					$this.prop("disabled", true);
					$this.text("Pessoa encontrada");
				}else{
					window.alert("Ocorreu um erro, a página será atualizada");
					location.reload();
				}
			}, error: function(e){
				console.log(e);
			}
		});

	});

	$(document).on("click", ".delete", function(){
		var id = $(this).attr("id");

		if(confirm("Você tem certeza que deseja apagar este comentário?") == false){
			return false;
		}

		$.ajax({
			type: 'POST',
			url: base+'sys/Comentario/delete',
			dataType: 'json',
			data: {
				id: id
			}, success: function(response){
				if(response == true){
					var length = $("#comentario_"+id).parent().children().length;
					if(length == 1){
						$("#comentario_"+id).parent().fadeOut();
					}else{
						$("#comentario_"+id).fadeOut();
					}
				}else{
					window.alert("Ocorreu um erro, a página será atualizada");
					location.reload();
				}
			}, error: function(e){
				console.log(e);
			}
		})
	});

	$(document).on("click", ".view-pessoa", function(){
		var id = $(this).attr("id");

		$.ajax({
			type: 'POST',
			url: base+'sys/Pessoa/view',
			dataType: 'json',
			data: {
				id: id
			}, success: function(response){
				if(response.status == 'ok'){
					response = response.results[0];
					$("#pessoa").val(id);
					$(".modal-back").fadeIn();
					var html = "<h5>"+response.nome+"</h5>";
						if(response.found == 1){
							html += "(Encontrada)";
						}
						html += "<p>"+response.descricao+"</p>";
					$(".person-details").html(html);
					var html = "<img src='"+base+"/img/uploads/"+response.foto+"'/>";
					$(".person-image").html(html);

					$.ajax({
						type: 'POST',
						url: base+'sys/Comentario/select',
						dataType: 'json',
						data: {
							pessoa: id
						}, success: function(response){
							if(response.status == 'ok'){
								var c = 0;
								var html = "<ul class='collection'>";
									$.each(response.results, function(i, value){
										html += "<li class='collection-item avatar'>";
										html += "<i class='material-icons circle black'>person</i>";
										html += "<span class='title'>"+value.nome+"</span>";
										html += "<p>"+value.comentario+"</p>";
										html += "<label>Comentado em "+value.created_at+"</label>";
										html += "</li>";
										c++;
									});
									html += "</ul>";
								$("#comments").html(html);
								$("#c").val(c);
							}
						}
					});
				}else{
					window.alert("Ocorreu um erro, a página será atualizada");
					location.reload();
				}
			}, error: function(e){
				console.log(e);
			}
		});
	});

	$(".close").click(function(){
		$(".modal-back").fadeOut();
	});

	$(document).on("click", ".view-comment", function(){
		if(comment == false){
			$("#form-comment").fadeIn();
			comment = true;
		}else{
			$("#form-comment").fadeOut();
			comment = false;
		}
	});

	$(document).on("click", ".send-comment", function(e){
		e.preventDefault();

		var fullname = $("#fullname").val();
		var email = $("#email").val();
		var telephone = $("#telephone").val();
		var comment = $("#comment").val();
		var pessoa = $("#pessoa").val();

		if(fullname == "" || telephone == "" || comment == ""){
			$("#feedback").html("<div style='color:red;'>Você deve preencher todos os campos</div>");
			hidemessage("#feedback");
			return false;
		}

		$.ajax({
			type: 'POST',
			url: base+'sys/Comentario/insert',
			dataType: 'json',
			data: {
				fullname: fullname,
				email: email,
				telephone: telephone,
				comment: comment,
				pessoa: pessoa
			}, success: function(response){
				if(response.status == 'ok'){
					$("#feedback").html("<div style='color:green;'>Comentário enviado com sucesso, aguarde aprovação do administrador</div>");
					hidemessage("#feedback");
					/*
					var c = $("#c").val();
					response = response.results;
					if(c == 0){
						var html = "<ul class='collection'>";
							html += "<li class='collection-item avatar'>";
							html += "<i class='material-icons circle black'>person</i>";
							html += "<span class='title'>"+fullname+"</span>";
							html += "<p>"+comment+"</p>";
							html += "<label>Comentado em "+response.created_at+"</label>";
							html += "</li>";
							html += "</ul>";
							$("#comments").html(html);
					}else{
						$("#comments ul").append("<li class='collection-item avatar'><i class='material-icons circle black'>person</i><span class='title'>"+fullname+"</span><p>"+comment+"</p><label>Comentado em "+response.created_at+"</label></li>");
					}
					c++;
					$("#c").val(c);
					*/
					$("#form-comment").fadeOut();
					comment = false;
				}
			}, error: function(e){
				console.log(e);
			}
		});

		return false;
	});

});