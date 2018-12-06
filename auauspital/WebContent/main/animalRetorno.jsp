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
  <title>Retornos próximos</title>
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="/auauspital/src/css/prontuario.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="/auauspital/src/css/estilo.css">
  <!--===============================================================================================-->
  <script src="/auauspital/src/js/validacao.js"></script>
  <!--===============================================================================================-->
  
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
    <h4>Animais com retorno próximo</h4>
  </div>
<div class="push"style="height:20px;"></div>

  <div class="row">
    <div class="col-sm-2">

  </div>


    <div class="col-sm-8"style="margin-top:-45px;">
     
      <!--Divirta-se com seu query por aki, acho q vai ter q colocar um action ai no input de cima-->
      <div class="push"style="height:20px;"></div>
      <div class="table-overflow"><!--Div para colocar barra de rolagem na tabela-->
  		
        <c:choose>
				<c:when test="${not empty prontuarios}">
				<table class="table table-bordered table-hover"style="font: 13px avenirLight !important;color: #707070 !important; height:255px!important;"> <!--Criando a tabela-->
				<thead class="thead-light">  <!-- Estrutura/cabeçalho da tabela, "primeira linha" -->
				<tr style="font: 13px avenir !important;color: #707070 !important;">
						<th>ID do Prontuario</th>
						<th>Nome do animal</th>
						<th>Nome do dono</th>	
						<th>Data de Retorno</th>
						<th>Professor(a) responsável</th>
					</tr>
				</thead> <!-- fim da estrutura/cabeçalho da tabela -->
				<tbody> <!-- Começo da parte com dados da tabela-->
					<c:forEach items="${prontuarios}" var="prontuario"> 
						<tr>
						<td><c:out value="${prontuario.idProntuario}" /></td>
						<td><c:out value="${prontuario.animal.nome}" /></td>
						<td><c:out value="${prontuario.animal.proprietario.nome}" /></td>
						<td><c:out value="${prontuario.dataRetorno}" /></td>
						<td><c:out value="${prontuario.professorResponsavel.nome}" /></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				</c:when>
				<c:otherwise>
					<p>Não há animais com data de retorno em 10 dias.</p>
				</c:otherwise>
			</c:choose>
     
      </div>

      <br><br>


        <div class="push"style="height:100px;"></div>
      
    </div>

    <div class="col-sm-2">

    </div>

  </div>
  <div class="footer">
    <h5>© 2018 - Site feito por Alexia Duarte, Caio Sabadin, Camila Marques e Zidane Gomes</h5>
  </div>
  <!-- Adicionando as bibliotecas do bootstrap, jquary, javascript e icone-->
  <script src="https://unpkg.com/ionicons@4.1.2/dist/ionicons.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

  </body>
  </html>
