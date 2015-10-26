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

   $('#estado').change(function ()
   {
      var option = $(this).find('option:selected').val();

      var rowCount = $('table tr').length;

      if (rowCount == 1) {
         alert('No se Puede Cerrar un Mapa sin Markers!!');
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
            }
         });
      } else {

      }
   });
}