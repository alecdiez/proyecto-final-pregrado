/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.mysql.jdbc.PreparedStatement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import interfaces.finalVariables;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import jxl.*;
import jxl.read.biff.BiffException;

/**
 *
 * @author Alejandro
 */
public class RecibeArchivo extends HttpServlet implements finalVariables {

    private PreparedStatement pst = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String perUsuario = session.getAttribute("perUsuario").toString();
        String perId = session.getAttribute("perId").toString();
        int ultimoMapaId = 0;

        out.println("<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js\"></script>");
        out.println("<script>");
        out.println("!window.jQuery && document.write('<script src=\"js/jquery-1.4.3.min.js\"><\\/script>');");
        out.println("</script>");
        out.println("<script type=\"text/javascript\" src=\"./js/fancybox/jquery.mousewheel-3.0.4.pack.js\"></script>");
        out.println("<script type=\"text/javascript\" src=\"./js/fancybox/jquery.fancybox-1.3.4.pack.js\"></script>");
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"./js/fancybox/jquery.fancybox-1.3.4.css\" media=\"screen\" />");

        if (ServletFileUpload.isMultipartContent(request)) {

            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest((request));
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {

                        String name = item.getName();
                        String[] ext = name.split("\\.");
                        if (ext[ext.length - 1].equals("xls")) {
                            String archivoCreado = UPLOAD_DIRECTORY + File.separator + ext[0] + "_" + perUsuario + "_" + getDate() + "." + ext[1];
                            File arc = new File(archivoCreado);
                            item.write(new File(archivoCreado));

                            out.println("<script>");

                            //parsear el archivo excel
                            /*if (leerArchivoExcel(archivoCreado)) {
                             out.println("Archivo excel con formato Incorrecto!!!");
                             }*/
                            ultimoMapaId = creaMapa(Integer.parseInt(perId));

                            out.println("$(document).ready(function () {");

                            out.println("parent.$.fancybox.close();");

                            out.println("window.open('MuestraMapa.jsp?mapaId=" + ultimoMapaId + "','','height=700,width=1100,left=200,top=50,scrollbars=1');");

                            out.println("});");

                            out.println("</script>");
                        } else {
                            out.println("Recuerde enviar archivos con formato EXCEL con extension - 'XLS'");
                        }

                    }
                }

            } catch (Exception ex) {
                out.println("File Upload Failed due to " + ex);
            }

        } else {
            out.println("Sorry this Servlet only handles file upload request");
        }

    }

    public boolean leerArchivoExcel(String path) {

        try {

            Workbook workbook = Workbook.getWorkbook(new File(path)); //Pasamos el excel que vamos a leer
            Sheet sheet = workbook.getSheet(0); //Seleccionamos la hoja que vamos a leer
            String nombre;

            for (int fila = 0; fila < sheet.getRows(); fila++) { //recorremos las filas
                for (int columna = 0; columna < sheet.getColumns(); columna++) { //recorremos las columnas
                    nombre = sheet.getCell(columna, fila).getContents(); //setear la celda leida a nombre
                    System.out.print(nombre + " "); // imprimir nombre
                }
                System.out.println("\n");
                System.out.println("————————————-");
            }
            return true;
        } catch (IOException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (BiffException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd_M_yyyy HH_mm_ss");
        String date = sdf.format(new Date());
        return date;
    }

    public int creaMapa(int usrId) {

        ResultSet rs = null;

        try {
            genericQuery gq = new genericQuery();
            gq.doConnect();
            String execute = "INSERT INTO `tesis`.`mapa`\n"
                    + " (mapaUsrId,\n"
                    + " mapaFecha)\n"
                    + "VALUES\n"
                    + " ('" + usrId + "',\n"
                    + " now())";

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(execute);
            pst.executeUpdate(execute);

            String query = "select max(mapaId) from tesis.mapa;";

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(query);
            this.pst.execute();
            rs = pst.getResultSet();
            if (rs.next()) {
                return rs.getInt(1);
            }

            gq.doConnectClose();
            return 0;
        } catch (InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }

    }

}
