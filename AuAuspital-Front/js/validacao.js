/*Função para validar o form da página de cadastro de novos animais*/

function validateForm() {

    var nomePet = document.forms["formCadastro"]["nomePet"].value;
    if (nomePet == "") {
        alert("Preencha o nome do animal.");
        return false;
    }

    var especie = document.forms["formCadastro"]["especie"].value;
    if (especie == "") {
        alert("Preencha a espécie do animal.");
        return false;
    }

    var idadePet = document.forms["formCadastro"]["idadePet"].value;
    if (idadePet == "") {
        alert("Preencha a idade do animal.");
        return false;
    }

    var corPet = document.forms["formCadastro"]["corPet"].value;
    if (corPet == "") {
        alert("Preencha a cor do animal.");
        return false;
    }

    var nomeDono = document.forms["formCadastro"]["nomeDono"].value;
    if (nomeDono == "") {
        alert("Preencha o nome do(a) dono(a).");
        return false;
    }

    var cpf = document.forms["formCadastro"]["cpf"].value;
    if (cpf == "") {
        alert("Preencha o cpf.");
        return false;
    }

    var nomeAluno = document.forms["formCadastro"]["nomeAluno"].value;
    if (nomeAluno == "") {
        alert("Preencha o nome do(a) aluno(a) responsável.");
        return false;
    }

    var matriculaAluno = document.forms["formCadastro"]["matriculaAluno"].value;
    if (matriculaAluno == "") {
        alert("Preencha a matrícula do(a) aluno(a) responsável.");
        return false;
    }

    var nomeProf = document.forms["formCadastro"]["nomeProf"].value;
    if (nomeProf == "") {
        alert("Preencha o nome do(a) professor(a) responsável.");
        return false;
    }

    var matriculaProf = document.forms["formCadastro"]["matriculaProf"].value;
    if (matriculaProf == "") {
        alert("Preencha a matrícula do(a) professor(a) responsável.");
        return false;
    }

    var motivo = document.forms["formCadastro"]["motivo"].value;
    if (motivo == "") {
        alert("Preencha o motivo do atendimento.");
        return false;
    }

    if (document.getElementById("yesCheck").checked == true) {
      var dataRetorno = document.forms["formCadastro"]["dataRetorno"].value;
      if (dataRetorno == "") {
          alert("Preencha a data de retorno.");
          return false;
      }
     }

}


/*Função para validar o form da página de login*/

function validateForm2(){

  var cpf = document.forms["formLogin"]["cpf"].value;
  if (cpf == "") {
      alert("Preencha o cpf.");
      return false;
  }

  var senha = document.forms["formLogin"]["senha"].value;
  if (senha == "") {
      alert("Preencha a senha.");
      return false;
  }

}

/*Função para validar o form da página de prontuários por animal e animais com retorno próximo*/
function validateForm3(){
var busca = document.forms["formBusca"]["busca"].value;
if (busca == "") {
    alert("Preencha o campo de busca.");
    return false;
}
}


/*Função para validar o form da página atendimento*/
function validateForm4(){

  if (document.getElementById("petChecked").checked == true) {
    var busca = document.forms["formBusca"]["busca"].value;
    if (busca == "") {
        alert("Preencha o nome do animal.");
        return false;
    }
    }

    else if (document.getElementById("cpfChecked").checked == true) {
      var busca = document.forms["formBusca"]["busca"].value;
      if (busca == "") {
          alert("Preencha o cpf.");
          return false;
      }
    }
   }
