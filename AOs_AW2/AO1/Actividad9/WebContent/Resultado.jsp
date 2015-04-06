<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado Actividad 9</title>
</head>
<%
	String ape = request.getParameter("ape");
	String nom = request.getParameter("nom");
	String edad = request.getParameter("edad");
	String pro = request.getParameter("pro");
	String email = request.getParameter("email");
	String pol = request.getParameter("pol");
	String eco = request.getParameter("eco");
	String poli = request.getParameter("poli");
	String esp = request.getParameter("esp");
%>
<body>
	<c:set var="ape" value="<%=ape%>" />
	<c:set var="nom" value="<%=nom%>" />
	<c:set var="edad" value="<%=Integer.parseInt(edad)%>" />
	<c:set var="pro" value="<%=pro%>" />
	<c:set var="email" value="<%=email%>" />
	<c:set var="pol" value="<%=pol%>" />
	<c:set var="eco" value="<%=eco%>" />
	<c:set var="poli" value="<%=poli%>" />
	<c:set var="esp" value="<%=esp%>" />
	<c:set var="existe" value="NOexiste" />
	<div align="center">
		<h1>Resultado - Actividad N° 9</h1>
	</div>
	<br>
	<form action="index.html">
		<div align="center">
			<sql:setDataSource var="dbmate" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/formweb" user="root" password="ama921sa" />
			<sql:query dataSource="${dbmate}" sql="select * from usuarios"
				var="resultado" />
			<c:forEach var="filaComp" items="${resultado.rows}">
				<c:if test="${filaComp.Usuario_Apellido==ape}">
					<c:if test="${filaComp.Usuario_Nombre==nom}">
						<c:set var="existe" value="existe" />
					</c:if>
				</c:if>
			</c:forEach>

			<c:if test="${existe == 'NOexiste'}">
				<sql:update dataSource="${dbmate}" var="resul">
           INSERT INTO formweb.usuarios (Usuario_Apellido,Usuario_Nombre,Usuario_Edad,Usuario_Profesion,Usuario_Email,Usuario_Pref1,Usuario_Pref2,Usuario_Pref3,Usuario_Pref4)
                           VALUES(?,?,?,?,?,?,?,?,?);
                        <sql:param value="${ape}" />
					<sql:param value="${nom}" />
					<sql:param value="${edad}" />
					<sql:param value="${pro}" />
					<sql:param value="${email}" />
					<sql:param value="${pol}" />
					<sql:param value="${eco}" />
					<sql:param value="${poli}" />
					<sql:param value="${esp}" />
				</sql:update>
			</c:if>
			<br> <b><c:out value="TABLA RESULTADOS" /></b><br>
			<table border="1">
				<thead>
					<tr>
						<th align="center">ID</th>
						<th align="center">Apellido</th>
						<th align="center">Nombre</th>
						<th align="center">Edad</th>
						<th align="center">Profesion</th>
						<th align="center">Email</th>
						<th align="center">Preferencia 1</th>
						<th align="center">Preferencia 2</th>
						<th align="center">Preferencia 3</th>
						<th align="center">Preferencia 4</th>
					</tr>
				</thead>
				<tbody>
					<sql:query dataSource="${dbmate}" sql="select * from usuarios"
						var="resultado" />
					<c:forEach var="fila" items="${resultado.rows}">
						<tr>
							<td align="center"><c:out value="${fila.Usuario_Id}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Apellido}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Nombre}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Edad}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Profesion}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Email}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Pref1}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Pref2}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Pref3}" /></td>
							<td align="center"><c:out value="${fila.Usuario_Pref4}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>
</body>
</html>