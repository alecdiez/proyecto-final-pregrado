<%-- 
    Document   : AltaPrivilegio
    Created on : 07/07/2015, 07:12:34
    Author     : Alejandro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<script src="js/AltaPrivilegio.js"></script>
<!DOCTYPE html>
<%@include file="sessionControl.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div align="center">
            <h1 class="TextoTituloGris">Alta Privilegio</h1>
            <table border="0" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>
                        <th class="TextoTitulo"></th>
                        <th class="TextoTitulo">Nombre</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="TextoTituloGris">Privilegio <font style="color: red">.*</font></td>
                        <td><input type="text" id="nom" class="ComboMedio" name="nom" value="" /></td>
                    </tr>   
                     <tr>
                        <td class="texto"></td>
                        <td><input type="button" class="BotonTablaRoja" id="guardaPrivilegio" value="Guardar" name="guardaPrivilegio" /></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </body>
</html>

