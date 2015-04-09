<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/Operaciones.tld" prefix="operaciones"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<HEAD>
<TITLE>Tag Operaciones</TITLE>
</HEAD>
<%
	String numero1 = request.getParameter("numero1");
	String numero2 = request.getParameter("numero2");
	String operacion = request.getParameter("operacion");
	numero1 = numero1 == null ? "" : numero1;
	numero2 = numero2 == null ? "" : numero2;
	numero1 = numero1.equals("") ? "0" : numero1;
	numero2 = numero2.equals("") ? "0" : numero2;
	operacion = operacion == null ? "" : operacion;
%>
<BODY>
	<div align="center">
		<h1>AO1 - Actividad N° 11</h1>
	</div>
	<c:set var="num1" value="<%=Integer.parseInt(numero1)%>" />
	<c:set var="num2" value="<%=Integer.parseInt(numero2)%>" />
	<c:set var="operacion" value="<%=operacion%>" />
	<br>
	<img alt="Enunciado" src="actividad11.jpg">
	<form action="index.jsp" name="form1">
		<div align="center">
			<h1>Ingrese la Operacion y los Números a calcular.</h1>
		</div>
		<div align="center">
			Ingrese el Primer Número:<input type="text" style="text-align: right"
				name="numero1" onKeyPress="return soloNumeros(event)">&nbsp;&nbsp;&nbsp;
			Ingrese el Segundo Número:<input type="text"
				style="text-align: right" name="numero2"
				onKeyPress="return soloNumeros(event)"> <br> <br>
			<input type="radio" name="operacion" value="suma" checked>Sumar&nbsp;&nbsp;
			<input type="radio" name="operacion" value="resta">Restar&nbsp;&nbsp;
			<input type="radio" name="operacion" value="multiplica">Multiplicar&nbsp;&nbsp;
			<input type="radio" name="operacion" value="divide">Dividir&nbsp;&nbsp;
			<br> <br>
			<c:if test="${operacion ne '' }">
			<br> <br> <input type="submit" value="Calcular">
				<h1 style="color: red">
					<operaciones:Operaciones operacion="${operacion}" num1="${num1}"
						num2="${num2}" />
					<h1>
					
			</c:if>

			<br> <br> <input type="submit" value="Calcular">
		</div>
	</form>
</BODY>
<script type="text/javascript">
	// Solo permite ingresar numeros.
	function soloNumeros(e) {
		var key = window.Event ? e.which : e.keyCode
		return (key >= 48 && key <= 57)
	}
</script>
</HTML>