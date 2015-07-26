/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    google.maps.event.addDomListener(window, 'load', initialize);

});

function initialize() {

    var mapOptions = {
        center: {lat: -31.411311, lng: -64.191514},
        zoom: 12       
    };
    var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
}