/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
   $('.Texto').click(function () {
      var perId = $(this).attr('id');
      jConfirm("¿Desea Eliminar a esta Persona", "Elimina Persona", function (r) {
         if (r) {
            $.ajax({
               async: true,
               type: "POST",
               dataType: "html",
               cache: false,
               url: "com.PersonaDAO",
               data: "perId=" + perId + "&condicion=elimina",
               beforeSend: showLoadingAnimation,
               success: controlResponse,
               timeout: 60000
            });
         } else {

         }
      });
   });
});

function showLoadingAnimation() {
   parent.$.fancybox.showActivity();
}

function controlResponse() {
   parent.$.fancybox.showActivity();
   parent.$.fancybox.hideActivity();
   alert('Persona Eliminada Correctamente!!!');
   parent.$("#bajaPersona").trigger('click');
}


