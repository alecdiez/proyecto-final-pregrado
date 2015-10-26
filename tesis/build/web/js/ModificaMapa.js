/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

   $('#imgObserva').click(function () {
      var observa = $('#observa').val();
      var mapaId = $('#mapaId').val();
      $.get('com.ServletUtil', {observa: observa, mapaId: mapaId}, function (responseText) {
         alert('Observaciones modificadas con éxito!!');
         $('#imgObserva').val(responseText);
      });
   });

});
