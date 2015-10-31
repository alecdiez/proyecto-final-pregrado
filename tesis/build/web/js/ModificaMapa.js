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
        if ($('#mapaMarkerId').val() == '') {
            guardaNuevoMarker();
        } else {
            guardaMarker();
        }

    });

    $('#imgCancela').click(function () {
        limpiaCombos();
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

    $('#mapaMarkerEstado').change(function ()
    {
        var option = $(this).find('option:selected').val();

        if (option == 'CERRADO') {
            alert('Recuerde que si Guarda el Marker con el estado Cerrado no se podrá Editar!!!');
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

    if (mapaMarkerCliNomApe != ''
            && mapaMarkerDireccion != ''
            && mapaMarkerCiudad != ''
            && mapaMarkerVenta != ''
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
                        alert('Marker N° ' + responseText + ' creado con éxito!!');
                        var href = "ModificaMapa.jsp?mapaId=" + mapaId + "&observa=" + mapaMarkerObserva;
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
        var error = [];
        error[0] = mapaMarkerCliNomApe != '' ? 'NO' : 'Nombre y Apellido';
        error[1] = mapaMarkerDireccion != '' ? 'NO' : 'Dirección';
        error[2] = mapaMarkerCiudad != '' ? 'NO' : 'Ciudad';
        error[3] = mapaMarkerProvincia != '' ? 'NO' : 'Provincia';
        error[4] = mapaMarkerVenta != '' ? 'NO' : 'Monto de la Venta';

        var alerta = '';

        for (var i = 0; i < error.length; i++) {
            if (error[i] != 'NO') {
                if (i == error.length - 1) {
                    alerta = alerta + error[i];
                } else {
                    alerta = alerta + error[i] + ' - ';
                }
            }
        }


        alert('Recuerde Ingresar todos los campos requeridos - Falta: ' + alerta);
    }
}

function editaMarker(markerId) {

    $('#mapaMarkerId').val(markerId);
    $('#mapaMarkerCliNomApe').val($('#mapaMarkerCliNomApe' + markerId).html());
    $('#mapaMarkerCliNomApe').val($('#mapaMarkerCliNomApe' + markerId).html());
    $('#mapaMarkerDireccion').val($('#mapaMarkerDireccion' + markerId).html());
    $('#mapaMarkerCiudad').val($('#mapaMarkerCiudad' + markerId).html());
    $('#mapaMarkerProvincia').val($('#mapaMarkerProvincia' + markerId).html());
    $('#mapaMarkerLat').val($('#mapaMarkerLat' + markerId).html());
    $('#mapaMarkerLong').val($('#mapaMarkerLong' + markerId).html());
    $('#mapaMarkerVenta').val($('#mapaMarkerVenta' + markerId).html());
    $('#mapaMarkerEntrega').val($('#mapaMarkerEntrega' + markerId).html().trim());
    $('#mapaMarkerObserva').val($('#mapaMarkerObserva' + markerId).html());
    $('#mapaMarkerEstado').val($('#mapaMarkerEstado' + markerId).html());
}

function limpiaCombos() {
    $('#mapaMarkerId').val('');
    $('#mapaMarkerCliNomApe').val('');
    $('#mapaMarkerCliNomApe').val('');
    $('#mapaMarkerDireccion').val('');
    $('#mapaMarkerCiudad').val('');
    $('#mapaMarkerProvincia').val('');
    $('#mapaMarkerLat').val('');
    $('#mapaMarkerLong').val('');
    $('#mapaMarkerVenta').val('');
    $('#mapaMarkerEntrega').val('SI');
    $('#mapaMarkerObserva').val('');
    $('#mapaMarkerEstado').val('ABIERTO');
}


function guardaMarker() {

    var mapaId = $('#mapaId').val();
    var mapaMarkerId = $('#mapaMarkerId').val();
    var mapaMarkerCliNomApe = $('#mapaMarkerCliNomApe').val();
    var mapaMarkerDireccion = $('#mapaMarkerDireccion').val();
    var mapaMarkerCiudad = $('#mapaMarkerCiudad').val();
    var mapaMarkerProvincia = $('#mapaMarkerProvincia').val();
    var mapaMarkerLat = $('#mapaMarkerLat').val();
    var mapaMarkerLong = $('#mapaMarkerLong').val();
    var mapaMarkerVenta = $('#mapaMarkerVenta').val();
    var mapaMarkerEntrega = $('#mapaMarkerEntrega').val();
    var mapaMarkerObserva = $('#mapaMarkerObserva').val();
    var mapaMarkerEstado = $('#mapaMarkerEstado').val();

    if (mapaMarkerEntrega == 'SI') {
        mapaMarkerEntrega = 'S';
    } else {
        mapaMarkerEntrega = 'N';
    }

    if (mapaMarkerEstado == 'ABIERTO') {
        mapaMarkerEstado = 1;
    } else {
        mapaMarkerEstado = 0;
    }

    if (mapaId != ''
            && mapaMarkerCliNomApe != ''
            && mapaMarkerDireccion != ''
            && mapaMarkerCiudad != ''
            && mapaMarkerVenta != ''
            && mapaMarkerProvincia != '') {

        jConfirm("¿Desea Editar el Marker N° " + mapaMarkerId + " ?", "Guarda Marker", function (r) {

            if (r) {
                $.get('com.MapaDAO', {mapaId: mapaId,
                    mapaMarkerId: mapaMarkerId,
                    mapaMarkerCliNomApe: mapaMarkerCliNomApe,
                    mapaMarkerDireccion: mapaMarkerDireccion,
                    mapaMarkerCiudad: mapaMarkerCiudad,
                    mapaMarkerProvincia: mapaMarkerProvincia,
                    mapaMarkerLat: mapaMarkerLat,
                    mapaMarkerLong: mapaMarkerLong,
                    mapaMarkerVenta: mapaMarkerVenta,
                    mapaMarkerEntrega: mapaMarkerEntrega,
                    mapaMarkerObserva: mapaMarkerObserva,
                    mapaMarkerEstado: mapaMarkerEstado}, function (responseText) {

                    if (responseText != 0) {
                        alert('Marker N° ' + responseText + ' guardado con éxito!!');
                        var href = "ModificaMapa.jsp?mapaId=" + mapaId + "&observa=" + mapaMarkerObserva;
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
                        alert('Error al Modificar el Marker');
                    }
                });
            } else {

            }
        });
    } else {
        alert('Recuerde Ingresar todos los campos requeridos');
    }
}

function abreMapa(mapaId) {
    window.open('MuestraMapa.jsp?mapaId=' + mapaId + '', '', 'height=700,width=1100,left=200,top=50,scrollbars=1');
}

function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}