<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 2 AO2</title>
</head>
<body>
	<h1>Actividad N° 2 - AO2</h1>
	<img alt="actividad2" src="act2.jpg">
	<div align="center">
		<h2>
			<script type="text/javascript">
				var cadena = prompt('Ingrese una oracion:', '');
				document.write('La oracion ingresada es: ' + cadena + '<br>');
				var cantMayusculas = 0;
				var cantMinusculas = 0;

				for (var i = 0; i < cadena.length; i++) {
					if (cadena.charAt(i) != ' ') {
						var toUp = cadena.charAt(i).toUpperCase();
						if (cadena.charAt(i) == toUp) {
							cantMayusculas++;
						} else {
							cantMinusculas++;
						}
					}
				}

				if (cantMayusculas == 0) {
					document
							.write('La oracion ingresada no tiene letras mayusculas<br>');
				} else if (cantMinusculas == 0) {
					document
							.write('La oracion ingresada no tiene letras minusculas<br>');
				} else {
					document
							.write('La oracion ingresada es una combinacion de letras minusculas y mayusculas!!!<br>');
				}

				document.write('Letras Mayusculas ingresadas ='
						+ cantMayusculas + '<br>');
				document.write('Letras Minusculas ingresadas ='
						+ cantMinusculas + '<br>');
			</script>
		</h2>
	</div>
</body>
</html>