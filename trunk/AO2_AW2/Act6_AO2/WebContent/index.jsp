<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 6 AO2</title>
</head>
<body>
	<h1>Actividad N° 6 - AO2</h1>
	<img alt="actividad6" src="act6.jpg">
	<form name="form1" action="index.jsp">
		<div align="center">
			Ingrese Primer Nombre:<input type="text" name="nom1" id="nom1">&nbsp;&nbsp;&nbsp;
			Ingrese Primer Apellido:<input type="text" name="ape1" id="ape1">&nbsp;&nbsp;&nbsp;
			Ingrese Edad:<input type="text" name="edad1" id="edad1"
				onKeyPress="return soloNumeros(event)"> <br> <br>
			<br> Ingrese Segundo Nombre:<input type="text" name="nom2"
				id="nom2">&nbsp;&nbsp;&nbsp; Ingrese Segundo Apellido:<input
				type="text" name="ape2" id="ape2">&nbsp;&nbsp;&nbsp; Ingrese
			Edad:<input type="text" name="edad2" id="edad2"
				onKeyPress="return soloNumeros(event)"> <br> <br>
			<br> <input type="button" onClick="mostrar()" value="Mostrar">
		</div>
	</form>
	<script type="text/javascript">
		function mostrar() {
			var edad1 = document.getElementById('edad1').value;
			var edad2 = document.getElementById('edad2').value;
			var nom1 = document.getElementById('nom1').value;
			var ape1 = document.getElementById('ape1').value;
			var nom2 = document.getElementById('nom2').value;
			var ape2 = document.getElementById('ape2').value;

			if (edad1 > edad2) {
				alert('La persona de Mayor edad es....' + nom1 + ' ' + ape1);
			} else if (edad1 < edad2) {
				alert('La persona de Mayor edad es....' + nom2 + ' ' + ape2);
			} else {
				alert('Las personas tienen la misma edad ...' + nom1 + ' '
						+ ape1 + ' ---- ' + nom2 + ' ' + ape2);
			}
			form1.submit();
		}

		function soloNumeros(e) {
			var key = window.Event ? e.which : e.keyCode
			return (key >= 48 && key <= 57)
		}
	</script>

</body>
</html>