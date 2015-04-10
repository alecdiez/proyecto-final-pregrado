<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Trigonometria.tld" prefix="tri"  %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 13</title>
<%
	String numero1 = request.getParameter("numero1");
	String op = request.getParameter("group1");
%>
</head>
<body>
<c:set var="op" value="<%=op%>" />
<c:set var="num1" value="<%=numero1%>" />

<div align="center">
		<h1>AO1 - Actividad N° 13</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad13.jpg">
	<br><h2> Prueba del custom tag:</h2>
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Calculadora trigonométrica!</h1>
		</div>
		<div align="center">
			Angulo en radianes:<input name="numero1" type="text" size="10" ><br>
			Operación: 
			<input type="radio" name="group1" value="seno" checked> Seno
			<input type="radio" name="group1" value="coseno" > Coseno
			<input type="radio" name="group1" value="tangente">Tangente
			
			<c:if test="${op.equals(\"seno\")}">
					<h2>
					<tri:SENO> <c:out value="${num1}"/> </tri:SENO>
				</h2>
			</c:if>
			<c:if test="${op.equals('coseno')}">
			<h2>
			<tri:COSENO> <c:out value="${num1}"/> </tri:COSENO>
			</h2>
			</c:if>
			<c:if test="${op.equals('tangente') }">
			<h2>
			<tri:TANGENTE><c:out value="${num1}"/></tri:TANGENTE>
			</h2>
			</c:if>
			
			<br> <br> <input type="submit" value="Calcular">
		</div>
	</form>

</body>

</html>