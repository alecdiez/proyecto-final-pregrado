<%--
    Document   : DefaultGeneral
    Created on : 04/07/2015, 10:40:43
    Author     : Alejandro
--%>
<%@page import="utl.TextFormat"%>
<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script>
    !window.jQuery && document.write('<script src="js/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="./js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="./js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="./js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link href="css/main.css" rel="stylesheet" />
<link rel="stylesheet" href="css/styles.css">
<link rel="stylesheet" href="css/style_menu.css">
<script src="js/DefaultGeneral.js"></script>
<!DOCTYPE html>


<%Long userId = Long.parseLong(TextFormat.toStringNeverNull(session.getAttribute("perId")));%>
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="userId" value="<%=userId%>" />
<c:set var="exportAllInfo" value="false" />
<c:set var="sqlGeneral" value="SELECT mapa.mapaId AS 'Identificar de Mapa',
       CONCAT( personas.perNom, ' ', personas.perApe ) AS Usuario,
       DATE_FORMAT( mapa.mapaFecha, '%d/%m/%Y %H:%i' ) AS Fecha
       FROM tesis.mapa AS mapa, tesis.personas AS personas
       WHERE mapa.mapaUsrId = personas.perId AND personas.perId = ${userId}
       ORDER BY Fecha DESC" />

<sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                   url="${url}" user="${user}" password="${pass}" />
<sql:query dataSource="${result}"
           sql="SELECT personas.perId, privilegios.privilegio
           FROM tesis.per_privi AS per_privi, tesis.personas AS personas, tesis.privilegios AS privilegios
           WHERE per_privi.perId = personas.perId AND per_privi.priviId = privilegios.priviId AND personas.perId = ${userId}
           AND privilegios.privilegio = 'SuperAdmin'"
           var="privilegios" />
<c:forEach var="elige" items="${privilegios.rows}" varStatus="theCount">
    <c:if test="${theCount.count==1}" >
        <c:set var="sqlGeneral" value="SELECT mapa.mapaId AS 'Identificador de Mapa',
               CONCAT( personas.perNom, ' ', personas.perApe ) AS Usuario,
               DATE_FORMAT( mapa.mapaFecha, '%d/%m/%Y %H:%i' ) AS Fecha
               FROM tesis.mapa AS mapa, tesis.personas AS personas
               WHERE mapa.mapaUsrId = personas.perId
               ORDER BY Fecha DESC" />
        <c:set var="exportAllInfo" value="true" />
    </c:if>
</c:forEach>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <br>
        <br>
        <div align="center">
            <h1 class="TextoTituloGris">Ultimos Mapas Generados</h1>
            <table border="0" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>
                        <th class="TextoTitulo">N° de Mapa</th>
                        <th class="TextoTitulo">Usuario</th>
                        <th class="TextoTitulo">Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${result}"
                               sql="${sqlGeneral}"
                               var="resultado" />
                    <c:forEach var="fila" items="${resultado.rows}">
                        <tr>
                            <td class="Cuadro" align="center">${fila.mapaId}</td>
                            <td class="Cuadro" align="center">${fila.Usuario}</td>
                            <td class="Cuadro" align="center">${fila.Fecha}</td>
                            <td class="Cuadro" align="center" title="Abrir Mapa N° ${fila.mapaId}">
                                <img src="images/XtpTm.png" onclick="abreMapa(${fila.mapaId})" width="25" height="25" alt="XtpTm"/>
                            </td>
                            <td class="Cuadro" align="center" title="Exportar Info de Mapa N° ${fila.mapaId}">
                                <img src="images/xls.jpg" onclick="exportaInfo(${fila.mapaId})" width="25" height="25" alt="xls"/>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>

</html>
