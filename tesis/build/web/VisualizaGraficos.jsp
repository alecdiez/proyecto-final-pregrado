<%-- 
    Document   : VisualizaGraficos
    Created on : 28/09/2015, 20:26:44
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script src="js/VisualizaGraficos.js"></script>
<link href="css/main.css" rel="stylesheet"/>

<!-- Load c3.css -->
<link href="js/c3-0.4.10/c3.css" rel="stylesheet" type="text/css">

<!-- Load d3.js and c3.js -->
 <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="js/c3-0.4.10/c3.min.js"></script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Graficos</title>
    </head>
    <body>
        <h1 class="TextoTituloGris">Graficos Comparativo de Total de Ventas por Fecha</h1>
        <br><br>
        <div id="chart"></div>
    </body>
</html>
