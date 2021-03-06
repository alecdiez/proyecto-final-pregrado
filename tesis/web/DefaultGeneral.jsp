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
<link rel="stylesheet" href="css/style_menu.css">
<script src="js/DefaultGeneral.js"></script>
<!DOCTYPE html>

<style>
    body {
        background-image: url("images/fondo_uno.jpg");
        background-color: #cccccc;
    }
</style>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="menu.jsp" %>
        <a id="visualizaGraficos" href="VizualizaGraficos.jsp" style="display: none" >Graficos</a>
        <a id="mapasGeneral" href="MapasGeneral.jsp" style="display: none" >Mapas</a>
        <a id="visGraficosPorVentas" href="VisGraficosPorVentas.jsp" style="display: none" >Graficos</a>
        <a id="generaMapaManual" href="GeneraMapaManual.jsp" style="display: none" >Graficos</a>
        <a id="modificaMapa" href="ModificaMapa.jsp" style="display: none" >Mapa</a>
        <a id="asignaPrivilegio" href="AsignaPrivilegio.jsp" style="display: none" >Asigna</a>
        <input type="hidden" id="fDesde" value="">
        <input type="hidden" id="fHasta" value="">
    </body>

</html>
