<%--
    Document   : AsignaPrivilegio
    Created on : 07-jul-2015, 8:53:04
    Author     : bizit
--%>

<%@page import="interfaces.finalVariables"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.alerts.js"></script>
<link href="js/jquery.alerts.css" rel="stylesheet" type="text/css" />
<script src="js/AsignaPrivilegio.js"></script>
<link href="css/main.css" rel="stylesheet"/>
<!DOCTYPE html>
<c:set var="url" value="<%=finalVariables.url%>" />
<c:set var="user" value="<%=finalVariables.connUsr%>" />
<c:set var="pass" value="<%=finalVariables.connPass%>" />
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

   </head>
   <body>
      <sql:setDataSource var="result" driver="com.mysql.jdbc.Driver"
                         url="${url}" user="${user}" password="${pass}" />
      <div align="center">
         <h1 class="TextoTituloGris">Asignación de Privilegios por Persona</h1>
         <table class="FormatoTabla">
            <thead>
               <tr>
                  <th class="TextoTitulo">
                     <c:out value="Personas" />
                  </th>
                  <th>

                  </th>
                  <th class="TextoTitulo">
                     <c:out value="Privilegios" />
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td  align="left">
                     <sql:query dataSource="${result}" sql="select per.perId, per.perNom, per.perApe from tesis.personas per order by perId"
                                var="resultado" />
                     <div id="listaPersonas">

                        <ul >
                           <c:forEach var="fila" items="${resultado.rows}">
                              <li class="TextoGrande" id="${fila.perId}"><c:out value="${fila.perNom} ${fila.perApe}" /></li><br>
                              </c:forEach>

                        </ul>
                     </div>

                  </td>

                  <td></td>

                  <td class="TextoTituloPlano" align="left">
                     <sql:query dataSource="${result}" sql="select privi.priviId, privi.privilegio from tesis.privilegios privi order by priviId"
                                var="resultado" />
                     <ul >
                        <table>
                           <div id="listaPrivilegios">
                              <c:forEach var="fila" items="${resultado.rows}">
                                 <tr>
                                    <td>
                                 <li><c:out value="${fila.privilegio}" /></li>
                                 </td>
                                 <td>
                                    <input class="TextoGrande" id="privi${fila.priviId}" type="checkbox" style="cursor: pointer" name="privi" value="" />
                                 </td>
                                 </tr>
                              </c:forEach>
                           </div>
                        </table>

                     </ul>

                  </td>
               </tr>
            </tbody>
         </table>

      </div>
   </body>
</html>
