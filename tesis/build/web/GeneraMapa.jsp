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
        <div align="left">
            <h1 class="Group">Se recuerda que para generar un nuevo mapa, se debe ingresar los datos en un archivo 
                excel que luego se debera seleccionar!</h1>
        </div><br><br>
        <form action="com.RecibeArchivo" method="post" enctype="multipart/form-data">

            <div align="left">
                <input type="file" id="archivo" width="150px" name="file" value="" />
            </div><br><br>
            <div align="center">
                <input type="submit" id="generaMapa" class="BotonTablaRoja" value="Generar Mapa" name="generaMapa" />
            </div>
        </form>


    </body>
</html>
