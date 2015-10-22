<%--
    Document   : MuestraMapa
    Created on : 12/07/2015, 11:59:56
    Author     : Alejandro
--%>

<%@page import="utl.TextFormat"%>
<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<style type="text/css">
    html, body, #map-canvas { height: 100%; margin: 0; padding: 0;}
</style>
<script src="js/MuestraMapa.js"></script>
<script type="text/javascript"  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNDjH7SoRgkGGD094b9bzN-iiBfyLPeeA"></script>
<%@include file="sessionControl.jsp"%>

<%Integer mapaId = Integer.parseInt(request.getParameter("mapaId"));%>
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="perId" value="<%=perId%>" />
<c:set var="mapaId" value="<%=mapaId%>" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form>
            <sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                               url="${url}" user="${user}" password="${pass}" />
            <sql:query dataSource="${result}" sql="select count(*) cant from tesis.mapamarker where mapaId = ${mapaId} "
                       var="cantMarkers" />
            <c:forEach var="filaCant" items="${cantMarkers.rows}">
                <input type="hidden" id="cantMarkers" value="${filaCant.cant}" />
            </c:forEach>

            <sql:query dataSource="${result}" sql="select * from tesis.mapamarker where mapaId = ${mapaId} order by mapaMarkerId "
                       var="resultado" />
            <c:forEach var="fila" items="${resultado.rows}" varStatus="theCount">
                <input type="hidden" id="MarkerId${theCount.count}" value="${fila.mapaMarkerId}" />
                <input type="hidden" id="MarkerCliNomApe${theCount.count}" value="${fila.mapaMarkerCliNomApe}" />
                <input type="hidden" id="MarkerDireccion${theCount.count}" value="${fila.mapaMarkerDirección}" />
                <input type="hidden" id="MarkerCiudad${theCount.count}" value="${fila.mapaMarkerCiudad}" />
                <input type="hidden" id="MarkerProvincia${theCount.count}" value="${fila.mapaMarkerProvincia}" />
                <input type="hidden" id="MarkerVenta${theCount.count}" value="${fila.mapaMarkerVenta}" />
                <input type="hidden" id="MarkerEntrega${theCount.count}" value="${fila.mapaMarkerEntrega}" />
                <input type="hidden" id="MarkerObserva${theCount.count}" value="${fila.mapaMarkerObserva}" />
                <input type="hidden" id="MarkerEstado${theCount.count}" value="${fila.mapaMarkerEstado}" />
            </c:forEach>
            <div align="center" width="100%" style="background-color:  #CFCFCF">
                <a href="javascript:void(0)" onclick="printPage()">Imprimir / Guardar en PDF - Mapa</a>
            </div> 
            <div id="map-canvas"></div>
        </form>
    </body>
</html>
