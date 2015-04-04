<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 3</title>
</head>
<body>
	<div align="center">
		<h1>AO1 - Actividad N° 3</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad3.jpg">

	<div align="center">

		<form name="form1" id="form1" action="Resultado.jsp" method="post">
			<div align="center">
				<h1>Ingrese los datos del Producto (max 10)</h1>
			</div>
			<table name="tabla" id="tabla">
				<thead>
					<th>Descripcion del Producto</th>
					<th>Precio Unitario</th>
					<th>Cantidad</th>
					<th>Bonificacion</th>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="9">
						<tr>
							<td><input type="text" style="text-align: right"
								name="des${i}" id="des${i}"></td>
							<td><input type="text" style="text-align: right"
								name="pre${i}" id="pre${i}"
								onKeyPress="return soloNumeros(event)"></td>
							<td><input type="text" style="text-align: right"
								name="cant${i}" id="cant${i}"
								onKeyPress="return soloNumeros(event)"></td>
							<td><input type="text" style="text-align: right"
								name="bon${i}" id="bon${i}"
								onKeyPress="return soloNumeros(event)"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<input type="button" onclick="enviaTabla()"
				value="Mostrar Resultados">
		</form>

	</div>
</body>
<script type="text/javascript">
	// Solo permite ingresar numeros.
	function soloNumeros(e) {
		var key = window.Event ? e.which : e.keyCode
		return (key >= 48 && key <= 57)
	}

	function enviaTabla() {
		var filas = new Array(10);
		for (i = 0; i < 9; i++) {

			var des = document.getElementById("des" + i).value;
			var pre = document.getElementById("pre" + i).value;
			var cant = document.getElementById("cant" + i).value;
			var bon = document.getElementById("bon" + i).value;
			filas[i] = des + "_" + pre + "_" + cant + "_" + bon;
		}

		var input = document.createElement("INPUT");
		input.type = 'hidden';
		input.value = filas;
		input.name = "filas";
		form1.appendChild(input);
		document.getElementById("form1").submit();
	}
</script>
</html>