<%--
    Document   : Login
    Created on : 03-jul-2015, 11:56:09
    Author     : bizit
--%>

<%@page import="utl.TextFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/main.css" rel="stylesheet"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/Login.js"></script>
        <%
            String clienteIpNumero = request.getLocalAddr();
        %>

    </head>
    <body>

        <table  border="0" width="100%">
            <tr>
                <td align="center">

                    <div  style="background-color:  #c40606;border-radius: 10px;width: 75%;text-align: left">

                        <form action="com.genericQuery" method="post">

                            <table  border="0" >
                                <thead>
                                <th>
                                <table cellpadding="0" cellspacing="0" id="login" border="0" >
                                    <tr>
                                        <td><label  class="Texto" >Usuario:</label>&nbsp;<input name="usuario" id="usuario" type="text" class="ComboMedio"  value="" align="rigth" />&nbsp</td>
                                        <td><label  class="Texto">Contraseña:</label>&nbsp;<input name="password" id="password" type="password" class="ComboMedio" value="" align="rigth"/>&nbsp&nbsp</td>
                                    <input type="hidden" name="clienteIpNumero" value="<%=clienteIpNumero%>" />
                                    </tr>

                                </table>
                                </th>
                                <th style=" vertical-align: bottom ">

                                <div align ="right">
                                    <input type="submit"  value="Ingresar"  name="ingresa_b" title="Ingresar" style="width: 75px" class="BotonTablaRoja" />
                                </div>
                                </th>
                                <%
                                    String emptySession = TextFormat.toStringNeverNull(session.getAttribute("empty"));
                                    if (!emptySession.isEmpty()) {%>
                                <th style=" vertical-align: bottom ">
                                <div>
                                    <span class="Texto">Error de usuario y Contraseña!!!</span>
                                </div>

                                <%}%>


                                </th>

                                </thead>
                            </table>

                        </form>
                    </div>
                </td>
            </tr>
        </table>


    </body>
</html>
