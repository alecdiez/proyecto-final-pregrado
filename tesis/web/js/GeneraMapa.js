/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

   var href = "GeneraMapaManual.jsp";

   $('#generaMapaManual').click(function () {
      parent.$("#generaMapaManual").fancybox({
         'href': href,
         'padding': 5,
         'overlayShow': false,
         'closeClick': true,
         'mouseWheel': true,
         'type': 'iframe',
         'width': 650,
         'height': 300
      });
      parent.$("#generaMapaManual").trigger('click');
   });

   $(".custom-input-file input:file").change(function () {
      $(this).parent().find(".archivo").html($(this).val());
   }).css('border-width', function () {
      if (navigator.appName == "Microsoft Internet Explorer")
         return 0;
   });
});
