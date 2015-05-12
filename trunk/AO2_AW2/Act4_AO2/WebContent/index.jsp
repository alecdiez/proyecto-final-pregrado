<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 4 AO2</title>
</head>
<body>
	<h1>Actividad N° 4 - AO2</h1>
	<img alt="actividad4" src="act4.jpg">
	<div align="center">
		<h2>
			<script type="text/javascript">
				var cadena = prompt('Ingrese una Cadena de Texto:', '');
				if(cadena.length!=0){
					document.write(palindromo(cadena));
				}else{
					document.write('Recuede ingresar una Cadena de Texto');
				}
				

				function palindromo(cadena) {

					var resultado = "La cadena \"" + cadena + "\" \n";

					var cadenaOriginal = cadena.toLowerCase();

					var letrasEspacios = cadenaOriginal.split("");

					var cadenaSinEspacios = "";
					for (i in letrasEspacios) {
						if (letrasEspacios[i] != " ") {
							cadenaSinEspacios += letrasEspacios[i];
						}
					}

					var letras = cadenaSinEspacios.split("");
					var letrasReves = cadenaSinEspacios.split("").reverse();

					var iguales = true;
					for (i in letras) {
						if (letras[i] == letrasReves[i]) {

						} else {
							iguales = false;
						}
					}

					if (iguales) {
						resultado += " es un palíndromo!!!";
					} else {
						resultado += " no es un palíndromo!!!!";
					}

					return resultado;
				}
			</script>
		</h2>
	</div>


</body>
</html>