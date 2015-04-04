<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado Actividad 5</title>
</head>
<%
	String parrafo = request.getParameter("parrafo");
	String buscar = request.getParameter("buscar");
%>
<body>

	<div align="center">
		<h1>Resultado - Actividad N° 5</h1>
	</div>
	<br>
	<form action="index.jsp">
		<div align="center">
			<c:set var="parrafo" value="<%=parrafo%>" />
			<c:set var="buscar" value="<%=buscar%>" />
			<h1>
				<c:out value="El parrafo a analizar es:  \" ${parrafo}\"" />
			</h1>
			<c:set var="countPalabra" value="0" />
			<c:forTokens items="${parrafo}" delims=" " var="palabra">
				<c:if test="${fn:length(buscar) > 1}">
					<c:if test="${palabra == buscar}">
						<c:set var="countPalabra" value="${countPalabra + 1}" />
					</c:if>
				</c:if>

				<c:if test="${fn:length(buscar) == 1}">
					<c:forEach var="i" begin="0" end="${fn:length(palabra)}" step="1">
						<c:if test="${fn:substring(palabra, i, i + 1) == buscar}">
							<c:set var="countPalabra" value="${countPalabra + 1}" />
						</c:if>
					</c:forEach>
				</c:if>

			</c:forTokens>
			<b><c:out value="La busqueda \" ${buscar}\" se repite : ${countPalabra} veces." /></b>
			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>
</body>
</html>