<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
  <html lang="pt-br">

  <head>
    <meta charset="utf-8">
    <!--===============================================================================================-->
    <meta name="viewport" content="initial-scale=1">
    <!--===============================================================================================-->
    <title>Aprovações Pendentes</title>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/auauspital/src/css/estilo.css">
    <!--===============================================================================================-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!--===============================================================================================-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/formValidação.js"></script>
    <!--===============================================================================================-->
    <script src="/auauspital/src/js/verificação.js"></script>
    <!--===============================================================================================-->
    <script type="text/javascript">
    	$(document).ready(function() {
    		
    		$("#btn-envio").click(function() {
    			if(document.getElementById("field-idProntuario").value == 0) {
    				alert("Por favor, selecione algum prontuário para aprovar.");
    				return false;
    			}
    		});
    		
    		<c:forEach items="${prontuarios}" var="prontuario">
    			$('#prontuario-<c:out value="${prontuario.idProntuario}" />').click(function() {
    				document.getElementById("field-idProntuario").value = <c:out value="${prontuario.idProntuario}" />;
    				$('#exibição').html("");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<h3>Prontuário do(a) aluno(a) <c:out value="${prontuario.aluno.nome}" /> (<fmt:formatDate pattern = "dd/MM/yyyy" value = "${prontuario.dataAtendimento}" />).</h3>");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<p><b>Nome:</b> <c:out value="${prontuario.animal.nome}" />.</p>");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<p><b>Espécie:</b> <c:out value="${prontuario.animal.tipo}" />.</p>");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<p><b>Cor:</b> <c:out value="${prontuario.animal.cor}" />.</p>");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<p><b>Idade:</b> <c:out value="${prontuario.animal.idade}" />.</p>");
    				<c:if test="${not empty prontuario.dataRetorno}">
    					document.getElementById("exibição").insertAdjacentHTML("beforeend", "<p><b>Data para Retorno:</b> <fmt:formatDate pattern = "dd/MM/yyyy" value = "${prontuario.dataRetorno}" />.</p>");
    				</c:if>
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<h3>Motivo da Visita</h3>");
    				var motivos = "<c:out value="${prontuario.motivos}" />";
    				motivos = motivos.replace(/\&gt\;/gi, ">");
    				motivos = motivos.replace(/\&lt\;/gi, "<");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", motivos);
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", "<h3>Prescrições</h3>");
    				var prescricoes = "<c:out value="${prontuario.prescricoes}" />";
    				prescricoes = prescricoes.replace(/\&gt\;/gi, ">");
    				prescricoes = prescricoes.replace(/\&lt\;/gi, "<");
    				document.getElementById("exibição").insertAdjacentHTML("beforeend", prescricoes);
    			});
    		</c:forEach>
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
      <h4>Prontuários com aprovações pendentes</h4>
    </div>

    <div class="row">
      <div class="column4">
        <div class="square img_1-1">

        <img class="imagemDog" src="/auauspital/src/imagens/icones/cachorro.png">
      </div>
    </div>


      <div class="column3">

        <br>
        <br>
        <div class="form-group">

          <form class="form-horizontal" id='form-cadastro' method="post" action="aprovarprontuario">
			<input type="hidden" id="field-idProntuario" name="idProntuario" value="0" />
            <div id="table-overflow">
              <div class="list-group">
              	<c:forEach items="${prontuarios}" var="prontuario">
              		<a id="prontuario-<c:out value="${prontuario.idProntuario}" />" href="#" class="list-group-item list-group-item-action">
              			<h6>
              				Nome: <c:out value="${prontuario.animal.nome}" /> (<c:out value="${prontuario.animal.tipo}" />) || Cadastrado pelo(a) médico(a) <c:out value="${prontuario.aluno.nome}" />, em <fmt:formatDate pattern = "dd/MM/yyyy" value = "${prontuario.dataAtendimento}" />
              			</h6>
              		</a>
              	</c:forEach>
              </div>
            </div>



        </div>
        <br>
        <div id="exibição">
          <c:choose>
          	<c:when test="${not empty prontuarios}">
          		<h3>Prontuários</h3>
          		<p>Clique em um dos prontuários da lista acima para visualizá-lo aqui.</p>
          	</c:when>
          	<c:otherwise>
          		<h3>Prontuários</h3>
          		<p>Não há prontuários pendentes de autorização.</p>
          	</c:otherwise>	
          </c:choose>
          
        </div>


        <br><br>
        <div id="imagemButton">
          <button id="btn-envio" type="submit" class="btn btn-form" style="margin-top:0;">Autorizar prontuário</button>
        </div>

          <div class="push"style="height:100px;"></div>
      </div>

      </form>
      <div class="column4" ></div>
    </div>


<div class="footer">
    <h5>© 2018 - Site feito por Alexia Duarte, Caio Sabadin, Camila Marques e Zidane Gomes</h5>
  </div>
  </body>

  </html>
