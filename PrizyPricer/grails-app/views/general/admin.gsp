<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="shortcut icon" type="image/x-icon" href="http://sia1.subirimagenes.net/img/2015/05/29/150529111542371236.jpg" />
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
      <link rel="stylesheet" href="${resource(dir: 'css', file: 'sorter.css')}" type="text/css">
      <title>Prizy - Administrators</title>
   </head>
   <body>
   <center>
      <table width="70%"><tr><td><div align="right"><g:link controller="general" action="index">Go Back</g:link></div></td></tr></table><br>
         <h1 align="center">List of Products</h1>
      <g:form action="admin">
         <table width="70%"><tr><td>Search By Bar Code: <g:field type="number" name="barcode" value="${barcode}"/>
                  <g:submitButton name="search" value="Go" />
               </td><td align="right"><g:link controller="general" action="newproduct">Add New Product</g:link></td></tr></table>
            </g:form>

      <table id="products">
         <thead>
            <tr>
               <th>ID</th>
               <th>Bar Code</th>
               <th>Code</th>
               <th>Desc</th>
               <th>Ideal Price</th>
               <th>Average Price</th>
               <th>Highest Price</th>
               <th>Lowest Price</th>
               <th>Prices UpLoaded</th>
            </tr>
         </thead>
         <tbody>
            <g:each in="${products}" var="product" status="i">
               <tr>
                  <td>${product.product_ID}</td>
                  <td>${product.product_BAR_CODE}</td>
                  <td>${product.product_CODE}</td>
                  <td>${product.product_DESC}</td>
                  <td>
                     <g:if test="${product.product_IDEAL_PRICE == 0}">
                        No ideal Price Yet
                     </g:if>
                     <g:if test="${product.product_IDEAL_PRICE != 0}">
                        ${product.product_IDEAL_PRICE}
                     </g:if>
                  </td>
                  <td>${product.product_AVERAGE_PRICE}</td>
                  <td>${product.product_HIGHEST_PRICE}</td>
                  <td>${product.product_LOWEST_PRICE}</td>
                  <td>${product.product_NUMBER_OF_PRICES}</td>
               </tr>
            </g:each>
         </tbody>
      </table>
      <g:if test="${products.empty}">
         No product is found
      </g:if>
   </center>
</body>
</html>
