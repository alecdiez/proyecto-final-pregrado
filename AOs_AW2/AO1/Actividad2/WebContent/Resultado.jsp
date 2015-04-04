<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultado</title>
</head>
<%
	String numero = request.getParameter("numero");
%>
<body>
	<c:set var="num" value="<%=numero%>" />
	<form action="index.jsp">
		<div align="center">
			<c:choose>
				<c:when test="${num == ''}">
					<c:out value="Recuerde Ingresar un Valor" />
				</c:when>
				<c:otherwise>
					<h1>
						Tabla de Multiplicar del número : <b> <c:out value="${num}" /></b>
					</h1>
					<c:forEach var="i" begin="0" end="10">
						<c:out value="${num} Multiplicado por ${i} = " />
						<c:out value="${num*i}" />

						<br />
					</c:forEach>

				</c:otherwise>

			</c:choose>
			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>
</body>
</html>