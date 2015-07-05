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
<!DOCTYPE html>
<%
    String emptyPer = TextFormat.toStringNeverNull(session.getAttribute("empty"));
    String perId = TextFormat.toStringNeverNull(session.getAttribute("perId"));
    String perUsuario = TextFormat.toStringNeverNull(session.getAttribute("perUsuario"));
    String perPass = TextFormat.toStringNeverNull(session.getAttribute("perPass"));
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body style="background-color:  #3f3939">
        
    </body>
</html>
