function Representante() {
    Representante.pessoaId;
    Representante.nome;
    Representante.rg;
    Representante.cpf;
    Representante.email;
    Representante.cep;
    Representante.endereco;
    Representante.complemento;
    Representante.cidade;
    Representante.estado;
    Representante.dataNascimento;
    Representante.telefone;
    Representante.celular;
    Representante.senha;
    Representante.dataDeAdmissao;
    Representante.CTPS;
    Representante.salario;
}

function atualizarRepresentante() {

    var representante = new Representante();
    representante.pessoaId = $('#representanteId').val();
    representante.celular = $('#celular').val();
    representante.cpf = $('#cpf').val();
    representante.email = $('#email').val();
    representante.dataNascimento = $("input[name=prefix__dataNascimento__suffix").val();
    representante.dataDeAdmissao = $("input[name=prefix__dataDeAdmissao__suffix").val();
    representante.endereco = $('#endereco').val();
    representante.senha = $('#senha').val();
    representante.nome = $('#nome').val();
    representante.rg = $('#rg').val();
    representante.telefone = $('#telefone').val();
    representante.cep = $('#cep').val();
    representante.complemento = $('#complemento').val();
    representante.cidade = $('#cidade').val();
    representante.estado = $('#estado').val();
    representante.CTPS = $('#CTPS').val();
    representante.salario = $('#salario').val();
    var representanteJson = JSON.stringify(representante);
    atualizaViaAjax(representanteJson, 'atualiza-representante-adm',
            function () {
                $("#cadastrar").text("Aguarde...");
                $("#cadastrar").prop("disabled", true);
            }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Atualizar");
    }, function (data) {
        criaCaixaMensagem("Dados Atualizados com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-representantes-adm');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function salvarRepresentante() {

    var representante = new Representante();
    representante.celular = $('#celular').val();
    representante.cpf = $('#cpf').val();
    representante.email = $('#email').val();
    representante.dataNascimento = $("input[name=prefix__dataNascimento__suffix").val();
    representante.dataDeAdmissao = $("input[name=prefix__dataDeAdmissao__suffix").val();
    representante.endereco = $('#endereco').val();
    representante.senha = $('#senha').val();
    representante.nome = $('#nome').val();
    representante.rg = $('#rg').val();
    representante.telefone = $('#telefone').val();
    representante.cep = $('#cep').val();
    representante.complemento = $('#complemento').val();
    representante.cidade = $('#cidade').val();
    representante.estado = $('#estado').val();
    representante.CTPS = $('#CTPS').val();
    representante.salario = $('#salario').val();
    var representanteJson = JSON.stringify(representante);

    salvaViaAjax(representanteJson, "salva-representante-adm", function () {
        $("#cadastrar").text("Aguarde...");
        $("#cadastrar").prop("disabled", true);
    }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Cadastrar");
    }, function (data) {
        criaCaixaMensagem("Dados Salvos com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-representantes-adm');
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



