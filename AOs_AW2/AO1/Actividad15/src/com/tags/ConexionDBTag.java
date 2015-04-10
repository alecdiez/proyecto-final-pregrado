package com.tags;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ConexionDBTag extends BodyTagSupport{

		private String URL;
		private String USER;
		private String PWD;
		Connection con=null;
	
	public void setUrl(String url) {
		this.URL = url;
	}

	public void setUser(String us) {
		this.USER = us;
	}

	public void setPWD(String pass) {
		this.PWD = pass;
	}
	
	private static final long serialVersionUID = 1L;

	public int doAfterBody() throws JspException {
		try{
			BodyContent bc = getBodyContent();
			String cuerpo = bc.getString();
			JspWriter out = bc.getEnclosingWriter();
			
			Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection(URL,USER,PWD);
			
			if (cuerpo.contains("SELECT")){
				ResultSet resultados = consultar(cuerpo);
				while(resultados.next()){
					//mostrar lo que esta guardado en el resulset
					//out.println(resultados.get
				}
				

			}else{
				if(cuerpo.contains("INSERT")||cuerpo.contains("UPDATE")||cuerpo.contains("DELETE")){
						if(this.ejecutar(cuerpo)){
							out.println("Sentencia exitosa");
						}else{
							out.println("Sentencia fallida");
						}
					}
			}
		}catch (IOException e){
			throw new JspException("Error: IOException"+e.getMessage());
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
        }        return resultado;
    }
}