<%--
    Document   : menu
    Created on : 06-jul-2015, 8:54:26
    Author     : bizit
--%>

<%@page import="asignaMenu.AsignaMenu"%>
<%@page import="utl.TextFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   </head>
   <body>
      <%
         Long perId = Long.parseLong(TextFormat.toStringNeverNull(session.getAttribute("perId")));
         AsignaMenu am = new AsignaMenu();
         out.print(am.asignaMenu(perId));
      %>
   </body>
</html>
