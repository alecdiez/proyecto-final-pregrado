<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Sample title</title>
   </head>
   <body>
      <h1>
         <g:if test="${'admin' == 'admin'}">
            <g:each in="${[1,2,3]}" var="num">
               <p>Number ${num}</p>
            </g:each>

            <g:set var="num" value="${1}" />
            <g:while test="${num < 5 }">
               <p>Number ${num++}</p>
            </g:while>
         </g:if>
         <g:else>
            no
         </g:else>
      </h1>
   </body>
</html>
