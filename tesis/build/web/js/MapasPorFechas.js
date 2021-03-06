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

    $('#mapasPorFechas').click(function () {
        var fechaDesde = $('#fechaDesde').val();
        var fechaHasta = $('#fechaHasta').val();
        var radio = $('input[type="radio"]:checked').val()

        if (fechaDesde == '' || fechaHasta == '') {
            var error = [];
            error[0] = fechaDesde == '' ? 'Fecha Desde -' : ' - ';
            error[1] = fechaHasta == '' ? 'Fecha Hasta' : ' - ';

            alert('Recuerde ingresar las fechas para buscar los Mapas!! - Falta:' + error[0] + '' + error[1]);
        } else {
            parent.$('#fDesde').val(fechaDesde);
            parent.$('#fHasta').val(fechaHasta);
            if (typeof radio === "undefined") {
                radio = '';
            }
            open(radio);
        }
    });
});

function open(radio) {

    var href = "MapasGeneral.jsp?fDesde=" + parent.$('#fDesde').val() + "&fHasta=" + parent.$('#fHasta').val() + "&estado=" + radio;

    parent.$("#mapasGeneral").fancybox({
        'href': href,
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 1000,
        'height': 600
    });

    parent.$("#mapasGeneral").trigger('click');
}
