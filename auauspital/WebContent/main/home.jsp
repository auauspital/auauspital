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
    <title>Home</title>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/auauspital/src/css/estilo.css">
    <!--===============================================================================================-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
  </head>

  <body>
  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <img src="/auauspital/src/imagens/logo2.png">
      </div>

      <ul class="nav navbar-nav navbar-right">
        <li><a href="logoutprocessor">Sair<span class="glyphicon glyphicon-log-out"></span></a></li>
      </ul>
    </div>
  </nav>

    <!-- Primeira fileira de botões -->
    <div class="grid">
      <div class="row">
        <a href="loadtelaatendimento">
          <div class="box">

            <div class="inner" style="background-color:#57B5B4">

              <img style="height: 90%!important;width: 80%!important;" src="/auauspital/src/imagens/icones/1.png">

            </div>
        </a>
        </div>

		<c:choose>
			<c:when test="${usuario.tipo == 0}">
		        <a href="loadtelaaprovarprontuarios">
		          <div class="box">
		
		            <div class="inner" style="background-color:#D37B93">
		
		              <img style="height: 90%!important;width: 70%!important;" src="/auauspital/src/imagens/icones/2.png">
		
		            </div>
		        </a>
		        </div>			
			</c:when>
			<c:otherwise>
		          <div class="box" style="border:0 !important;outline:0 !important;">
		
		            <div class="inner" style="border:0 !important;outline:0 !important;">
		
		              <img style="height: 90%!important;width: 70%!important;" src="/auauspital/src/imagens/icones/pawprint.png">
		
		            </div>
		        </div>		
			</c:otherwise>
		</c:choose>
		

        <a href="loadtelaatendimentosaluno">
          <div class="box">

            <div class="inner" style="background-color:#FFAB00">

              <img style="height: 90%!important;width: 80%!important;" src="/auauspital/src/imagens/icones/3.png">

            </div>
        </a>
        </div>
      </div>
    </div>
    <!-- Segunda fileira de botões -->
    <div class="grid">
      <div class="row">
        <a href="loadtelaatendimentosprofessor">
          <div class="box">

            <div class="inner" style="background-color:#EAEAEA">

              <img style="height: 90%!important;width: 90%!important;" src="/auauspital/src/imagens/icones/4.png">

            </div>
        </a>
        </div>

        <a href="loadtelaprontuariosanimal">
          <div class="box">

            <div class="inner" style="background-color:#EFC589">

              <img style="height: 90%!important;width: 80%!important;" src="/auauspital/src/imagens/icones/5.png">

            </div>
        </a>
        </div>

        <a href="loadtelaatendimentodata">
          <div class="box">

            <div class="inner" style="background-color:#CDD7DB">

              <img style="height: 90%!important;width: 98%!important;" src="/auauspital/src/imagens/icones/6.png">

            </div>
        </a>
        </div>
      </div>
    </div>

    <div class="push"></div>
  <div class="footer">
    <h5>© 2018 - Site feito por Alexia Duarte, Caio Sabadin, Camila Marques e Zidane Gomes</h5>
  </div>
  </body>

  </html>