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
        <title>Prizy - New Price</title>
    </head>
    <body>
        <table width="70%"><tr><td><div align="right"><g:link controller="general" action="researcher">Go Back</g:link></div></td></tr></table><br>
            <h1 align="center">Add New Price</h1> 
            <div align="center">
                <p>It's important to remember that you can not add</p>
                <p>a new price to an unexisting Product.</p>
            <g:form name="form1" action="newprice">
                <table id="products" width="40%">
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Field</th>                        
                        </tr>
                    </thead>            
                    <tbody>                    
                        <tr>
                            <td>Product BAR CODE</td>
                            <td><g:field type="number" name="barcode" value="${barcode}" property="title" title="(12 Digits important!)" required="true"/></td>                        
                        </tr>  
                        <tr>
                            <td>Product Price </td>
                            <td><g:field type="number" name="price" value="${price}"  required="true"/></td>                        
                        </tr>
                        <tr>
                            <td>Notes</td>
                            <td><g:field type="text" name="note" value="${note}"/></td>                        
                        </tr>
                        <tr>
                            <td>${error}</td>
                            <td><g:submitButton name="submit" value="Save" /></td>                        
                        </tr>
                    <br/>                
                    </tbody>     
                </table>
            </g:form>
        </div>
    </body>
</html>
