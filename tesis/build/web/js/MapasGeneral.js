/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var cantMapas = 0;

$(document).ready(function () {
   cantMapas = $('#cantMapas').val();

   if (cantMapas == 0) {
      alert('No existe ningun mapa generado entre las Fechas Seleccionadas!!!');

      parent.$("#verMapasPorFechas").trigger('click');
   }
});

function abreMapa(mapaId) {
   window.open('MuestraMapa.jsp?mapaId=' + mapaId + '', '', 'height=700,width=1100,left=200,top=50,scrollbars=1');
}

function exportaInfo(mapaId) {
   $.get('com.ExportaInfo', {mapaId: mapaId}, function (responseText) {
      window.open(responseText);
   });
}

function editaMapa(mapaId) {
   var href = "ModificaMapa.jsp?mapaId=" + mapaId;

   parent.$("#modificaMapa").fancybox({
      'href': href,
      'padding': 5,
      'overlayShow': false,
      'closeClick': true,
      'mouseWheel': true,
      'type': 'iframe',
      'width': 800,
      'height': 600
   });
   parent.$("#modificaMapa").trigger('click');
}