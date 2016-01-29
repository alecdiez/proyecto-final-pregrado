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

        <title>Welcome to PRYZY</title>

        <style>
            div { color: #7c795d; font-family: 'Trocchi', serif; font-size: 25px; font-weight: normal; line-height: 48px; margin: 0; }

            a:link, a:visited {
            background-color: #f44336;
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            }


            a:hover, a:active {
            background-color: red;
            }
        </style>

    </head>
    <body>
        <div align="center"><img src="${resource(dir: 'images', file: 'prizy.png')}" alt="logo"/></div>
        <div align="center"><img src="${resource(dir: 'images', file: 'prizy2.png')}" alt="logo"/></div>
        <table align="center" width="60%" border="0" cellspacing="100">
            <tr>
                <td>
                    <div class="styleGreen" style="text-align: center; height:250px; width: 250px; position: absolute;">

                        <g:link controller="researcher" action="index">
                            <p>IF YOU ARE A PRICE RESEARCHER</p>
                            <p>PRESS HERE</p>
                        </g:link>
                    </div>
                </td>
                <td>

                    <div class="styleGreen" style="text-align: center; height:250px; width: 250px; position: absolute;">
                        <g:link controller="admin" action="index">
                            <p>IF YOU ARE AN ADMINISTRATOR</p>
                            <p>PRESS HERE</p>
                        </g:link>
                    </div>

                </td>
            </tr>
        </table>
    </body>
</html>
