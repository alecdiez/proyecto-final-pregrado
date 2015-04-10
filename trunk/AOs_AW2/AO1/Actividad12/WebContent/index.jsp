<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Descriptor.tld" prefix="des"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 12</title>
</head>
<%
	String numero1 = request.getParameter("numero1");

	numero1 = numero1 == null ? "" : numero1;

	numero1 = numero1.equals("") ? "0" : numero1;
%>
<body>
	<c:set var="num1" value="<%=Integer.parseInt(numero1)%>" />
	<div align="center">
		<h1>AO1 - Actividad N° 12</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad12.JPG">
	<br>
	<h2>Prueba del custom tag:</h2>
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Ingrese Un numero entero por favor!!!.</h1>
		</div>
		<div align="center">
			Número Entero:<input type="text" style="text-align: right"
				name="numero1" onKeyPress="return soloNumeros(event)">&nbsp;&nbsp;&nbsp;
			<c:if test="${num1 != 0 }">
				<h2>
					<des:Raiz_Cuadrada>
	               <c:out value="${num1}"/> 
	               </des:Raiz_Cuadrada>
				</h2>
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