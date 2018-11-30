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

        	var isEditar = <c:out value="${not empty isEditarCadastro}" />;

            if(!isEditar) {
				$("#btn-editarProprietario").css("display", "none");
				$('input[name=dadosDono]').val("");
				$('input[name=dadosDono]').attr("placeholder", "Digite aqui o CPF do proprietário desejado...");
				$('#linha-dadosDono').css("display", "none");
            }

    		var proprietarios = [
				<c:forEach items="${proprietarios}" var="proprietario">
					{
						idProprietario: <c:out value="${proprietario.idProprietario}" />,
						label: "<c:out value="${proprietario.nome}" /> (<c:out value="${proprietario.cpf}" />)",
					},
				</c:forEach>
			];
        	
    		$("#btn-editarProprietario").click(function() {
    			$("#proprietarioEditadoControle").attr("value", "true");
    			$("#proprietarioNovoCadastrado").attr("value", "false");
    			$('#proprietarioNovoAssociado').attr("value", "false");
    			$("#box-dadosDono").css("display", "none");
    			$("#box-dadosEndereco").css("display", "block");
    		});
    		
    		$("#btn-trocarProprietario").click(function() {
    			$("#dialog-NovoDono").dialog({
        			modal: true,
        			buttons: {
        				"Cadastrar": function() {
        					$('input[name=nomeDono]').val("");
        					$('input[name=cpf]').val("");
        					$('input[name=logradouro]').val("");
        					$('input[name=complemento]').val("");
        					$('input[name=cidade]').val("");
        					$('input[name=cep]').val("");
        					
        					$("#box-dadosEndereco").css("display", "block");
        					$("#box-dadosDono").css("display", "none");
        					$("#proprietarioNovoCadastrado").attr("value", "true");
        					$("#proprietarioEditadoControle").attr("value", "false");
        					$('#proprietarioNovoAssociado').attr("value", "false");
        					
        					$(this).dialog("close");
        				},
        				"Associar": function() {

        					$('#linha-dadosDono').css("display", "block");
        					$('input[name=dadosDono]').removeAttr("disabled");
            				$('#botoesControle').css("display", "none");
							$('#proprietarioNovoAssociado').attr("value", "true");
							$("#proprietarioNovoCadastrado").attr("value", "false");
        					$("#proprietarioEditadoControle").attr("value", "false");
            				$('input[name=dadosDono]').autocomplete({
								source: proprietarios,
								select: function(event, ui) {
									event.preventDefault();
									$('input[name=dadosDono]').val(ui.item.label);
									var cpfProprietario = ui.item.label;
									var tam = proprietarios.length;
									for(i=0;i<tam;i++) {
										if(proprietarios[i].label == cpfProprietario) {
											$('input[name=idProprietario]').attr("value", proprietarios[i].idProprietario);
										}
									}
									$('input[name=dadosDono]').attr("disabled", "disabled");
								}
                    		});
            				
        					$(this).dialog("close");
        				}
        			}
        		});
    		});
    		
    	});
    </script>
  </head>

  <body>
   <div style="display:none;" id="dialog-NovoDono" title="Novo Dono">
  	 <p>Você deseja cadastrar um novo dono, ou deseja associar um proprietário já existente a esse animal?</p>
   </div>
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
          	<c:choose>
          		<c:when test="${not empty isEditarCadastro}">
          			<input type="hidden" name="isEditarCadastrado" value="true" />
          			<input type="hidden" name="idAnimal" value="<c:out value="${animal.idAnimal}" />" />
          			<input type="hidden" name="idProprietario" value="<c:out value="${animal.proprietario.idProprietario}" />" />
          			<input type="hidden" id="proprietarioEditadoControle" name="isProprietarioEditado" value="false" />
          			<input type="hidden" id="proprietarioNovoCadastrado" name="isProprietarioNovoCadastrado" value="false" />
          			<input type="hidden" id="proprietarioNovoAssociado" name="isProprietarioNovoAssociado" value="false" />
          		</c:when>
          		<c:otherwise>
          			<input type="hidden" name="isEditarCadastrado" value="false" />
          		</c:otherwise>
          	</c:choose>
			
			
            <div class="form-group">
              <!-- Nome do animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Nome do animal:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="nomePet" value="<c:out value="${animal.nome}" />">

              </div>
            </div>

            <div class="form-group">
              <!-- Tipo de animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Espécie:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="especie" placeholder="Ex: Cachorro, gato, hamster..." value="<c:out value="${animal.tipo}" />">

              </div>
            </div>

            <div class="form-group">
              <!-- Idade do animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Idade:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="idadePet" value="<c:out value="${animal.idade}" />">

              </div>
            </div>

            <div class="form-group">
              <!-- Cor do animal -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Cor do animal:</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="full_name_id" name="corPet" value="<c:out value="${animal.cor}" />">

              </div>
            </div>
            
            		 <div id="box-dadosDono">
	            		 <div class="form-group" id="linha-dadosDono">
	            		 	<!-- Dados do dono para serem apenas aceitos -->
	            		 	<label for="full_name_id" class="control-label col-sm-3" id="prontuario">Dono:</label>
	            		 	<div class="col-sm-9">
	            		 		<input type="text" class="form-control" id="full_name_id" name="dadosDono" disabled="disabled" value="<c:out value="${animal.proprietario.nome}" /> (CPF: <c:out value="${animal.proprietario.cpf}" />)" />
	            		 		
	            		 	</div>
	            		 </div>
	            		 
	            		 <div id="botoesControle" class="form-group">
	            		 	<!-- Botoes para edicao ou troca de dono -->
	            		 	<label for="full_name_id" class="control-label col-sm-3" id="prontuario"></label>
	            		 	<div class="col-sm-9">
	            		 		<button class="btn-cadastro" id="btn-editarProprietario" type="button"><span class="glyphicon glyphicon-pencil"></span> Editar dados do dono</button> <button class="btn-cadastro" id="btn-trocarProprietario" type="button"><span class="glyphicon glyphicon-plus"></span> Novo dono</button>
	            		 		
	            		 		
	            		 	</div>
	            		 </div>
	            	 </div>
            	
            	<div id="box-dadosEndereco" style="display:none;">
					<div class="form-group">
		              <!--Nome do(a) dono(a) -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Nome do(a) dono(a):</label>
		              <div class="col-sm-9">
		                <input type="text" class="form-control" id="full_name_id" name="nomeDono" value="<c:out value="${animal.proprietario.nome}" />">
						
		              </div>
		            </div>
		            
					<div class="form-group">
		              <!-- CPF -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">CPF:</label>
		              <div class="col-sm-9">
		                <input type="text" class="form-control" id="full_name_id" name="cpf" value="<c:out value="${animal.proprietario.cpf}" />">
		
		              </div>
		            </div>
		
		            <div class="form-group">
		              <!-- Rua -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Logradouro:</label>
		              <div class="col-sm-9">
		                <input type="text" class="form-control" id="full_name_id" name="logradouro" value="<c:out value="${animal.proprietario.endereco.logradouro}" />">
		
		              </div>
		            </div>
		            
		            <div class="form-group">
		              <!-- Complemento -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Complemento:</label>
		              <div class="col-sm-9">
		                <input type="text" class="form-control" id="full_name_id" name="complemento" value="<c:out value="${animal.proprietario.endereco.complemento}" />">
		
		              </div>
		            </div>
		            
		            <div class="form-group">
		              <!-- Cidade -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Cidade:</label>
		              <div class="col-sm-9">
		                <input type="text" class="form-control" id="full_name_id" name="cidade" value="<c:out value="${animal.proprietario.endereco.cidade}" />">
		
		              </div>
		            </div>
		            
		            <div class="form-group">
		              <!-- UF -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">UF:</label>
		              <div class="col-sm-9">          
						<select class="form-control" id="full_name_id" name="uf">
							<c:choose>
								<c:when test="${animal.proprietario.endereco.uf eq 'AC' }">
									<option value="AC" selected="selected">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'AL' }">
								    <option value="AC">Acre</option>
								    <option value="AL" selected="selected">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'AP' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP" selected="selected">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'AM' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM" selected="selected">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'BA' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA" selected="selected">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'CE' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE" selected="selected">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'DF' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF" selected="selected">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'ES' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES" selected="selected">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'GO' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO" selected="selected">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'MA' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA" selected="selected">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'MT' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT" selected="selected">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'MS' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS" selected="selected">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'MG' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG" selected="selected">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>					
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'PA' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA" selected="selected">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'PB' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB" selected="selected">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'PR' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR" selected="selected">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'PE' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE" selected="selected">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'PI' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI" selected="selected">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'RN' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN" selected="selected">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'RS' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS" selected="selected">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'RO' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO" selected="selected">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'RR' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR" selected="selected">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'SC' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC" selected="selected">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'SP' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP" selected="selected">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'SE' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE" selected="selected">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'TO' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
								    <option value="SE">Sergipe</option>
									<option value="TO" selected="selected">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:when>
								<c:when test="${animal.proprietario.endereco.uf eq 'ET' }">
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
								    <option value="SE">Sergipe</option>
								    <option value="TO">Tocantins</option>
									<option value="ET" selected="selected">Estrangeiro</option>
								</c:when>
								<c:otherwise>
								    <option value="AC">Acre</option>
								    <option value="AL">Alagoas</option>
								    <option value="AP">Amapá</option>
								    <option value="AM">Amazonas</option>
								    <option value="BA">Bahia</option>
								    <option value="CE">Ceará</option>
								    <option value="DF">Distrito Federal</option>
								    <option value="ES">Espírito Santo</option>
								    <option value="GO">Goiás</option>
								    <option value="MA">Maranhão</option>
								    <option value="MT">Mato Grosso</option>
								    <option value="MS">Mato Grosso do Sul</option>
								    <option value="MG">Minas Gerais</option>
								    <option value="PA">Pará</option>
								    <option value="PB">Paraíba</option>
								    <option value="PR">Paraná</option>
								    <option value="PE">Pernambuco</option>
								    <option value="PI">Piauí</option>
								    <option value="RJ" selected="selected">Rio de Janeiro</option>
								    <option value="RN">Rio Grande do Norte</option>
								    <option value="RS">Rio Grande do Sul</option>
								    <option value="RO">Rondônia</option>
								    <option value="RR">Roraima</option>
								    <option value="SC">Santa Catarina</option>
								    <option value="SP">São Paulo</option>
									<option value="SE">Sergipe</option>
									<option value="TO">Tocantins</option>
									<option value="ET">Estrangeiro</option>
								</c:otherwise>
							</c:choose>
		
						</select>
		
		              </div>
		            </div>
		            
		            <div class="form-group">
		              <!-- CEP -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">CEP:</label>
		              <div class="col-sm-9">
		                <input type="text" class="form-control" id="full_name_id" name="cep"  value="<c:out value="${animal.proprietario.endereco.cep}" />">
		
		              </div>
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
		                <select class="form-control" id="full_name_id" name="idMembro">
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
		              <!-- Nome do(a) professor(a) responsável -->
		              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Professor responsável:</label>
		              <div class="col-sm-9">
		                <select class="form-control" id="full_name_id" name="idMembro">
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
              <!-- Prescrição -->
              <label for="full_name_id" class="control-label col-sm-3" id="prontuario">Prescrições:</label>
              <div class="col-sm-9">
                <textarea class="form-control" cols="40" id="message" name="prescricoes" rows="5"></textarea>

              </div>
            </div>

            <div class="form-group">
              <!-- Retorno do paciente -->
              <label class="control-label col-sm-3" id="prontuario">Retorno?</label>
              <div class="col-sm-9">
                <div class="radio">

                  <label class="radio-inline">
                  <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" value="y"  id="yesCheck">Sim
                </label>

                  <label class="radio-inline">
                  <input type="radio" onclick="javascript:yesnoCheck();" name="yesno" value = "n" checked id="noCheck">Não
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
