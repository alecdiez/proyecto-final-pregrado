/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var cantMarkers;
var nomApe;
var direc;
var ciudad;
var provincia;
var venta;
var entrega;
var observa;
var markers = [];
var contentString = [];
var direcciones = [];
var map;
var count = 0;
var activeWindow;

$(document).ready(function () {
    google.maps.event.addDomListener(window, 'load', initialize);
    cantMarkers = $('#cantMarkers').val();
    setTimeout(function () {
        finishOperation()
    }, 1500);
});

function initialize() {

    var mapOptions = {
        center: {lat: -31.411311, lng: -64.191514},
        zoom: 13
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

    //setMarkers(-31.411311, -64.191514,map);  
    var geocoder = new google.maps.Geocoder();

    //var address1 = 'la pampa 1468 cordoba';
    //var address2 = 'pedro isnardi 4250 cordoba';

    for (var i = 0; i < cantMarkers; i++) {
        direc = $('#MarkerDireccion' + (i + 1)).val();
        ciudad = $('#MarkerCiudad' + (i + 1)).val();
        nomApe = $('#MarkerCliNomApe' + (i + 1)).val();
        provincia = $('#MarkerProvincia' + (i + 1)).val();
        venta = $('#MarkerVenta' + (i + 1)).val();
        entrega = $('#MarkerEntrega' + (i + 1)).val();
        observa = $('#MarkerObserva' + (i + 1)).val();
        entrega = entrega == 'S' ? 'Entregado' : 'No Entregado';



        contentString[i] = '<div id="content">' +
                '<div id="divisor">' +
                '</div>' +
                '<h1 id="firstHeading" class="firstHeading">Cliente</h1>' +
                '<div id="bodyContent">' +
                '<p><b>' + nomApe + '</b></p><br>' +
                'Dirección: ' + direc + '<br>' +
                'Ciudad: ' + ciudad + '<br>' +
                'Provincia: ' + provincia + '<br>' +
                'Estado: ' + entrega + '<br>' +
                'Monto: ' + venta + '<br>' +
                'Observaciones: ' + observa + '<br>' +
                '</div>' +
                '</div>';

        direcciones[i] = direc + ' ' + ciudad;
    }

    for (var j = 0; j < cantMarkers; j++) {
        geocoder.geocode({'address': direcciones[j]}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });
                markers.push(marker);
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
            count++;
        });
    }
}

function finishOperation() {
   
    for (var x = 0; x < cantMarkers; x++) {
        var infowindow = new google.maps.InfoWindow({});
        bindInfoWindow(markers[x], map, infowindow, contentString[x]);
    }
}

function bindInfoWindow(marker, map, infowindow, contentString) {

    google.maps.event.addListener(marker, 'click', function () {
        if (activeWindow != null)
            activeWindow.close();

        infowindow.close(map, marker);
        infowindow.setContent(contentString);
        infowindow.open(map, marker);
        activeWindow = infowindow;
    });

    google.maps.event.addListener(infowindow, 'domready', function () {
    });
}