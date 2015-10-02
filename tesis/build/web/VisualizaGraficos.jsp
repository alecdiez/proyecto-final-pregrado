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
<script type="text/javascript" src="https://www.google.com/jsapi"></script> 
<!DOCTYPE html>

<script src="js/VisualizaGraficos.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script> 
<link href="css/main.css" rel="stylesheet"/>
<%@include file="sessionControl.jsp"%>

<script type="text/javascript" src="https://www.google.com/jsapi"></script> 
<%    String fDesde = request.getParameter("fDesde");
    String fHasta = request.getParameter("fHasta");

    fDesde = fDesde == null ? "vino null" : fDesde;
    fHasta = fHasta == null ? "vino null" : fHasta;
%>
<script>alert('<%=fDesde%>'+' - '+'<%=fHasta%>');</script>
<c:set var="fDesde" value="<%=fDesde%>" />
<c:set var="fHasta" value="<%=fHasta%>" />
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

<c:set var="queryGeneral" value="SELECT mapa.mapaUsrId, mapa.mapaFecha, SUM( mapamarker.mapamarkerVenta ) suma, personas.perUsuario
       FROM tesis.mapamarker AS mapamarker, tesis.mapa AS mapa, tesis.personas AS personas
       WHERE mapamarker.mapaId = mapa.mapaId AND mapa.mapaUsrId = personas.perId AND mapa.mapaUsrId = ${perId} GROUP BY mapa.mapaFecha" />

<c:if test="${isSuperAdmin eq 'true'}" >
    <c:set var="queryGeneral" value="SELECT mapa.mapaUsrId, mapa.mapaFecha, SUM( mapamarker.mapamarkerVenta ) suma, personas.perUsuario
           FROM tesis.mapamarker AS mapamarker, tesis.mapa AS mapa, tesis.personas AS personas
           WHERE mapamarker.mapaId = mapa.mapaId AND mapa.mapaUsrId = personas.perId GROUP BY mapa.mapaFecha ORDER BY mapa.mapaUsrId " />
</c:if>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graficos</title>
    </head>
    <body>
        <input type="hidden" id="fDes" value="${fDesde}" >
        <input type="hidden" id="fHas" value="${fHasta}" >
        <div id="GraficoGoogleChart-ejemplo-1" style="width: 950px; height: 500px"></div>

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


    </body>
</html>
