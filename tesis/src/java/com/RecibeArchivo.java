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
import java.util.ArrayList;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import jxl.*;
import jxl.read.biff.BiffException;
import static utl.TextFormat.toStringNeverNull;

/**
 *
 * @author Alejandro
 */
public class RecibeArchivo extends HttpServlet implements finalVariables {

    private PreparedStatement pst = null;
    private genericQuery gq = new genericQuery();
    private ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String perId = session.getAttribute("perId").toString();
        String mapaMarkerId = toStringNeverNull(request.getParameter("mapaMarkerId"));
        String lat = toStringNeverNull(request.getParameter("latitud"));
        String lng = toStringNeverNull(request.getParameter("longitud"));
        String manual = toStringNeverNull(request.getParameter("manual"));
        String observa = toStringNeverNull(request.getParameter("observa"));
        if (manual != null && manual.equals("true")) {
            out.print(creaMapa(Integer.parseInt(perId), observa));
        } else {
            guardaLatLng(mapaMarkerId, lat, lng);
        }

    }

    public void guardaLatLng(String mapaMarkerId, String lat, String lng) {

        try {
            gq.doConnect();
            String execute = "UPDATE tesis.mapamarker"
                    + " SET"
                    + " mapaMarkerLat = '" + lat + "',"
                    + " mapaMarkerLong = '" + lng + "'"
                    + " WHERE mapaMarkerId = " + Integer.parseInt(mapaMarkerId) + ";";

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(execute);
            pst.executeUpdate(execute);

            gq.doConnectClose();

        } catch (InstantiationException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }

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
                            item.write(arc);

                            out.println("<script>");

                            ultimoMapaId = creaMapa(Integer.parseInt(perId), "");

                            //parsear el archivo excel
                            leerArchivoExcel(archivoCreado, ultimoMapaId);

                            out.println("$(document).ready(function () {");

                            out.println("parent.$.fancybox.close();");

                            out.println("window.open('DefaultGeneral.jsp?','central','');");

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

    public boolean leerArchivoExcel(String path, int mapaId) {

        ArrayList<String> controlNombreColumna = new ArrayList<String>();
        ArrayList valoresPorFila = new ArrayList();

        try {
            Workbook workbook = Workbook.getWorkbook(new File(path)); //Pasamos el excel que vamos a leer
            Sheet sheet = workbook.getSheet(0); //Seleccionamos la hoja que vamos a leer
            String nombrecolumna;
            String valor = "";
            for (int fila = 0; fila < sheet.getRows(); fila++) { //recorremos las filas
                for (int columna = 0; columna < sheet.getColumns(); columna++) { //recorremos las columnas
                    nombrecolumna = sheet.getCell(columna, fila).getContents(); //setear la celda leida a nombre
                    if (fila == 0) {
                        controlNombreColumna.add(nombrecolumna);
                    } else {
                        if (columna == 0) {
                            valor = sheet.getCell(columna, fila).getContents();
                        } else {
                            valor = valor + "," + sheet.getCell(columna, fila).getContents();
                        }
                    }
                }
                if (fila == 0) {
                    if (controlNombreColumna.contains("Nombre")
                            && controlNombreColumna.contains("Apellido")
                            && controlNombreColumna.contains("Direccion")
                            && controlNombreColumna.contains("Ciudad")
                            && controlNombreColumna.contains("Provincia")
                            && controlNombreColumna.contains("Latitud")
                            && controlNombreColumna.contains("Longitud")
                            && controlNombreColumna.contains("Venta")
                            && controlNombreColumna.contains("Entrega")
                            && controlNombreColumna.contains("Observaciones")) {

                    } else {
                        return false;
                    }
                } else {
                    valoresPorFila.add(valor);
                }

            }
            gq.doConnect();
            for (Object vpf : valoresPorFila) {
                String[] data = vpf.toString().split(",");
                if (data.length > 0) {
                    if (!data[0].isEmpty()
                            || !data[1].isEmpty()
                            || !data[2].isEmpty()
                            || !data[3].isEmpty()
                            || !data[4].isEmpty()) {

                        String execute = " INSERT INTO tesis.mapamarker"
                                + "(mapaId,"
                                + "mapaMarkerCliNomApe,"
                                + "mapaMarkerDirección,"
                                + "mapaMarkerCiudad,"
                                + "mapaMarkerProvincia,"
                                + "mapaMarkerLat,"
                                + "mapaMarkerLong,"
                                + "mapamarkerVenta,"
                                + "mapamarkerEntrega,"
                                + "mapamarkerObserva,"
                                + "mapamarkerEstado)"
                                + "VALUES"
                                + "(" + mapaId + ","
                                + "'" + data[0] + " " + data[1] + "',"
                                + "'" + data[2] + "',"
                                + "'" + data[3] + "',"
                                + "'" + data[4] + "',"
                                + "'" + data[5] + "',"
                                + "'" + data[6] + "',"
                                + "'" + data[7] + "',"
                                + "'" + data[8] + "',"
                                + "'" + data[9] + "',"
                                + "1);";

                        this.pst = (PreparedStatement) gq.getConnection().prepareStatement(execute);
                        pst.executeUpdate(execute);
                    }
                }
            }
            gq.doConnectClose();
            return true;
        } catch (IOException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (BiffException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (InstantiationException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (IllegalAccessException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd_M_yyyy HH_mm_ss");
        String date = sdf.format(new Date());
        return date;
    }

    public int creaMapa(int usrId, String observa) {
        try {
            gq.doConnect();
            String execute = "INSERT INTO mapa\n"
                    + " (mapaUsrId,\n"
                    + " mapaFecha,\n"
                    + " mapaEstado,\n"
                    + " mapaObserva)\n"
                    + "VALUES\n"
                    + " ('" + usrId + "',\n"
                    + " now(),\n"
                    + "1,"
                    + "'" + observa + "')";

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
