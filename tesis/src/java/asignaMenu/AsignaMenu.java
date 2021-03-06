/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package asignaMenu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.genericQuery;
import com.mysql.jdbc.PreparedStatement;

/**
 *
 * @author bizit
 */
public class AsignaMenu {

    private PreparedStatement pst = null;

    public String asignaMenu(Long perId) {
        ArrayList<String> priviPersona = new ArrayList<String>();
        try {
            StringBuilder query = new StringBuilder();
            query.append(" SELECT personas.perId, privilegios.privilegio");
            query.append(" FROM tesis.per_privi AS per_privi, tesis.personas AS personas, tesis.privilegios AS privilegios");
            query.append(" WHERE per_privi.perId = personas.perId");
            query.append(" AND per_privi.priviId = privilegios.priviId");
            query.append(" AND `personas`.`perId` = ").append(perId).append(" order by personas.perId");

            genericQuery gq = new genericQuery();
            gq.doConnect();
            priviPersona = execQuery(query.toString(), gq);
            gq.doConnectClose();

        } catch (InstantiationException ex) {
            Logger.getLogger(AsignaMenu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(AsignaMenu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AsignaMenu.class.getName()).log(Level.SEVERE, null, ex);
        }

        return this.devuelveMenu(priviPersona);
    }

    public ArrayList<String> execQuery(String query, genericQuery gq) {
        ArrayList<String> priviPersona = new ArrayList<String>();
        ResultSet rs = null;
        try {
            this.pst = (PreparedStatement) gq.getConnection().prepareStatement(query);
            this.pst.execute();
            rs = pst.getResultSet();
            java.sql.ResultSetMetaData rsMd = rs.getMetaData();
            while (rs.next()) {
                priviPersona.add(rs.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AsignaMenu.class.getName()).log(Level.SEVERE, null, ex);
        }

        return priviPersona;
    }

    public String devuelveMenu(ArrayList privilegios) {

        String menu = "<nav><ul id=\"menu-bar\" >\n"
                + "        <li><a href=\"#\">Personas</a>\n"
                + "            <ul>\n"
                + "\n";
        if (privilegios.contains("altaPersona")) {
            menu += "                <li style=\"cursor: pointer\"><a id=\"altaPersona\" href=\"AltaPersona.jsp\">Alta Persona</a></li>\n";
        }
        if (privilegios.contains("bajaPersona")) {
            menu += "                <li  style=\"cursor: pointer\"><a id=\"bajaPersona\" href=\"BajaPersona.jsp\">Baja Persona</a></li>\n";
        }
        if (privilegios.contains("modificaPersona")) {
            menu += "                <li  style=\"cursor: pointer\"><a id=\"modificaPersona\" href=\"ModificaPersona.jsp\">Modifica Persona</a></li>\n";
        } else {
            menu += "                <li  style=\"cursor: pointer\"><a id=\"modificaUnaPersona\" href=\"ModificaUnaPersona.jsp\">Modifica Persona</a></li>\n";
        }

        menu += "\n"
                + "            </ul>\n"
                + "        </li>\n"
                + "        <li><a href=\"#\">Privilegios</a>\n"
                + "            <ul>\n"
                + "\n";
        if (privilegios.contains("altaPrivilegio")) {
            menu += "                <li  style=\"cursor: pointer\"><a id=\"altaPrivilegio\" href=\"AltaPrivilegio.jsp\">Alta Privilegio</a></li>\n";
        }
        if (privilegios.contains("bajaPrivilegio")) {
            menu += "                <li  style=\"cursor: pointer\"><a id=\"bajaPrivilegio\" href=\"BajaPrivilegio.jsp\">Baja Privilegio</a></li>\n";
        }
        if (privilegios.contains("asignaPrivilegio")) {
            menu += "                <li  style=\"cursor: pointer\"><a id=\"asignaPrivilegioPer\" href=\"AsignaPrivilegioPer.jsp\">Asigna Privilegio</a></li>\n";
        }
        menu += "</ul></li>";

        menu += " <li><a href=\"#\">Sistema</a>\n"
                + "<ul>\n";
        menu += "                <li style=\"cursor: pointer\"><a id=\"generaMapa\" href=\"GeneraMapa.jsp\" title=\"GENERA MAPA\">Generar Mapa</a></li>\n";
        if (privilegios.contains("visualizaMapas")) {
            menu += "                <li  style=\"cursor: pointer\"><a href=\"#\" title=\"VER MAPAS \">Ver Mapas <b>&rarr;</b></a>"
                    + "<ul>"
                    + "<li  style=\"cursor: pointer\"><a id=\"verMapasPorFechas\" href=\"MapasPorFechas.jsp\" title=\"MAPAS POR FECHAS o ESTADO\">Ver Mapas por Fechas y Estado</a></li>\n"
                    + "</ul></li>\n";
        }
        if (privilegios.contains("visualizaGraficos")) {
            menu += "                <li  style=\"cursor: pointer\"><a href=\"#\" title=\"GRAFICOS\">Gráficos <b>&rarr;</b></a>"
                    + "<ul>"
                    + "<li  style=\"cursor: pointer\"><a id=\"calendarioGraficos\" href=\"CalendarioGraficos.jsp\" title=\"CALENDARIO GRAFICOS\">Ver Graficos por Fechas</a></li>\n"
                    + "<li  style=\"cursor: pointer\"><a id=\"graficosPorVentas\" href=\"GraficosPorVentas.jsp\" title=\"GRAFICOS POR VENTA\">Ver Graficos por Ventas</a></li>\n"
                    + "</ul></li>\n";
        }

        if (privilegios.contains("SuperAdmin")) {
             menu += "</ul></li>";
            menu += " <li><a href=\"#\">Administración</a><ul>\n";
            menu += "                <li style=\"cursor: pointer\"><a id=\"auditLogin\" href=\"AuditLogin.jsp\">Audit Login</a></li>\n";
            menu += "</ul></li>";

        }

        menu += "    </ul>";
        menu += "    </li>";

        menu += "    </ul></nav>";

        return menu;
    }

}
