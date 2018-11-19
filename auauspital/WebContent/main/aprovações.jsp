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

          <form class="form-horizontal" id='form-cadastro'>

            <div id="table-overflow">
              <div class="list-group">
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
                <a href="#" class="list-group-item list-group-item-action">
                  <h6>Nome: Logan  ||  Tipo de animal: Hamster  ||  Data de cadastro: 05/11/2018  ||  Médico(a) responsável: Alexia </h6>
                </a>
              </div>
            </div>



        </div>
        <br>
        <div id="exibição">
          <h3>Wuthering Heights - Chapter One</h3>
          <p>
            1801. - I have just returned from a visit to my landlord - the solitary neighbour that I shall be troubled with. This is certainly a beautiful country! In all England, I do not believe that I could have fixed on a situation so completely removed from the stir of society. A perfect misanthropist's heaven: and Mr. Heathcliff and I are such a suitable pair to divide the desolation between us. A capital fellow! He little imagined how my heart warmed towards him when I beheld his black eyes withdraw so suspiciously under their brows, as I rode up, and when his fingers sheltered themselves, with a jealous resolution, still further in his waistcoat, as I announced my name.
            </p>
            <p>  'Mr. Heathcliff?' I said.
              </p>
            <p>  A nod was the answer.
              </p>
              <p>'Mr. Lockwood, your new tenant, sir. I do myself the honour of calling as soon as possible after my arrival, to express the hope that I have not inconvenienced you by my perseverance in soliciting the occupation of Thrushcross Grange: I heard yesterday you had had some thoughts - '
                </p>
              <p>'Thrushcross Grange is my own, sir,' he interrupted, wincing. 'I should not allow any one to inconvenience me, if I could hinder it - walk in!'

            <p>  The 'walk in' was uttered with closed teeth, and expressed the sentiment, 'Go to the Deuce:' even the gate over which he leant manifested no sympathising movement to the words; and I think that circumstance determined me to accept the invitation: I felt interested in a man who seemed more exaggeratedly reserved than myself.
                      </p>
        </div>


        <br><br>
        <div id="imagemButton">
          <button type="submit" class="btn btn-form" style="margin-top:0;">Autorizar prontuário</button>
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
