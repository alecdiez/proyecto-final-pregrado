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

        if (fechaDesde == '' || fechaHasta == '') {
            alert('Recuerde ingresar las fechas para generar los Mapas!!');
        } else {
            parent.$('#fDesde').val(fechaDesde);
            parent.$('#fHasta').val(fechaHasta);
            open();
        }

    });
});

function open() {

    var href = "MapasGeneral.jsp?fDesde=" + parent.$('#fDesde').val() + "&fHasta=" + parent.$('#fHasta').val();

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
