/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    google.maps.event.addDomListener(window, 'load', initialize);

});
var map;
function initialize() {


    var mapOptions = {
        center: {lat: -31.411311, lng: -64.191514},
        zoom: 13
    };
    map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);

    //setMarkers(-31.411311, -64.191514,map);  

    
    
    var geocoder = new google.maps.Geocoder();
    
    var address1 = 'la pampa 1468 cordoba';
    var address2 = 'pedro isnardi 4250 cordoba';
    for(var i=0;i<2;i++){
       if(i==0){
           geocoder.geocode({'address': address1}, geocodeResult);
       }else{
           geocoder.geocode({'address': address2}, geocodeResult);
       }
        
    }
    

}

function geocodeResult(results, status) {
    // Verificamos el estatus

    if (status == 'OK') {

        var markerOptions = {position: results[0].geometry.location}
        var marker = new google.maps.Marker(markerOptions);
        marker.setMap(map);

        var contentString = '<div id="content">' +
                '<div id="siteNotice">' +
                '</div>' +
                '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
                '<div id="bodyContent">' +
                '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
                'sandstone rock formation in the southern part of the ' +
                'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) ' +
                'south west of the nearest large town, Alice Springs; 450&#160;km ' +
                '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major ' +
                'features of the Uluru - Kata Tjuta National Park. Uluru is ' +
                'sacred to the Pitjantjatjara and Yankunytjatjara, the ' +
                'Aboriginal people of the area. It has many springs, waterholes, ' +
                'rock caves and ancient paintings. Uluru is listed as a World ' +
                'Heritage Site.</p>' +
                '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
                'https://en.wikipedia.org/w/index.php?title=Uluru</a> ' +
                '(last visited June 22, 2009).</p>' +
                '</div>' +
                '</div>';

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        google.maps.event.addListener(marker, 'click', function () {
            infowindow.open(map, marker);
        });
    } else {
        // En caso de no haber resultados o que haya ocurrido un error
        // lanzamos un mensaje con el error
        alert("Geocoding no tuvo éxito debido a: " + status);
    }
}