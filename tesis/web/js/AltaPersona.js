/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
   $('#guardaPersona').click(function () {
           alert('entramos');
   });
});

function soloNumeros(e) {
   var key = window.Event ? e.which : e.keyCode
   return (key >= 48 && key <= 57)
}