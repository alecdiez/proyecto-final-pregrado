<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 8 AO2</title>
</head>
<body>
	<h1>Actividad N° 8 - AO2</h1>
	<img alt="actividad8" src="act8.jpg">
	<form name="form1" action="index.jsp">
		<div align="center">

			Ingrese el Nombre del Usuario: <input type="text" name="usr" id="usr"><br>
			<br> Seleccion el/los deportes elegidos...&nbsp;&nbsp;&nbsp; <input
				type="checkbox" id="Futbol" value="Futbol">Futbol&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="Basquet" value="Bsquet">Basquet&nbsp;&nbsp;&nbsp;
			<input type="checkbox" id="Tenis" value="Tenis">Tenis&nbsp;&nbsp;&nbsp;
			<input type="button" onClick="mostrar()" value="Mostrar">

		</div>
	</form>
</body>
<script type="text/javascript">
	function mostrar() {
		var futbol = document.getElementById("Futbol").checked;
		var mostrar = "";
		if (futbol) {
			mostrar = "Futbol";
		}
		var basquet = document.getElementById("Basquet").checked;

		if (basquet) {
			mostrar = mostrar + " Basquet";
		}
		var tenis = document.getElementById("Tenis").checked;

		if (tenis) {
			mostrar = mostrar + " Tenis";
		}

		var usr = document.getElementById("usr").value;

		alert('el usuario ' + usr + ' eligio... ' + mostrar);

	}
</script>
</html>