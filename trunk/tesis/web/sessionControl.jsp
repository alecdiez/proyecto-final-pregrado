<%-- 
    Document   : sessionControl
    Created on : 04/07/2015, 10:53:55
    Author     : Alejandro
--%>

<%@page import="utl.TextFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String emptyPer = TextFormat.toStringNeverNull(session.getAttribute("empty"));
    String perId = TextFormat.toStringNeverNull(session.getAttribute("perId"));
    String perUsuario = TextFormat.toStringNeverNull(session.getAttribute("perUsuario"));
    String perPass = TextFormat.toStringNeverNull(session.getAttribute("perPass"));

    if (emptyPer.equals("empty")) {
        response.sendRedirect("index.html");
    }
%>
