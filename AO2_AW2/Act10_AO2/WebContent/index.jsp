<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 10 AO2</title>
</head>
<body>
	<h1>Actividad N° 10 - AO2</h1>
	<img alt="actividad10" src="act10.jpg">
	<form name="form1" action="index.jsp">
		<div align="center">
			<h2>
				<script type="text/javascript">
					var ingreso;
					var cont = 0;
					var enteros = [];
					while (ingreso != 'FIN') {
						var nombre = prompt(
								'Ingrese un Número entero, para finalizar ingrese FIN:',
								'');
						enteros[cont] = ingreso;
						ingreso = nombre.toUpperCase();
						cont++;
					}
					document
							.write('El mayor valor de los numeros ingresados es..... : '
									+ mayor(enteros));
					function mayor(array) {

						var mayor = 0;
						for (var i = 0; i < array.length; i++) {
							if (parseInt(array[i]) > mayor) {
								mayor = array[i];
							}
						}

						return mayor;
					}
				</script>
			</h2>
		</div>

	</form>
</body>
</html>