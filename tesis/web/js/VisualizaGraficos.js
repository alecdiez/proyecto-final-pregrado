/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var cantMapas;
var usuario;

$(document).ready(function () {
   cantMapas = $('#cantMapas').val();

   for (var i = 0; i < cantMapas; i++) {
      usuario = $('#usuario' + (i + 1)).val();
      if (i != 0) {
         if (usuario != $('#usuario' + (i)).val()) {

         }
      } else {

      }

   }

   if (cantMapas >= 1) {
       generaGrafico();
   } else {
      alert('No Existen datos Comparables!!');
   }

});

var p={'data1':'x1'};
var s1=['x1', 10, 30, 45, 50, 70, 100];
var s2= [ 'data1', 30, 200, 100, 400, 150, 250];
function generaGrafico(){
   var chart = c3.generate({
         data: {
            xs: p,
            columns: [
               s1,s2
            ]
         }
      });
}

