<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 3 AO2</title>
</head>
<body>
	<h1>Actividad N° 3 - AO2</h1>
	<img alt="actividad3" src="act3.jpg">
	<div align="center">
		<h2>
			<script type="text/javascript">
				var ingreso;
				var cont = 0;
				while (ingreso != 'FIN') {
					var nombre = prompt('Ingrese un Nombre:', '');
					ingreso = nombre.toUpperCase();
					if (nombre.length != 0) {
						cont++;
					}
				}

				document.write('La cantidad de Nombres ingresados es : '
						+ (cont - 1) + '<br>');
			</script>
		</h2>
	</div>

</body>
</html>