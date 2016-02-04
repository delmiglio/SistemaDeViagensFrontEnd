/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Usuario() {
    Usuario.pessoaId;
    Usuario.nome;
    Usuario.rg;
    Usuario.cpf;
    Usuario.email;
    Usuario.cep;
    Usuario.endereco;
    Usuario.complemento;
    Usuario.cidade;
    Usuario.estado;
    Usuario.dataNascimento;
    Usuario.telefone;
    Usuario.celular;
    Usuario.senha;
    Usuario.nivelPermissao;
}

(function ($) {

    $('#acessar').click(function () {
        
        var usuario = new Usuario();
        usuario.email = $('#email').val();
        usuario.senha = $('#senha').val();
        var usuarioJson = JSON.stringify(usuario);
        salvaViaAjax(usuarioJson, "acesso-usuario?ckSalvaLogin=" + $('#ckSalvaLogin').val(), function () {
            $("#acessar").text("Aguarde...");
            $("#acessar").prop("disabled", true);
        }, function () {
             $("#acessar").text("Efetuar login");
            $("#acessar").prop("disabled", false);
        }, function (data) {
           $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/home');
        }, function (data) {
            criaCaixaMensagem("Usuário e/ou Senha Invalidos", 4000, "info", null);
        });
    });

})(jQuery); // end of jQuery name space


