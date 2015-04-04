<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%
	String filas = request.getParameter("filas");
	String[] fila = filas.split(",");
%>
<body>
	<div align="center">
		<h1>Resultado - Actividad N° 3</h1>
	</div>
	<br>
	<form action="index.jsp">
		<div align="center">
			<%
				for (int i = 0; i < fila.length; i++) {
					String datos[] = fila[i].split("-");
					String des = datos[0];
					String pre = datos[1];
					String cant = datos[2];
					String bon = datos[3];
			%>
			<c:set var="des" value="<%=des%>" />
			<c:set var="pre" value="<%=Float.parseFloat(pre)%>" />
			<c:set var="cant" value="<%=Integer.parseInt(cant)%>" />
			<c:set var="bon" value="<%=Double.parseDouble(bon)%>" />

			<h3>
				<c:out value="El Producto \" ${des}\" tiene un precio
					de $ ${pre}, con un Subtotal
					de $ ${(pre*cant)-(pre*cant)*(bon/100)} y un iva de $ ${((pre*cant)-(pre*cant)*(bon/100))*(21/100)}" />
			</h3>

			<c:set var="suma" value="${suma+((pre*cant)-(pre*cant)*(bon/100))}" />
			<%
				}
			%>

			<h1>
				<c:out value="El total a facturar es : $${suma}" />
			</h1>

			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>
</body>
</html>