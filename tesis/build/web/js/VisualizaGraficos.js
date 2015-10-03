/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var usuario;
var usrId;
var fecha;
var suma;
var cantMapas;
var data1 = [];

google.load("visualization", "1", {packages: ["corechart"]});
google.setOnLoadCallback(dibujarGrafico);

function getValue()
{
    cantMapas = document.getElementById("cantMapas").value;

    for (var i = 0; i < (parseInt(cantMapas) + 1); i++) {

        if (i == 0) {
            data1[i] = ['Suma', 'Total de Ventas en $'];
        } else {
            usuario = document.getElementById("usuario" + i).value;
            usrId = document.getElementById("usrId" + i).value;
            fecha = document.getElementById("fecha" + i).value;
            suma = document.getElementById("suma" + i).value;
            data1[i] = [usuario + ' - Fecha: ' + fecha + '', parseFloat(suma)];
        }
    }
}
function dibujarGrafico() {

    getValue();

    // Tabla de datos: valores y etiquetas de la gráfica
    var data = google.visualization.arrayToDataTable(data1);
    var options = {
        title: 'Graficos Comparativo de Total de Ventas por Fecha  - \n\
            Entre los días (' + document.getElementById('fDes').value + ' y ' + document.getElementById('fHas').value + ')'
    }
// Dibujar el gráfico
    new google.visualization.ColumnChart(
            //ColumnChart sería el tipo de gráfico a dibujar
            document.getElementById('GraficoGoogleChart-ejemplo-1')
            ).draw(data, options);
}