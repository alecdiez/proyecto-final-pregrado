<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado Actividad 8</title>
</head>
<%
	String numero = request.getParameter("numero");
%>
<body>
	<c:set var="numero" value="<%=Integer.parseInt(numero)%>" />
	<c:set var="existe" value="NOexiste" />
	<div align="center">
		<h1>Resultado - Actividad N° 8</h1>
	</div>
	<br>
	<form action="index.html">
		<div align="center">
			<sql:setDataSource var="dbmate" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/matematica" user="root"
				password="ama921sa" />
			<sql:query dataSource="${dbmate}" sql="select * from resultados"
				var="resultado" />
			<c:forEach var="filaComp" items="${resultado.rows}">
				<c:if test="${filaComp.Resultado_Numero==numero}">
					<c:set var="existe" value="existe" />
				</c:if>
			</c:forEach>

			<c:if test="${existe == 'existe'}">
				<sql:update dataSource="${dbmate}" var="resul">
            DELETE FROM matematica.resultados WHERE Resultado_Numero=?;
                        <sql:param value="${numero}" />
				</sql:update>
			</c:if>
			<br> <b><c:out value="TABLA RESULTADOS" /></b><br>
			<table border="1">
				<thead>
					<tr>
						<th align="center">ID</th>
						<th align="center">Número</th>
						<th align="center">Elevado al Cuadrado</th>
						<th align="center">Elevado al Cubo</th>
					</tr>
				</thead>
				<tbody>
					<sql:query dataSource="${dbmate}" sql="select * from resultados"
						var="resultado" />
					<c:forEach var="fila" items="${resultado.rows}">
						<tr>
							<td align="center"><c:out value="${fila.Resultado_Id}" /></td>
							<td align="center"><c:out value="${fila.Resultado_Numero}" /></td>
							<td align="center"><c:out value="${fila.Resultado_Cuadrado}" /></td>
							<td align="center"><c:out value="${fila.Resultado_Cubo}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>
</body>
</html>