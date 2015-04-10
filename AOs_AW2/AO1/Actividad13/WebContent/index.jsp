<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Tangente.tld" prefix="tangente"%>
<%@ taglib uri="/WEB-INF/tlds/Seno.tld" prefix="seno"%>
<%@ taglib uri="/WEB-INF/tlds/Coseno.tld" prefix="coseno"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Calcular angulo</title>
<%
	String angulo = request.getParameter("angulo");
	angulo = angulo == null ? "" : angulo;
	angulo = angulo.equals("") ? "0" : angulo;
	String operacion = request.getParameter("operacion");
	operacion = operacion == null ? "" : operacion;
%>
</head>
<body>
	<div align="center">
		<h1>AO1 - Actividad N° 13</h1>
	</div>
	<c:set var="angulo" value="<%=Float.parseFloat(angulo)%>" />
	<c:set var="operacion" value="<%=operacion%>" />
	<br>
	<img alt="Enunciado" src="actividad13.jpg">
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Ingrese el angulo por favor!!.</h1>
		</div>
		<div align="center">
			Angulo:<input type="text" style="text-align: right" name="angulo"
				onKeyPress="return soloNumeros(event)">&nbsp;&nbsp;&nbsp; <input
				type="radio" name="operacion" value="seno">Seno&nbsp;&nbsp;
			<input type="radio" name="operacion" value="coseno">Coseno&nbsp;&nbsp;
			<input type="radio" name="operacion" value="tangente">Tangente&nbsp;&nbsp;



			<c:if test="${angulo != 0 }">

				<c:if test="${operacion eq 'tangente' }">

					<br>
					<br>
					<input type="submit" value="Calcular">
					<h1 style="color: red">
						<tangente:Tangente angulo="${angulo}" operacion="${operacion}" />
						<h1>
				</c:if>
				<c:if test="${operacion eq 'seno' }">

					<br>
					<br>
					<input type="submit" value="Calcular">
					<h1 style="color: red">
						<seno:Seno angulo="${angulo}" operacion="${operacion}" />
						<h1>
				</c:if>
				<c:if test="${operacion eq 'coseno' }">

					<br>
					<br>
					<input type="submit" value="Calcular">
					<h1 style="color: red">
						<coseno:Coseno angulo="${angulo}" operacion="${operacion}" />
						<h1>
				</c:if>

			</c:if>

			<br> <br> <input type="submit" value="Calcular">
		</div>
	</form>
</body>
<script type="text/javascript">
	// Solo permite ingresar numeros.
	function soloNumeros(e) {
		var key = window.Event ? e.which : e.keyCode
		return (key >= 48 && key <= 57)
	}
</script>
</html>