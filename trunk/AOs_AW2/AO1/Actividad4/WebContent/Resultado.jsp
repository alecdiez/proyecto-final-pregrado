<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado Actividad 4</title>
</head>
<%
	String frase = request.getParameter("frase");
%>
<body>

	<div align="center">
		<h1>Resultado - Actividad N° 4</h1>
	</div>
	<br>
	<form action="index.jsp">
		<div align="center">
			<c:set var="frase" value="<%=frase%>" />
			<h1>
				<c:out value="La frase a analizar es:  ${frase}" />
			</h1>

			<table border="1">
				<thead>
					<tr>
						<th>Plabra</th>
						<th>Cantidad de Letras</th>
						<th>Cantidad de Ocurrencias</th>
					</tr>
				</thead>
				<tbody>
					<c:forTokens items="${frase}" delims=" " var="palabra">
						<tr>
							<td align="left"><c:out value="${palabra}" /></td>
							<td align="center"><c:set var="pal" value="${palabra}" /> <c:out
									value="${fn:length(pal)}" /></td>
							<td align="right"><c:set var="count" value="0" /> <c:forTokens
									items="${frase}" delims=" " var="palabraComp">
									<c:if test="${palabra == palabraComp}">
										<c:set var="count" value="${count + 1}" />
									</c:if>
								</c:forTokens> <c:out value="${count}" /></td>
						</tr>
					</c:forTokens>
				</tbody>
			</table>
			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>

</body>
</html>