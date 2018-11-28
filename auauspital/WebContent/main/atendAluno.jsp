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
  <title>Atendimentos por alunos</title>
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="/auauspital/src/css/historicoAtendimento.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="/auauspital/src/css/estilo.css">

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
    <h4>Atendimentos por alunos</h4>
  </div>

<div class="push"style="height:20px;"></div>
  <div class="row">
    <div class="column4"></div>


    <div class="column3" >

      <div class="table-overflow"><!--Div para colocar barra de rolagem na tabela-->
      <table class="table table-bordered table-hover "> <!--Criando a tabela-->
        <thead class="thead-light" style="font: 13px avenir !important;color: #707070 !important;">  <!-- Estrutura/cabeçalho da tabela, "primeira linha" da tabela -->
          <tr>
            <th>Nome</th>
            <th>Tipo de animal</th>
            <th>Data de atendimento</th>
            <th>Aluno(a) responsavel</th>
          </tr>
        </thead> <!-- fim da estrutura/cabeçalho da tabela -->
        <tbody style="font: 13px avenirLight !important;color: #707070 !important;"> <!-- Começo da parte com dados da tabela-->

          <tr> <!-- Aqui provavelmente entrar um forech das linha da tabela, não sei como escreve-->
            <td>John</td> <!-- Aqui provavelmente entra o forech dos ""nomes""-->
            <td>Sapo</td> <!-- Aqui provavelmente entra o forech dos ""Tipo de animal""-->
            <td>25/12/18</td> <!-- Aqui provavelmente entra o forech dos ""Data de atendimento""-->
            <td>Thiago</td> <!-- Aqui provavelmente entra o forech dos ""Professor(a) responsavel""-->
          </tr>


                                                  <!--Aqui sera retirado-->

                  <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                 <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>

          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>John</td>
            <td>Sapo</td>
            <td>25/12/18</td>
            <td>Thiago</td>
          </tr>
                      <!--Retirado até aqui, fé-->
        </tbody>
      </table>




    </div>
    <div class="imagemPeixinho">
    <img src="/auauspital/src/imagens/icones/fish-bowl.png" alt="gatinho" width=150 >
  </div>
    <div class="push"></div>


  </div>


    <div class="column4" ></div>


  <div class="push"></div>





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
