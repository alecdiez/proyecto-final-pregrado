package com.tags;

import java.io.*;

import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;

import com.mysql.jdbc.ResultSetMetaData;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexionDBTag extends BodyTagSupport implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String url;
	private String user;
	private String pwd;
	Connection con = null;

	public void setUrl(String url) {
		this.url = url;
	}

	public void setUser(String us) {
		this.user = us;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int doAfterBody() throws JspException {
		try {
			BodyContent bc = getBodyContent();
			String cuerpo = bc.getString().toUpperCase();
			JspWriter out = bc.getEnclosingWriter();

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);

			if (con.isValid(1000)) {

				out.println("CONEXION OK!!!<br>");

			} else {
				out.println("Sin Conexion!!!<br>");
			}

			if (cuerpo.contains("SELECT")) {

				try (ResultSet resultados = consultar(cuerpo)) {

					ResultSetMetaData rsMd = (ResultSetMetaData) resultados
							.getMetaData();
					int cantidadColumnas = rsMd.getColumnCount();
					out.println("<table border=\"1\">");
					out.println("<thead>");
					out.println("<tr>");
					for (int i = 1; i <= cantidadColumnas; i++) {
						out.println("<th>" + rsMd.getColumnLabel(i) + "</th>");

					}
					out.println("</tr>");
					out.println("</thead>");
					out.println("<tbody>");
					while (resultados.next()) {
						out.println("<tr>");
						for (int i = 0; i < cantidadColumnas; i++) {
							String dato = resultados.getString(i + 1) == null ? ""
									: resultados.getString(i + 1);
							out.println("<td align=\"center\">" + dato
									+ "</td>");
						}

						out.println("</tr>");
					}
					out.println("</tbody>");
					out.println("</table>");

				}
			} else {
				if (cuerpo.contains("INSERT") || cuerpo.contains("UPDATE")
						|| cuerpo.contains("DELETE")) {
					if (this.ejecutar(cuerpo)) {
						out.println("Sentencia exitosa");
					} else {
						out.println("Sentencia fallida");
					}
				}
			}
			con.close();
		} catch (IOException e) {
			throw new JspException("Error: IOException" + e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	public boolean ejecutar(String sql) {
		try {
			Statement st = con.createStatement();
			st.executeUpdate(sql);
			st.close();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ResultSet consultar(String sql) {
		ResultSet resultado;
		try {
			Statement st = con.createStatement();
			resultado = st.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return resultado;
	}
}