<%--
    Document   : GeneraMapa
    Created on : 11/07/2015, 11:20:43
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
<script src="js/GeneraMapa.js"></script>
<%@include file="sessionControl.jsp"%>
<!DOCTYPE html>
<html>
   <head>

   </head>
   <body>
      <div align="center">
         <h1 class="TextoTituloGris">Generar Nuevo Mapa</h1>
      </div><br>

      <form action="com.RecibeArchivo" method="post" enctype="multipart/form-data">

         <table border="0" width="50%" cellpadding="20">
            <thead>
               <tr>
                  <th colspan="2"><div align="left">
               <h1 class="Group">Se recuerda que para generar un nuevo mapa, se debe ingresar los datos en un archivo
                  excel que luego se debera seleccionar! - O puede Generar un mapa ingresando valores manualmente.</h1>
            </div></th>
            </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="background: #CFCFCF">
                     <div class="custom-input-file">
                        <input type="file" id="archivo" name="file" class="input-file" />
                        Examinar
                        <div class="archivo">...</div>
                     </div>
                  </td>
                  <td style="background: #CFCFCF">
                     <input type="submit" id="generaMapa" class="BotonTablaRoja" title="Genera Mapa by Excel" value="Generar Mapa" name="generaMapa" />
                  </td>
               </tr>
               <tr>
                  <td>
                     <input type="button" id="generaMapaManual" class="BotonTablaRoja" title="Genera Mapa Manual" value="Generar Mapa Manual" name="generaMapaManual" />
                  </td>
               </tr>
               <tr>
                  <td>
                     <h2 class="Group">Ejemplo de archivo Excel! extension .xls (Compatible 97/2003) Recuerde Completar todos los datos!!!</h2>
                     <img src="images/ejemplo.jpg" width="700" height="332" alt="ejemplo"/>
                  </td>
               </tr>
            </tbody>
         </table>

      </form>
   </body>
</html>
