/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.mysql.jdbc.PreparedStatement;
import interfaces.finalVariables;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import au.com.bytecode.opencsv.CSVWriter;

/**
 *
 * @author Alejandro
 */
public class ExportaInfo extends HttpServlet implements finalVariables {

    private PreparedStatement pst = null;
    private genericQuery gq = new genericQuery();
    private ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String perUsuario = session.getAttribute("perUsuario").toString();
        String perId = session.getAttribute("perId").toString();
        String mapaId = request.getParameter("mapaId");
        String fileCompleteName = GENERATED_DIRECTORY + File.separator + "_" + perUsuario + "_" + getDate() + ".csv";
        String fileName = "_" + perUsuario + "_" + getDate() + ".csv";

        out.println(generaArchivo(mapaId, fileCompleteName, fileName, response));

    }

    public String generaArchivo(String mapaId, String fileCompleteName, String fileName, HttpServletResponse response) throws IOException {

        try {
            gq.doConnect();
            String query = "select * from  tesis.mapamarker where mapaId = " + Integer.parseInt(mapaId) + "";

            CSVWriter writer = new CSVWriter(new FileWriter(fileCompleteName), ',', CSVWriter.NO_QUOTE_CHARACTER);

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(query);
            this.pst.execute();
            rs = pst.getResultSet();

            writer.writeAll(rs, true);
            writer.flush();
            writer.close();

            gq.doConnectClose();

            return GENERATED_FILE + fileName;

        } catch (SQLException ex) {
            Logger.getLogger(ExportaInfo.class.getName()).log(Level.SEVERE, null, ex);
            return ex.getMessage();
        } catch (InstantiationException ex) {
            Logger.getLogger(ExportaInfo.class.getName()).log(Level.SEVERE, null, ex);
            return ex.getMessage();
        } catch (IllegalAccessException ex) {
            Logger.getLogger(ExportaInfo.class.getName()).log(Level.SEVERE, null, ex);
            return ex.getMessage();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

    }

    public String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd_M_yyyy HH_mm_ss");
        String date = sdf.format(new Date());
        return date;
    }

}
