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
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'sorter.css')}" type="text/css">
        <title>Prizy - New Product</title>
    </head>
    <body>
        <table width="70%"><tr><td><div align="right"><g:link controller="general" action="admin">Go Back</g:link></div></td></tr></table><br>
            <h1 align="center">Add New Product</h1> <p>It's important to remember that there is not can be two products</p>
            <p>with the same BARCODE and PRODUCT CODE.</p>
            <div align="center">
            <g:form action="newproduct">
                <table id="products" width="40%">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Field</th>                        
                        </tr>
                    </thead>            
                    <tbody>                    
                        <tr>
                            <td>Product CODE</td>
                            <td><g:field type="text" name="code" value="${code}" required="true"/></td>                        
                        </tr>  
                        <tr>
                            <td>Product BAR CODE</td>
                            <td><g:field type="number" name="barcode" value="${barcode} property="title" title="(12 Digits important!)" required="true"/></td>                        
                        </tr>
                        <tr>
                            <td>Product DESC</td>
                            <td><g:field type="text" name="desc" value="${desc}" required="true"/></td>                        
                        </tr>
                        <tr>
                            <td></td>
                            <td><g:submitButton name="submit" value="Save" /></td>                        
                        </tr>
                    <br/>                
                    </tbody>     
                </table>
            </g:form>
        </div>
    </body>
</html>
