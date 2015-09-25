/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var cantMarkers;
var markerId;
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
var activeWindow;
var geocoder;
var latLng;
var count = 0;

$(document).ready(function () {
   google.maps.event.addDomListener(window, 'load', initialize);
   cantMarkers = $('#cantMarkers').val();
});

function initialize() {

   var mapOptions = {
      center: {lat: -31.411311, lng: -64.191514},
      zoom: 13
   };
   map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
   geocoder = new google.maps.Geocoder();
   finalizaOperacion();
}

function finalizaOperacion() {

   for (var i = 0; i < cantMarkers; i++) {
      markerId = $('#MarkerId' + (i + 1)).val();
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

   for (var i = 0; i < direcciones.length; i++) {
      resuleveLatLng(direcciones[i], i, function (ll, pos) {

         var split = ll.split(',');
         var markerToMap = new google.maps.Marker({
            position: {lat: parseFloat(split[0]), lng: parseFloat(split[1])},
            map: map,
            title: 'Lat: ' + split[0] + ' | Long: ' + split[1]
         });

         var infowindow = new google.maps.InfoWindow({});
         bindInfoWindow(markerToMap, infowindow, contentString[pos], split[0], split[1]);

      });
   }
}

function resuleveLatLng(direc, pos, callback) {

   $.getJSON('http://maps.googleapis.com/maps/api/geocode/json?address=' + direc + '&sensor=false', null, function (data) {
      var p = data.results[0].geometry.location
      var latLng = new google.maps.LatLng(p.lat, p.lng);
      if (typeof callback == 'function') {
         callback(p.lat + ',' + p.lng, pos);
      }
   });


}

function bindInfoWindow(marker, infowindow, contentString, lat, lng) {

   google.maps.event.addListener(marker, 'click', function () {
      if (activeWindow != null)
         activeWindow.close();

      contentString = contentString + "Latitud: " + lat + "<br>Longitud: " + lng

      infowindow.close(map, marker);
      infowindow.setContent(contentString);
      infowindow.open(map, marker);
      activeWindow = infowindow;
   });

   google.maps.event.addListener(infowindow, 'domready', function () {
   });
}