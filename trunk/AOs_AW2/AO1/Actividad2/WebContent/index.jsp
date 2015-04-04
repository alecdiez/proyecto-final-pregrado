<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 2</title>
</head>
<body>
	<div align="center">
		<h1>AO1 - Actividad N° 2</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad2.jpg">
	<div align="center">

		<form action="Resultado.jsp">
			<div align="center">
				<h1>Ingrese un número del 1 al 10</h1>
			</div>
			Ingrese el Número:<input type="text" style="text-align: right"
				name="numero" onKeyPress="return soloNumeros(event)">&nbsp;&nbsp;&nbsp; <br> <br> <input
				type="submit" value="Mostrar Tabla entera">

		</form>

	</div>
</body>
<script type="text/javascript">
	// Solo permite ingresar numeros.
	function soloNumeros(e) {
		var key = window.Event ? e.which : e.keyCode
		return (key >= 48 && key <= 57)
	}
</script>
</html>