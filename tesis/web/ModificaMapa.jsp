<%--
    Document   : ModificaMapa
    Created on : Oct 26, 2015, 3:04:23 PM
    Author     : bizit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
   String mapaId = request.getParameter("mapaId");
%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>JSP Page</title>
   </head>
   <body>
      <h1><%=mapaId%></h1>
   </body>
</html>
