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
        <title>Prizy - Ideal Price Formula</title>
    </head>
    <body>    
    <center>      
        <table width="70%"><tr><td><div align="right"><g:link dontroller="admin" action="index">Go Back</g:link></div></td></tr></table>
            <h1 align="center">Ideal Price Formula</h1>            
            <p>The "Ideal Price" is calculated by taking all</p>
            <p> the prices of this product, removing the 2 highest</p>
            <p>and 2 lowest, then doing an average with the rest and adding 20% to it. </p>
            <br>
        <g:form name="form1" controller="admin" action="idealpriceformula">
            <table width="50%">
                <tr><td colspan="2">
                        Formula Used to calculate the Ideal Price:
                        &nbsp;&nbsp;&nbsp;
                        ID:&nbsp;${formulaUsed.idealPriceFormulaId}                                         
                    </td>
                    <td colspan="2">
                        Date of Birth:&nbsp;
                        <g:formatDate format="MM-dd-yyyy HH:mm" date="${formulaUsed.idealPriceFormulaDate}"/>                        
                    </td>
                </tr>
                <tr><td colspan="4"></td></tr>
                <tr>
                    <td>
                        Percentage:&nbsp;<g:field type="number" style="width:50px;" name="percentage" value="${formulaUsed.idealPriceFormulaPercentage}" required=""/>                            
                    </td>
                    <td>
                        Max:&nbsp;<g:field type="number" style="width:50px;" name="max" value="${formulaUsed.idealPriceFormulaMax}" required=""/>
                    </td>
                    <td>
                        Min:&nbsp;<g:field type="number" style="width:50px;" name="min" value="${formulaUsed.idealPriceFormulaMin}" required=""/>
                    </td>
                    <td>
                        <g:submitButton name="create" value="Create New Formula" />
                        ${error}
                    </td>
                </tr>
            </table>
        </g:form>
        <br><br>
        <table id="products">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date Of Birth</th>
                    <th>Max</th>
                    <th>Min</th>
                    <th>Percentage</th>
                    <th>Is Used</th>
                </tr>
            </thead>            
            <tbody>
                <g:each in="${formulas}" var="form" status="i">
                    <g:if test="${form.idealPriceFormulaIsUsed == 'S'}">
                        <tr>
                            <td class="red">${form.idealPriceFormulaId}</td>
                            <td class="red">
                                <g:formatDate format="MM-dd-yyyy HH:mm" date="${form.idealPriceFormulaDate}"/>
                            </td>
                            <td class="red">${form.idealPriceFormulaMax}</td>
                            <td class="red">${form.idealPriceFormulaMin}</td>  
                            <td class="red">${form.idealPriceFormulaPercentage}</td>
                            <td class="red">${form.idealPriceFormulaIsUsed}</td>
                        </tr>
                    </g:if>
                    <g:else>
                        <tr>
                            <td>${form.idealPriceFormulaId}</td>
                            <td>
                                <g:formatDate format="MM-dd-yyyy HH:mm" date="${form.idealPriceFormulaDate}"/>
                            </td>
                            <td>${form.idealPriceFormulaMax}</td>
                            <td>${form.idealPriceFormulaMin}</td>  
                            <td>${form.idealPriceFormulaPercentage}</td>
                            <td>${form.idealPriceFormulaIsUsed}</td>
                        </tr>

                    </g:else>                                 
                </g:each>                
            </tbody>     
        </table>         
    </center>
</body>
</html>
