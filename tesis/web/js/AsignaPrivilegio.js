/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

   $('.TextoGrande').click(function () {

      $('.TextoGrande').each(function (i) {
         if ($(this).hasClass('highlight')) {
            $(this).removeClass('highlight');
         }
      });

      $(this).toggleClass('highlight');
      buscaPrivilegios($(this).attr('id'));
   });

});

function buscaPrivilegios(perId) {

   $.get('com.PrivilegioDAO', {perId: perId, condicion: "getPrivilegios"}, function (responseText) {
      var priviIds = responseText.split('_');

      $('.TextoGrande').each(function (j) {
         $(this).attr('checked', false);
         for (var i = 0; i < priviIds.length; i++) {
            if ($(this).attr('id') == 'privi' + (priviIds[i].trim())) {
               $(this).attr('checked', true);
            }
         }
      });

   });
}


