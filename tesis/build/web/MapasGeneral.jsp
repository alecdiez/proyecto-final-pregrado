<%-- 
    Document   : MapasGeneral
    Created on : 24/10/2015, 10:05:12
    Author     : Alejandro
--%>

<%@page import="utl.TextFormat"%>
<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script>
    !window.jQuery && document.write('<script src="js/jquery-1.4.3.min.js"><\/script>');
</script>
<script type="text/javascript" src="./js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
<script type="text/javascript" src="./js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="./js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
<link href="css/main.css" rel="stylesheet" />
<script src="js/MapasGeneral.js"></script>

<%    String fDesde = request.getParameter("fDesde");
    String fHasta = request.getParameter("fHasta");
    String fDesdeSinModificar = fDesde;
    String fHastaSinModificar = fHasta;

    fDesde = transformaFecha(fDesde);
    fHasta = transformaFecha(fHasta);

%>

<%!
    public String transformaFecha(String fecha) {
        String fechaSplit[] = fecha.split("/");
        return fechaSplit[2] + "/" + fechaSplit[1] + "/" + fechaSplit[0];
    }
%>


<%Long userId = Long.parseLong(TextFormat.toStringNeverNull(session.getAttribute("perId")));%>
<c:set var="fDesde" value="<%=fDesde%>" />
<c:set var="fHasta" value="<%=fHasta%>" />
<c:set var="fDesdeSinModificar" value="<%=fDesdeSinModificar%>" />
<c:set var="fHastaSinModificar" value="<%=fHastaSinModificar%>" />
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="userId" value="<%=userId%>" />
<c:set var="exportAllInfo" value="false" />
<c:set var="queryCant" value="select count(*) cant from tesis.mapa where mapaUsrId = ${perId}
       AND DATE(mapaFecha) between '${fDesde}' and '${fHasta}'" />
<c:set var="sqlGeneral" value="SELECT mapa.mapaId AS 'Identificar de Mapa',
       CONCAT( personas.perNom, ' ', personas.perApe ) AS 'Usuario',
       DATE_FORMAT( mapa.mapaFecha, '%d/%m/%Y %H:%i' ) AS 'Fecha',
       CASE mapa.mapaEstado WHEN 0 THEN 'CERRADO' ELSE 'ABIERTO' END AS 'Estado'
       FROM tesis.mapa AS mapa, tesis.personas AS personas
       WHERE mapa.mapaUsrId = personas.perId AND personas.perId = ${userId} 
       AND DATE(mapa.mapaFecha) between '${fDesde}' and '${fHasta}'
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
               CONCAT( personas.perNom, ' ', personas.perApe ) AS 'Usuario',
               DATE_FORMAT( mapa.mapaFecha, '%d/%m/%Y %H:%i' ) AS 'Fecha',
               CASE mapa.mapaEstado WHEN 0 THEN 'CERRADO' ELSE 'ABIERTO' END AS 'Estado'
               FROM tesis.mapa AS mapa, tesis.personas AS personas
               WHERE mapa.mapaUsrId = personas.perId 
               AND DATE(mapa.mapaFecha) between '${fDesde}' and '${fHasta}'
               ORDER BY mapa.mapaFecha DESC" />
        <c:set var="exportAllInfo" value="true" />
        <c:set var="queryCant" value="select count(*) cant from tesis.mapa WHERE
               DATE(mapaFecha) between '${fDesde}' and '${fHasta}'"/>
    </c:if>
</c:forEach>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <br>
        <br>
        <div align="center">
            <h1 class="TextoTituloGris">Mapas generados entre los dias  '${fDesdeSinModificar}'  y  '${fHastaSinModificar}'</h1>
            <table border="0" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>
                        <th class="TextoTitulo">N° de Mapa</th>
                        <th class="TextoTitulo">Usuario</th>
                        <th class="TextoTitulo">Fecha</th>
                        <th class="TextoTitulo">Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query dataSource="${result}" sql="${queryCant}"
                               var="cantMapas" />
                    <c:forEach var="filaCant" items="${cantMapas.rows}">
                    <input type="hidden" id="cantMapas" value="${filaCant.cant}" />
                </c:forEach>
                <sql:query dataSource="${result}"
                           sql="${sqlGeneral}"
                           var="resultado" />
                <c:forEach var="fila" items="${resultado.rows}">
                    <tr>
                        <td class="Cuadro" align="center">${fila.mapaId}</td>
                        <td class="Cuadro" align="center">${fila.Usuario}</td>
                        <td class="Cuadro" align="center">${fila.Fecha}</td>
                        <td class="Cuadro" align="center">${fila.Estado}</td>
                        <td class="Cuadro" align="center" title="Abrir Mapa N° ${fila.mapaId}">
                            <img src="images/XtpTm.png" onclick="abreMapa(${fila.mapaId})" style="cursor: pointer" title="Abre Mapa N° ${fila.mapaId}" width="25" height="25" alt="XtpTm"/>
                        </td>
                        <td class="Cuadro" align="center" title="Exportar Info de Mapa N° ${fila.mapaId}">
                            <img src="images/xls.jpg" onclick="exportaInfo(${fila.mapaId})" style="cursor: pointer" title="Exporta Mapa N° ${fila.mapaId}" width="25" height="25" alt="xls"/>
                        </td>                                      
                    </tr>
                </c:forEach>                    
                </tbody>
            </table>
        </div>
    </body>
</html>
