/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    $('#generaGraficos').click(function () {

        var cantMax = $('#cantMax').val();
        var min = $('#min').val();
        var max = $('#max').val();
        var radio = $('input[type="radio"]:checked').val()

        if (min == '' || max == '' || cantMax == '') {
            alert('Recuerde ingresar los datos Requeridos!!');
        } else {
            if (typeof radio === "undefined") {
                radio = '';
            }
            open(cantMax, min, max, radio);
        }
    });
});

function open(cantMax, min, max, radio) {

    var href = "VisGraficosPorVentas.jsp?cantMax=" + cantMax + "&min=" + min + "&max=" + max + "&estado=" + radio;

    parent.$("#visGraficosPorVentas").fancybox({
        'href': href,
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 1000,
        'height': 600
    });

    parent.$("#visGraficosPorVentas").trigger('click');
}

function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}