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
<body onload="recorreTabla(),recorreTablaLetra()">
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
			<table border="1" name="tabla" id="tabla">
				<thead>
					<tr>
						<th>Plabra</th>
						<th>Ocurrencia en el Parrafo</th>
						<th>Mayor Ocurrencia en el Parrafo</th>
					</tr>
				</thead>
				<tbody>
					<c:forTokens items="${parrafo}" delims=" " var="palabra">
						<tr>
							<td align="left"><c:out value="${palabra}" /></td>

							<td align="right"><c:set var="count" value="0" /> <c:forTokens
									items="${parrafo}" delims=" " var="palabraComp">
									<c:if test="${palabra == palabraComp}">
										<c:set var="count" value="${count + 1}" />
									</c:if>
								</c:forTokens> <c:out value="${count}" /></td>

							<td align="right" id="${palabra}"></td>

						</tr>
					</c:forTokens>
				</tbody>
			</table>
			<br>
			<%
				String parrafoLetra = parrafo.replace(" ", "");
			%>
			<c:set var="parrafoLetra" value="<%=parrafoLetra%>" />
			<table border="1" name="tablaLetra" id="tablaLetra">
				<thead>
					<tr>
						<th>Letra</th>
						<th>Ocurrencia en el Parrafo</th>
						<th>Mayor Ocurrencia en el Parrafo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" begin="0" end="${fn:length(parrafoLetra)-1}"
						step="1">
						<c:set var="letra" value="${fn:substring(parrafoLetra, i, i + 1)}" />
						<c:set var="countLetra" value="0" />
						<tr>
							<td align="center"><c:out value="${letra} " /></td>
							<td align="center"><c:forEach var="i" begin="0"
									end="${fn:length(parrafoLetra)-1}" step="1">
									<c:set var="LetraComp"
										value="${fn:substring(parrafoLetra, i, i + 1)}" />
									<c:if test="${LetraComp == letra}">
										<c:set var="countLetra" value="${countLetra + 1}" />
									</c:if>
								</c:forEach> <c:out value="${countLetra} " /></td>
							<td align="right" id="${letra}let"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br> <br> <input type="submit" value="Regresar al Inicio">
		</div>
	</form>
</body>
<script type="text/javascript">
	function recorreTabla() {

		var tabla = document.getElementById("tabla");
		var mayor = 0;
		for (var i = 1, row; row = tabla.rows[i]; i++) {
			for (var j = 0, col; col = row.cells[j]; j++) {

				if (j == 1) {
					var cant = parseInt(col.innerHTML);
					if (cant > mayor) {
						mayor = cant;
					}
				}

			}
		}

		for (var i = 1, row; row = tabla.rows[i]; i++) {
			for (var j = 0, col; col = row.cells[j]; j++) {
				if (j == 0) {
					var pa = col.innerHTML;
				}

				if (j == 1) {
					var cant = parseInt(col.innerHTML);
					if (cant == mayor) {
						document.getElementById(pa).innerHTML = "MAYOR";
					}
				}

			}
		}

	}

	function recorreTablaLetra() {

		var tablaLetra = document.getElementById("tablaLetra");
		var mayorLetra = 0;
		for (var i = 1, rowLetra; rowLetra = tablaLetra.rows[i]; i++) {
			for (var j = 0, colLetra; colLetra = rowLetra.cells[j]; j++) {

				if (j == 1) {
					var cant = parseInt(colLetra.innerHTML);
					if (cant > mayorLetra) {
						mayorLetra = cant;
					}
				}

			}
		}
		var letraMayor
		for (var i = 1, rowLetra; rowLetra = tablaLetra.rows[i]; i++) {
			for (var j = 0, col; col = rowLetra.cells[j]; j++) {
				if (j == 0) {
					var let = String(col.innerHTML);
				}

				if (j == 1) {
					var cantLetra = parseInt(col.innerHTML);
					if (cantLetra == mayorLetra) {
						letraMayor = let;
					}
				}

			}
		}
		if (letraMayor.length == 2) {
			letraMayor = letraMayor.replace(" ", "");
		}
		
		document.getElementById(letraMayor + 'let').innerHTML = "MAYOR";

	}
</script>
</html>