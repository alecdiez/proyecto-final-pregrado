/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $("#altaPersona").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 400,
        'height': 250
    });
    $("#bajaPersona").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 600,
        'height': 350
    });
    $("#modificaPersona").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 600,
        'height': 350
    });
    $("#modificaUnaPersona").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 600,
        'height': 350
    });
    $("#altaPrivilegio").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 400,
        'height': 250
    });
    $("#bajaPrivilegio").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 600,
        'height': 350
    });
    $("#asignaPrivilegio").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 600,
        'height': 350
    });
    $("#generaMapa").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 800,
        'height': 500
    });
    $("#visualizaGraficos").fancybox({
        'padding': 5,
        'overlayShow': false,
        'closeClick': true,
        'mouseWheel': true,
        'type': 'iframe',
        'width': 1000,
        'height': 500
    });
});

function abreMapa(mapaId) {
    window.open('MuestraMapa.jsp?mapaId=' + mapaId + '', '', 'height=700,width=1100,left=200,top=50,scrollbars=1');
}

function exportaInfo(mapaId) {
    $.get('com.ExportaInfo', {mapaId: mapaId}, function (responseText) {
        window.open(responseText);
    });

}
