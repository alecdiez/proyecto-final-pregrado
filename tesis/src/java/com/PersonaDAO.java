/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;
import interfaces.finalVariables;
import utl.TextFormat;

/**
 *
 * @author bizit
 */
public class PersonaDAO extends HttpServlet implements finalVariables
{

   private PreparedStatement pst = null;

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
      String condicion = TextFormat.toStringNeverNull(request.getParameter("condicion"));
      if(condicion.equals("guarda"))
      {
         guardaPersona(request);
      }
      if(condicion.equals("elimina"))
      {
         eliminaPersona(request);
      }

   }

   @Override
   public String getServletInfo()
   {
      return "Short description";
   }// </editor-fold>

   public void guardaPersona(HttpServletRequest request)
   {
      String nom = TextFormat.toStringNeverNull(request.getParameter("nom"));
      String ape = TextFormat.toStringNeverNull(request.getParameter("ape"));
      String dni = TextFormat.toStringNeverNull(request.getParameter("dni"));
      String usr = TextFormat.toStringNeverNull(request.getParameter("usr"));
      String pass = TextFormat.toStringNeverNull(request.getParameter("pass"));
      try
      {
         genericQuery gq = new genericQuery();
         gq.doConnect();
         String execute = "INSERT INTO `tesis`.`personas`\n"
            + "(perUsuario,\n"
            + "perPass,\n"
            + "perNom,\n"
            + "perApe,\n"
            + "perDni)\n"
            + "VALUES\n"
            + "('" + usr + "',\n"
            + "'" + pass + "',\n"
            + "'" + nom + "',\n"
            + "'" + ape + "',\n"
            + "" + dni + ")";

         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(execute);
         pst.executeUpdate(execute);
         gq.doConnectClose();
      }
      catch (InstantiationException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      catch (IllegalAccessException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      catch (SQLException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
   }

   public void eliminaPersona(HttpServletRequest request)
   {
      String perId = TextFormat.toStringNeverNull(request.getParameter("nom"));

      try
      {
         genericQuery gq = new genericQuery();
         gq.doConnect();
         String execute = "";

         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(execute);
         pst.executeUpdate(execute);
         gq.doConnectClose();
      }
      catch (InstantiationException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      catch (IllegalAccessException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
      catch (SQLException ex)
      {
         Logger.getLogger(PersonaDAO.class.getName()).log(Level.SEVERE, null, ex);
      }
   }
}
