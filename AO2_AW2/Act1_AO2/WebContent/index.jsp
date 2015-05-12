<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 1 AO2</title>
</head>
<body>
	<h1>Actividad N° 1 - AO2</h1>
	<img alt="actividad1" src="act1.jpg">

<div align="center">
<h2>
	<script type="text/javascript">
		function cargar(elementos) {
			var f;
			for (f = 0; f < elementos.length; f++) {
				var v;
				v = prompt('Ingrese un numero:', '');
				elementos[f] = parseInt(v);
			}
		}

		function resultados(elementos) {
			var total = 0;
			var f;
			for (f = 0; f < elementos.length; f++) {
				total = total + elementos[f];
			}			
			document.write('La suma es :' + total+'<br>');
			var totalMayor36 = 0;
			var cantMayor50 = 0;
			for (var i = 0; i < elementos.length; i++) {
				if(elementos[i]>36){
				totalMayor36 = totalMayor36 + elementos[i];
				}
				if(elementos[i]>50){
					cantMayor50++;
			    }
			}
			
			document.write('La suma de los valores Mayores a 36 es :' + totalMayor36+'<br>');
			document.write('La cantidad de valores Mayores a 50 es :' + cantMayor50+'<br>');
		}
		
		var elemento;
		elementos = new Array(10);
		cargar(elementos);
		resultados(elementos);
	</script>
</h2>
</div>

</body>
</html>