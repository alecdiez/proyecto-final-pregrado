/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import com.mysql.jdbc.PreparedStatement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utl.TextFormat;

/**
 *
 * @author Alejandro
 */
public class PrivilegioDAO extends HttpServlet {

    private PreparedStatement pst = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String condicion = TextFormat.toStringNeverNull(request.getParameter("condicion"));

        if (condicion.equals("getPrivilegios")) {
            getPrivilegios(request, response);
        }
        if (condicion.equals("asigna")) {
            asignaPrivilegios(request, response);
        }

    }

    public void asignaPrivilegios(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        HttpSession session = null;
        ResultSet rs = null;
        ArrayList<String> privilegio = new ArrayList<String>();
        try {
            session = request.getSession();
            out = response.getWriter();
            String perId = TextFormat.toStringNeverNull(request.getParameter("perId"));
            String priviIds = TextFormat.toStringNeverNull(request.getParameter("priviIds"));
            String[] privi = priviIds.split(",");
            for (String p : privi) {
                if (!p.isEmpty()) {
                    privilegio.add(p.replace("privi", ""));
                }
            }

            genericQuery gq = new genericQuery();
            gq.doConnect();

            String delete = "delete from tesis.per_privi where perId = " + perId + "";
            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(delete);
            pst.executeUpdate(delete);

            for (String pId : privilegio) {
                String insert = "insert into tesis.per_privi (perId , priviId) values (" + perId + "," + pId + ")";
                this.pst = (PreparedStatement) gq.getConnection().prepareStatement(insert);
                pst.executeUpdate(insert);
            }

            gq.doConnectClose();
        } catch (IOException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(PrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        String condicion = TextFormat.toStringNeverNull(request.getParameter("condicion"));
        if (condicion.equals("guarda")) {
            guardaPrivilegio(request);
        }
        if (condicion.equals("elimina")) {
            eliminaPrivilegio(request, session);
        }
    }

    public void getPrivilegios(HttpServletRequest request, HttpServletResponse response) {
        ResultSet rs = null;
        ArrayList<String> priviIds = new ArrayList<String>();
        try {
            HttpSession session = request.getSession();
            PrintWriter out = response.getWriter();
            String perId = TextFormat.toStringNeverNull(request.getParameter("perId"));
            String query = "SELECT priviId FROM tesis.per_privi where perId = " + perId + ";";

            genericQuery gq = new genericQuery();
            gq.doConnect();
            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(query);
            this.pst.execute();
            rs = pst.getResultSet();
            while (rs.next()) {
                priviIds.add(rs.getString(1));
            }
            String result = "";
            for (String priviId : priviIds) {
                if (priviId.equals(priviIds.get(0))) {
                    result = priviId;
                } else {
                    result = result + "_" + priviId;
                }

            }
            gq.doConnectClose();
            out.println(result);

        } catch (InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void guardaPrivilegio(HttpServletRequest request) {
        String nom = TextFormat.toStringNeverNull(request.getParameter("nom"));
        ResultSet rs = null;
        int priviId = 0;
        try {
            genericQuery gq = new genericQuery();
            gq.doConnect();

            String ultId = "SELECT max(priviId) FROM tesis.privilegios;";
            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(ultId);
            this.pst.execute();
            rs = pst.getResultSet();
            while (rs.next()) {
                priviId = (rs.getInt(1) + 1);
            }

            String execute = "INSERT INTO `tesis`.`privilegios`\n"
                    + "(priviId,privilegio)\n"
                    + "VALUES\n"
                    + "(" + priviId + ",'" + nom + "')";

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(execute);
            pst.executeUpdate(execute);
            gq.doConnectClose();
        } catch (InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminaPrivilegio(HttpServletRequest request, HttpSession session) {
        String priviId = TextFormat.toStringNeverNull(request.getParameter("priviId"));

        try {

            genericQuery gq = new genericQuery();
            gq.doConnect();
            String execute = "DELETE FROM tesis.privilegios WHERE priviId='" + priviId + "';";

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(execute);
            pst.executeUpdate(execute);
            gq.doConnectClose();

        } catch (InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
