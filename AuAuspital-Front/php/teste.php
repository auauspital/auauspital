<?php
require "header.php";
require "footer.php";
 ?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="utf-8">
  <!--===============================================================================================-->
  <meta name="viewport" content="initial-scale=1">
  <!--===============================================================================================-->
  <title>Retorno - TESTE</title>
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="../css/prontuario.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="../css/estilo.css">

</head>
<body>

  <div id="titulos">
    <h4>Prontuários por animal</h4>
  </div>


  <div class="row">
    <div class="column4">

  </div>


    <div class="column3">

      <div class="bordaTop2"><h4 style=" font-size: 20px; padding-top:20px;">Busque pelo nome do animal:</h4></div>
        <div class="bordaTop"><img src="../imagens/icones/gatinho.png" alt="gatinho" width=120 height=120></div>

      <!--Esse input é onde a pessoa vai digitar o nome do animal que deseja procurar o prontuario-->
      <input id="nomeAnimal" type="text" class="form-control" name="nomeAnimal" placeholder="Digite o nome do animal">
      <!--Divirta-se com seu query por aki, acho q vai ter q colocar um action ai no input de cima-->
      <div class="push"style="height:20px;"></div>
      <div class="table-overflow"><!--Div para colocar barra de rolagem na tabela-->
      <table class="table table-bordered table-hover"> <!--Criando a tabela-->
        <thead class="thead-light">  <!-- Estrutura/cabeçalho da tabela, "primeira linha" -->
          <tr style="font: 13px avenir !important;color: #707070 !important;">
            <th>Nome</th>
            <th>Tipo de animal</th>
            <th>Nome do dono(a)</th>
            <th>Data do Retorno</th>
          </tr>
        </thead> <!-- fim da estrutura/cabeçalho da tabela -->
        <tbody style="font: 13px avenirLight !important;color: #707070 !important;"> <!-- Começo da parte com dados da tabela-->

          <tr> <!-- Aqui provavelmente entrar um forech das linha da tabela, não sei como escreve-->
            <td>Alvin</td> <!-- Aqui provavelmente entra o forech dos ""nomes""-->
            <td>Joaninha</td> <!-- Aqui provavelmente entra o forech dos ""Tipo de animal""-->
            <td>Ferb</td> <!-- Aqui provavelmente entra o forech dos ""Nome do dono(a)""-->
            <td>10/12/18</td> <!-- Aqui provavelmente entra o forech dos ""CPF do dono(a)""-->
          </tr>


                                                  <!--Aqui sera retirado-->

                  <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>Alvin</td>
            <td>Joaninha</td>
            <td>Ferb</td>
            <td>10/12/18</td>
          </tr>
                 <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>Alvin</td>
            <td>Joaninha</td>
            <td>Ferb</td>
            <td>10/12/18</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>Alvin</td>
            <td>Joaninha</td>
            <td>Ferb</td>
            <td>10/12/18</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>Alvin</td>
            <td>Joaninha</td>
            <td>Ferb</td>
            <td>10/12/18</td>
          </tr>
                <!--Repitindo linha apenas para visualização antes de entrar a parte do back-->
          <tr>
            <td>Alvin</td>
            <td>Joaninha</td>
            <td>Ferb</td>
            <td>10/12/18</td>
          </tr>
                      <!--Retirado até aqui, fé-->
        </tbody>
      </table>
      </div>

      <br><br>


        <div class="push"style="height:100px;"></div>

    </div>

    <div class="column4">

    </div>

  </div>

  <!-- Adicionando as bibliotecas do bootstrap, jquary, javascript e icone-->
  <script src="https://unpkg.com/ionicons@4.1.2/dist/ionicons.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

  </body>
  </html>
