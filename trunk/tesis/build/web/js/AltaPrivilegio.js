/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#guardaPrivilegio').click(function () {
        var nom = $('#nom').val();

        if (nom == '') {
            alert('Recuerde completar los datos Obligatorios!!');
        } else {
            jConfirm("¿Desea Agregar este Privilegio", "Agrega Privilegio", function (r) {
                if (r) {
                    $.ajax({
                        async: true,
                        type: "POST",
                        dataType: "html",
                        cache: false,
                        url: "com.PrivilegioDAO",
                        data: "nom=" + nom + "&condicion=guarda",
                        beforeSend: showLoadingAnimation,
                        success: controlResponse,
                        timeout: 60000
                    });
                } else {

                }
            });
        }

    });
});

function showLoadingAnimation() {
    parent.$.fancybox.showActivity();
}

function controlResponse() {
    parent.$.fancybox.showActivity();
    parent.$.fancybox.close();
    parent.$.fancybox.hideActivity();
    alert('Privilegio Guardada Correctamente!!!');
}