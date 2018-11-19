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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <li><a href="home.php">Home<span class="glyphicon glyphicon-home"></span></a></li>
        <li><a href="login.php">Sair<span class="glyphicon glyphicon-log-out"></span></a></li>
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
        <a href="cadastro.php">
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
        <form name="formBusca" action="/action_page.php" onsubmit="return validateForm4()" method="post">
        <h4 style=" font-size: 20px; padding-top:20px;">Caso já seja cadastrado em nosso sistema, busque pelo nome do bichinho ou
pelo CPF  do dono e selecione o cadastro:</h4>

        <div class="form-group">

          <input type="text" class="form-control" id="busca" name="busca">

          <div id="radioButtons">
          <label class="radio-inline"><input type="radio" name="optradio" checked id="petChecked" >Nome do animal</label>
          <label class="radio-inline"><input type="radio" name="optradio" id="cpfChecked">CPF</label>
        </div>

          <select class="form-control" id="resultado">
    <option>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </option>

  </select>

          <button type="submit"class="btn btn-form" value="Submit">Enviar</button>


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
