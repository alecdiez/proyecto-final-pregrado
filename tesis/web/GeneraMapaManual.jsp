<%--
    Document   : GeneraMapaManual
    Created on : 25/10/2015, 19:39:29
    Author     : Alejandro
--%>

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
<script src="js/GeneraMapaManual.js"></script>
<%@include file="sessionControl.jsp"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <table border="0" cellpadding="20">
         <thead>
            <tr>
               <th colspan="3">
         <h1 class="Group">Para Generar un Nuevo Mapa Simplemente Oprima "Nuevo Mapa"!</h1>
      </th>
   </tr>
</thead>
<tbody>
   <tr>
      <td align="left" class="TextoLinea">
         Observaciones:
      </td>
      <td align="left" class="TextoLinea">
         <input type="text" id="observa" size="35" name="observa" value="" />
      </td>
      <td>
         <input type="button" id="generaMapa" class="BotonTablaRoja" title="Genera Mapa" value="Generar Mapa" name="generaMapa" />
      </td>
</tbody>

</table>
</body>
</html>
