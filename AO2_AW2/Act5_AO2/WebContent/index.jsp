<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 5 AO2</title>
</head>
<body>
	<h1>Actividad N° 5 - AO2</h1>
	<img alt="actividad5" src="act5.jpg">
	<form action="index.jsp">

		Ingrese una Cadena de Texto:<input type="text"
			style="text-align: right" name="cadena" id="cadena">
		&nbsp;&nbsp;&nbsp; <br>
		<input type="radio" name="operacion" id="a" checked>Imprimir
		la primera mitad de caracteres de la cadena&nbsp;&nbsp; <br>
		<input type="radio" name="operacion" id="b">Imprimir el ultimo
		caracter&nbsp;&nbsp; <br>
		<input type="radio" name="operacion" id="c">Imprimir la cadena
		inversa&nbsp;&nbsp; <br>
		<input type="radio" name="operacion" id="d">Imprimir cada
		caracter del string separado por un guión&nbsp;&nbsp; <br>
		<input type="radio" name="operacion" id="e">Imprimir la
		cantidad de vocales almacenadas&nbsp;&nbsp; <br> <br> <input
			type="button" value="Mostrar Resultados" onClick="mostrar()">

	</form>

	<script type="text/javascript">
		function mostrar() {

			var cadena = document.getElementById('cadena').value;
			//document.write('La cadena ingresada es: '+cadena1);
			if (document.getElementById('a').checked) {
				var primeraMitad = '';
				var arrayCaracteres = new Array(cadena.length);
				for (var i = 0; i < cadena.length; i++) {
					if (i < (cadena.length / 2)) {
						primeraMitad = primeraMitad + cadena.charAt(i);
					}
					arrayCaracteres[i] = cadena.charAt(i);
				}				
				document.write('La primera mitad del String ingresado es ... '
						+ primeraMitad + '<br><a href=\"index.jsp\">Regresar</a>');
			}
			if (document.getElementById('b').checked) {
				document
						.write('El último caracter del String ingresado es ... '
								+ cadena.charAt((cadena.length - 1)) + '<br><a href=\"index.jsp\">Regresar</a>');
			}

			if (document.getElementById('c').checked) {
				//var primeraMitad = '';
				var arrayCaracteres = new Array(cadena.length);
				for (var i = 0; i < cadena.length; i++) {
					
					arrayCaracteres[i] = cadena.charAt(i);
				}
				var inversa = arrayCaracteres.reverse();
				document.write('El String impreso inversamente es ... '
						+ inversa + '<br><a href=\"index.jsp\">Regresar</a>');
			}
			if (document.getElementById('d').checked) {
				document.write('Cada Caracter entre guiones  ... <br><a href=\"index.jsp\">Regresar</a>');
				for (var i = 0; i < cadena.length; i++) {
					if (i != cadena.length - 1) {
						document.write(cadena.charAt(i) + ' - ');
					} else {
						document.write(cadena.charAt(i));
					}
				}
			}

			if (document.getElementById('e').checked) {
				document.write('<br>');
				var cantVocales = 0;
				for (var i = 0; i < cadena.length; i++) {
					if ((cadena.charAt(i) == "a") || (cadena.charAt(i) == "A")
							|| (cadena.charAt(i) == "e")
							|| (cadena.charAt(i) == "E")
							|| (cadena.charAt(i) == "i")
							|| (cadena.charAt(i) == "I")
							|| (cadena.charAt(i) == "o")
							|| (cadena.charAt(i) == "O")
							|| (cadena.charAt(i) == "u")
							|| (cadena.charAt(i) == "U")) {
						cantVocales++;
					}
				}

				document.write('La cantidad de vocales encontradas es ... '
						+ cantVocales + '<br><br><a href=\"index.jsp\">Regresar</a>');
			}
			
		}
		
		
	</script>
</body>


</html>