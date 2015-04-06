<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Actividad 10</title>
</head>
<%
	String ids = request.getParameter("ids");
%>
<body>
	<c:set var="ids" value="<%=ids%>" />
	
	<div align="center">
		<h1>AO1 - Actividad N° 10</h1>
	</div>
	<br>
	<img alt="Enunciado" src="actividad10.jpg">
	<form action="index.jsp" name="form1">
		<div align="center">
			<sql:setDataSource var="dbmate" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/formweb" user="root" password="ama921sa" />
            <c:if test="${fn:length(ids) != 0 }">
            <c:forTokens items="${ids}" delims="-" var="id">
            <sql:update dataSource="${dbmate}" var="resul">
            DELETE FROM formweb.usuarios WHERE Usuario_Id=?;
                        <sql:param value="${id}" />
			</sql:update>
			</c:forTokens>
            
           </c:if>
			<br> <b><c:out value="TABLA RESULTADOS" /></b><br>
			<table border="1" id="tabla">
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
						<th align="center">Eliminar</th>
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
							<td align="center"><input type="checkbox"
								id="${fila.Usuario_Id}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <input type="button" value="Eliminar Seleccionados"
				onclick="enviaIds()"> <input type="hidden" name="ids"
				id="ids">
		</div>
	</form>
</body>
<script type="text/javascript">
	function enviaIds() {
		var tabla = document.getElementById('tabla');

		var checkboxes = document.getElementsByTagName('input');
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].type == 'checkbox') {
				if (checkboxes[i].checked) {
					var cbid = checkboxes[i].id;
					
						document.getElementById("ids").value = document
								.getElementById("ids").value
								+ cbid + "-";
					
				}
			}
		}

		form1.submit();

	}
</script>
</html>