<%--
    Document   : AltaPersona
    Created on : 06-jul-2015, 10:45:54
    Author     : bizit
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
<script src="js/AltaPersona.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div align="center">
            <h1 class="TextoTituloGris">Alta Persona</h1>
            <table border="0" cellspacing="2" cellpadding="2">
                <thead>
                    <tr>
                        <th class="TextoTitulo">Descripción</th>
                        <th class="TextoTitulo">Datos</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="TextoTituloGris">Nombre <font style="color: red">.*</font></td>
                        <td><input type="text" id="nom" class="ComboMedio" name="nom" value="" /></td>
                    </tr>
                    <tr>
                        <td class="TextoTituloGris">Apellido <font style="color: red">.*</font></td>
                        <td><input type="text" id="ape" class="ComboMedio" name="ape" value="" /></td>
                    </tr>
                    <tr>
                        <td class="TextoTituloGris">Dni <font style="color: red">.*</td>
                        <td><input type="text" id="dni" class="ComboMedio" name="ndi" value="" onKeyPress="return soloNumeros(event)"/></td>
                    </tr>
                    <tr>
                        <td class="TextoTituloGris">Usuario <font style="color: red">.*</font></td>
                        <td><input type="text" id="usr" class="ComboMedio" name="usr" value="" /></td>
                    </tr>
                    <tr>
                        <td class="TextoTituloGris">Contraseña <font style="color: red">.*</font></td>
                        <td><input type="password" id="pass" class="ComboMedio" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td class="texto"></td>
                        <td><input type="button" class="BotonTablaRoja" id="guardaPersona" value="Guardar" name="guardaPersona" /></td>
                    </tr>
                </tbody>
            </table>
        </div>

    </body>
</html>
