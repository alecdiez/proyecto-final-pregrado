/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

   $('.TextoTituloGris').click(function () {

      $('.TextoTituloGris').fancybox({
         'padding': 5,
         'overlayShow': false,
         'closeClick': true,
         'mouseWheel': true,
         'type': 'iframe',
         'width': 1000,
         'height': 700
      });

   });

});