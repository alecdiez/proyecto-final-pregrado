<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
        <link rel="shortcut icon" type="image/x-icon" href="http://sia1.subirimagenes.net/img/2015/05/29/150529111542371236.jpg" />
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'sorter.css')}" type="text/css">
        <title>Prizy - New Product</title>
    <r:layoutResources/>    
</head>
<body>
    <table width="70%"><tr><td><div align="right"><g:link action="index">Go Back</g:link></div></td></tr></table><br>
        <h1 align="center">Add New Product</h1>
        <div align="center">
            <p>It's important to remember that there is not can be two products</p>
            <p>with the same BARCODE and PRODUCT CODE.</p>        
        <g:form name="formSubmit" action="newproduct">
            <table width="60%" align="center" cellspacing="10">
                <thead>
                    <tr>
                        <th align="left" width="20%">Description</th>
                        <th align="left">Field</th>                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="left">Product CODE</td>
                        <td align="left"><g:field type="text" name="code" value="${code}"/></td>                        
                    </tr>
                    <tr>
                        <td align="left">Product BAR CODE</td>
                        <td align="left"><g:field type="number" name="barCode" value="${barCode}"/></td>                        
                    </tr>
                    <tr>
                        <td align="left">Product DESC</td>
                        <td align="left"><g:field type="text" name="desc" value="${desc}"/></td>                        
                    </tr>
                    <tr>
                        <td align="left">
                            <span class="red">${error}</span>
                        </td>
                        <td align="left"><g:submitButton name="submit" value="SAVE"/></td>
                    </tr>
                <br/>
                </tbody>
            </table>
<script type="text/javascript"> 
    $( document ).ready(function() { 
    $('#formSubmit').validate({
        rules: {
            code: 'required',
            barCode: {
                required: true,
                minlength: 12,
                maxlength: 12
            }            
        },
        messages: {
            code: {
                required: 'Please enter the CODE  for your new product!',
            },
            barCode: {
                required: 'Please provide a new BAR CODE',
                minlength: 'Please Remember, 12 Digits for the Bar Code! Thanks.',
                maxlength: 'Please Remember, 12 Digits for the Bar Code! Thanks.'
            }
        },

        submitHandler: function(form) {

            if(formSubmit.valid()){
                form.submit();
                 $('button[type="submit"]').removeAttr('disabled');
            } else {
                $('button[type="submit"]').attr('disabled','disabled');
                }
             }
        });  
});
</script>
        </g:form>    
    </div>
</body>
</html>
