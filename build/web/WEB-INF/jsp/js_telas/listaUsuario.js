/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deletaUsuario(id) {
    apagaViaAjax('deleta-usuario-adm?id=' + id, 
            function (data) {
                efeitoAguarde();
            }, function (data) {
                removeEfeitoAguarde();
            },
            function (data) {
                criaCaixaMensagem("Sucesso ao Apagar", 4000, "info", null);
                setTimeout(function () {
                    $(location).attr('href', 'http://localhost:8084/SistemaDeViagensFrontEnd/lista-usuarios-adm');
                }, 5000);
            }, function (data) {
                criaCaixaMensagem("Ocorreu um Erro, Contate a TI", 4000, "erro", null);
                removeEfeitoAguarde();
    });
}

function executaModalDelete() {

    $('#modalDeletar').openModal();
}


