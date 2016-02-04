/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function Festa() {
    Festa.festaId;
    Festa.cep;
    Festa.endereco;
    Festa.complemento;
    Festa.cidade;
    Festa.estado;
    Festa.dataDoEvento;
    Festa.tipoEvento;
    Festa.preco;
    Festa.descricao;
    Festa.foto;
}

function atualizarFesta() {

    var festa = new Festa();
    festa.foto = $('#foto').val();
    festa.cidade = $('#cidade').val();
    festa.complemento = $('#complemento').val();
    festa.dataDoEvento = $("input[name=prefix__dataDoEvento__suffix").val();
    festa.endereco = $('#endereco').val();
    festa.estado = $('#estado').val();
    festa.festaId = $('#festaId').val();
    festa.tipoEvento = $('#tipoEvento').val();
    festa.preco = $('#preco').val();
    festa.descricao = $('#descricao').val();
    festa.cep = $('#cep').val();
    var festaJson = JSON.stringify(festa);

    atualizaViaAjax(festaJson, 'atualiza-festa-adm',
            function () {
                $("#cadastrar").text("Aguarde...");
                $("#cadastrar").prop("disabled", true);
            }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Atualizar");
    }, function (data) {
        criaCaixaMensagem("Dados Atualizados com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-festas');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function salvarFesta() {

    var festa = new Festa();
    festa.cidade = $('#cidade').val();
    festa.complemento = $('#complemento').val();
    festa.dataDoEvento = $("input[name=prefix__dataDoEvento__suffix").val();
    festa.endereco = $('#endereco').val();
    festa.estado = $('#estado').val();
    festa.tipoEvento = $('#tipoEvento').val();
    festa.preco = $('#preco').val();
    festa.descricao = $('#descricao').val();
    festa.cep = $('#cep').val();
    var festaJson = JSON.stringify(festa);

    salvaViaAjax(festaJson, "salva-festa-adm", function () {
        $("#cadastrar").text("Aguarde...");
        $("#cadastrar").prop("disabled", true);
    }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Cadastrar");
    }, function (data) {
        criaCaixaMensagem("Dados Salvos com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-festas');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });

}

function inserirImagemFesta() {

    var festa = new Festa();
    festa.cidade = $('#cidade').val();
    festa.festaId = $('#festaId').val();
    festa.complemento = $('#complemento').val();
    festa.dataDoEvento = $("input[name=prefix__dataDoEvento__suffix").val();
    festa.endereco = $('#endereco').val();
    festa.estado = $('#estado').val();
    festa.tipoEvento = $('#tipoEvento').val();
    festa.preco = $('#preco').val();
    festa.descricao = $('#descricao').val();
    festa.cep = $('#cep').val();
    festa.foto = $('#foto').val();
    var festaJson = JSON.stringify(festa);
    $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/cadastro-imagem-festa-adm?dados=' + festaJson);
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

    $('#fotoSelecionada').change(function () {
        readURL(this);
    });

    $(document).ready(function () {
        $('select').material_select();
    });

})(jQuery); // end of jQuery name space


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imagemSelecionada').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
    else {
        var img = input.value;
        $(input).next().attr('src', img);
    }
}






