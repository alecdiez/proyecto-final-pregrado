/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#guardaPersona').click(function () {
        var nom = $('#nom').val();
        var ape = $('#ape').val();
        var dni = $('#dni').val();
        var usr = $('#usr').val();
        var pass = $('#pass').val();
        var perId = $('#perId').val();

        if (nom == '' | ape == '' | usr == '' | pass == '' | dni == '') {
            alert('Recuerde completar los datos Obligatorios!!');
        } else {
            jConfirm("¿Desea Modificar a esta Persona", "Agrega Persona", function (r) {
                if (r) {
                    $.ajax({
                        async: true,
                        type: "POST",
                        dataType: "html",
                        cache: false,
                        url: "com.PersonaDAO",
                        data: "nom=" + nom + "&ape=" + ape + "&dni=" + dni + "&usr=" + usr + "&pass=" + pass + "&perId=" + perId + "&condicion=modifica",
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

function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}

function showLoadingAnimation() {
    parent.$.fancybox.showActivity();
}

function controlResponse() {
    
    parent.$.fancybox.showActivity();
    $.fancybox.close();
    parent.$.fancybox.hideActivity();    
    alert('Persona Guardada Correctamente!!!');
    parent.$("#modificaPersona").trigger('click');
    parent.$("#modificaUnaPersona").trigger('click');
}


