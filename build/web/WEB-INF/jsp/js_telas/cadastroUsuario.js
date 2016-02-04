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

function atualizarUsuario() {

    var usuario = new Usuario();
    usuario.pessoaId = $('#pessoaId').val();
    usuario.celular = $('#celular').val();
    usuario.cpf = $('#cpf').val();
    usuario.email = $('#email').val();
    usuario.nivelPermissao = $('#nivelPermissao').val();
    usuario.dataNascimento = $("input[name=prefix__dataNascimento__suffix").val();
    usuario.endereco = $('#endereco').val();
    usuario.senha = $('#senha').val();
    usuario.nome = $('#nome').val();
    usuario.rg = $('#rg').val();
    usuario.telefone = $('#telefone').val();
    usuario.cep = $('#cep').val();
    usuario.complemento = $('#complemento').val();
    usuario.cidade = $('#cidade').val();
    usuario.estado = $('#estado').val();
    var usuarioJson = JSON.stringify(usuario);
    atualizaViaAjax(usuarioJson, 'atualiza-usuario-adm',
            function () {
                $("#cadastrar").text("Aguarde...");
                $("#cadastrar").prop("disabled", true);
            }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Atualizar");
    }, function (data) {
        criaCaixaMensagem("Dados Atualizados com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-usuarios-adm');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function salvarUsuario() {

    var usuario = new Usuario();
    usuario.celular = $('#celular').val();
    usuario.cpf = $('#cpf').val();
    usuario.email = $('#email').val();
    usuario.nivelPermissao = $('#nivelPermissao').val();
    usuario.dataNascimento = $("input[name=prefix__dataNascimento__suffix").val();
    usuario.endereco = $('#endereco').val();
    usuario.senha = $('#senha').val();
    usuario.nome = $('#nome').val();
    usuario.rg = $('#rg').val();
    usuario.telefone = $('#telefone').val();
    usuario.cep = $('#cep').val();
    usuario.complemento = $('#complemento').val();
    usuario.cidade = $('#cidade').val();
    usuario.estado = $('#estado').val();
    var usuarioJson = JSON.stringify(usuario);

    salvaViaAjax(usuarioJson, "salva-usuario-adm", function () {
        $("#cadastrar").text("Aguarde...");
        $("#cadastrar").prop("disabled", true);
    }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Cadastrar");
    }, function (data) {
        criaCaixaMensagem("Dados Salvos com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-usuarios-adm');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });

}
(function ($) {


    $("#cep").blur(function () {
        buscaCep($("#cep").val(), function (data) {
            $("#endereco").val(data.logradouro);
            $("#cidade").val(data.localidade);
            $("#estado").val(data.uf);
            $("#complemento").val(data.complemento);
        }, function (error) {
            criaCaixaMensagem("Cep Não Encontrado", 4000, "alerta");
        });
    });

    $(document).ready(function () {
        $('select').material_select();
    });



})(jQuery); // end of jQuery name space



