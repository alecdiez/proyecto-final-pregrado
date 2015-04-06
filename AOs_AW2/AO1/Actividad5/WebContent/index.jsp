<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 5</title>
</head>
<body>
	<div align="center">
		<h1>AO1 - Actividad N° 5</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad5.jpg">
	<div align="center">

		<form name="form1" id="form1" action="Resultado.jsp" method="post">
			<div align="center">
				<h1>Ingrese un Parrafo:</h1>
			</div>
			<input type="text" style="text-align: left" size="100" name="parrafo"
				id="parrafo"><br>
			<div align="center">
				<h1>Ingrese una Letra o Palabra a Buscar:</h1>
			</div>
			<input type="text" style="text-align: left" size="20" name="buscar"
				id="buscar"><br>
			<br> <input type="submit" value="Mostrar Resultados">
		</form>
	</div>
</body>
</html>