/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function ($) {

    $(document).ready(function () {
        $('select').material_select();
    });

    $('#fotoSelecionada').change(function () {
        readURL(this);
    });

})(jQuery); // end of jQuery name space

function Viagem() {
    Viagem.viagemId;
    Viagem.origem;
    Viagem.destino;
    Viagem.dataIda;
    Viagem.dataVolta;
    Viagem.vooComEscala;
    Viagem.preco;
    Viagem.hotel;
    Viagem.descricao;
    Viagem.foto;
}


function atualizarViagem() {

    var viagem = new Viagem();
    viagem.dataIda = $("input[name=prefix__dataIda__suffix]").val();
    viagem.dataVolta = $("input[name=prefix__dataVolta__suffix]").val();
    viagem.descricao = $('#descricao').val();
    viagem.preco = $('#preco').val();
    viagem.hotel = $('#hotel').val();
    viagem.vooComEscala = $('#vooComEscala').val();
    viagem.foto = $('#foto').val();
    viagem.origem = $('#origem').val();
    viagem.destino = $('#destino').val();
    viagem.viagemId = $('#viagemId').val();
    var jsonViagem = JSON.stringify(viagem);

    atualizaViaAjax(jsonViagem, 'atualiza-viagem-adm',
            function () {
                $("#cadastrar").text("Aguarde...");
                $("#cadastrar").prop("disabled", true);
            }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Atualizar");
    }, function (data) {
        criaCaixaMensagem("Dados Atualizados com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-viagens');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function salvarViagem() {

    var viagem = new Viagem();
    viagem.dataIda = $("input[name=prefix__dataIda__suffix]").val();
    viagem.dataVolta = $("input[name=prefix__dataVolta__suffix]").val();
    viagem.descricao = $('#descricao').val();
    viagem.preco = $('#preco').val();
    viagem.hotel = $('#hotel').val();
    viagem.vooComEscala = $('#vooComEscala').val();
    viagem.foto = $('#foto').val();
    viagem.origem = $('#origem').val();
    viagem.destino = $('#destino').val();
    var jsonViagem = JSON.stringify(viagem);

    salvaViaAjax(jsonViagem, "salva-viagem-adm", function () {
        $("#cadastrar").text("Aguarde...");
        $("#cadastrar").prop("disabled", true);
    }, function (data) {
        $("#cadastrar").prop("disabled", false);
        $("#cadastrar").text("Cadastrar");
    }, function (data) {
        criaCaixaMensagem("Dados Salvos com Sucesso", 4000, "info", null);
        setTimeout(function () {
            $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-viagens');
        }, 5000);
    }, function (data) {
        criaCaixaMensagem("Dados Invalidos, Verifique os Campos", 4000, "info", null);
    });
}

function inserirImagemViagem() {

    var viagem = new Viagem();
    viagem.viagemId = $('#viagemId').val();
    viagem.dataIda = $("input[name=prefix__dataIda__suffix]").val();
    viagem.dataVolta = $("input[name=prefix__dataVolta__suffix]").val();
    viagem.descricao = $('#descricao').val();
    viagem.preco = $('#preco').val();
    viagem.hotel = $('#hotel').val();
    viagem.vooComEscala = $('#vooComEscala').val();
    viagem.foto = $('#foto').val();
    viagem.origem = $('#origem').val();
    viagem.destino = $('#destino').val();
    var jsonViagem = JSON.stringify(viagem);
    $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/cadastro-imagem-viagem-adm?dados=' + jsonViagem);

}


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
