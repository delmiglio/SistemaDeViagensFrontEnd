function Turma() {
    Turma.turmaId;
    Turma.quantidadeAlunos;
    Turma.serie;
    Turma.descricao;

}

function atualizarTurma() {

    var turma = new Turma();
    turma.turmaId = $('#turmaId').val();
    turma.quantidadeAlunos = $('#quantidadeAlunos').val();
    turma.serie = $('#serie').val();
    turma.email = $('#email').val();
    turma.descricao = $('#descricao').val();
    var turmaJson = JSON.stringify(turma);
    atualizaViaAjax(turmaJson, 'atualiza-turma-adm',
            function () {
                $("#cadastrar").text("Aguarde...");
                $("#cadastrar").prop("disabled", true);
            }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Atualizar");
    }, function (data) {
        criaCaixaMensagem("Dados Atualizados com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-turmas');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function salvarTurma() {

    var turma = new Turma();
    turma.quantidadeAlunos = $('#quantidadeAlunos').val();
    turma.serie = $('#serie').val();
    turma.email = $('#email').val();
    turma.descricao = $('#descricao').val();
    var turmaJson = JSON.stringify(turma);

    salvaViaAjax(turmaJson, "salva-turma-adm", function () {
        $("#cadastrar").text("Aguarde...");
        $("#cadastrar").prop("disabled", true);
    }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Cadastrar");
    }, function (data) {
        criaCaixaMensagem("Dados Salvos com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-turmas');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });

}
(function ($) {


    $(document).ready(function () {
        $('select').material_select();
    });



})(jQuery); // end of jQuery name space



