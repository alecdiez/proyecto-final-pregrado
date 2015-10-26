/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var mapaId;
$(document).ready(function () {

    $('#imgObserva').click(function () {
        var observa = $('#observa').val();
        mapaId = $('#mapaId').val();
        $.get('com.ServletUtil', {observa: observa, mapaId: mapaId}, function (responseText) {
            alert('Observaciones modificadas con éxito!!');
            $('#imgObserva').val(responseText);
        });
    });

    $('#imgNuevoMarker').click(function () {
        guardaNuevoMarker();
    });

    $('#estado').change(function ()
    {
        var option = $(this).find('option:selected').val();

        var rowCount = $('table tr').length;

        if (rowCount == 2) {
            alert('No se Puede Cerrar un Mapa sin Markers!!');
            $(this).val("ABIERTO");
        } else {
            mapaId = $('#mapaId').val();
            cierraMapa(mapaId);
        }
    });
});


function cierraMapa(mapaId) {
    jConfirm("Rescuerde que si cierra un Mapa ya no lo podrá Editar ¿Desea Cerrarr este Mapa?", "Cierra Mapa", function (r) {

        if (r) {
            $.get('com.ServletUtil', {mapaId: mapaId, cierraMapa: true}, function (responseText) {

                if (responseText == 'bien') {
                    alert('Mapa cerrado con exito con éxito!!');
                    parent.$.fancybox.close();
                } else {
                    alert('Error al Cerrar el Mapa');
                    $('#estado').val("ABIERTO");
                }
            });
        } else {
            $('#estado').val("ABIERTO");
        }
    });
}

function guardaNuevoMarker() {

    var mapaId = $('#mapaId').val();
    var mapaMarkerCliNomApe = $('#mapaMarkerCliNomApe').val();
    var mapaMarkerDireccion = $('#mapaMarkerDireccion').val();
    var mapaMarkerCiudad = $('#mapaMarkerCiudad').val();
    var mapaMarkerProvincia = $('#mapaMarkerProvincia').val();
    var mapaMarkerLat = $('#mapaMarkerLat').val();
    var mapaMarkerLong = $('#mapaMarkerLong').val();
    var mapaMarkerVenta = $('#mapaMarkerVenta').val();
    var mapaMarkerEntrega = $('#mapaMarkerEntrega').val();
    var mapaMarkerObserva = $('#mapaMarkerObserva').val();

    if (mapaMarkerEntrega == 'SI') {
        mapaMarkerEntrega = 'S';
    } else {
        mapaMarkerEntrega = 'N';
    }

    if (mapaId != ''
            && mapaMarkerCliNomApe != ''
            && mapaMarkerDireccion != ''
            && mapaMarkerCiudad != ''
            && mapaMarkerProvincia != '') {

        jConfirm("¿Desea Crear un nuevo Marker?", "Crea Marker", function (r) {

            if (r) {
                $.get('com.MapaDAO', {mapaId: mapaId,
                    mapaMarkerCliNomApe: mapaMarkerCliNomApe,
                    mapaMarkerDireccion: mapaMarkerDireccion,
                    mapaMarkerCiudad: mapaMarkerCiudad,
                    mapaMarkerProvincia: mapaMarkerProvincia,
                    mapaMarkerLat: mapaMarkerLat,
                    mapaMarkerLong: mapaMarkerLong,
                    mapaMarkerVenta: mapaMarkerVenta,
                    mapaMarkerEntrega: mapaMarkerEntrega,
                    mapaMarkerObserva: mapaMarkerObserva}, function (responseText) {

                    if (responseText != 0) {
                        alert('Marker N° ' + responseText + ' cerrado con exito con éxito!!');
                        var href = "ModificaMapa.jsp?mapaId=" + mapaId;
                        parent.$("#modificaMapa").fancybox({
                            'href': href,
                            'padding': 5,
                            'overlayShow': false,
                            'closeClick': true,
                            'mouseWheel': true,
                            'type': 'iframe',
                            'width': 1200,
                            'height': 700
                        });
                        parent.$("#modificaMapa").trigger('click');
                    } else {
                        alert('Error al Crear el Marker');
                    }
                });
            } else {

            }
        });
    } else {

        alert('Recuerde Ingresar todos los campos requeridos');

    }


}