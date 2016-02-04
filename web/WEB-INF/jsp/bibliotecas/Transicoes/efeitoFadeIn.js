/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function efeitoAguarde() {
    var loading = "<div id='loading' style='position:fixed;display:none;top:0;left:0;bottom:0;right:0;background:rgba(0,0,0,0.5);z-index:9999999;'>";
    loading += "</div>";
    $("body").append(loading);
    $("#loading").fadeIn(0);
}

function removeEfeitoAguarde() {
    $("#loading").fadeOut(1000, function () {
        $("#loading").remove();
    });
}

(function ($) {


})(jQuery); // end of jQuery name space

