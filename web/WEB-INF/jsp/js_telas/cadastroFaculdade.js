function Faculdade() {
    Faculdade.faculdadeId;
    Faculdade.nome;
    Faculdade.cep;
    Faculdade.endereco;
    Faculdade.complemento;
    Faculdade.cidade;
    Faculdade.estado;
    Faculdade.email;
    Faculdade.senha;
    Faculdade.telefone;
    Faculdade.diretor;
    Faculdade.informacoes;
}

function atualizarFaculdade() {

    var faculdade = new Faculdade();
    faculdade.nome = $('#nome').val();
    faculdade.cidade = $('#cidade').val();
    faculdade.complemento = $('#complemento').val();
    faculdade.endereco = $('#endereco').val();
    faculdade.diretor = $('#diretor').val();
    faculdade.informacoes = $('#informacoes').val();
    faculdade.telefone = $('#telefone').val();
    faculdade.estado = $('#estado').val();
    faculdade.faculdadeId = $('#faculdadeId').val();
    faculdade.email = $('#email').val();
    faculdade.senha = $('#senha').val();
    faculdade.cep = $('#cep').val();
    var faculdadeJson = JSON.stringify(faculdade);

    atualizaViaAjax(faculdadeJson, 'atualiza-faculdade',
            function () {
                $("#cadastrar").text("Aguarde...");
                $("#cadastrar").prop("disabled", true);
            }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Atualizar");
    }, function (data) {
        criaCaixaMensagem("Dados Atualizados com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/home');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function salvarFaculdade() {

    var faculdade = new Faculdade();
    faculdade.nome = $('#nome').val();
    faculdade.cidade = $('#cidade').val();
    faculdade.complemento = $('#complemento').val();
    faculdade.endereco = $('#endereco').val();
    faculdade.diretor = $('#diretor').val();
    faculdade.informacoes = $('#informacoes').val();
    faculdade.telefone = $('#telefone').val();
    faculdade.estado = $('#estado').val();
    faculdade.email = $('#email').val();
    faculdade.senha = $('#senha').val();
    faculdade.cep = $('#cep').val();
    var faculdadeJson = JSON.stringify(faculdade);

    salvaViaAjax(faculdadeJson, "salva-faculdade", function () {
        $("#cadastrar").text("Aguarde...");
        $("#cadastrar").prop("disabled", true);
    }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Cadastrar");
    }, function (data) {
        criaCaixaMensagem("Dados Salvos com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/home');
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
    

})(jQuery); // end of jQuery name space

