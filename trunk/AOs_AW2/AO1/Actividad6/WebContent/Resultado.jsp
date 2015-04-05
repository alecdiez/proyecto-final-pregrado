<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado Actividad 6</title>
</head>
<%
	String parrafo = request.getParameter("parrafo");
%>
<body>
	<div align="center">
		<h1>Resultado - Actividad N° 6</h1>
	</div>
	<br>
	<form action="index.jsp">
		<div align="center">
			<c:set var="parrafo" value="<%=parrafo%>" />
			<h1>
				<c:out value="El parrafo a analizar es:  \" ${parrafo}\"" />
			</h1>
			<c:forTokens items="${parrafo}" delims=" " var="palabra">
			
			<table border="1">
				<thead>
					<tr>
						<th>Plabra</th>
						<th>Ocurrencia</th>
						<th>Mayor Ocurrencia</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			</c:forTokens>
		</div>
	</form>
</body>
</html>