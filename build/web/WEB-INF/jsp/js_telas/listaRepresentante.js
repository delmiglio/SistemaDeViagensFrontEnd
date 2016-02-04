/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function deletaRepresentante(id) {

    apagaViaAjax('deleta-representante-adm?id=' + id, null, null,
            function (data) {
                criaCaixaMensagem("Sucesso ao Apagar", 4000, "info", null);
                setTimeout(function () {
                    $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-representantes-adm');
                }, 5000);
            }, function (data) {
        criaCaixaMensagem("Ocorreu um Erro, Contate a TI", 4000, "erro", null);
    });
}

function executaModalDelete() {

    $('#modalDeletar').openModal();
}


