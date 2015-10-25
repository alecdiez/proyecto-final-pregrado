<%-- 
    Document   : GraficosPorVenta
    Created on : 25/10/2015, 09:39:15
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

        <script src="js/GraficosPorVentas.js"></script>
        <link href="css/main.css" rel="stylesheet"/>
    </head>
    <body>
        <h1 class="TextoTituloGris"><p>Seleccione entre que valores de venta se mostraran los graficos estadisticos.</p></h1><br>

        <table border="0" id="tabla" cellpadding="20">
            <tr>
                <td align="left" class="TextoLinea"><p>CANTIDADES:</p></td>
                <td align="left" class="TextoLinea"><p>Cantidad Minima de Ventas:<font style="color: red">*</font> 
                        <input type="text" size="5" style="color: #666" id="min" onKeyPress="return soloNumeros(event)"></p></td>
                <td align="left" colspan="2" class="TextoLinea"><p>Cantidad Maxima de Ventas:<font style="color: red">*</font> 
                        <input type="text" size="5" style="color: #666" id="max" onKeyPress="return soloNumeros(event)"></p></td>
            </tr>
            <tr>
                <td align="left" colspan="3" class="TextoLinea"><p>Cantidad Maxima de Mapas a Comparar:<font style="color: red">*</font> 
                        <input type="text" size="2" style="color: #666" id="cantMax" onKeyPress="return soloNumeros(event)"></p></td>
            </tr>
            <tr>
                <td align="left" class="TextoLinea"><p>ESTADOS:</p></td>
                <td align="left" class="TextoLinea"><p>Abierto:&nbsp;<input type="radio" name="estado" value="1" /></p></td>
                <td align="left" colspan="2" class="TextoLinea"><p>Cerrado:&nbsp;<input type="radio" name="estado" value="0" /></p></td>                
            </tr>
            <tr>
                <td colspan="3" align="center"><input type="button" id="generaGraficos" class="BotonTablaRoja" title="Click para generar el grafico!" value="Mostrar Graficos" name="generaGraficos" /></td>
            </tr>
        </table>


    </body>
</html>
