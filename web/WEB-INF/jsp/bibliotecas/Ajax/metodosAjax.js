/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// Busca CEP EM API EXTERNA
function buscaCep(cep, promiseSuccess, promiseError) {
    $.ajax({
        url: "http://viacep.com.br/ws/" + cep + "/json/",
        type: 'GET',
        dataType: 'json', 
        success: promiseSuccess,
        error: promiseError
    });

}

//Salva Qualquer Objeto Via Ajax
function salvaViaAjax(objeto, url, funcaoAntesDeEnviar,
        funcaoAoCompletar, funcaoSucesso, funcaoErro) {
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'JSON',
        data: "dados="+objeto,
        beforeSend: funcaoAntesDeEnviar,
        success: funcaoSucesso,
        error: funcaoErro,
        complete: funcaoAoCompletar
    });
}

// Apaga Qualquer Registro Via Ajax
function apagaViaAjax(url, funcaoAntesDeEnviar, funcaoAoCompletar, funcaoSucesso, funcaoErro) {
    $.ajax({
        url: url,
        type: 'GET',
        beforeSend: funcaoAntesDeEnviar,
        success: funcaoSucesso,
        error: funcaoErro,
        complete: funcaoAoCompletar
    });
}

// Atualiza Qualquer Registro Via Ajax
function atualizaViaAjax(objeto, url, funcaoAntesDeEnviar,
        funcaoAoCompletar, funcaoSucesso, funcaoErro) {
   
    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'JSON',
        data: "dados="+objeto,
        beforeSend: funcaoAntesDeEnviar,
        success: funcaoSucesso,
        error: funcaoErro,
        complete: funcaoAoCompletar
    });
}

function imagensViaAjax(objeto, url, funcaoAntesDeEnviar,
        funcaoAoCompletar, funcaoSucesso, funcaoErro){
    
    $.ajax({
        url: url,
        type: 'GET',
        dataType: 'JSON',
        data: "dados="+objeto,
        beforeSend: funcaoAntesDeEnviar,
        success: funcaoSucesso,
        error: funcaoErro,
        complete: funcaoAoCompletar
    });
}




