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
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'sorter.css')}" type="text/css">
        <title>Prizy - New Price</title>
    </head>
    <body>
        <table width="70%"><tr><td><div align="right"><g:link controller="researcher" action="index">Go Back</g:link></div></td></tr></table><br>
            <h1 align="center">Add New Price</h1> 
            <div align="center">
                <p>It's important to remember that you can not add</p>
                <p>a new price to an unexisting Product.</p>
            <g:form name="form1" action="newprice">
                <table width="60%" cellspacing="10">
                    <thead>
                        <tr>
                            <th align="left" width="20%">Description</th>
                            <th align="left">Field</th>                        
                        </tr>
                    </thead>            
                    <tbody>                    
                        <tr>
                            <td align="left">Product BAR CODE</td>
                            <td align="left"><g:field type="number" name="barcode" value="${barcode}"/></td>                        
                        </tr>  
                        <tr>
                            <td align="left">Product Price </td>
                            <td align="left"><g:field type="number" name="price" value="${price}"/></td>                        
                        </tr>
                        <tr>
                            <td align="left">Notes</td>
                            <td align="left"><g:field type="text" name="note" value="${note}"/></td>                        
                        </tr>
                        <tr>
                            <td>${error}</td>
                            <td><g:submitButton name="submit" value="Save" /></td>                        
                        </tr>
                    <br/>                
                    </tbody>     
                </table>
                
                 <script> 
 $( document ).ready(function() {
    $('#form1').validate({
        rules: {
            price: 'required',
            barcode:{
              required: true,
              minlength: 12,
              maxlength: 12
            }            
        },
        messages: {
            price: {
                required: 'Please enter the PRICE  for this product!',
            },
            barcode: {
                required: 'Please provide an existing BAR CODE',
                minlength: 'Please Remember, 12 Digits for the Bar Code! Thanks.',
                maxlength: 'Please Remember, 12 Digits for the Bar Code! Thanks.'
            }
        },

        submitHandler: function(form) {

            if(form1.valid()){
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

