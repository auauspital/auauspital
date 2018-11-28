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
    <title>Cadastro</title>
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
    <script src="/auauspital/src/js/verificação.js"></script>
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
      <h4>Prontuário médico</h4>
    </div>


    <div class="row">
      <div class="column4" style="width:20%!important"></div>


      <div class="column3"style="width:50%!important">


        <div class="form-group">

          <form class="form-horizontal" id='form-cadastro' name="formCadastro" action="cadastraanimal" onsubmit="return validateForm()" method="post">

            <div class="form-group">
              <!-- Nome do animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Nome do animal:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="nomePet">

              </div>
            </div>

            <div class="form-group">
              <!-- Tipo de animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Espécie:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="especie" placeholder="Ex: Cachorro, gato, hamster...">

              </div>
            </div>

            <div class="form-group">
              <!-- Idade do animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Idade:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="idadePet">

              </div>
            </div>

            <div class="form-group">
              <!-- Cor do animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Cor do animal:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="corPet">

              </div>
            </div>

            <div class="form-group">
              <!--Nome do(a) dono(a) -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Nome do(a) dono(a):</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="nomeDono">

              </div>
            </div>
            
			<div class="form-group">
              <!-- CPF -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">CPF:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="cpf">

              </div>
            </div>

            <div class="form-group">
              <!-- Rua -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Logradouro:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="logradouro">

              </div>
            </div>
            
            <div class="form-group">
              <!-- Complemento -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Complemento:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="complemento">

              </div>
            </div>
            
            <div class="form-group">
              <!-- Cidade -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Cidade:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="cidade">

              </div>
            </div>
            
            <div class="form-group">
              <!-- UF -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">UF:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="uf">

              </div>
            </div>
            
            <div class="form-group">
              <!-- CEP -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">CEP:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="cep">

              </div>
            </div>
            
            <c:choose>
            	<c:when test="${usuario.tipo==0}">
		 			<div class="form-group">
		              <!-- Nome do(a) professor(a) responsável -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Prof(a). responsável:</label>
		              <div class="col-sm-9">
		                <input disabled="disabled" value="<c:out value="${usuario.nome}" />" type="text" class="form-control" id="full_name_id" name="nomeProf">
						
		              </div>
		            </div>
		            
		 			<div class="form-group">
		              <!-- Nome do(a) aluno(a) responsável -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Aluno responsável:</label>
		              <div class="col-sm-9">
		                <select class="form-control" id="full_name_id" name="nomeAluno">
		                	<c:forEach items="${membrosCadastro}" var="aluno">
		                		<option value="${aluno.id}">
		                			<c:out value="${aluno.nome}" /> (#<c:out value="${aluno.matricula}" />)
		                		</option>
		                	</c:forEach>
						</select>
		              </div>
		            </div> 		           	
            	</c:when>
            	<c:otherwise>
		 			<div class="form-group">
		              <!-- Nome do(a) aluno(a) responsável -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Aluno responsável:</label>
		              <div class="col-sm-9">
		                <input disabled="disabled" value="<c:out value="${usuario.nome}" />" type="text" class="form-control" id="full_name_id" name="nomeAluno">
						
		              </div>
		            </div>
		            
		 			<div class="form-group">
		              <!-- Nome do(a) aluno(a) responsável -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Professor responsável:</label>
		              <div class="col-sm-9">
		                <select class="form-control" id="full_name_id" name="nomeProf">
		                	<c:forEach items="${membrosCadastro}" var="professor">
		                		<option value="${professor.id}">
		                			<c:out value="${professor.nome}" /> (#<c:out value="${professor.matricula}" />)
		                		</option>
		                	</c:forEach>
						</select>
		              </div>
		            </div>             	
            	</c:otherwise>
            </c:choose>

            <div class="form-group">
              <!-- Motivo da consulta -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Motivo do atendimento:</label>
              <div class="col-sm-9">
                <textarea class="form-control" cols="40" id="message" name="motivo" rows="5"></textarea>

              </div>
            </div>


            <div class="form-group">
              <!-- Retorno do paciente -->
              <label class="control-label col-sm-3" id="prontuario">Retorno?</label>
              <div class="col-sm-9">
                <div class="radio">

                  <label class="radio-inline">
                  <input type="radio" onclick="javascript:yesnoCheck();" name="yesno"  id="yesCheck">Sim
                </label>

                  <label class="radio-inline">
                  <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" checked id="noCheck">Não
                </label>

                  <div id="ifYes" style="display:none">
                    <div class="form-group">
                      <!-- Data do retorno -->
                      <br>
                      <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Data de retorno:</label>
                      <div class="col-sm-9">
                        <input type="date" class="form-control" id="full_name_id" name="dataRetorno">

                      </div>
                    </div>
                  </div>


                </div>
              </div>
            </div>

            <div id="imagemButton">
              <img src="/auauspital/src/imagens/icones/bird2.png">
              <button type="submit" class="btn btn-form" style="margin-top:0;"value="Submit">Enviar</button>
            </div>

          </form>

        </div>
      </div>
      <div class="column4"style="width:30%!important;"></div>
    </div>

    <div class="push"></div>
    <div class="footer">
    <h5>© 2018 - Site feito por Alexia Duarte, Caio Sabadin, Camila Marques e Zidane Gomes</h5>
  </div>
  </body>

  </html>
