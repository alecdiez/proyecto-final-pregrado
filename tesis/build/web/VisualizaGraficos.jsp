<%--
    Document   : VisualizaGraficos
    Created on : 28/09/2015, 20:26:44
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utl.TextFormat"%>
<%@page import="interfaces.finalVariables"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="js/VisualizaGraficos.js"></script>
<link href="css/main.css" rel="stylesheet"/>

<!-- Load c3.css -->
<link href="js/c3-0.4.10/c3.css" rel="stylesheet" type="text/css">

<!-- Load d3.js and c3.js -->
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="js/c3-0.4.10/c3.min.js"></script>
<%@include file="sessionControl.jsp"%>

<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="perId" value="<%=perId%>" />
<c:set var="isSuperAdmin" value="false" />
<c:set var="queryCant" value="select count(*) cant from tesis.mapa where mapaUsrId = ${perId}" />

<sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                   url="${url}" user="${user}" password="${pass}" />

<sql:query dataSource="${result}"
           sql="SELECT personas.perId, privilegios.privilegio
           FROM tesis.per_privi AS per_privi, tesis.personas AS personas, tesis.privilegios AS privilegios
           WHERE per_privi.perId = personas.perId AND per_privi.priviId = privilegios.priviId AND personas.perId = ${perId}
           AND privilegios.privilegio = 'SuperAdmin'"
           var="privilegios" />

<c:forEach var="elige" items="${privilegios.rows}" varStatus="theCount">
   <c:if test="${theCount.count==1}" >
      <c:set var="queryCant" value="select count(*) cant from tesis.mapa"/>
      <c:set var="isSuperAdmin" value="true" />
   </c:if>
</c:forEach>

<c:set var="queryGeneral" value="SELECT mapa.mapaUsrId, mapa.mapaFecha, SUM( mapamarker.mapamarkerVenta ), personas.perUsuario
          FROM tesis.mapamarker AS mapamarker, tesis.mapa AS mapa, tesis.personas AS personas
          WHERE mapamarker.mapaId = mapa.mapaId AND mapa.mapaUsrId = personas.perId AND mapa.mapaUsrId = ${perId} GROUP BY mapa.mapaFecha" />

<c:if test="${isSuperAdmin eq 'true'}" >
   <c:set var="queryGeneral" value="SELECT mapa.mapaUsrId, mapa.mapaFecha, SUM( mapamarker.mapamarkerVenta ), personas.perUsuario
          FROM tesis.mapamarker AS mapamarker, tesis.mapa AS mapa, tesis.personas AS personas
          WHERE mapamarker.mapaId = mapa.mapaId AND mapa.mapaUsrId = personas.perId GROUP BY mapa.mapaFecha ORDER BY mapa.mapaUsrId " />
</c:if>


<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Graficos</title>
   </head>
   <body>
      <h1 class="TextoTituloGris">Graficos Comparativo de Total de Ventas por Fecha</h1>
      <br><br>

      <sql:query dataSource="${result}" sql="${queryCant}"
                 var="cantMapas" />
      <c:forEach var="filaCant" items="${cantMapas.rows}">
         <input type="hidden" id="cantMapas" value="${filaCant.cant}" />
      </c:forEach>

      <sql:query dataSource="${result}" sql="${queryGeneral}"
                 var="datos" />

      <c:forEach var="fila" items="${datos.rows}" varStatus="theCount">
         <input type="hidden" id="usrId${theCount.count}" value="${fila.mapaUsrId}" />
         <input type="hidden" id="fecha${theCount.count}" value="${fila.mapaFecha}" />
         <input type="hidden" id="suma${theCount.count}" value="${fila.suma}" />
         <input type="hidden" id="usuario${theCount.count}" value="${fila.perUsuario}" />
      </c:forEach>

      <div id="chart"></div>
   </body>
</html>
