/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
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

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import interfaces.finalVariables;
import utl.TextFormat;

/**
 *
 * @author bizit
 */
public class genericQuery extends HttpServlet implements finalVariables {

    private Connection connection = null;
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
        session.removeAttribute("empty");
        ArrayList<String> usrLogOn = new ArrayList<String>();
        try {
            String usr = TextFormat.toStringNeverNull(request.getParameter("usuario"));
            String pass = TextFormat.toStringNeverNull(request.getParameter("password"));
            doConnect();
            usrLogOn = Login(usr, pass);
            doConnectClose();
        } catch (InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

        sessionLogin(usrLogOn, session);
        out.println("<script>");
        if (!usrLogOn.get(0).equals("empty")) {            
            out.println("window.open('DatosPersona.jsp?','alto')");
            out.println("window.open('DefaultGeneral.jsp?','central')");
        } else {            
            out.println("window.open('Login.jsp?','alto')");                     
        }
        out.println("</script>");
    }

    public void sessionLogin(ArrayList<String> usrData, HttpSession session) {

        for (String data : usrData) {
            if (!data.equals("empty")) {
                if (data.equals("perId")) {
                    session.setAttribute("perId", data);
                }
                if (data.equals("perUsuario")) {
                    session.setAttribute("perUsuario", data);
                }
                if (data.equals("perPass")) {
                    session.setAttribute("perPass", data);
                }
                if (data.equals("perNom")) {
                    session.setAttribute("perNom", data);
                }
            } else {
                session.setAttribute("empty", data);
            }
        }
    }

    public void doConnect() throws InstantiationException, IllegalAccessException, SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = (Connection) DriverManager.getConnection(url, connUsr, connPass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<String> Login(String usr, String pass) {
        ArrayList<String> userLog = new ArrayList<String>();
        String query = "select * from personas where perUsuario = '" + usr + "' and perPass = '" + pass + "' ";

        ResultSet rs = null;
        try {
            this.pst = (PreparedStatement) connection.prepareStatement(query);
            this.pst.execute();
            rs = pst.getResultSet();
            java.sql.ResultSetMetaData rsMd = rs.getMetaData();
            int cantidadColumnas = rsMd.getColumnCount();
            if (rs.next()) {
                for (int i = 0; i < cantidadColumnas; i++) {
                    userLog.add(rs.getString(i + 1));
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (userLog.isEmpty()) {
            userLog.add("empty");
        }

        return userLog;
    }

    public void doConnectClose() throws SQLException {
        connection.close();
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public Statement getPst() {
        return pst;
    }

    public void setPst(PreparedStatement pst) {
        this.pst = pst;
    }

}
