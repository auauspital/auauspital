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
    <link rel="stylesheet" type="text/css" href="/auauspital/src/css/estilo.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="/auauspital/src/css/historicoAtendimento.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" href="/auauspital/src/css/jquery-ui.min.css" />
    <!--===============================================================================================-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/validacao.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/verificação.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/jquery-ui.min.js"></script>
    <!--===============================================================================================-->
	<script type="text/javascript">
	$(document).ready(function() {
		var prontuarios = [
	        <c:forEach items="${prontuarios}" var="prontuario">
	            {
	                label: "<c:out value="${prontuario.aluno.nome}" /> (<c:out value="${prontuario.aluno.cpf}" />)",
	                value: "<c:out value="${prontuario.aluno.id}" />",
	                idAluno: <c:out value="${prontuario.aluno.id}" />,
	                nomeAluno: "<c:out value="${prontuario.aluno.nome}" />",
	                cpfAluno: "<c:out value="${prontuario.aluno.cpf}" />",
	                nomeAnimal: "<c:out value="${prontuario.animal.nome}" />",
	                tipoAnimal: "<c:out value="${prontuario.animal.tipo}" />",
	                dataAtendimento: "<c:out value="${prontuario.dataAtendimento}" />",
	                nomeProfessor: "<c:out value="${prontuario.professorResponsavel.nome}" />"
	            },
	        </c:forEach>
	    ];
		
		var alunos = [
			<c:forEach items="${usuarios}" var="aluno">
				{
					label: "<c:out value="${aluno.nome}" /> (<c:out value="${aluno.cpf}" />)",
					value: <c:out value="${aluno.id}" />
				},
			</c:forEach>
		];
	   
	    	$('#buscaAluno').autocomplete({
	            source: alunos,
	            select: function(event, ui) {
	                event.preventDefault();
	                $('#buscaAluno').val(ui.item.label);
	                var idBuscado = ui.item.value;
	                var tamanho = prontuarios.length;
					var tabela = document.getElementsByTagName('tbody')[0];
					tabela.innerHTML = "";
	                for(i=0;i<tamanho;i++) {
	                    if(prontuarios[i].idAluno==idBuscado) {
	                    	var conteudo = "<tr>";
	                    	conteudo += "<td>" + prontuarios[i].nomeAluno + "(" + prontuarios[i].cpfAluno + ")</td>";
	                    	conteudo += "<td>" + prontuarios[i].nomeAnimal + "</td>";
	                    	conteudo += "<td>" + prontuarios[i].tipoAnimal + "</td>";
	                    	conteudo += "<td>" + prontuarios[i].dataAtendimento + "</td>";
	                    	conteudo += "<td>" + prontuarios[i].nomeProfessor + "</td>";
	                    	conteudo += "</tr>";       
							tabela.insertAdjacentHTML('beforeend', conteudo);
	                    }
	                }                
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
        <li><a href="logoutprocessor"> Sair <span class="glyphicon glyphicon-log-out"></span></a></li>
      </ul>
    </div>
  </nav>
  <div id="titulos">
    <h4>Atendimentos por alunos</h4>
  </div>

  <div class="push"style="height:20px;"></div>
  <div class="row">
    <div class="column4">
      <div class="square2">

      <img class="imagemCardio" src="/auauspital/src/imagens/icones/cardiogram.png">
    </div>
		</div> <!-- fim do segundo div "row"-->

    <div class="column3">
		<div class="bordaTop2"><h4 style=" font-size: 25px; padding-top:50px;">Busque pelo CPF do aluno:</h4></div>
			 <input  type="text" class="form-control" id="buscaAluno" name="busca" placeholder="Digite o CPF do aluno" style="border-radius:2px;">
          <br>
			<div style="height:50px;">
			
            
          </div >
			<div class="table-overflow"><!--Div para colocar barra de rolagem na tabela-->
			<c:choose>
				<c:when test="${not empty prontuarios}">
				<table class="table table-bordered table-hover"style="font: 13px avenirLight !important;color: #707070 !important; height:255px!important;"> <!--Criando a tabela-->
				<thead class="thead-light">  <!-- Estrutura/cabeçalho da tabela, "primeira linha" -->
				<tr style="font: 13px avenir !important;color: #707070 !important;">
						<th>Aluno(a) responsável</th>
						<th>Nome</th>
						<th>Tipo de animal</th>
						<th>Data de atendimento</th>
						<th>Professor(a) responsável</th>
					</tr>
				</thead> <!-- fim da estrutura/cabeçalho da tabela -->
				<tbody> <!-- Começo da parte com dados da tabela-->
					 
				</tbody>
				</table>
				</c:when>
				<c:otherwise>
					<p>Não há prontuários cadastrados no sistema.</p>
				</c:otherwise>
			</c:choose>

		</div>

		</div>


    <div class="column4"></div>
</div>

  <div class="push"></div>





<div class="footer">
    <h5>© 2018 - Site feito por Alexia Duarte, Caio Sabadin, Camila Marques e Zidane Gomes</h5>
  </div>
<!-- Adicionando as bibliotecas do bootstrap, jquary, javascript e icone-->
<%-- <script src="https://unpkg.com/ionicons@4.1.2/dist/ionicons.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>--%>

</body>
</html>
