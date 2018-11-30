<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
  <html lang="pt-br">

  <head>
    <meta charset="utf-8">
    <!--===============================================================================================-->
    <meta name="viewport" content="initial-scale=1">
    <!--===============================================================================================-->
    <title>Iniciar Atendimento</title>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/auauspital/src/css/estilo.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="/auauspital/src/css/jquery-ui.min.css" />
    <!--===============================================================================================-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/validacao.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/jquery-ui.min.js"></script>
    <!--===============================================================================================-->
    <script type="text/javascript">
		$(document).ready(function() {
			var animais = [
				<c:forEach items="${animais}" var="animal">
					{
						value: <c:out value="${animal.idAnimal}" />,
						label: "<c:out value="${animal.nome}" />",
						tipo: "<c:out value="${animal.tipo}" />",
						idade: <c:out value="${animal.idade}" />,
						cor: "<c:out value="${animal.cor}" />",
						proprietario: "<c:out value="${animal.proprietario.nome}" />"
					},
				</c:forEach>
			];

			var proprietarios = [
				<c:forEach items="${proprietarios}" var="proprietario">
					{
						idProprietario: <c:out value="${proprietario.idProprietario}" />,
						nome: "<c:out value="${proprietario.nome}" />",
						label: "<c:out value="${proprietario.nome}" /> (<c:out value="${proprietario.cpf}" />)",
						animais: [
							<c:forEach items="${proprietario.animais}" var="animal">
								{
									idAnimal: <c:out value="${animal.idAnimal}" />,
									nome: "<c:out value="${animal.nome}" />",
									tipo: "<c:out value="${animal.tipo}" />",
									idade: <c:out value="${animal.idade}" />,
									cor: "<c:out value="${animal.cor}" />"
								},							
							</c:forEach>
						]
					},
				</c:forEach>
			];

			
			
			$("#busca").autocomplete({
				source: animais,
				select: function(event, ui) {
					event.preventDefault();
					$("#busca").val(ui.item.label);
					var idAnimal = ui.item.value;
					var tam = animais.length;
					for(i=0;i<tam;i++) {
						if(animais[i].value == idAnimal) {
							$("#resultado").html('<option value="' + animais[i].value + '">' + animais[i].label + ', ' + animais[i].tipo.toLowerCase() + ' de cor ' + animais[i].cor.toLowerCase() + ', com ' + animais[i].idade + ' anos de idade. Seu dono é ' + animais[i].proprietario + '.</option>');
						}
					}
				}
			});

			$("#cpfChecked").click(function() {
				$("#busca").autocomplete({
					source: proprietarios,
					select: function(event, ui) {
						event.preventDefault();
						$("#busca").val(ui.item.label);
						var cpfProprietario = ui.item.label;
						var tam = proprietarios.length;
						for(i=0;i<tam;i++) {
							if(proprietarios[i].label == cpfProprietario) {
								$("#resultado").html("");
								var numAnimais = proprietarios[i].animais.length;
								for(j=0;j<numAnimais;j++) {
									$("#resultado").append('<option value="' + proprietarios[i].animais[j].idAnimal + '">' + proprietarios[i].animais[j].nome + ', ' + proprietarios[i].animais[j].tipo.toLowerCase() + ' de cor ' + proprietarios[i].animais[j].cor.toLowerCase() + ', com ' + proprietarios[i].animais[j].idade + ' anos de idade. O dono é ' + proprietarios[i].nome + '.</option>');
								}
							}
						}							
					}
				});
			});

			$("#petChecked").click(function() {
				$("#busca").autocomplete({
					source: animais,
					select: function(event, ui) {
						event.preventDefault();
						$("#busca").val(ui.item.label);
						var idAnimal = ui.item.value;
						var tam = animais.length;
						for(i=0;i<tam;i++) {
							if(animais[i].value == idAnimal) {
								$("#resultado").html('<option value="' + animais[i].value + '">' + animais[i].label + ', ' + animais[i].tipo.toLowerCase() + ' de cor ' + animais[i].cor.toLowerCase() + ', com ' + animais[i].idade + ' anos de idade. Seu dono é ' + animais[i].proprietario + '.</option>');
							}
						}						
					}
				});
			});

			$("#btn-enviar").click(function() {
				if($("#idBuscado").val()=='') {
					return false;
				}
			});
			
		});
    </script>
  </head>

  <body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <img src="/auauspital/src/imagens/logo2.png">
      </div>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="home.jsp">Home<span class="glyphicon glyphicon-home"></span></a></li>
        <li><a href="logoutprocessor">Sair<span class="glyphicon glyphicon-log-out"></span></a></li>
      </ul>
    </div>
  </nav>
    <div id="titulos">
      <h4>Iniciar atendimento</h4>
    </div>
<br><br>
    <div class="row">
      <div class="column2">

      </div>
      <br>
      <div class="column">
        <a href="loadtelacadastro">
          <div class='rectangle-box'>

            <div class='rectangle-content'>
              <div>
                <img style="height: 100%!important;width: 100%!important;" src="/auauspital/src/imagens/icones/novoanimal2.png">
              </div>
            </div>
          </div>
        </a>
      </div>
      <div class="column2">

      </div>
    </div>

    <div class="row">
      <div class="column4"></div>

      <div class="column3" >
        <form name="formBusca" action="loadtelacadastro" onsubmit="return validateForm4()" method="post">
        <h4 style=" font-size: 20px; padding-top:20px;padding-bottom:30px;">Caso já seja cadastrado em nosso sistema, busque pelo nome do bichinho ou
pelo CPF  do dono e selecione o cadastro:</h4>

        <div class="form-group">
		  <div id="radioButtons">
	          <label class="radio-inline"><input type="radio" name="optradio" checked id="petChecked" value="petChecked" >Nome do animal</label>
	          <label class="radio-inline"><input type="radio" name="optradio" id="cpfChecked" value="cpfChecked" >CPF</label>
          </div>

		  
          	<input type="text" class="form-control" id="busca" name="busca">
          

          <select required="required" class="form-control" name="animal" id="resultado">
    		<option value="" selected="selected" disabled="disabled">Por favor, procure por um nome ou um CPF no campo acima</option>
  		  </select>

          <button id="btn-enviar" type="submit"class="btn btn-form" value="Submit">Enviar</button>


        </div>
      </div>
      <div class="column4"></div>
    </div>
      </div>


    <div class="push"></div>
    <div class="footer">
    <h5>© 2018 - Site feito por Alexia Duarte, Caio Sabadin, Camila Marques e Zidane Gomes</h5>
  </div>
  </body>

  </html>
