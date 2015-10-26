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
import static utl.TextFormat.toStringNeverNull;

/**
 *
 * @author Alejandro
 */
public class MapaDAO extends HttpServlet {

    private PreparedStatement pst = null;
    private genericQuery gq = new genericQuery();
    private ResultSet rs = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String mapaId = toStringNeverNull(request.getParameter("mapaId"));
        String mapaMarkerCliNomApe = toStringNeverNull(request.getParameter("mapaMarkerCliNomApe"));
        String mapaMarkerDireccion = toStringNeverNull(request.getParameter("mapaMarkerDireccion"));
        String mapaMarkerCiudad = toStringNeverNull(request.getParameter("mapaMarkerCiudad"));
        String mapaMarkerProvincia = toStringNeverNull(request.getParameter("mapaMarkerProvincia"));
        String mapaMarkerLat = toStringNeverNull(request.getParameter("mapaMarkerLat"));
        String mapaMarkerLong = toStringNeverNull(request.getParameter("mapaMarkerLong"));
        String mapaMarkerVenta = toStringNeverNull(request.getParameter("mapaMarkerVenta"));
        String mapaMarkerEntrega = toStringNeverNull(request.getParameter("mapaMarkerEntrega"));
        String mapaMarkerObserva = toStringNeverNull(request.getParameter("mapaMarkerObserva"));

        String[] nuevaFila = new String[9];
        nuevaFila[0] = mapaMarkerCliNomApe;
        nuevaFila[1] = mapaMarkerDireccion;
        nuevaFila[2] = mapaMarkerCiudad;
        nuevaFila[3] = mapaMarkerProvincia;
        nuevaFila[4] = mapaMarkerLat;
        nuevaFila[5] = mapaMarkerLong;
        nuevaFila[6] = mapaMarkerVenta;
        nuevaFila[7] = mapaMarkerEntrega;
        nuevaFila[8] = mapaMarkerObserva;

        out.println(creaNuevoMarker(Integer.parseInt(mapaId), nuevaFila));
    }

    public int creaNuevoMarker(int mapaId, String[] nuevaFila) {
        try {
            gq.doConnect();
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
                    + "'" + nuevaFila[0] + "',"
                    + "'" + nuevaFila[1] + "',"
                    + "'" + nuevaFila[2] + "',"
                    + "'" + nuevaFila[3] + "',"
                    + "'" + nuevaFila[4] + "',"
                    + "'" + nuevaFila[5] + "',"
                    + "'" + nuevaFila[6] + "',"
                    + "'" + nuevaFila[7] + "',"
                    + "'" + nuevaFila[8] + "',"
                    + "1);";

            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(execute);
            pst.executeUpdate(execute);

            String query = "select max(mapaMarkerId) from tesis.mapaMarker;";

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
    }

}
