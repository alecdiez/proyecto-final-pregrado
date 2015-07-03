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
import com.mysql.jdbc.ResultSetMetaData;
import com.mysql.jdbc.Statement;
import interfaces.finalVariables;
import utl.TextFormat;

/**
 *
 * @author bizit
 */
public class genericQuery extends HttpServlet implements finalVariables
{

   private Connection connection = null;
   private PreparedStatement pst = null;

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   /**
    * Handles the HTTP <code>GET</code> method.
    *
    * @param request servlet request
    * @param response servlet response
    * @throws ServletException if a servlet-specific error occurs
    * @throws IOException if an I/O error occurs
    */
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException
   {

   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException
   {
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();
      ArrayList<String> usrLogOn = new ArrayList<String>();
      try
      {
         String usr = TextFormat.toStringNeverNull(request.getParameter("usuario"));
         String pass = TextFormat.toStringNeverNull(request.getParameter("password"));
         doConnect();
         usrLogOn = Login(usr, pass);
         doConnectClose();
      }
      catch (InstantiationException ex)
      {
         Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
      }
      catch (IllegalAccessException ex)
      {
         Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
      }
      catch (SQLException ex)
      {
         Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
      }

      for(String usrData : usrLogOn)
      {
         out.println(usrData);
      }

   }

   public void doConnect() throws InstantiationException, IllegalAccessException, SQLException
   {
      try
      {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
         connection = (Connection)DriverManager.getConnection(url, connUsr, connPass);
      }
      catch (ClassNotFoundException ex)
      {
         Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
      }

   }

   public ArrayList<String> Login(String usr, String pass)
   {
      ArrayList<String> userLog = new ArrayList<String>();
      String query = "select * from personas where perUsuario = '" + usr + "' and perPass = '" + pass + "' ";

      ResultSet rs = null;
      try
      {
         this.pst = (PreparedStatement)connection.prepareStatement(query);
         this.pst.execute();
         rs = pst.getResultSet();
         java.sql.ResultSetMetaData rsMd = rs.getMetaData();
         int cantidadColumnas = rsMd.getColumnCount();
         if(rs.next())
         {
            for(int i = 0; i < cantidadColumnas; i++)
            {
               userLog.add(rs.getString(i + 1));
            }

         }
      }
      catch (SQLException ex)
      {
         Logger.getLogger(genericQuery.class.getName()).log(Level.SEVERE, null, ex);
      }

      if(userLog.isEmpty())
      {
         userLog.add("empty");
      }

      return userLog;
   }

   public void doConnectClose() throws SQLException
   {
      connection.close();
   }

   public Connection getConnection()
   {
      return connection;
   }

   public void setConnection(Connection connection)
   {
      this.connection = connection;
   }

   public Statement getPst()
   {
      return pst;
   }

   public void setPst(PreparedStatement pst)
   {
      this.pst = pst;
   }

}
