<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!public double operacion(int numero1, int numero2, String operacion) {
		double resultado = 0;
		if (operacion.equals("suma")) {
			resultado = (numero1 + numero2);
		} else if (operacion.equals("resta")) {
			resultado = (numero1 - numero2);
		} else if (operacion.equals("multiplica")) {
			resultado = (numero1 * numero2);
		} else if (operacion.equals("divide")) {
			resultado = (numero1 / numero2);
		}
		return resultado;
	}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resultados Calculados</title>
</head>
<%
	String numero1 = request.getParameter("numero1");
	String numero2 = request.getParameter("numero2");
	String operacion = request.getParameter("operacion");
	//out.println();
%>
<body>
	<form action="index.jsp">
		<div align="center">
			<h1>Resultado</h1>
		</div>


		<c:set var="num1" value="<%=numero1%>" />
		<c:set var="num2" value="<%=numero2%>" />
		<c:set var="ope" value="<%=operacion%>" />
		<b> <c:choose>
				<c:when test="${num1 == ''}">
					<c:out value="Recuerde Ingresar Ambos Valores" />
				</c:when>
				<c:when test="${num2 == ''}">
					<c:out value="Recuerde Ingresar Ambos Valores" />
				</c:when>
				<c:otherwise>
					<c:out value="Resultado de ${ope} ${num1} y ${num2} es = " />
   &quot<c:out
						value="<%=operacion(Integer.parseInt(numero1),
							Integer.parseInt(numero2), operacion)%>" />&quot
  </c:otherwise>
			</c:choose>

		</b> <br> <br> <input type="submit" value="Regresar al Inicio">

	</form>
</body>
</html>