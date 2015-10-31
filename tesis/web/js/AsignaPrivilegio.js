/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    /*$('.TextoGrande').click(function () {
     
     $('.TextoGrande').each(function (i) {
     if ($(this).hasClass('highlight')) {
     $(this).removeClass('highlight');
     }
     });
     
     $(this).toggleClass('highlight');
     buscaPrivilegios($(this).attr('id'));
     });*/

    buscaPrivilegios($('.TextoGrande').attr('id'));
    $('.TextoGrande').toggleClass('highlight');

    $('#asigPrivi').click(function () {
        asignaPrivilegios();
    });
});

function buscaPrivilegios(perId) {

    $.get('com.PrivilegioDAO', {perId: perId, condicion: "getPrivilegios"}, function (responseText) {
        var priviIds = responseText.split('_');

        $('.TextoTituloGris').each(function (j) {
            $(this).attr('checked', false);
            for (var i = 0; i < priviIds.length; i++) {
                if ($(this).attr('id') == 'privi' + (priviIds[i].trim())) {
                    $(this).attr('checked', true);
                }
            }
        });

    });
}

function asignaPrivilegios() {

    var perId = '';
    $('.highlight').each(function (j) {
        perId = $(this).attr('id');
    });

    var priviIds = [];

    $('.TextoTituloGris').each(function (j) {

        if ($(this).is(':checkbox')) {
            if ($(this).attr('checked')) {
                var id = $(this).attr('id');
                if (id.indexOf("privi") != -1) {
                    priviIds[j] = id;
                }
            }
        }

    });


    if (perId == '') {
        alert('Recuerde Seleccionar a una Persona!!');
    } else {
        jConfirm("¿Desea Continuar", "Asignar Privilegios", function (r) {
            if (r) {
                $.ajax({
                    async: true,
                    type: "GET",
                    dataType: "html",
                    cache: false,
                    url: "com.PrivilegioDAO",
                    data: "perId=" + perId + "&priviIds=" + priviIds + "&condicion=asigna",
                    beforeSend: showLoadingAnimation,
                    success: controlResponse,
                    timeout: 60000
                });
            } else {

            }
        });
    }
}

function showLoadingAnimation() {
    parent.$.fancybox.showActivity();
}

function controlResponse() {
    parent.$.fancybox.showActivity();
    parent.$.fancybox.hideActivity();
    alert('Privilegios Asignados Correctamente!!!');
    parent.$("#asignaPrivilegio").trigger('click');
}


