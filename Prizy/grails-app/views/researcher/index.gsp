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
        <title>Prizy - Researcher</title>
    </head>
    <body>    
    <center>      
        <table width="70%"><tr><td><div align="right"><g:link uri="/">Go Back</g:link></div></td></tr></table><br>
            <h1 align="center">List of Prices UpLoaded</h1>        
            <table width="70%"><tr><td></td><td align="right"><g:link controller="researcher" action="newprice">Add New Price</g:link></td></tr></table>
            <table id="products">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Bar Code</th>
                        <th>Price</th>
                        <th>Notes</th>                    
                    </tr>
                </thead>            
                <tbody>
                <g:each in="${prices}" var="price" status="i">
                    <tr>
                        <td>${price.pricesId}</td>
                        <td>${price.pricesBarCode}</td>
                        <td>${price.pricesPrice}</td>
                        <td>${price.pricesNotes}</td>                        
                    </tr>             
                </g:each>                
            </tbody>     
        </table>         
    </center>
</body>
</html>

