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
            <p>The "Ideal Price" ORIGINAL FORMULA is calculated by taking all</p>
            <p> the prices of this product, removing the 2 highest</p>
            <p>and 2 lowest, then doing an average with the rest and adding 20% to it. </p>
            <br>
        <g:form name="form1" controller="admin" action="idealpriceformula">
            <table width="50%">
                <tr><td >
                        Formula Used to calculate the Ideal Price:
                        &nbsp;&nbsp;&nbsp;
                        ID:<span class="green">&nbsp;${formulaUsed?.formulaId}</span>
                    </td>
                    <td>
                        Date of Birth:&nbsp;
                        <span class="green"><g:formatDate format="MM-dd-yyyy HH:mm" date="${formulaUsed?.formulaDate}"/></span>
                    </td>
                </tr>
                <tr><td colspan="2"></td></tr>
                <tr>
                    <td colspan="2">
                        Description:&nbsp;<span class="green">${formulaUsed?.formulaDescription}</span>
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
                    <th>Description</th>   
                    <th>Is Used</th>
                    <th>Select Formula</th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${formulas}" var="form" status="i">
                    <g:if test="${form.formulaIsUsed == 'Y'}">
                        <tr>
                            <td class="green">${form.formulaId}</td>
                            <td class="green">
                                <g:formatDate format="MM-dd-yyyy HH:mm" date="${form.formulaDate}"/>
                            </td>
                            <td class="green">${form.formulaDescription}</td>
                            <td class="green">YES</td>
                            <td class="green">Formula Used</td>
                        </tr>
                    </g:if>
                    <g:else>
                        <tr>
                            <td>${form.formulaId}</td>
                            <td>
                                <g:formatDate format="MM-dd-yyyy HH:mm" date="${form.formulaDate}"/>
                            </td>
                            <td>${form.formulaDescription}</td>
                            <td>No</td>                            
                            <td>
                                <g:form name="formPick" controller="admin" action="idealpriceformula">
                                    <g:hiddenField name="idPick" value="${form.formulaId}" />
                                    <g:submitButton name="change" value="Pick" property="title" title="Pick Formula # ${form.formulaId} " />
                                </g:form>
                            </td>
                        </tr>
                    </g:else>
                </g:each>
            </tbody>
        </table>
    </center>
    <script type="text/javascript"> 
        $( document ).ready(function() { 

        });
    </script>
</body>
</html>
