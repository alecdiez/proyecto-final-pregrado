<%--
    Document   : ModificaMapa
    Created on : Oct 26, 2015, 3:04:23 PM
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
<script src="js/ModificaMapa.js"></script>

<%
   String mapaId = request.getParameter("mapaId");
   String observa = request.getParameter("observa");
%>
<c:set var="mapaId" value="<%=mapaId%>" />
<c:set var="observa" value="<%=observa%>" />
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="sqlGeneral" value="SELECT * from mapamarker where mapaId = ${mapaId}" />
<c:set var="estadoFila" value="ABIERTO" />
<sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                   url="${url}" user="${user}" password="${pass}" />
<html>
   <input type="hidden" name="mapaId" id="mapaId" value="${mapaId}" />
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <br>
      <br>
      <div align="center">
         <h1 class="TextoTituloGris">Edicion Completa del Mapa N° ${mapaId}</h1><br>
         <span class="TextoTituloGris"> Estado:</span> <select id="estado" class="ComboMedio" name="estado">
            <option>ABIERTO</option>
            <option>CERRADO</option>
         </select><br><br>
         <span class="TextoTituloGris"> Observaciones:<input class="ComboMedioLargo" id="observa" type="text"
                                                             name="observa" value="${observa}" />
            <img src="images/guard.png" title="Guarda Observaciones" id="imgObserva" style="cursor: pointer" width="25" height="25" alt="guard"/>
            <br><br>
            <table border="0" cellspacing="2" cellpadding="2">
               <thead>
                  <tr>
                     <th class="TextoTitulo">N° de Marker</th>
                     <th class="TextoTitulo">Nombre y Apellido</th>
                     <th class="TextoTitulo">Dirección</th>
                     <th class="TextoTitulo">Ciudad</th>
                     <th class="TextoTitulo">Provincia</th>
                     <th class="TextoTitulo">Latitud</th>
                     <th class="TextoTitulo">Longitud</th>
                     <th class="TextoTitulo">Venta</th>
                     <th class="TextoTitulo">Entrega</th>
                     <th class="TextoTitulo">Observaciones</th>
                     <th class="TextoTitulo">Estado</th>
                  </tr>
               </thead>
               <tbody>
                  <sql:query dataSource="${result}"
                             sql="${sqlGeneral}"
                             var="resultado" />
                  <c:forEach var="fila" items="${resultado.rows}">
                     <tr>
                        <td class="Cuadro" align="center">${fila.mapaMarkerId}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerCliNomApe}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerDirección}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerCiudad}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerProvincia}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerLat}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerLong}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerVenta}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerEntrega}</td>
                        <td class="Cuadro" align="center">${fila.mapaMarkerObserva}</td>
                        <td class="Cuadro" align="center">
                           <c:if test="${fila.mapaMarkerEstado eq '1'}" >
                              <c:set var="estadoFila" value="ABIERTO" />
                           </c:if>
                           <c:if test="${fila.mapaMarkerEstado eq '0'}" >
                              <c:set var="estadoFila" value="CERRADO" />
                           </c:if>
                           ${estadoFila}
                        </td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
      </div>
   </body>
</html>
