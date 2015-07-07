/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    $('.Texto').click(function () {
        var priviId = $(this).attr('id');
        jConfirm("¿Desea Eliminar este Privilegio", "Elimina Privilegio", function (r) {
            if (r) {
                $.ajax({
                    async: true,
                    type: "POST",
                    dataType: "html",
                    cache: false,
                    url: "com.PrivilegioDAO",
                    data: "priviId=" + priviId + "&condicion=elimina",
                    beforeSend: showLoadingAnimation,
                    success: controlResponse,
                    timeout: 60000
                });
            } else {

            }
        });
    });
});

function showLoadingAnimation() {
    parent.$.fancybox.showActivity();
}

function controlResponse() {
    parent.$.fancybox.showActivity();
    parent.$.fancybox.hideActivity();
    alert('Privilegio Eliminado Correctamente!!!');
    parent.$("#bajaPrivilegio").trigger('click');
}