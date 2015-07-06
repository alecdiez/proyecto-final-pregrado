/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
   $('#guardaPersona').click(function () {
      var nom = $('#nom').val();
      var ape = $('#ape').val();
      var dni = $('#dni').val();
      var usr = $('#usr').val();
      var pass = $('#pass').val();

      if (nom == '' | ape == '' | usr == '' | pass == '') {
         alert('Recuerde completar los datos Obligatorios!!');
      } else {
         alert('aca llamamos a ajax')
      }


   });
});

function soloNumeros(e) {
   var key = window.Event ? e.which : e.keyCode
   return (key >= 48 && key <= 57)
}