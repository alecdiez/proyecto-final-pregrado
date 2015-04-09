<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Raiz_Cuadrada.tld" prefix="raiz_cuadrada"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tag Raiz Cuadrada</title>
</head>
<%
	String numero1 = request.getParameter("numero1");
	numero1 = numero1 == null ? "" : numero1;
	numero1 = numero1.equals("") ? "0" : numero1;
	
%>
<body>
	<div align="center">
		<h1>AO1 - Actividad N° 12</h1>
	</div>
	<c:set var="num1" value="<%=Float.parseFloat(numero1)%>" />
	<br>
	<img alt="Enunciado" src="actividad12.jpg">
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Ingrese un Número Entero por favor!!.</h1>
		</div>
		<div align="center">
			Número Entero:<input type="text" style="text-align: right"
				name="numero1" onKeyPress="return soloNumeros(event)">&nbsp;&nbsp;&nbsp;
           
           <c:if test="${num1 != 0 }">
           <br> <br> <input type="submit" value="Calcular">
				<h1 style="color: red">
					<raiz_cuadrada:Raiz_CuadradaTag  num1="${num1}" />
					<h1>
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