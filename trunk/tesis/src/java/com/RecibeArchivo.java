/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Alejandro
 */
public class RecibeArchivo extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "C:\\apache-tomcat-7.0.50\\upLoadFiles";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        if (ServletFileUpload.isMultipartContent(request)) {

            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest((request));
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {

                        String name = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + name));

                    }
                }
                out.println("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js\"></script>");
                out.println("<script>");
                out.println("!window.jQuery && document.write('<script src=\"js/jquery-1.4.3.min.js\"><\\/script>');");
                out.println("</script>");
                out.println("<script type=\"text/javascript\" src=\"./js/fancybox/jquery.mousewheel-3.0.4.pack.js\"></script>");
                out.println("<script type=\"text/javascript\" src=\"./js/fancybox/jquery.fancybox-1.3.4.pack.js\"></script>");
                out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"./js/fancybox/jquery.fancybox-1.3.4.css\" media=\"screen\" />");

                out.println("<script>");

                out.println("$(document).ready(function () {");

                out.println("parent.$.fancybox.close();");

                out.println("window.open('MuestraMapa.jsp','','height=700,width=1100,left=200,top=50,scrollbars=1');");

                out.println("});");

                out.println("</script>");

            } catch (Exception ex) {
                out.println("File Upload Failed due to " + ex);
            }

        } else {
            out.println("Sorry this Servlet only handles file upload request");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
