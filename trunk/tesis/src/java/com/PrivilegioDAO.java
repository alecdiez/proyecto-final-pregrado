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
public class PrivilegioDAO extends HttpServlet
{

   private PreparedStatement pst = null;

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException
   {
      String condicion = TextFormat.toStringNeverNull(request.getParameter("condicion"));
      if(condicion.equals("getPrivilegios"))
      {
         getPrivilegios(request, response);
      }

   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException
   {
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();

      String condicion = TextFormat.toStringNeverNull(request.getParameter("condicion"));
      if(condicion.equals("guarda"))
      {
         guardaPrivilegio(request);
      }
      if(condicion.equals("elimina"))
      {
         eliminaPrivilegio(request, session);
      }
      if(condicion.equals("asigna"))
      {

      }

   }

   public void getPrivilegios(HttpServletRequest request, HttpServletResponse response)
   {
      try
      {
         HttpSession session = request.getSession();
         PrintWriter out = response.getWriter();
         String perId = TextFormat.toStringNeverNull(request.getParameter("perId"));
         out.println("lalalala  " + perId);
      }
      catch (IOException ex)
      {
         Logger.getLogger(PrivilegioDAO.class.getName()).log(Level.SEVERE, null, ex);
      }

   }

   public void guardaPrivilegio(HttpServletRequest request)
   {
      String nom = TextFormat.toStringNeverNull(request.getParameter("nom"));
      ResultSet rs = null;
      int priviId = 0;
      try
      {
         genericQuery gq = new genericQuery();
         gq.doConnect();

         String ultId = "SELECT max(priviId) FROM tesis.privilegios;";
         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(ultId);
         this.pst.execute();
         rs = pst.getResultSet();
         java.sql.ResultSetMetaData rsMd = rs.getMetaData();
         while(rs.next())
         {
            priviId = (rs.getInt(1) + 1);
         }

         String execute = "INSERT INTO `tesis`.`privilegios`\n"
            + "(priviId,privilegio)\n"
            + "VALUES\n"
            + "(" + priviId + ",'" + nom + "')";

         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(execute);
         pst.executeUpdate(execute);
         gq.doConnectClose();
      }
      catch (InstantiationException | IllegalAccessException | SQLException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   public void eliminaPrivilegio(HttpServletRequest request, HttpSession session)
   {
      String priviId = TextFormat.toStringNeverNull(request.getParameter("priviId"));

      try
      {

         genericQuery gq = new genericQuery();
         gq.doConnect();
         String execute = "DELETE FROM tesis.privilegios WHERE priviId='" + priviId + "';";

         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(execute);
         pst.executeUpdate(execute);
         gq.doConnectClose();

      }
      catch (InstantiationException | IllegalAccessException | SQLException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   @Override
   public String getServletInfo()
   {
      return "Short description";
   }// </editor-fold>

}
