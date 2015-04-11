<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Conexiones.tld" prefix="con"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 15</title>
<%
	String sql = request.getParameter("sql");
	sql = sql == null ? "" : sql;
	String user = request.getParameter("us");
	user = user == null ? "" : user;
	String url = request.getParameter("url");
	url = url == null ? "" : url;
	String pas = request.getParameter("pass");
	pas = pas == null ? "" : pas;

	String vacio = url.equals("") | user.equals("") | pas.equals("") ? "vacio"
			: "";
%>
</head>
<body>
	<c:set var="sql" value="<%=sql%>" />
	<c:set var="us" value="<%=user%>" />
	<c:set var="url" value="<%=url%>" />
	<c:set var="pass" value="<%=pas%>" />
	<c:set var="vac" value="<%=vacio%>" />

	<div align="center">
		<h1>AO1 - Actividad N° 15</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad15.jpg">
	<br>
	<h2>Prueba del custom tag:</h2>
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Conexiones a bases de datos!</h1>
		</div>
		<div align="center">
			<table>
				<thead>
					<tr>
						<th>Descripcion</th>
						<th>Dato</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>URL de la base de datos:</td>
						<td><input name="url" value="${url}" type="text"></td>
					</tr>
					<tr>
						<td>Usuario:</td>
						<td><input type="text" value="${us}" name="us"></td>
					</tr>
					<tr>
						<td>Pass:</td>
						<td><input type="password" value="${pass}" name="pass"></td>
					</tr>
					<tr>
						<td>Consulta SQL:</td>
						<td><input type="text" value="${sql}" name="sql"></td>
					</tr>
				</tbody>
			</table>
			<br>

			<c:if test="${vac ne 'vacio'}">
				<h2>
					<con:DATABASE url="${url}" user="${us}" pwd="${pass}">
						<c:out value="${sql}" />
					</con:DATABASE>

				</h2>
			</c:if>

			<br> <br> <input type="submit" value="Ejecutar">
		</div>
	</form>
</body>
</html>