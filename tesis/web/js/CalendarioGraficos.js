/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: '<Ant',
        nextText: 'Sig>',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);

    $("#fechaDesde").datepicker();
    $("#fechaHasta").datepicker();

    $('#generaGraficos').click(function () {
        var fechaDesde = $('#fechaDesde').val();
        var fechaHasta = $('#fechaHasta').val();
        var cantMax = $('#cantMax').val();

        if (fechaDesde == '' || fechaHasta == '' || cantMax == '') {
            var error = [];
            error[0] = fechaDesde == '' ? 'Fecha Desde -' : ' - ';
            error[1] = fechaHasta == '' ? 'Fecha Hasta -' : ' - ';
            error[2] = cantMax == '' ? 'Cantidad Maxima' : '';

            alert('Recuerde ingresar los datos Requeridos!! - ' + error[0] + '' + error[1] + '' + error[2]);
        } else {
            parent.$('#fDesde').val(fechaDesde);
            parent.$('#fHasta').val(fechaHasta);
            open(cantMax);
        }

    });
});

function open(cantMax) {

    var href = "VisualizaGraficos.jsp?fDesde=" + parent.$('#fDesde').val() + "&fHasta=" + parent.$('#fHasta').val() + "&cantMax=" + cantMax;

    parent.$("#visualizaGraficos").fancybox({
        'href': href,
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 1000,
        'height': 600
    });

    parent.$("#visualizaGraficos").trigger('click');
}

function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}
