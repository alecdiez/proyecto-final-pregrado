<%--
    Document   : BajaPersona
    Created on : 06-jul-2015, 13:38:18
    Author     : bizit
--%>

<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" />
<script src="js/BajaPersona.js"></script>
<link href="css/main.css" rel="stylesheet"/>
<!DOCTYPE html>
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<%@include file="sessionControl.jsp"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div align="center">
            <sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                               url="${url}" user="${user}" password="${pass}" />
            <h1 class="TextoTituloGris">Eliminar Persona</h1>
            <table border="0" id="tabla">
                <thead>
                    <tr>
                        <th class="TextoTitulo" align="center">ID</th>
                        <th class="TextoTitulo" align="center">Nombre</th>
                        <th class="TextoTitulo" align="center">Apellido</th>
                        <th class="TextoTitulo" align="center">DNI</th>
                        <th class="TextoTitulo" align="center">Usuario</th>
                        <th class="TextoTitulo" align="center">Password</th>
                        <th class="TextoTitulo" align="center">Eliminar
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${result}" sql="select * from tesis.personas order by perId"
                               var="resultado" />
                    <c:forEach var="fila" items="${resultado.rows}">
                        <tr>
                            <td class="Cuadro" align="center"><c:out value="${fila.perId}" /></td>
                            <td class="Cuadro" align="center"><c:out value="${fila.perNom}" /></td>
                            <td class="Cuadro" align="center"><c:out value="${fila.perApe}" /></td>
                            <td class="Cuadro" align="center"><c:out value="${fila.perDni}" /></td>
                            <td class="Cuadro" align="center"><c:out value="${fila.perUsuario}" /></td>
                            <td class="Cuadro" align="center"><c:out value="${fila.perPass}" /></td>
                            <td align="center">
                                <span class="Texto" style="cursor: pointer" id="${fila.perId}">
                                    <img src="images/eliminar.gif" width="25" height="25" alt="eliminar"/>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>


        </div>
    </body>
</html>
