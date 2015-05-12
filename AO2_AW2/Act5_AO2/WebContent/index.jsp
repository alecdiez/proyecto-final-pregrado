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
	<div align="center">
		<h2>
			<script type="text/javascript">
				var cadena = prompt('Ingrese una Cadena de Texto:', '');
				var primeraMitad = '';
				var arrayCaracteres = new Array(cadena.length);
				for (var i = 0; i < cadena.length; i++) {
					if (i < (cadena.length / 2)) {
						primeraMitad = primeraMitad + cadena.charAt(i);
					}
					arrayCaracteres[i] = cadena.charAt(i);
				}
				document.write('La primera mitad del String ingresado es ... '
						+ primeraMitad + '<br>');

				document
						.write('El último caracter del String ingresado es ... '
								+ cadena.charAt((cadena.length - 1)) + '<br>');
				for (var i = 0; i < cadena.length; i++) {
					if (i < (cadena.length / 2)) {
						primeraMitad = primeraMitad + cadena.charAt(i);
					}
				}
				var inversa = arrayCaracteres.reverse();

				document.write('El String impreso inversamente es ... '
						+ inversa + '<br>');

				document.write('Cada Caracter entre guiones  ... ');
				for (var i = 0; i < cadena.length; i++) {
					if (i != cadena.length - 1) {
						document.write(cadena.charAt(i) + ' - ');
					} else {
						document.write(cadena.charAt(i));
					}
				}
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
						+ cantVocales + '<br>');
			</script>
		</h2>
	</div>

</body>
</html>