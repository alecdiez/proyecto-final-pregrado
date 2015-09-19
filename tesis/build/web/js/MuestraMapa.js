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
var marker;
var contentString = [];
var map;
var count=0;

$(document).ready(function () {
    google.maps.event.addDomListener(window, 'load', initialize);
    cantMarkers = $('#cantMarkers').val();
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

        geocoder.geocode({'address': direc + ' ' + ciudad}, function geocodeResult(results, status) {
            
            if (status == 'OK') {                
                var markerOptions = {position: results[0].geometry.location}
                marker = new google.maps.Marker(markerOptions);
                marker.setMap(map);
                bindInfoWindow(marker,count);

            } else {
                // En caso de no haber resultados o que haya ocurrido un error
                // lanzamos un mensaje con el error
                alert("Geocoding no tuvo éxito debido a: " + status);
            }
            count++;
        });
    }
}



function bindInfoWindow(marker,position) {
        
        var content=contentString[position];
        
        var infowindow = new google.maps.InfoWindow({
            content: content,
        });
        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
        });
   
}

