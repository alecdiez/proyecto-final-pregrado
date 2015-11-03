<%-- 
    Document   : AuditLogin
    Created on : 02/11/2015, 20:45:43
    Author     : Alejandro
--%>

<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" />
<script src="js/AuditLogin.js"></script>
<script src="js/pager.js"></script>
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
            <h1 class="TextoTituloGris">Asigna Privilegios</h1>
            <table border="0" id="tabla">
                <thead>
                    <tr>
                        <th class="TextoTitulo" align="center">ID</th>
                        <th class="TextoTitulo" align="center">Usuario</th>
                        <th class="TextoTitulo" align="center">Usr. Ingresado</th>
                        <th class="TextoTitulo" align="center">Pass. Ingresado</th>
                        <th class="TextoTitulo" align="center">IP</th>                      
                        <th class="TextoTitulo" align="center">Fecha</th>
                        <th class="TextoTitulo" align="center">Conectado</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${result}" sql="SELECT audit_login.auditLoginId, personas.perUsuario, audit_login.auditLoginUsr,
                               audit_login.auditLoginPass, audit_login.auditLoginIP, audit_login.auditLoginFecha,
                               CASE audit_login.auditLoginConectado WHEN 'S' THEN 'SI' ELSE 'NO' END AS 'Conectado' 
                               FROM { OJ tesis.personas AS personas RIGHT OUTER JOIN tesis.audit_login AS audit_login 
                               ON personas.perId = audit_login.audtiLoginUsrId } ORDER BY audit_login.auditLoginId DESC "
                               var="resultado" />
                    <c:forEach var="fila" items="${resultado.rows}">
                        <tr>
                            <td class="Cuadro"><c:out value="${fila.auditLoginId}" /></td>
                            <td class="Cuadro"><c:out value="${fila.perUsuario}" /></td>
                            <td class="Cuadro"><c:out value="${fila.auditLoginUsr}" /></td>
                            <td class="Cuadro"><c:out value="${fila.auditLoginPass}" /></td>
                            <td class="Cuadro"><c:out value="${fila.auditLoginIP}" /></td>                           
                            <td class="Cuadro" ><c:out value="${fila.auditLoginFecha}" /></td>
                            <td class="Cuadro" ><c:out value="${fila.Conectado}" /></td>                           
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div style="border:0" id="pageNavPosition"></div>
            <script>
                var pager = new Pager('tabla', 10);
                pager.init();
                pager.showPageNav('pager', 'pageNavPosition');
                pager.showPage(1);
            </script>
        </div>
    </body>
</html>
