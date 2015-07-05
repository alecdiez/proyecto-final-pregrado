<%-- 
    Document   : DatosPersona
    Created on : 04/07/2015, 10:40:25
    Author     : Alejandro
--%>

<%@page import="utl.TextFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/DatosPersona.js"></script>
<link href="css/main.css" rel="stylesheet"/>
<!DOCTYPE html>
<%
    String perNom = TextFormat.toStringNeverNull(session.getAttribute("perNom"));    
%>
<c:set var="perNom" value="<%=perNom%>" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body style="background-color:  #3f3939">
        <div align="right">
            <table>
                <tr>
                    <td class="texto">
                        <c:out value="Bienvenido ${perNom}" />
                    </td>
                    <td style=" vertical-align: bottom ">
                        <form name="form1" action="com.genericQuery">
                            <input type="button" id="closeSession" value="Cerrar Sesion" class="BotonCerrarSession" onmouseover="this.style.color = 'blue'"
                                   onMouseOut="this.style.color = '#c40606'"/>                           
                        </form>

                    </td>
                </tr>

            </table>

        </div>

    </body>
</html>
