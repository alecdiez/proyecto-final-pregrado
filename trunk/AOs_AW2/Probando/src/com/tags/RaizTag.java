package com.tags;
import java.io.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;


public class RaizTag extends BodyTagSupport{

	private static final long serialVersionUID = 1L;

	public int doAfterBody() throws JspException {
		try{
			BodyContent bc = getBodyContent();
			String cuerpo = bc.getString();
			JspWriter out = bc.getEnclosingWriter();
			out.print(cuerpo);
			/*if(cuerpo>=0){
				out.print("Raíz cuadrada de "+cuerpo);//+"= "+Math.sqrt(cuerpo));
			}else{
				out.print("No existe la raiz cuadrada de un número negativo");
			}*/
		}catch (IOException e){
			throw new JspException("Error: IOException"+e.getMessage());
		}
		return SKIP_BODY;
	}
}