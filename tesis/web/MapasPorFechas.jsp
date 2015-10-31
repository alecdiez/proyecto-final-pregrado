<%-- 
    Document   : MapasPorFecha
    Created on : 24/10/2015, 09:47:03
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <script type="text/javascript" src='http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'></script>
        <script type="text/javascript"  src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/jquery-ui.min.js'></script>
        <link rel="stylesheet" type="text/css"href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css"></link>
        <script type="text/javascript" src="./js/fancybox/jquery.mousewheel-3.0.4.pack.js"></script>
        <script type="text/javascript" src="./js/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
        <link rel="stylesheet" type="text/css" href="./js/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
        <script type="text/javascript" src="js/jquery.alerts.js"></script>
        <link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" />

        <script src="js/MapasPorFechas.js"></script>
        <link href="css/main.css" rel="stylesheet"/>
    </head>
    <body>
        <h1 class="TextoTituloGris">Seleccione el estado y las fechas para mostrar los Mapas.</h1><br>
        <h2 class="TextoTituloGris">Click sobre el campo para expandir el calendario.</h2>
        <form name="form1">
            <table border="0" id="tabla" cellpadding="20">
                <tr>
                    <td align="left" class="TextoLinea"><p>FECHAS:</p></td>
                    <td align="left" class="TextoLinea"><p>Fecha Desde: <font style="color: red">*</font><input type="text" style="color: #666" id="fechaDesde" readonly></p></td>
                    <td align="right" class="TextoLinea"><p>Fecha Hasta: <font style="color: red">*</font><input type="text" style="color: #666" id="fechaHasta" readonly></p></td>
                </tr>
                <tr>
                    <td align="left" class="TextoLinea"><p>ESTADOS:</p></td>
                    <td align="left" class="TextoLinea"><p>Abierto:&nbsp;<input type="radio" name="estado" value="1" /></p></td>
                    <td align="left" class="TextoLinea"><p>Cerrado:&nbsp;<input type="radio" name="estado" value="0" /></p></td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><input type="button" id="mapasPorFechas" title="Click para buscar mapas!" class="BotonTablaRoja" value="Mostrar Mapas" name="mapasPorFechas" /></td>
                </tr>
            </table>

        </form>
    </body>
</html>
