<%--
    Document   : ModificaMapa
    Created on : Oct 26, 2015, 3:04:23 PM
    Author     : Alejandro
--%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script src="js/ModificaMapa.js"></script>
<%@include file="sessionControl.jsp"%>
<%    String mapaId = request.getParameter("mapaId");
    String observa = request.getParameter("observa");
%>
<c:set var="mapaId" value="<%=mapaId%>" />
<c:set var="observa" value="<%=observa%>" />
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<c:set var="sqlGeneral" value="SELECT * from mapamarker where mapaId = ${mapaId}" />
<c:set var="estadoFila" value="ABIERTO" />
<input type="hidden" id="mapaId" name="mapaId" value="${mapaId}" />
<sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                   url="${url}" user="${user}" password="${pass}" />
<sql:query dataSource="${result}"
           sql="SELECT DATE_FORMAT(mapaFecha,'%d/%m/%Y') AS 'FECHA', DATE_FORMAT(mapaFecha,'%H:%m:%s') AS 'HORA' FROM tesis.mapa WHERE mapa.mapaId = ${mapaId}"
           var="fecha" />
<c:forEach var="filaFecha" items="${fecha.rows}">
    <c:set var="fec" value="${filaFecha.FECHA}" />  
    <c:set var="hora" value="${filaFecha.HORA}" />
</c:forEach>
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
            <h1 class="TextoTituloGris">Edicion Completa del Mapa N° ${mapaId} - Creado el día ${fec} a las ${hora} hs.&nbsp;&nbsp;&nbsp;
                <img src="images/XtpTm.png" onclick="abreMapa(${mapaId})" style="cursor: pointer" title="Abre Mapa N° ${mapaId}" width="25" height="25" alt="XtpTm"/>
            </h1><br>
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
                            <th class="TextoTitulo">Nombre y Apellido<font style="color: red">*</font></th>
                            <th class="TextoTitulo">Dirección<font style="color: red">*</font></th>
                            <th class="TextoTitulo">Ciudad<font style="color: red">*</font></th>
                            <th class="TextoTitulo">Provincia<font style="color: red">*</font></th>
                            <th class="TextoTitulo">Latitud</th>
                            <th class="TextoTitulo">Longitud</th>
                            <th class="TextoTitulo">Venta<font style="color: red">*</font></th>
                            <th class="TextoTitulo">Entrega</th>
                            <th class="TextoTitulo">Observaciones</th>
                            <th class="TextoTitulo">Estado<font style="color: red">*</font></th>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td class="Cuadro"  align="center">
                                <input type="text" readonly class="ComboChico" id="mapaMarkerId" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboMedio" id="mapaMarkerCliNomApe" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboMedio" id="mapaMarkerDireccion" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboChicoMedio" id="mapaMarkerCiudad" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboChicoMedio" id="mapaMarkerProvincia" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboChico" id="mapaMarkerLat" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboChico" id="mapaMarkerLong" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" class="ComboChico" id="mapaMarkerVenta" onKeyPress="return soloNumeros(event)" name="" value="" />
                            </td>
                            <td class="Cuadro"  align="center">
                                <select id="mapaMarkerEntrega" class="ComboChico" name="entrega">
                                    <option>SI</option>
                                    <option>NO</option>
                                </select>
                            </td>
                            <td class="Cuadro"  align="center">
                                <input type="text" id="mapaMarkerObserva" class="ComboChicoMedio" name="" value="" />
                            </td>
                            <td class="Cuadro" align="center" >
                                <select id="mapaMarkerEstado" class="ComboChicoMedio" name="estado">
                                    <option>ABIERTO</option>
                                    <option>CERRADO</option>
                                </select>
                            </td>
                            <td class="Cuadro" id="guardaNuevaLinea" align="center">
                                <img src="images/guard.png" title="Guarda Marker" id="imgNuevoMarker" style="cursor: pointer" width="20" height="20" alt="guard"/>
                                <img src="images/cancela.png" title="Cancela Edición" id="imgCancela" style="cursor: pointer" width="20" height="20" alt="cancela"/>
                            </td>
                        </tr>



                        <sql:query dataSource="${result}"
                                   sql="${sqlGeneral}"
                                   var="resultado" />
                        <c:forEach var="fila" items="${resultado.rows}">
                            <tr>
                                <td class="Cuadro" id="${fila.mapaMarkerId}" align="center">${fila.mapaMarkerId}</td>
                                <td class="Cuadro" id="mapaMarkerCliNomApe${fila.mapaMarkerId}" align="center">${fila.mapaMarkerCliNomApe}</td>
                                <td class="Cuadro" id="mapaMarkerDireccion${fila.mapaMarkerId}" align="center">${fila.mapaMarkerDirección}</td>
                                <td class="Cuadro" id="mapaMarkerCiudad${fila.mapaMarkerId}" align="center">${fila.mapaMarkerCiudad}</td>
                                <td class="Cuadro" id="mapaMarkerProvincia${fila.mapaMarkerId}" align="center">${fila.mapaMarkerProvincia}</td>
                                <td class="Cuadro" id="mapaMarkerLat${fila.mapaMarkerId}" align="center">${fila.mapaMarkerLat}</td>
                                <td class="Cuadro" id="mapaMarkerLong${fila.mapaMarkerId}" align="center">${fila.mapaMarkerLong}</td>
                                <td class="Cuadro" id="mapaMarkerVenta${fila.mapaMarkerId}" align="center">${fila.mapaMarkerVenta}</td>
                                <td class="Cuadro" id="mapaMarkerEntrega${fila.mapaMarkerId}" align="center">
                                    <c:if test="${fila.mapaMarkerEntrega eq 'S'}" >
                                        <c:set var="entregaFila" value="SI" />
                                    </c:if>
                                    <c:if test="${fila.mapaMarkerEntrega eq 'N'}" >
                                        <c:set var="entregaFila" value="NO" />
                                    </c:if>
                                    ${entregaFila}
                                </td>
                                <td class="Cuadro" id="mapaMarkerObserva${fila.mapaMarkerId}" align="center">${fila.mapaMarkerObserva}</td>
                                <td class="Cuadro" id="mapaMarkerEstado${fila.mapaMarkerId}" align="center">
                                    <c:if test="${fila.mapaMarkerEstado eq '1'}" >
                                        <c:set var="estadoFila" value="ABIERTO" />
                                        ${estadoFila}
                                    </c:if>
                                    <c:if test="${fila.mapaMarkerEstado eq '0'}" >
                                        <c:set var="estadoFila" value="CERRADO" />
                                        <font style="color:  #990000;font-weight: bold">${estadoFila}</font>
                                    </c:if>

                                </td>

                                <td class="Cuadro" align="center">
                                    <c:if test="${fila.mapaMarkerEstado eq '1'}" >
                                        <img src="images/editar.png" title="Edita Marker" onclick="editaMarker(${fila.mapaMarkerId})" style="cursor: pointer" width="15" height="15" alt="edita"/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
        </div>
    </body>
</html>
