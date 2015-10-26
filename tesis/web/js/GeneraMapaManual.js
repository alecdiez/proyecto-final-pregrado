/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

   $('#generaMapa').click(function () {
      var observa = $('#observa').val();
      creaNuevoMapa(observa);
   });
});


function creaNuevoMapa(observa) {
   jConfirm("¿Desea Generar un nuevo Mapa?", "Nuevo Mapa", function (r) {
      if (r) {
         $.ajax({
            async: true,
            type: "GET",
            dataType: "html",
            cache: false,
            url: "com.RecibeArchivo",
            data: "manual=true&observa=" + observa,
            beforeSend: showLoadingAnimation,
            success: function (result)
            {
               controlResponse(result)
            },
            timeout: 60000
         });
      } else {

      }
   });
}

function showLoadingAnimation() {
   parent.$.fancybox.showActivity();
}

function controlResponse(result) {
   parent.$.fancybox.showActivity();
   parent.$.fancybox.hideActivity();
   alert('Exito, el mapa N° ' + result + ' ha sido creado!!!');

   var href = "ModificaMapa.jsp?mapaId=" + result;

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