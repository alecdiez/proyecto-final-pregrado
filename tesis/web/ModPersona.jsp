<%--
    Document   : ModPersona
    Created on : 06-jul-2015, 16:20:57
    Author     : bizit
--%>

<%@page import="utl.TextFormat"%>
<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link href="css/main.css" rel="stylesheet" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script>
    !window.jQuery && document.write('<script src="js/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="./js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="./js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="./js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" />
<script src="js/ModPersona.js"></script>
<!DOCTYPE html>
<%@include file="sessionControl.jsp"%>
<%String modPerId = TextFormat.toStringNeverNull(request.getParameter("perId"));%>
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="modPerId" value="<%=modPerId%>" />
<input type="hidden" id="perId" name="perId" value="${modPerId}" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                           url="${url}" user="${user}" password="${pass}" />
        <div align="center">
            <h1 class="TextoTituloGris">Modifica Persona</h1>
            <table border="0" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>
                        <th class="TextoTitulo">Descripción</th>
                        <th class="TextoTitulo">Datos</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${result}" sql="select * from tesis.personas where perId = ${modPerId}"
                               var="resultado" />
                    <c:forEach var="fila" items="${resultado.rows}">
                        <tr>
                            <td class="TextoTituloGris">Nombre <font style="color: red">.*</font></td>
                            <td><input type="text" id="nom" class="ComboMedio" name="nom" value="${fila.perNom}" /></td>
                        </tr>
                        <tr>
                            <td class="TextoTituloGris">Apellido <font style="color: red">.*</font></td>
                            <td><input type="text" id="ape" class="ComboMedio" name="ape" value="${fila.perApe}" /></td>
                        </tr>
                        <tr>
                            <td class="TextoTituloGris">Dni <font style="color: red">.*</td>
                            <td><input type="text" id="dni" class="ComboMedio" name="ndi" value="${fila.perDni}" onKeyPress="return soloNumeros(event)"/></td>
                        </tr>
                        <tr>
                            <td class="TextoTituloGris">Usuario <font style="color: red">.*</font></td>
                            <td><input type="text" id="usr" class="ComboMedio" name="usr" value="${fila.perUsuario}" /></td>
                        </tr>
                        <tr>
                            <td class="TextoTituloGris">Contraseña <font style="color: red">.*</font></td>
                            <td><input type="password" id="pass" class="ComboMedio" name="pass" value="${fila.perPass}" /></td>
                        </tr>
                        <tr>
                            <td class="texto"></td>
                            <td><input type="button" class="BotonTablaRoja" id="guardaPersona" value="Guardar" name="guardaPersona" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </body>
</html>
