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
    String perNom = TextFormat.toStringNeverNull(session.getAttribute("perNom"));

    if ((emptyPer.equals("empty") || emptyPer.isEmpty()) && perId.isEmpty() && perUsuario.isEmpty() && perPass.isEmpty() && perNom.isEmpty()) {
        response.sendRedirect("index.html");
    }
%>
