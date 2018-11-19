/*Isso é para o formulário de cadastro dos animais, quando a pessoa seleciona
 sim para o retorno, aparece o input para colocar a data, e quando não o input some*/


function yesnoCheck() {
    if (document.getElementById('yesCheck').checked) {
        document.getElementById('ifYes').style.display = 'block';
    }
    else document.getElementById('ifYes').style.display = 'none';

}
