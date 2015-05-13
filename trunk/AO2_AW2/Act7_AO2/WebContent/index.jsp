<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad N° 7 AO2</title>
</head>
<body>
	<h1>Actividad N° 7 - AO2</h1>
	<img alt="actividad7" src="act7.jpg">
	<form name="form1" action="index.jsp">
		<div align="center">

			Procesador:<select id="sel1">
				<option value="400">Intel I3 u$s 400</option>
				<option value="600">Intel I5 u$s 600</option>
				<option value="800">Intel I7 u$s 800</option>
			</select>&nbsp;&nbsp;&nbsp; Monitor:<select id="sel2">
				<option value="150">Samsung 20' - u$s 150</option>
				<option value="250">Samsung 22' - u$s 250></option>
				<option value="300">Samsung 26' - u$s 300</option>
			</select>&nbsp;&nbsp;&nbsp; Disco Duro:<select id="sel3">
				<option value="100">500 Gb - u$s 100</option>
				<option value="140">1 Tb - u$s 140</option>
				<option value="200">3 Tb - u$s 200</option>
			</select>&nbsp;&nbsp;&nbsp;<input type="button" onClick="mostrar()"
				value="Mostrar Presupuesto"> <br> <br>El Resultado
			del Presupuesto es....: <input type="text" name="result" id="result">
		</div>
	</form>
</body>
<script type="text/javascript">
	function mostrar() {
		var sel1 = document.getElementById("sel1");
		var valor1 = sel1.options[sel1.selectedIndex].value;

		var sel2 = document.getElementById("sel2");
		var valor2 = sel2.options[sel2.selectedIndex].value;

		var sel3 = document.getElementById("sel3");
		var valor3 = sel3.options[sel3.selectedIndex].value;

		document.getElementById("result").value = 'U$S '
				+ (parseInt(valor1) + parseInt(valor2) + parseInt(valor3));

	}
</script>
</html>