<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Conexiones.tld" prefix="con"  %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 15</title>
<%
	String sql = request.getParameter("sql");
	String user = request.getParameter("us");
	String url = request.getParameter("url");
	String pas = request.getParameter("pass");
%>
</head>
<body>
<c:set var="sql" value="<%=sql%>" />
<c:set var="us" value="<%=user%>" />
<c:set var="url" value="<%=url%>" />
<c:set var="pass" value="<%=pas%>" />

<div align="center">
		<h1>AO1 - Actividad N° 15</h1>
	</div>
	<br><h2> Prueba del custom tag:</h2>
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Conexiones a bases de datos!</h1>
		</div>
		<div align="center">
			URL de la base de datos:<input name="url" type="text" ><br>
			Usuario: <input type="text" name="us" > 
			Pass: <input type="password" name="pass" >
			Consulta SQL: <input type="text" name="sql">
			
			<h2>
			<con:DATABASE URL="${url}" USER="${us }" PWD="${pass }"><c:out value="${sql}"/></con:DATABASE>
			</h2>
			
			
			<br> <br> <input type="submit" value="Ejecutar">
		</div>
	</form>
</body>
</html>