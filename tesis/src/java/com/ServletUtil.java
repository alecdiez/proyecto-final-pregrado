/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

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

import com.mysql.jdbc.PreparedStatement;
import static utl.TextFormat.toStringNeverNull;

/**
 *
 * @author bizit
 */
public class ServletUtil extends HttpServlet
{

   private PreparedStatement pst = null;
   private genericQuery gq = new genericQuery();
   private ResultSet rs = null;

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException
   {
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();
      int mapaId = Integer.parseInt(request.getParameter("mapaId"));
      String observa = toStringNeverNull(request.getParameter("observa"));
      String cierraMapa = toStringNeverNull(request.getParameter("cierraMapa"));

      if(cierraMapa.isEmpty() && !cierraMapa.equals("true"))
      {
         out.print(upDateObservaciones(mapaId, observa));
      }
      else
      {
         out.print(cierraMapa(mapaId));
      }

   }

   private String upDateObservaciones(int mapaId, String observa)
   {

      try
      {
         gq.doConnect();
         String execute = "UPDATE tesis.mapa"
            + " SET"
            + " mapaObserva = '" + observa + "'"
            + " WHERE mapaId = " + mapaId + ";";

         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(execute);
         pst.executeUpdate(execute);

         gq.doConnectClose();

         return observa;

      }
      catch (InstantiationException ex)
      {
         Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
         return null;
      }
      catch (IllegalAccessException ex)
      {
         Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
         return null;
      }
      catch (SQLException ex)
      {
         Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
         return null;
      }

   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException
   {
      HttpSession session = request.getSession();
      PrintWriter out = response.getWriter();

   }

   private String cierraMapa(int mapaId)
   {

      try
      {
         gq.doConnect();
         String execute = "UPDATE tesis.mapa"
            + " SET"
            + " mapaEstado = '0'"
            + " WHERE mapaId = " + mapaId + ";";

         this.pst = (PreparedStatement)gq.getConnection().prepareStatement(execute);
         pst.executeUpdate(execute);

         gq.doConnectClose();

         return "bien";

      }
      catch (InstantiationException ex)
      {
         Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
         return null;
      }
      catch (IllegalAccessException ex)
      {
         Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
         return null;
      }
      catch (SQLException ex)
      {
         Logger.getLogger(RecibeArchivo.class.getName()).log(Level.SEVERE, null, ex);
         return null;
      }

   }

}
