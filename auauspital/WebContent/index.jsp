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
<title>AuAuspital</title>
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/auauspital/src/css/estilo.css">
<!--===============================================================================================-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->
<script src="/auauspital/src/js/validacao.js"></script>
<!--===============================================================================================-->


</head>

<body>

	<section class="intro">
		<row>
		<div class="col-lg-6 col-sm-12 painel-esquerdo">
			<div class="wrapper">
				<img src="/auauspital/src/imagens/logo.png">
			</div>
		</div>
		<div class="col-lg-6 col-sm-12 painel-direito">

			<div class="icon-login">
				<img src="/auauspital/src/imagens/icones/estetoscopio.png">
			</div>
			<div class="main">
				<div class="texto-login">
					<h4>Entre e registre seus prontuários!</h4>
				</div>

				<form name="formLogin" action="processadorlogin" method="post">
					<div class="lable">
						<div class="col_1_of_2 span_1_of_2">
							<input type="text" class="text" placeholder="CPF"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'cpf';}" name="cpf">
						</div>

						<div class="clear"></div>
					</div>
					<div class="lable-2">
						<input type="password" class="text" placeholder="Senha"
							onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = 'Password ';}"
							name="senha">

					</div>

					<ul style="float: right !important; list-style-type: none;">
						<li><button class="login-link" name="Submit" type="submit"
							value="Submit" onclick=" return validateForm2();">Login<span
								class="glyphicon glyphicon-log-in"></span></button></li>
					</ul>
				</form>
			</div>
		</div>
		</row>
	</section>


</body>



</html>
