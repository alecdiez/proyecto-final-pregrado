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
        <sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                           url="${url}" user="${user}" password="${pass}" />
        <sql:query dataSource="${result}" sql="select * from tesis.mapamarker where mapaId = ${mapaId} "
                   var="resultado" />
        <c:forEach var="fila" items="${resultado.rows}">
            <input type="hidden" id="markerId" value="${fila.mapaMarkerId}" />
            <input type="hidden" id="MarkerCliNomApe${fila.mapaMarkerId}" value="${fila.mapaMarkerCliNomApe}" />
            <input type="hidden" id="MarkerDirección${fila.mapaMarkerId}" value="${fila.mapaMarkerDirección}" />
            <input type="hidden" id="MarkerCiudad${fila.mapaMarkerId}" value="${fila.mapaMarkerCiudad}" />
            <input type="hidden" id="MarkerProvincia${fila.mapaMarkerId}" value="${fila.mapaMarkerProvincia}" />
            <input type="hidden" id="MarkerVenta${fila.mapaMarkerId}" value="${fila.mapaMarkerVenta}" />
            <input type="hidden" id="MarkerEntrega${fila.mapaMarkerId}" value="${fila.mapaMarkerEntrega}" />
            <input type="hidden" id="MarkerObserva${fila.mapaMarkerId}" value="${fila.mapaMarkerObserva}" />
        </c:forEach>
        <div id="map-canvas"></div>
    </body>
</html>
