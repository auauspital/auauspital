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
  <title>Prontuários por animal</title>
  <!--===============================================================================================-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="../css/prontuario.css">
  <!--===============================================================================================-->
  <link rel="stylesheet" href="../css/estilo.css">
  <!--===============================================================================================-->
  <script src="../js/validacao.js"></script>
  <!--===============================================================================================-->

</head>
<body>

  <div id="titulos">
    <h4>Prontuários por animal</h4>
  </div>


  <div class="row">
    <div class="column4">

  </div>


    <div class="column3" style="margin-top:-45px;">
      <div class="bordaTop2"><h4 style=" font-size: 25px; padding-top:50px;">Busque pelo nome do animal:</h4></div>
        <div class="bordaTop"><img src="../imagens/icones/veterinarian.png" alt="gatinho" width=120 height=120></div>




      <div class="form-group">

        <form class="form-horizontal" id='form-cadastro' name="formBusca" action="/action_page.php" onsubmit="return validateForm3()" method="post">

          <input  type="text" class="form-control" name="busca" placeholder="Digite o nome do animal" style="border-radius:2px;">
          <br>
          <div style="height:50px;">
            <button type="submit"class="btn btn-form" value="Submit" style="margin-top:0!important; float: left!important;">Buscar animal</button>
          </div >
          <div class="table-overflow">
            <div class="list-group">
              <a href="#" class="list-group-item list-group-item-action">

                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia</h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">

                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">

                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">

                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">
                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">
                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">
                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
              <a href="#" class="list-group-item list-group-item-action">
                <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
              </a>
            </div>
          </div>



      </div>
      <br>
      <div id="exibição">

          <!--Aqui vai abrir o prontuario, pode fazer sua querry aki meu lindo-->
          <h3>A Idade de ser feliz</h3>
          <p>
            Uma só idade para a gente se encantar com a vida
            e viver apaixonadamente
            e desfrutar tudo com toda intensidade
            sem medo nem culpa de sentir prazer
  </p>
        <p> Fase dourada em que a gente pode criar e recriar a vida
            à nossa própria imagem e semelhança
            e sorrir e cantar e brincar e dançar
            e vestir-se com todas as cores
            e entregar-se a todos os amores
            experimentando a vida em todos os seus sabores
            sem preconceito ou pudor
  </p>
          <p>  Tempo de entusiasmo e de coragem
            em que todo desafio é mais um convite à luta
            que a gente enfrenta com toda a disposição de tentar algo novo,
            de novo e de novo, e quantas vezes for preciso
              </p>
          <p>  Essa idade, tão fugaz na vida da gente,
            chama-se presente,
            e tem apenas a duração do instante que passa ...
            ... doce pássaro do aqui e agora
            que quando se dá por ele já partiu para nunca mais!
          </p>

          <p>
            Uma só idade para a gente se encantar com a vida
            e viver apaixonadamente
            e desfrutar tudo com toda intensidade
            sem medo nem culpa de sentir prazer
  </p>
        <p> Fase dourada em que a gente pode criar e recriar a vida
            à nossa própria imagem e semelhança
            e sorrir e cantar e brincar e dançar
            e vestir-se com todas as cores
            e entregar-se a todos os amores
            experimentando a vida em todos os seus sabores
            sem preconceito ou pudor
  </p>
          <p>  Tempo de entusiasmo e de coragem
            em que todo desafio é mais um convite à luta
            que a gente enfrenta com toda a disposição de tentar algo novo,
            de novo e de novo, e quantas vezes for preciso
              </p>
          <p>  Essa idade, tão fugaz na vida da gente,
            chama-se presente,
            e tem apenas a duração do instante que passa ...
            ... doce pássaro do aqui e agora
            que quando se dá por ele já partiu para nunca mais!
          </p>


      </div>


      <br><br>


        <div class="push"style="height:100px;"></div>
    </div>

    </form>
    <div class="column4" ></div>
  </div>

  <!-- Adicionando as bibliotecas do bootstrap, jquary, javascript e icone-->
  <script src="https://unpkg.com/ionicons@4.1.2/dist/ionicons.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>

  </body>
  </html>
